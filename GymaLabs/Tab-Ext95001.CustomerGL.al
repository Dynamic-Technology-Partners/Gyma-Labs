/// <summary>
/// TableExtension Customer-GL (ID 95001) extends Record Customer.
/// </summary>
tableextension 95001 "Customer-GL" extends Customer
{
    fields
    {
        field(95000; "DEA License No."; Text[15])
        {
            Caption = 'DEA License No.';
            DataClassification = ToBeClassified;
        }
        field(95001; "DEA Expired Date"; Date)
        {
            Caption = 'DEA Expired Date';
            DataClassification = ToBeClassified;
        }
    }
}
