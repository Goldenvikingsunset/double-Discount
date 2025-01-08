tableextension 50055 "Double Discount Sales Line" extends "Sales Line"
{
    fields
    {
        field(50100; "Secondary Discount %"; Decimal)
        {
            Caption = 'Secondary Discount %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            var
                DoubleDiscCalc: Codeunit "Double Discount Calculator";
            begin
                // Don't trigger calculation if clearing fields during initialization
                if (CurrFieldNo = 0) or (xRec."Secondary Discount %" = Rec."Secondary Discount %") then
                    exit;

                DoubleDiscCalc.CalculateLineAmounts(Rec, FieldNo("Secondary Discount %"));

                // Explicitly tell BC the record has been modified
                Modify(true);
            end;
        }
        field(50101; "Secondary Discount Amount"; Decimal)
        {
            Caption = 'Secondary Discount Amount';
            Editable = false;
        }
        field(50102; "Original Amount"; Decimal)
        {
            Caption = 'Original Amount';
            Editable = false;
        }
        field(50103; "First Discount Amount"; Decimal)
        {
            Caption = 'First Discount Amount';
            Editable = false;
        }
    }

    trigger OnAfterModify()
    var
        DoubleDiscCalc: Codeunit "Double Discount Calculator";
    begin
        // If line discount changes, recalculate amounts but preserve the line discount value
        if xRec."Line Discount %" <> Rec."Line Discount %" then
            DoubleDiscCalc.CalculateLineAmounts(Rec, FieldNo("Line Discount %"));
    end;
}