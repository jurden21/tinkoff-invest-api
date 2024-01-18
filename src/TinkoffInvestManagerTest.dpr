program TinkoffInvestManagerTest;

{$APPTYPE CONSOLE}
{$R *.res}

uses
    System.SysUtils,
    System.Generics.Collections,
    TinkoffClientUnit in 'tinkoff\TinkoffClientUnit.pas',
    AccountStatusUnit in 'tinkoff\enum\AccountStatusUnit.pas',
    AccountTypeUnit in 'tinkoff\enum\AccountTypeUnit.pas',
    AccountAccessLevelUnit in 'tinkoff\enum\AccountAccessLevelUnit.pas',
    UsersServiceUnit in 'tinkoff\service\UsersServiceUnit.pas',
    HttpUtilUnit in 'util\HttpUtilUnit.pas',
    ApplicationContextUnit in 'config\ApplicationContextUnit.pas',
    IniUtilUnit in 'util\IniUtilUnit.pas',
    AccountUnit in 'tinkoff\entity\AccountUnit.pas',
    AccountsUnit in 'tinkoff\entity\AccountsUnit.pas';

var
    Client: TTinkoffClient;
    Accounts: TObjectList<TAccount>;
    Index: Integer;

begin
    ReportMemoryLeaksOnShutdown := True;

    Client := TTinkoffClient.Create;

    try

        Writeln('Request UsersService.GetAccounts...');
        Accounts := Client.GetAccounts;
        for Index := 0 to Accounts.Count - 1 do
            Writeln(Accounts[Index].ToString);
        Accounts.Free;
        Writeln('=====================================================================');

    finally
        Client.Free;
    end;


    Writeln('Press ENTER...');
    Readln;

end.
