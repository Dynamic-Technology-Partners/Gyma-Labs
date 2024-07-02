codeunit 95001 "Gyma Labs Functions"
{
    procedure CheckForHazardousControlledItem(ItemNo: Code[20]): Boolean
    var
        Item: Record Item;
    begin
        Item.Get(ItemNo);
        if Item.Hazardous or Item.Controlled then begin
            if Item.Hazardous and Item.Controlled then begin
                Message('You are shipping an item marked as Hazardous and Controlled: %1 %2.', Item."No.", Item.Description);
            end else begin
                if Item.Hazardous then
                    Message('You are shipping an item marked as Hazardous: %1 %2.', Item."No.", Item.Description);
                if Item.Controlled then
                    Message('You are shipping an item marked as Controlled: %1 %2.', Item."No.", Item.Description);
            end;
            exit(true);
        end else begin
            if Item."DEA Register No." <> '' then
                Message('You are shipping an item with a DEA Register No.: %1 %2.', Item."No.", Item.Description);
            if Item."FDA Product Code" <> '' then
                Message('You are shipping an item with an FDA Product Code: %1 %2.', Item."No.", Item.Description);
            if Item.Hazmat <> '' then
                Message('You are shipping item %1 %2 with Hazmat information: %3.', Item."No.", Item.Description, Item.Hazmat);
        end;
        exit(false);
    end;
}
