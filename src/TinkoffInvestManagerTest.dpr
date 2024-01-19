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
  HttpUtilUnit in 'tinkoff\util\HttpUtilUnit.pas',
  IniUtilUnit in 'util\IniUtilUnit.pas',
  AccountUnit in 'tinkoff\entity\AccountUnit.pas',
  AccountsUnit in 'tinkoff\entity\AccountsUnit.pas',
  GetInfoResponseUnit in 'tinkoff\entity\GetInfoResponseUnit.pas',
  JsonUtilUnit in 'tinkoff\util\JsonUtilUnit.pas';

var
    Key: String;
    Client: TTinkoffClient;
    Accounts: TObjectList<TAccount>;
    GetInfoResponse: TGetInfoResponse;
    Index: Integer;

begin
    ReportMemoryLeaksOnShutdown := True;

    Key := TIniUtil.ReadString('Tinkoff', 'Key');
    Client := TTinkoffClient.Create(Key);

    try

        Writeln('Request UsersService.GetAccounts...');
        Accounts := Client.GetAccounts;
        for Index := 0 to Accounts.Count - 1 do
            Writeln(Accounts[Index].ToString);
        Accounts.Free;
        Writeln('=====================================================================');
        Writeln('');

        Writeln('Request UserService.GetInfo...');
        GetInfoResponse := Client.GetInfo;
        Writeln(GetInfoResponse.ToString);
        Writeln('=====================================================================');
        Writeln('');

    finally
        Client.Free;
    end;


    Writeln('Press ENTER...');
    Readln;

end.
