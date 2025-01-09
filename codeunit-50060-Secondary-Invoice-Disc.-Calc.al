codeunit 50060 "Secondary Invoice Disc. Calc"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnAfterCalculateSalesSubPageTotals', '', false, false)]
    local procedure OnAfterCalculateSalesSubPageTotals(var TotalSalesLine2: Record "Sales Line")
    var
        SalesHeader: Record "Sales line";
    begin
        if not SalesHeader.Get(TotalSalesLine2."Document Type", TotalSalesLine2."Document No.") then
            exit;

        if SalesHeader."Secondary Invoice Discount %" <> 0 then begin
            SalesHeader.CalcFields(Amount);
            if SalesHeader."Inv. Disc. Amount to Invoice" = 0 then
                SalesHeader."Sec. Inv. Discount Amount" := Round(SalesHeader.Amount * SalesHeader."Secondary Invoice Discount %" / 100)
            else
                SalesHeader."Sec. Inv. Discount Amount" := Round((SalesHeader.Amount - SalesHeader."Inv. Disc. Amount to Invoice") * SalesHeader."Secondary Invoice Discount %" / 100);
            SalesHeader.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", 'OnAfterSalesDeltaUpdateTotals', '', false, false)]
    local procedure OnAfterSalesDeltaUpdateTotals(
        var TotalSalesLine: Record "Sales Line";
        var SalesLine: Record "Sales Line";
        var xSalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales line";
    begin
        if not SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.") then
            exit;

        if SalesHeader."Secondary Invoice Discount %" <> 0 then begin
            SalesHeader.CalcFields(Amount);
            if SalesHeader."Inv. Disc. Amount to Invoice" = 0 then
                SalesHeader."Sec. Inv. Discount Amount" := Round(SalesHeader.Amount * SalesHeader."Secondary Invoice Discount %" / 100)
            else
                SalesHeader."Sec. Inv. Discount Amount" := Round((SalesHeader.Amount - SalesHeader."Inv. Disc. Amount to Invoice") * SalesHeader."Secondary Invoice Discount %" / 100);
            SalesHeader.Modify();
        end;
    end;
}