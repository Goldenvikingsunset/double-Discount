permissionset 50061 "Double Discount"
{
    Assignable = true;
    Caption = 'Double Discount';
    Permissions =
        tabledata "Sales Invoice Line" = RIMD,
        tabledata "Sales Line" = RIMD,
        tabledata "Sales Header" = RIMD;
}