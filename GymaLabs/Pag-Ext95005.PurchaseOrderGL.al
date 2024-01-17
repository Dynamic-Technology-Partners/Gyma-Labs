/// <summary>
/// PageExtension Purchase Order-GL (ID 95005) extends Record Purchase Order.
/// </summary>
pageextension 95005 "Purchase Order-GL" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("FDA No."; rec."FDA No.")
            {
                ApplicationArea = All;
            }
            field("FDA Release Date"; rec."FDA Release Date")
            {
                ApplicationArea = All;
            }
            field("CIF"; rec.CIF)
            {
                ApplicationArea = All;
            }
            field("Packing"; rec.Packing)
            {
                ApplicationArea = All;
            }
            field("Labels"; rec.Labels)
            {
                ApplicationArea = All;
            }
            field("Marking"; rec.Marking)
            {
                ApplicationArea = All;
            }
            field("Documents"; rec.Documents)
            {
                ApplicationArea = All;
            }
        }
    }
}
