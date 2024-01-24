/// <summary>
/// PageExtension Sales Order Subform-GL (ID 95014) extends Record Sales Order Subform.
/// </summary>
pageextension 95014 "Sales Order Subform-GL" extends "Sales Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Customer Part No."; rec."Customer Part No.")
            {
                ApplicationArea = All;
            }
            field("Customer Item Ref. No."; rec."Customer Item Ref. No.")
            {
                ApplicationArea = All;
            }
            field("Commission %"; rec."Commission %")
            {
                ApplicationArea = All;
            }
        }
    }
}
