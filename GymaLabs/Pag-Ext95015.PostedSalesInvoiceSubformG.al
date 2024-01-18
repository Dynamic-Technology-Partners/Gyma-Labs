/// <summary>
/// PageExtension Posted Sales Invoice Subform-G (ID 95015) extends Record Posted Sales Invoice Subform.
/// </summary>
pageextension 95015 "Posted Sales Invoice Subform-G" extends "Posted Sales Invoice Subform"
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
