/// <summary>
/// TableExtension Sales Shipment Line-GL (ID 95007) extends Record Sales Shipment Line.
/// </summary>
tableextension 95007 "Sales Shipment Line-GL" extends "Sales Shipment Line"
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
