codeunit 50055 "Double Discount Calculator"
{
    procedure CalculateLineAmounts(var SalesLine: Record "Sales Line"; CalledByFieldNo: Integer)
    var
        SalesSetup: Record "Sales & Receivables Setup";
        AmountAfterFirstDisc: Decimal;
    begin
        // Get setup
        SalesSetup.Get();

        // Calculate original amount
        SalesLine."Original Amount" := Round(SalesLine.Quantity * SalesLine."Unit Price");

        // Reset all discount amounts if both discounts are 0
        if (SalesLine."Line Discount %" = 0) and (SalesLine."Secondary Discount %" = 0) then begin
            SalesLine."First Discount Amount" := 0;
            SalesLine."Secondary Discount Amount" := 0;
            SalesLine."Line Amount" := SalesLine."Original Amount";
            exit;
        end;

        // Calculate first discount
        if SalesLine."Line Discount %" <> 0 then begin
            SalesLine."First Discount Amount" := Round(SalesLine."Original Amount" * SalesLine."Line Discount %" / 100);
            AmountAfterFirstDisc := SalesLine."Original Amount" - SalesLine."First Discount Amount";
        end else begin
            SalesLine."First Discount Amount" := 0;
            AmountAfterFirstDisc := SalesLine."Original Amount";
        end;

        // Calculate second discount
        if SalesLine."Secondary Discount %" <> 0 then begin
            SalesLine."Secondary Discount Amount" := Round(AmountAfterFirstDisc * SalesLine."Secondary Discount %" / 100);
            SalesLine."Line Amount" := AmountAfterFirstDisc - SalesLine."Secondary Discount Amount";
        end else begin
            SalesLine."Secondary Discount Amount" := 0;
            SalesLine."Line Amount" := AmountAfterFirstDisc;
        end;
    end;
}