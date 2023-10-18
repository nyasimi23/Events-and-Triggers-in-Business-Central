codeunit 50104 "Validations"
{
    trigger OnRun()
    begin
        
    end;


    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Phone No.', false, false)]
    local procedure TableCustomerOnAfterValidatePhoneNo(var Rec: Record Customer)
    begin
        CheckForExcess(Rec."Phone No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Address', false, false)]
    local procedure TableCustomerOnAfterValidateAddress(var Rec: Record Customer)
    begin
          CheckForPlusSign(Rec.Address);
    end;

    

    local procedure CheckForPlusSign(TextToVerify: Text)
    var
        myInt: Integer;
    begin
        if TextToVerify.Contains('+') then
            Message('A + sign has been found.');
    end;


    local procedure CheckForExcess(TextToVerify: Text)
    begin
        if StrLen(TextToVerify) > 12 then 
        Message('Digits are in excess');
    end;
   
}