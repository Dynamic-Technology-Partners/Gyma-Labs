/// <summary>
/// TableExtension Purchase Header Archive-GL (ID 95011) extends Record Purchase Header Archive.
/// </summary>
tableextension 95011 "Purchase Header Archive-GL" extends "Purchase Header Archive"
{
    fields
    {
        field(95000; "FDA No."; Code[20])
        {
            Caption = 'FDA No.';
            DataClassification = ToBeClassified;
        }
        field(95001; "FDA Release Date"; Date)
        {
            Caption = 'FDA Release Date';
            DataClassification = ToBeClassified;
        }
        field(95002; CIF; Code[10])
        {
            Caption = 'CIF';
            DataClassification = ToBeClassified;
            TableRelation = "Cost Insurance Freight-GL".Code;
        }
        field(95003; Packing; Code[10])
        {
            Caption = 'Packing';
            DataClassification = ToBeClassified;
            TableRelation = "Packing-GL".Code;
        }
        field(95004; "Labels"; Code[10])
        {
            Caption = 'Labels';
            DataClassification = ToBeClassified;
            TableRelation = "Labels-GL".Code;
        }
        field(95005; Marking; Code[10])
        {
            Caption = 'Marking';
            DataClassification = ToBeClassified;
            TableRelation = "Marking-GL".Code;
        }
        field(95006; Documents; Code[10])
        {
            Caption = 'Documents';
            DataClassification = ToBeClassified;
            TableRelation = "Documents-GL".Code;
        }
    }
}
