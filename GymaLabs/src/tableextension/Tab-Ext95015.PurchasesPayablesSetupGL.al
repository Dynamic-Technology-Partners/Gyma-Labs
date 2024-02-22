/// <summary>
/// TableExtension Purchases & Payables Setup-GL (ID 95015) extends Record Purchases & Payables Setup.
/// </summary>
tableextension 95015 "Purchases & Payables Setup-GL" extends "Purchases & Payables Setup"
{
    fields
    {
        field(95000; "P.L. Item Cost Default to Zero"; Boolean)
        {
            Caption = 'Purchase Line Item Cost Default to Zero';
            DataClassification = ToBeClassified;
        }
    }
}
