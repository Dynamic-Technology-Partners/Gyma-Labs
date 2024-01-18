/// <summary>
/// PageExtension Posted Purchase Receipt-GL (ID 95021) extends Record Posted Purchase Receipt.
/// </summary>
pageextension 95021 "Posted Purchase Receipt-GL" extends "Posted Purchase Receipt"
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
