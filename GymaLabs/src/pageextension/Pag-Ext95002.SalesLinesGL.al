/// <summary>
/// PageExtension Sales Lines-GL (ID 95002) extends Record Sales Lines.
/// </summary>
pageextension 95002 "Sales Lines-GL" extends "Sales Lines"
{
    layout
    {
        addlast(Control1)
        {
            field("Customer Part No."; rec."Customer Part No.")
            {
                ApplicationArea = All;
            }
            field("Customer Item Reference No."; rec."Customer Item Ref. No.")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Commission %"; rec."Commission %")
            {
                ApplicationArea = All;
                Visible = SalesHeader."Order Type" = SalesHeader."Order Type"::Commission;
            }
        }
    }

    var
        SalesHeader: Record "Sales Header";

    trigger OnAfterGetRecord()
    begin
        if SalesHeader."No." <> Rec."Document No." then begin
            SalesHeader.Get(Rec."Document No.");
        end;
    end;
}
