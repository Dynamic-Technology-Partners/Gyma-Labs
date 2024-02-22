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

    //[EventSubscriber(ObjectType::Table, Database::"Sales Header", OnCheckSalesReleaseRestrictions, '', false, false)]
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeSalesLineFind, '', false, false)]
    local procedure OnBeforeSalesLineFind(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var LinesWereModified: Boolean; var IsHandled: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        x: Codeunit "Release Purchase Document";
    begin
        if SalesLine.FindFirst() then begin
            repeat
                Clear(PurchaseHeader);
                if SalesLine."Purchase Order No." <> '' then
                    PurchaseHeader.Get(SalesLine."Purchase Order No.");
                if SalesLine."Special Order Purchase No." <> '' then
                    PurchaseHeader.Get(SalesLine."Special Order Purchase No.");
                if PurchaseHeader."FDA Release Date" <> 0D then
                    if PurchaseHeader."FDA Release Date" > Today() then
                        Error('Purchase Order is not yet released by the FDA.');
            until SalesLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", OnBeforeReleasePurchaseDoc, '', false, false)]
    local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean; SkipWhseRequestOperations: Boolean)
    begin
        if PurchaseHeader."FDA Release Date" = 0D then begin
            if not Confirm('The FDA Release Date is blank. Do you want to continue posting?', false) then
                Error('Posting Cancelled by User!');
        end else
            if PurchaseHeader."FDA Release Date" > Today() then
                if not Confirm('Purchase Order is not yet released by the FDA. Do you want to continue posting?', false) then
                    Error('Posting Cancelled by User!');
    end;
}
