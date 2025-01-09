pageextension 50060 "Secondary Invoice Disc Page" extends "Sales Order Subform"
{
    layout
    {
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