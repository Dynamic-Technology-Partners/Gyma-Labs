/// <summary>
/// PageExtension Customer Card - GL (ID 95022) extends Record Customer Card.
/// </summary>
pageextension 95022 "Customer Card - GL" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("DEA License No."; Rec."DEA License No.")
            {
                ApplicationArea = All;
            }
            field("DEA Expired Date"; Rec."DEA Expired Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
