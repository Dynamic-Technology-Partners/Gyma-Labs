/// <summary>
/// Enum Sales Order Type (ID 95000).
/// </summary>
enum 95000 "Sales Order Type"
{
    Extensible = true;

    value(0; Standard)
    {
        Caption = 'Standard';
    }
    value(1; Commission)
    {
        Caption = 'Commission';
    }
    value(2; Project)
    {
        Caption = 'Project';
    }
}
