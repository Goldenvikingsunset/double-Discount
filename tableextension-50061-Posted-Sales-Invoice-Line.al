tableextension 50061 "Posted Sales Invoice Line" extends "Sales Invoice Line"
{
    fields
    {
        field(50300; "Secondary Invoice Discount %"; Decimal)
        {
            Caption = 'Secondary Invoice Discount %';
            DecimalPlaces = 0 : 5;
        }
        field(50301; "Sec. Inv. Discount Amount"; Decimal)
        {
            Caption = 'Secondary Invoice Discount Amount';
        }
        field(50100; "Secondary Discount %"; Decimal)
        {
            Caption = 'Secondary Discount %';
            DecimalPlaces = 0 : 5;
        }
        field(50101; "Secondary Discount Amount"; Decimal)
        {
            Caption = 'Secondary Discount Amount';
        }
        field(50102; "Original Amount"; Decimal)
        {
            Caption = 'Original Amount';
        }
        field(50103; "First Discount Amount"; Decimal)
        {
            Caption = 'First Discount Amount';
        }
    }
}
