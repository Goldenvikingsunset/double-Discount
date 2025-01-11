codeunit 50061 "Posted Sales Invoice Transfer"
{
    local procedure TransferFieldsFromSalesLineToPostedSalesInvoiceLine(var SalesLine: Record "Sales Line"; var PostedSalesInvoiceLine: Record "Sales Line")
    begin
        // ...existing code...
        PostedSalesInvoiceLine."Secondary Discount %" := SalesLine."Secondary Discount %";
        PostedSalesInvoiceLine."Secondary Discount Amount" := SalesLine."Secondary Discount Amount";
        PostedSalesInvoiceLine."Original Amount" := SalesLine."Original Amount";
        PostedSalesInvoiceLine."First Discount Amount" := SalesLine."First Discount Amount";
        // ...existing code...
    end;
}
