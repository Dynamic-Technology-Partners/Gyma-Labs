/// <summary>
/// TableExtension Sales Header Archive-GL (ID 95014) extends Record Sales Header Archive.
/// </summary>
tableextension 95014 "Sales Header Archive-GL" extends "Sales Header Archive"
{
    fields
    {
        field(95000; "No. of Packages"; Decimal)
        {
            Caption = 'No. of Packages';
            DataClassification = ToBeClassified;
        }
        field(95001; "Weight"; Decimal)
        {
            Caption = 'Weight';
            DataClassification = ToBeClassified;
        }
        field(95002; "Ship Code"; Text[200])
        {
            Caption = 'Ship Code';
            DataClassification = ToBeClassified;
        }
        field(95003; "Class"; Text[30])
        {
            Caption = 'Class';
            DataClassification = ToBeClassified;
        }
        field(95004; "No. of Pieces"; Decimal)
        {
            Caption = 'No. of Pieces';
            DataClassification = ToBeClassified;
        }
        field(95005; "Order Type"; Enum "Sales Order Type")
        {
            Caption = 'Order Type';
            DataClassification = ToBeClassified;
        }
    }
}
