/// <summary>
/// PageExtension Sales Order Shipment-GL (ID 95011) extends Record Sales Order Shipment.
/// </summary>
pageextension 95011 "Sales Order Shipment-GL" extends "Sales Order Shipment"
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
