/// <summary>
/// Page Marking-GL (ID 95003).
/// </summary>
page 95003 "Marking-GL"
{
    Caption = 'Marking';
    PageType = List;
    SourceTable = "Marking-GL";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Class field.';
                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 1"; Rec."Description 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 1 field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Description 3"; Rec."Description 3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 3 field.';
                }
                field("Description 4"; Rec."Description 4")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 4 field.';
                }
                field("Description 5"; Rec."Description 5")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 5 field.';
                }
                field(Hazardous; Rec.Hazardous)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Hazardous field.';
                }
            }
        }
    }
}
