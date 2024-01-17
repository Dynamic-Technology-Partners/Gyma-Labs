/// <summary>
/// PageExtension Purchase Order Archive-GL (ID 95008) extends Record Purchase Order Archive.
/// </summary>
pageextension 95008 "Purchase Order Archive-GL" extends "Purchase Order Archive"
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
