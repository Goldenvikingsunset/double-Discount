pageextension 50062 "Posted Sales Invoice Subform" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Line Discount %")
        {
            field(SecondaryDiscountPct; Rec."Secondary Discount %")
            {
                ApplicationArea = All;
                Caption = 'Secondary Discount %';
                ToolTip = 'Specifies a secondary discount percentage that will be applied after the line discount.';
            }
            field(SecondaryDiscountAmt; Rec."Secondary Discount Amount")
            {
                ApplicationArea = All;
                Caption = 'Secondary Discount Amount';
                ToolTip = 'Shows the amount of the secondary discount.';
                Editable = false;
            }
        }
        addafter("Invoice Discount Amount")
        {
            field("Secondary Invoice Discount %"; Rec."Secondary Invoice Discount %")
            {
                ApplicationArea = All;
                Caption = 'Secondary Invoice Discount %';
                ToolTip = 'Specifies a secondary invoice discount percentage that will be applied after the invoice discount.';
            }
            field("Sec. Inv. Discount Amount"; Rec."Sec. Inv. Discount Amount")
            {
                ApplicationArea = All;
                Caption = 'Secondary Invoice Discount Amount';
                ToolTip = 'Shows the amount of the secondary invoice discount.';
                Editable = false;
            }
        }
    }
}
