/// <summary>
/// PageExtension Sales Order Archive-GL (ID 95012) extends Record Sales Order Archive.
/// </summary>
pageextension 95012 "Sales Order Archive-GL" extends "Sales Order Archive"
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
