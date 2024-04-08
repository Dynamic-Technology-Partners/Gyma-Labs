/// <summary>
/// PageExtension Purchases Payables Setup-GL (ID 95023) extends Record Purchases Payables Setup.
/// </summary>
pageextension 95023 "Purchases & Payables Setup-GL" extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Purchase Line Item Cost Default to Zero"; Rec."P.L. Item Cost Default to Zero")
            {
                ApplicationArea = All;
            }
        }
    }
}
