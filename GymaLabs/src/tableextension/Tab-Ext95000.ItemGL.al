/// <summary>
/// TableExtension Item-GL (ID 95000) extends Record Item.
/// </summary>
tableextension 95000 "Item-GL" extends Item
{
    fields
    {
        field(95000; Hazardous; Boolean)
        {
            Caption = 'Hazardous';
            DataClassification = ToBeClassified;
        }
        field(95001; Controlled; Boolean)
        {
            Caption = 'Controlled';
            DataClassification = ToBeClassified;
        }
        field(95002; Refrigerated; Boolean)
        {
            Caption = 'Refrigerated';
            DataClassification = ToBeClassified;
        }
        field(95003; CAS; Text[30])
        {
            Caption = 'CAS';
            DataClassification = ToBeClassified;
        }
        field(95004; CSA; Text[30])
        {
            Caption = 'CSA';
            DataClassification = ToBeClassified;
        }
        field(95005; "DEA Register No."; Text[30])
        {
            Caption = 'DEA Register No.';
            DataClassification = ToBeClassified;
        }
        field(95006; "FDA Product Code"; Text[30])
        {
            Caption = 'FDA Product Code';
            DataClassification = ToBeClassified;
        }
        field(95007; Hazmat; Text[200])
        {
            Caption = 'Hazmat';
            DataClassification = ToBeClassified;
        }
    }
}
