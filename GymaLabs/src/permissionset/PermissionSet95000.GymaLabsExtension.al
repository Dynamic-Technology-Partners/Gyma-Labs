permissionset 95000 "Gyma Labs Extension"
{
    Assignable = true;
    Permissions = tabledata "Cost Insurance Freight-GL" = RIMD,
        tabledata "Documents-GL" = RIMD,
        tabledata "Labels-GL" = RIMD,
        tabledata "Marking-GL" = RIMD,
        tabledata "Packing-GL" = RIMD,
        table "Cost Insurance Freight-GL" = X,
        table "Documents-GL" = X,
        table "Labels-GL" = X,
        table "Marking-GL" = X,
        table "Packing-GL" = X,
        page "Cost Insurance Freight-GL" = X,
        page "Documents-GL" = X,
        page "Labels-GL" = X,
        page "Marking-GL" = X,
        page "Packing-GL" = X;
}