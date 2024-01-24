/// <summary>
/// PageExtension Posted Sales Invoice-GL (ID 95016) extends Record Posted Sales Invoice.
/// </summary>
pageextension 95016 "Posted Sales Invoice-GL" extends "Posted Sales Invoice"
{
    layout
    {
        addafter(General)
        {
            field("No. of Packages"; rec."No. of Packages")
            {
                ApplicationArea = All;
            }
            field("Weight"; rec.Weight)
            {
                ApplicationArea = All;
            }
            field("Ship Code"; rec."Ship Code")
            {
                ApplicationArea = All;
            }
            field("Class"; rec.Class)
            {
                ApplicationArea = All;
            }
            field("No. of Pieces"; rec."No. of Pieces")
            {
                ApplicationArea = All;
            }
            field("Order Type"; rec."Order Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
