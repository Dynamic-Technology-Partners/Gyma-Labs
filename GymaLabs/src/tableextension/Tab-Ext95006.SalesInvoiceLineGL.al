/// <summary>
/// TableExtension Sales Invoice Line-GL (ID 95006) extends Record Sales Invoice Line.
/// </summary>
tableextension 95006 "Sales Invoice Line-GL" extends "Sales Invoice Line"
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
            Caption = 'Customer Item Reference No.';
            DataClassification = ToBeClassified;
        }
        field(95002; "Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = ToBeClassified;
        }
    }
}
