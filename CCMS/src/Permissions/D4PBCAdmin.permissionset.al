namespace D4P.CCMS.Permissions;

permissionset 62000 "D4P BC ADMIN"
{
    Assignable = true;
    Caption = 'D365BC Admin Center - Full Access';
    Permissions =
        tabledata * = RIMD,
        table * = X,
        page * = X,
        report * = X,
        codeunit * = X;
}