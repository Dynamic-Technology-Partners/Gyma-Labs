/// <summary>
/// Table Documents-GL (ID 95004).
/// </summary>
table 95004 "Documents-GL"
{
    Caption = 'Documents-GL';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(3; "Description 1"; Text[80])
        {
            Caption = 'Description 1';
        }
        field(4; "Description 2"; Text[80])
        {
            Caption = 'Description 2';
        }
        field(5; "Description 3"; Text[80])
        {
            Caption = 'Description 3';
        }
        field(6; "Description 4"; Text[80])
        {
            Caption = 'Description 4';
        }
        field(7; "Description 5"; Text[80])
        {
            Caption = 'Description 5';
        }
        field(8; Class; Code[10])
        {
            Caption = 'Class';
        }
        field(9; Hazardous; Boolean)
        {
            Caption = 'Hazardous';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
