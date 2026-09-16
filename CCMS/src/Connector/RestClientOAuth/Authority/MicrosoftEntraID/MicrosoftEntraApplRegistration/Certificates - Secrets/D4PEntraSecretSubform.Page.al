namespace D4P.CCMS.Connector.RestClientOAuth;
page 62037 "D4P Entra Secret Subform"
{
    PageType = ListPart;
    Caption = 'Secrets';
    ApplicationArea = All;
    SourceTable = "D4P Entra Secret";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Description; Rec.Description)
                {

                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("End Date/Time"; Rec."End Date/Time")
                {
                    ToolTip = 'Specifies the value of the End Date/Time field.';
                }
                field(SecretTxt; SecretTxt)
                {
                    Caption = 'Value';
                    Editable = SecretEditable;
                    ToolTip = 'Specifies the value of the Value field.';

                    trigger OnValidate()
                    begin
                        Rec.Hint := SecretTxt.Substring(1, 3);
                        CurrPage.SaveRecord();
                        Rec.SetSecretText(SecretTxt);
                        CurrPage.Update(false);
                    end;
                }
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the value of the Id field.';
                }
            }
        }
    }

    var
        [NonDebuggable]
        SecretTxt: Text;
        SecretEditable: Boolean;


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Id := CopyStr(Format(CreateGuid(), 0, 4).ToLower(), 1, MaxStrLen(Rec.Id));
        SecretTxt := '';
        SecretEditable := true;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Hint = '' then begin
            SecretTxt := '';
            SecretEditable := true;
        end else begin
            SecretTxt := Rec.Hint + '******************';
            SecretEditable := false;
        end;
    end;
}