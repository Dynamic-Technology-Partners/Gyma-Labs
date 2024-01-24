/// <summary>
/// PageExtension Purchase Invoice-GL (ID 95006) extends Record Purchase Invoice.
/// </summary>
pageextension 95006 "Purchase Invoice-GL" extends "Purchase Invoice"
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
