/// <summary>
/// TableExtension Sales Line-GL (ID 95004) extends Record Sales Line.
/// </summary>
tableextension 95004 "Sales Line-GL" extends "Sales Line"
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
