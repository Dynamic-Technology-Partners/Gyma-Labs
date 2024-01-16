/// <summary>
/// TableExtension Sales Line-GL (ID 95004) extends Record Sales Line.
/// </summary>
tableextension 95004 "Sales Line-GL" extends "Sales Line"
{
    fields
    {
        field(95000; "Commission %"; Decimal)
        {
            Caption = 'Commission %';
            DataClassification = ToBeClassified;
        }
    }
}
