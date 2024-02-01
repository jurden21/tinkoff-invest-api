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
  GetInfoResponseUnit in 'tinkoff\entity\users\GetInfoResponseUnit.pas',
  JsonUtilUnit in 'tinkoff\util\JsonUtilUnit.pas',
  OperationsServiceUnit in 'tinkoff\service\OperationsServiceUnit.pas',
  GetPositionsResponseUnit in 'tinkoff\entity\operations\GetPositionsResponseUnit.pas',
  GetPositionsRequestUnit in 'tinkoff\entity\operations\GetPositionsRequestUnit.pas',
  GetAccountsResponseUnit in 'tinkoff\entity\users\GetAccountsResponseUnit.pas';

var
    Key: String;
    Client: TTinkoffClient;
    ExampleAccountId: String;
    Index: Integer;
    GetInfoResponse: TGetInfoResponse;
    GetPositionsRequest: TGetPositionsRequest;
    GetPositionsResponse: TGetPositionsResponse;
    Accounts: TObjectList<TAccount>;

begin
    ReportMemoryLeaksOnShutdown := True;

    Key := TIniUtil.ReadString('Tinkoff', 'Key');
    Client := TTinkoffClient.Create(Key);

    try

        Writeln('Request UsersService.GetAccounts...');
        Accounts := Client.GetAccounts;
        ExampleAccountId := Accounts[0].Id;
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

        Writeln('Request OperationsService.GetPositions...');
        Writeln('Account: ' + ExampleAccountId);
        GetPositionsRequest := TGetPositionsRequest.Create(ExampleAccountId);
        GetPositionsResponse := Client.GetPositions(GetPositionsRequest);
        Writeln(GetPositionsResponse.ToString);
        Writeln('=====================================================================');
        Writeln('');

    finally
        Client.Free;
    end;


    Writeln('Press ENTER...');
    Readln;

end.
