pageextension 50055 "Double Discount Setup Page" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Discount Posting")
        {
            group("Double Discount")
            {
                Caption = 'Double Discount';

                field("Max Combined Discount %"; Rec."Max Combined Discount %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum allowed combined discount percentage when using double discounts.';
                }
                field("Validate Max Combined Discount"; Rec."Validate Max Combined Discount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether to validate the maximum combined discount.';
                }
            }
        }
    }
}