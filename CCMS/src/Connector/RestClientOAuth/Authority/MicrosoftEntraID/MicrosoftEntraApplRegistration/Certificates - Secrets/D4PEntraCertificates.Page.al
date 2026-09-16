namespace D4P.CCMS.Connector.RestClientOAuth;
page 62036 "D4P Entra Certificates"
{
    PageType = List;
    Caption = 'Entra Certificates';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "D4P Entra Certificate";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
                field(HasValue; Rec.HasValue())
                {
                    Caption = 'Certificate exists';
                    ToolTip = 'Specifies the value of the Certificate exists field.';
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(CreateCertificateActionRef; CreateCertificateAction) { }
            actionref(DownloadCertificateActionRef; DownloadCertificateAction) { }
        }
        area(Processing)
        {
            action(CreateCertificateAction)
            {
                Caption = 'Create Certificate';
                Image = NewResource;
                ToolTip = 'Enables the creation of a new certificate.';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord();
                    Rec.CreateCertificate();
                end;
            }
            action(DownloadCertificateAction)
            {
                Caption = 'Download Certificate';
                Image = Download;
                ToolTip = 'Enables the download of an existing certificate.';

                trigger OnAction()
                begin
                    Rec.DownloadCertificate();
                end;
            }
        }
    }
}