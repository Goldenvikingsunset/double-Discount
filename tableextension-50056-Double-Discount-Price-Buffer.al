tableextension 50056 "Double Discount Price Buffer" extends "Price Calculation Buffer"
{
    fields
    {
        field(50100; "Secondary Discount %"; Decimal)
        {
            Caption = 'Secondary Discount %';
            DecimalPlaces = 0 : 5;
        }
        field(50101; "Secondary Discount Amount"; Decimal)
        {
            Caption = 'Secondary Discount Amount';
        }
    }
}