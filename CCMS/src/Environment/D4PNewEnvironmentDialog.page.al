namespace D4P.CCMS.Environment;

using D4P.CCMS.Tenant;

page 62005 "D4P New Environment Dialog"
{
    PageType = StandardDialog;
    Caption = 'New Environment Creation';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field(EnvironmentName; EnvironmentName)
            {
                Caption = 'Environment Name';
                ToolTip = 'Specifies the name of the new environment to create.';
            }
            field(Localization; Localization)
            {
                Caption = 'Localization';
                ToolTip = 'Specifies the localization for the new environment.';
            }
            field(EnvironmentType; EnvironmentType)
            {
                Caption = 'Environment Type';
                ToolTip = 'Specifies the type of the new environment to create.';
            }
        }
    }

    procedure SetBCTenant(var _BCTenant: Record "D4P BC Tenant")
    begin
        BCTenant := _BCTenant;
    end;

    procedure CreateNewBCEnvironment()
    var
        EnvironmentManagement: Codeunit "D4P BC Environment Mgt";
    begin
        EnvironmentManagement.CreateNewBCEnvironment(
            BCTenant, EnvironmentName, Localization, EnvironmentType);
    end;

    var
        BCTenant: Record "D4P BC Tenant";
        Localization: Code[2];
        EnvironmentType: Enum "D4P Environment Type";
        EnvironmentName: Text[100];
}