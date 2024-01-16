/// <summary>
/// TableExtension Purchase Header-GL (ID 95003) extends Record Purchase Header.
/// </summary>
tableextension 95003 "Purchase Header-GL" extends "Purchase Header"
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
        }
        field(95003; Packing; Code[10])
        {
            Caption = 'Packing';
            DataClassification = ToBeClassified;
        }
        field(95004; "Labels"; Code[10])
        {
            Caption = 'Labels';
            DataClassification = ToBeClassified;
        }
        field(95005; Marking; Code[10])
        {
            Caption = 'Marking';
            DataClassification = ToBeClassified;
        }
        field(95006; Documents; Code[10])
        {
            Caption = 'Documents';
            DataClassification = ToBeClassified;
        }
    }
}
