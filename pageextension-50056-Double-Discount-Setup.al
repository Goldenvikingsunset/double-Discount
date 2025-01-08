pageextension 50056 "Double Discount Sales Order" extends "Sales Order Subform"
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
        addafter("Line Amount")
        {
            field(OriginalAmount; Rec."Original Amount")
            {
                ApplicationArea = All;
                Caption = 'Original Amount';
                ToolTip = 'Shows the original amount before any discounts.';
                Editable = false;
            }
            field(FirstDiscountAmount; Rec."First Discount Amount")
            {
                ApplicationArea = All;
                Caption = 'First Discount Amount';
                ToolTip = 'Shows the amount of the first discount.';
                Editable = false;
            }
        }
    }
}