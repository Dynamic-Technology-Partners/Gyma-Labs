/// <summary>
/// Table Cost Insurance Freight-GL (ID 95000).
/// </summary>
table 95000 "Cost Insurance Freight-GL"
{
    Caption = 'Cost Insurance Freight-GL';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Cost Insurance Freight-GL";

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
