/// <summary>
/// PageExtension Sales Shipment Lines-GL (ID 95003) extends Record Sales Shipment Lines.
/// </summary>
pageextension 95003 "Sales Shipment Lines-GL" extends "Sales Shipment Lines"
{
    layout
    {
        addlast(Control1)
        {
            field("Customer Part No."; rec."Customer Part No.")
            {
                ApplicationArea = All;
            }
            field("Customer Item Refence No."; rec."Customer Item Ref. No.")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Commission %"; rec."Commission %")
            {
                ApplicationArea = All;
            }
        }
    }
}
