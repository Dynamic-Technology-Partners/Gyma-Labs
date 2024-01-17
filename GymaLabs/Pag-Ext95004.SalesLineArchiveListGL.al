/// <summary>
/// PageExtension Sales Line Archive List-GL (ID 95004) extends Record Sales Line Archive List.
/// </summary>
pageextension 95004 "Sales Line Archive List-GL" extends "Sales Line Archive List"
{
    layout
    {
        addlast(Control14)
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
