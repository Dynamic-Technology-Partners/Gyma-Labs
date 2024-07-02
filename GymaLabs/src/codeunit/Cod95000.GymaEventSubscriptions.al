/// <summary>
/// Codeunit Gyma Event Subscriptions (ID 95000).
/// </summary>
codeunit 95000 "Gyma Event Subscriptions"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateNoPurchaseLine, '', false, false)]
    local procedure OnAfterValidateNoPurchaseLine(var PurchaseLine: Record "Purchase Line"; var xPurchaseLine: Record "Purchase Line"; var TempPurchaseLine: Record "Purchase Line" temporary; PurchaseHeader: Record "Purchase Header")
    var
        PurchasesPayableSetup: Record "Purchases & Payables Setup";
    begin
        PurchasesPayableSetup.Get();
        if PurchasesPayableSetup."P.L. Item Cost Default to Zero" then begin
            if PurchaseLine."Direct Unit Cost" <> 0 then
                PurchaseLine.Validate("Direct Unit Cost", 0);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Dist. Integration", OnBeforeInsertPurchLine, '', false, false)]
    local procedure OnBeforeInsertPurchLine(var PurchaseLine: Record "Purchase Line"; SalesLine: Record "Sales Line")
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        PurchasesPayablesSetup.Get();
        if PurchasesPayablesSetup."P.L. Item Cost Default to Zero" then
            if PurchaseLine."Direct Unit Cost" <> 0 then
                PurchaseLine.Validate("Direct Unit Cost", 0);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnCodeOnAfterSalesLineCheck, '', false, false)]
    local procedure OnCodeOnAfterSalesLineCheck(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header")
    var
        Item: Record Item;
        ShipToAddress: Record "Ship-to Address";
        Customer: Record Customer;
        GymaLabsFunctions: Codeunit "Gyma Labs Functions";
    begin
        if SalesLine.Type = SalesLine.Type::Item then begin
            if GymaLabsFunctions.CheckForHazardousControlledItem(SalesLine."No.") then begin
                if SalesHeader."Ship-to Code" <> '' then begin
                    ShipToAddress.Get(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code");
                    if ShipToAddress."DEA Expired Date" <= Today() then
                        Error('The DEA License on this Ship-to Address is expired.');
                end else begin
                    Customer.Get(SalesHeader."Sell-to Customer No.");
                    if Customer."DEA Expired Date" <= Today() then
                        Error('This DEA License on this Customer is expired.');
                end;
            end;
            if SalesHeader."Order Type" = SalesHeader."Order Type"::Commission then
                SalesLine.TestField("Commission %");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", OnBeforeRunSalesPost, '', false, false)]
    local procedure OnBeforeRunSalesPost(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean; var SuppressCommit: Boolean)
    var
        SalesLine: Record "Sales Line";
        PurchaseHeader: Record "Purchase Header";
        ShipToAddress: Record "Ship-to Address";
        Customer: Record Customer;
        Item: Record Item;
        ShipToAddressDEAExpiredDate: Date;
        CustomerDEAExpiredDate: Date;
        GymaLabsFunctions: Codeunit "Gyma Labs Functions";
    begin
        ShipToAddressDEAExpiredDate := 0D;
        CustomerDEAExpiredDate := 0D;
        if SalesHeader."Ship-to Code" <> '' then begin
            ShipToAddress.Get(SalesHeader."Sell-to Customer No.", SalesHeader."Ship-to Code");
            ShipToAddressDEAExpiredDate := ShipToAddress."DEA Expired Date";
        end else begin
            Customer.Get(SalesHeader."Sell-to Customer No.");
            CustomerDEAExpiredDate := Customer."DEA Expired Date";
        end;
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindFirst() then begin
            repeat
                if SalesLine.Type = SalesLine.Type::Item then begin
                    if GymaLabsFunctions.CheckForHazardousControlledItem(SalesLine."No.") then begin
                        if ShipToAddressDEAExpiredDate <> 0D then begin
                            if ShipToAddressDEAExpiredDate <= Today() then
                                Error('The DEA License for this Ship-to Address is expired.');
                        end else if CustomerDEAExpiredDate <= Today() then
                                Error('The DEA License for this Customer is expired.');
                        Clear(PurchaseHeader);
                        if SalesLine."Purchase Order No." <> '' then
                            PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, SalesLine."Purchase Order No.");
                        if SalesLine."Special Order Purchase No." <> '' then
                            PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, SalesLine."Special Order Purchase No.");
                        if PurchaseHeader."FDA Release Date" <> 0D then
                            if PurchaseHeader."FDA Release Date" <= Today() then
                                Message('NOTICE: Purchase %1 %2 is not yet released by the FDA.', Format(PurchaseHeader."Document Type"), PurchaseHeader."No.");
                    end;
                end;
            until SalesLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", OnBeforeRunPurchPost, '', false, false)]
    local procedure OnBeforeRunPurchPost(var PurchaseHeader: Record "Purchase Header")
    begin
        if PurchaseHeader."FDA Release Date" <> 0D then
            if PurchaseHeader."FDA Release Date" <= Today() then
                Message('NOTICE: Purchase %1 %2 is not yet released by the FDA.', Format(PurchaseHeader."Document Type"), PurchaseHeader."No.");
    end;

    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesDoc, '', false, false)]//
    //local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean;
    //                                    InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesLines, '', false, false)]
    local procedure OnBeforePostSalesLines(var SalesHeader: Record "Sales Header"; var TempSalesLineGlobal: Record "Sales Line" temporary; var TempVATAmountLine: Record "VAT Amount Line" temporary; var EverythingInvoiced: Boolean)
    var
        SalesLine: Record "Sales Line";
        //GenJnlLine: Record "Gen. Journal Line" temporary;
        //GenJnlPostLine2: Codeunit "Gen. Jnl.-Post Line";
        VendorNo: Code[20];
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        Vendor: Record Vendor;
        x: report "Copy Purchase Document";
    begin
        if SalesHeader."Order Type" = SalesHeader."Order Type"::Commission then begin
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            if SalesLine.FindSet() then
                repeat
                    VendorNo := '';
                    if SalesLine."Special Order Purchase No." <> '' then begin
                        //PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
                        //PurchaseLine.SetRange("No.", SalesLine."No.");
                        //PurchaseLine.SetRange("Document No.", SalesLine."Special Order Purchase No.");                        
                        //if PurchaseLine.FindFirst() then
                        if PurchaseLine.Get(PurchaseLine."Document Type"::Order, SalesLine."Special Order Purchase No.", SalesLine."Special Order Purch. Line No.") then
                            VendorNo := PurchaseLine."Buy-from Vendor No.";
                        if VendorNo = '' then begin
                            PurchRcptLine.SetCurrentKey("Order No.", "Order Line No.", "Posting Date");
                            PurchRcptLine.SetRange("Order No.", SalesLine."Special Order Purchase No.");
                            PurchRcptLine.SetRange("Order Line No.", SalesLine."Special Order Purch. Line No.");
                            //PurchRcptLine.SetRange("No.", SalesLine."No.");                            
                            //PurchRcptLine.SetRange("Special Order Sales No.", SalesHeader."No.");
                            if PurchRcptLine.FindFirst() then
                                VendorNo := PurchRcptLine."Buy-from Vendor No.";
                        end;

                        If VendorNo <> '' then begin
                            Clear(PurchaseHeader);
                            PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::"Credit Memo");
                            PurchaseHeader."No." := '';
                            PurchaseHeader.Insert(true);
                            PurchaseHeader.Validate("Buy-from Vendor No.", VendorNo);
                            PurchaseHeader.Validate("Document Date", Today());
                            PurchaseHeader.Validate("Vendor Invoice No.", SalesHeader."No.");
                            PurchaseHeader.Modify(true);
                            PurchaseLine.Validate("Document Type", PurchaseHeader."Document Type");
                            PurchaseLine.Validate("Document No.", PurchaseHeader."No.");
                            PurchaseLine."Line No." := 10000;
                            PurchaseLine.Insert(true);
                            PurchaseLine.Validate("Type", PurchaseLine."Type"::"G/L Account");
                            case PurchaseHeader."Buy-from Vendor No." of
                                'ACHAR2':
                                    PurchaseLine.Validate("No.", '61151-044');
                                'AGNOPH2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'ALCHE2':
                                    PurchaseLine.Validate("No.", '61151-057');
                                'ANJAN2':
                                    PurchaseLine.Validate("No.", '61151-049');
                                'APICO2':
                                    PurchaseLine.Validate("No.", '61151-048');
                                'APIPH2':
                                    PurchaseLine.Validate("No.", '61151-073');
                                'APOTH2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'BIOPH2':
                                    PurchaseLine.Validate("No.", '61151-046');
                                'CENTA2':
                                    PurchaseLine.Validate("No.", '61151-054');
                                'CHENP2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'CLININ2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'CMBXC2':
                                    PurchaseLine.Validate("No.", '61151-070');
                                'CMBXI2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'CMBXIT2':
                                    PurchaseLine.Validate("No.", '61151-075');
                                'DIPHM2':
                                    PurchaseLine.Validate("No.", '61151-090');
                                'DJLE2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'EMCUR2':
                                    PurchaseLine.Validate("No.", '61151-047');
                                'ENERGON2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'ESJAY2':
                                    PurchaseLine.Validate("No.", '61151-071');
                                'ESTEV2':
                                    PurchaseLine.Validate("No.", '61151-060');
                                'GADEA2':
                                    PurchaseLine.Validate("No.", '61151-053');
                                'GALENICA2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'GPPHARM2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'HARMN2':
                                    PurchaseLine.Validate("No.", '61151-059');
                                'HEMMO2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'HYBIO2':
                                    PurchaseLine.Validate("No.", '61151-056');
                                'INDOC2':
                                    PurchaseLine.Validate("No.", '61151-052');
                                'INKE2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'KELIX2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'LISAP2':
                                    PurchaseLine.Validate("No.", '61151-072');
                                'MALLA2':
                                    PurchaseLine.Validate("No.", '61151-061');
                                'MYLAN2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'NERPHA2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'NEULA2':
                                    PurchaseLine.Validate("No.", '61151-050');
                                'NURAY2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'OLON2':
                                    PurchaseLine.Validate("No.", '61151-045');
                                'OLONU2':
                                    PurchaseLine.Validate("No.", '61151-055');
                                'PENGX2':
                                    PurchaseLine.Validate("No.", '61151-074');
                                'PIRAPH02':
                                    PurchaseLine.Validate("No.", '61151-');
                                'RUILAB2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'SMSVII2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'SOLARA2':
                                    PurchaseLine.Validate("No.", '61151-');
                                'SYNCO2':
                                    PurchaseLine.Validate("No.", '61151-');
                                else
                                    Message('Credit Memo GL Account is not found for Vendor %1.', PurchaseHeader."Buy-from Vendor No.");
                            end;
                            PurchaseLine.Validate(Quantity, 1);
                            PurchaseLine.Validate("Direct Unit Cost", Round(SalesLine."Line Amount" * (SalesLine."Commission %" / 100), 0.01));
                            PurchaseLine.Modify(true);
                        end else
                            Message('No vendor was found for Sales Line Item No. %1 %2 so a vendor credit will have to be created manually for this commission line.', SalesLine."No.", SalesLine.Description);
                    end;
                until SalesLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterInitPostingNoSeries, '', false, false)]
    local procedure OnAfterInitPostingNoSeries(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        case SalesHeader."Document Type" of
            SalesHeader."Document Type"::Order:
                begin
                    SalesSetup.Get();
                    if SalesSetup."Order Nos." = SalesSetup."Posted Invoice Nos." then
                        SalesHeader."Posting No." := SalesHeader."No.";
                end;
        end;
    end;
}
