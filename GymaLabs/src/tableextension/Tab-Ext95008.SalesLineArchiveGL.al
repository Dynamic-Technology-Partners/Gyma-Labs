/// <summary>
/// TableExtension Sales Line Archive-GL (ID 95008) extends Record Sales Line Archive.
/// </summary>
tableextension 95008 "Sales Line Archive-GL" extends "Sales Line Archive"
{
    fields
    {
        field(95000; "Customer Part No."; Code[20])
        {
            Caption = 'Customer Part No.';
            DataClassification = ToBeClassified;
        }
        field(95001; "Customer Item Ref. No."; Text[50])
        {
            Caption = 'Customer Item Ref. No.';
            DataClassification = ToBeClassified;
        }
        field(95002; "Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = ToBeClassified;
        }
    }
}
