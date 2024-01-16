/// <summary>
/// TableExtension Sales Header-GL (ID 95002) extends Record Sales Header.
/// </summary>
tableextension 95002 "Sales Header-GL" extends "Sales Header"
{
    fields
    {
        field(95000; "Customer Part No."; Code[20])
        {
            Caption = 'Customer Part No.';
            DataClassification = ToBeClassified;
        }
        field(95001; "Customer Item Reference No."; Text[50])
        {
            Caption = 'Customer Item Reference No.';
            DataClassification = ToBeClassified;
        }
        field(95002; "Order Type"; Enum "Sales Order Entity Buffer Status")
        {
            Caption = 'Order Type';
            DataClassification = ToBeClassified;
        }
    }
}
