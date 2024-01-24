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
