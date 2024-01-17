/// <summary>
/// TableExtension Ship-to Address-GL (ID 95005) extends Record Ship-to Address.
/// </summary>
tableextension 95005 "Ship-to Address-GL" extends "Ship-to Address"
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
