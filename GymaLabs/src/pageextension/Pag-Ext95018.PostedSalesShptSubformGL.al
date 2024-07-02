/// <summary>
/// PageExtension Posted Sales Shpt. Subform-GL (ID 95018) extends Record Posted Sales Shpt. Subform.
/// </summary>
pageextension 95018 "Posted Sales Shpt. Subform-GL" extends "Posted Sales Shpt. Subform"
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
