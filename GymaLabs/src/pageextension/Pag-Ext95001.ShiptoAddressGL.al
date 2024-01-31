/// <summary>
/// PageExtension Ship-to Address-GL (ID 95001) extends Record Ship-to Address.
/// </summary>
pageextension 95001 "Ship-to Address-GL" extends "Ship-to Address"
{
    layout
    {
        addlast(General)
        {
            field("DEA License No."; rec."DEA License No.")
            {
                ApplicationArea = All;
            }
            field("DEA Expired Date"; rec."DEA Expired Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
