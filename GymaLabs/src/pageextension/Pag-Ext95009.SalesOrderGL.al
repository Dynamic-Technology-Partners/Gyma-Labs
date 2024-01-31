/// <summary>
/// PageExtension Sales Order-GL (ID 95009) extends Record Sales Order.
/// </summary>
pageextension 95009 "Sales Order-GL" extends "Sales Order"
{
    layout
    {
        addafter("Completely Shipped")
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
                MultiLine = true;
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
