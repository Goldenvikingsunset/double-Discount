tableextension 50057 "Double Discount Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50200; "Max Combined Discount %"; Decimal)
        {
            Caption = 'Maximum Combined Discount %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
            MaxValue = 100;
        }
        field(50201; "Validate Max Combined Discount"; Boolean)
        {
            Caption = 'Validate Maximum Combined Discount';
        }
    }
}