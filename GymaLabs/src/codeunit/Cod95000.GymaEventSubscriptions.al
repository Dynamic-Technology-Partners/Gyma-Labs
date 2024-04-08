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

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeSalesLineFind, '', false, false)]
    // local procedure OnBeforeSalesLineFind(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var LinesWereModified: Boolean; var IsHandled: Boolean)
    // var
    //     PurchaseHeader: Record "Purchase Header";
    // begin
    //     if SalesLine.FindFirst() then begin
    //         repeat
    //             Clear(PurchaseHeader);
    //             if SalesLine."Purchase Order No." <> '' then
    //                 PurchaseHeader.Get(SalesLine."Purchase Order No.");
    //             if SalesLine."Special Order Purchase No." <> '' then
    //                 PurchaseHeader.Get(SalesLine."Special Order Purchase No.");
    //             if PurchaseHeader."FDA Release Date" <> 0D then
    //                 if PurchaseHeader."FDA Release Date" > Today() then
    //                     Error('Purchase Order is not yet released by the FDA.');
    //         until SalesLine.Next() = 0;
    //     end;
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", OnBeforeReleasePurchaseDoc, '', false, false)]
    // local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean; SkipWhseRequestOperations: Boolean)
    // begin
    //     if PurchaseHeader."FDA Release Date" = 0D then begin
    //         if not Confirm('The FDA Release Date is blank. Do you want to continue posting?', false) then
    //             Error('Posting Cancelled by User!');
    //     end else
    //         if PurchaseHeader."FDA Release Date" > Today() then
    //             if not Confirm('Purchase Order is not yet released by the FDA. Do you want to continue posting?', false) then
    //                 Error('Posting Cancelled by User!');
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", OnBeforeRunSalesPost, '', false, false)]
    local procedure OnBeforeRunSalesPost(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean; var SuppressCommit: Boolean)
    var
        SalesLine: Record "Sales Line";
        PurchaseHeader: Record "Purchase Header";
        x: page "Purchase Order";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindFirst() then begin
            repeat
                Clear(PurchaseHeader);
                if SalesLine."Purchase Order No." <> '' then
                    PurchaseHeader.Get(SalesLine."Purchase Order No.");
                if SalesLine."Special Order Purchase No." <> '' then
                    PurchaseHeader.Get(SalesLine."Special Order Purchase No.");
                if PurchaseHeader."FDA Release Date" <> 0D then
                    if PurchaseHeader."FDA Release Date" > Today() then
                        Error('Purchase %1 is not yet released by the FDA.', Format(PurchaseHeader."Document Type"));
            until SalesLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", OnBeforeRunPurchPost, '', false, false)]
    local procedure OnBeforeRunPurchPost(var PurchaseHeader: Record "Purchase Header")
    begin
        if PurchaseHeader."FDA Release Date" <> 0D then
            if PurchaseHeader."FDA Release Date" > Today() then
                Error('Purchase %1 is not yet released by the FDA.', Format(PurchaseHeader."Document Type"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Dist. Integration", OnAfterInsertPurchLine, '', false, false)]
    local procedure OnAfterInsertPurchLine(var PurchaseLine: Record "Purchase Line"; SalesLine: Record "Sales Line"; var NextLineNo: Integer)
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        PurchasesPayablesSetup.Get();
        if PurchasesPayablesSetup."P.L. Item Cost Default to Zero" then begin
            if PurchaseLine."Direct Unit Cost" <> 0 then
                PurchaseLine.Validate("Direct Unit Cost", 0);
        end;
    end;
}
