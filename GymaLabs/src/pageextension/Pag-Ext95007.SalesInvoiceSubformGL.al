pageextension 95007 "Sales Invoice Subform-GL" extends "Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Customer Part No."; rec."Customer Part No.")
            {
                ApplicationArea = All;
            }
            field("Customer Item Reference No."; rec."Customer Item Ref. No.")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("Commission %"; rec."Commission %")
            {
                ApplicationArea = All;
            }
        }
    }
}
