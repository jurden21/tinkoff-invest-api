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
    GetAccountsResponse: TGetAccountsResponse;
    GetInfoResponse: TGetInfoResponse;
    GetPositionsRequest: TGetPositionsRequest;
    GetPositionsResponse: TGetPositionsResponse;

begin
    ReportMemoryLeaksOnShutdown := True;

    Key := TIniUtil.ReadString('Tinkoff', 'Key');
    Client := TTinkoffClient.Create(Key);

    try

        Writeln('Request UsersService.GetAccounts...');
        GetAccountsResponse := Client.GetAccounts;
        if GetAccountsResponse.Accounts.Count > 3
        then ExampleAccountId := GetAccountsResponse.Accounts[3].Id
        else ExampleAccountId := GetAccountsResponse.Accounts[0].Id;
        for Index := 0 to GetAccountsResponse.Accounts.Count - 1 do
            Writeln(GetAccountsResponse.Accounts[Index].ToString);
        GetAccountsResponse.Free;
        Writeln('=====================================================================');
        Writeln('');

        Writeln('Request UserService.GetInfo...');
        GetInfoResponse := Client.GetInfo;
        Writeln(GetInfoResponse.ToString);
        GetInfoResponse.Free;
        Writeln('=====================================================================');
        Writeln('');

        Writeln('Request OperationsService.GetPositions...');
        Writeln('Account: ' + ExampleAccountId);
        GetPositionsRequest := TGetPositionsRequest.Create(ExampleAccountId);
        GetPositionsResponse := Client.GetPositions(GetPositionsRequest);
        Writeln(GetPositionsResponse.ToString);
        GetPositionsResponse.Free;
        GetPositionsRequest.Free;
        Writeln('=====================================================================');
        Writeln('');

    finally
        Client.Free;
    end;


    Writeln('Press ENTER...');
    Readln;

end.
