/// <summary>
/// PageExtension Item Card-GL (ID 95000) extends Record Item Card.
/// </summary>
pageextension 95000 "Item Card-GL" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Hazardous"; Rec.Hazardous)
            {
                ApplicationArea = All;
            }
            field("Controlled"; rec.Controlled)
            {
                ApplicationArea = All;
            }
            field("Refrigerated"; rec.Refrigerated)
            {
                ApplicationArea = All;
            }
            field("CAS"; rec.CAS)
            {
                ApplicationArea = All;
            }
            field("CSA"; rec.CSA)
            {
                ApplicationArea = All;
            }
            field("DEA Register No."; rec."DEA Register No.")
            {
                ApplicationArea = All;
            }
            field("FDA Product Code"; rec."FDA Product Code")
            {
                ApplicationArea = All;
            }
            field("Hazmat"; rec.Hazmat)
            {
                ApplicationArea = All;
            }
        }
    }
}
