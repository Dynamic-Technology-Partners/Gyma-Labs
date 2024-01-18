/// <summary>
/// PageExtension Sales Quote Subform-GL (ID 95013) extends Record Sales Quote Subform.
/// </summary>
pageextension 95013 "Sales Quote Subform-GL" extends "Sales Quote Subform"
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
