tableextension 50060 "Secondary Invoice Disc Header" extends "Sales Line"
{
    fields
    {
        field(50300; "Secondary Invoice Discount %"; Decimal)
        {
            Caption = 'Secondary Invoice Discount %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            begin
                CalculateSecondaryInvoiceDiscount();
            end;
        }
        field(50301; "Sec. Inv. Discount Amount"; Decimal)
        {
            Caption = 'Secondary Invoice Discount Amount';
            Editable = false;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
    }

    local procedure CalculateSecondaryInvoiceDiscount()
    var
        SalesCalcDiscount: Codeunit "Sales-Calc. Discount";
        AmountAfterFirstDiscount: Decimal;
    begin
        if "Inv. Disc. Amount to Invoice" = 0 then
            AmountAfterFirstDiscount := Amount
        else
            AmountAfterFirstDiscount := Amount - "Inv. Disc. Amount to Invoice";

        if "Secondary Invoice Discount %" <> 0 then
            "Sec. Inv. Discount Amount" := Round(AmountAfterFirstDiscount * "Secondary Invoice Discount %" / 100)
        else
            "Sec. Inv. Discount Amount" := 0;

        Modify(true);
    end;
}
