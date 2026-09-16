namespace D4P.CCMS.Permissions;

permissionset 62001 "D4P BC ADMIN READ"
{
    Assignable = true;
    Caption = 'D365BC Admin Center - Read Only Access';
    Permissions =
        tabledata * = R,
        table * = X,
        page * = X,
        report * = X,
        codeunit * = X;
}
