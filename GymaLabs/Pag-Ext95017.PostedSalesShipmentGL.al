/// <summary>
/// PageExtension Posted Sales Shipment-GL (ID 95017) extends Record Posted Sales Shipment.
/// </summary>
pageextension 95017 "Posted Sales Shipment-GL" extends "Posted Sales Shipment"
{
    layout
    {
        addlast(General)
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
