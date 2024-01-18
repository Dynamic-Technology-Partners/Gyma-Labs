/// <summary>
/// PageExtension Sales Order Archive Subform-GL (ID 95019) extends Record Sales Order Archive Subform.
/// </summary>
pageextension 95019 "Sales Order Archive Subform-GL" extends "Sales Order Archive Subform"
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
