unit UsersServiceUnit;

interface

uses
    System.Generics.Collections, REST.Types,
    AccountUnit;

type
    TUsersService = class
    private const
        BASE_URL = 'https://invest-public-api.tinkoff.ru/rest/tinkoff.public.invest.api.contract.v1.';
        SERVICE_URL = BASE_URL + 'UsersService/';
        GET_ACCOUNTS_URL = SERVICE_URL + 'GetAccounts';
    public
        class function GetAccounts: TObjectList<TAccount>;
    end;

implementation

uses
    HttpUtilUnit, AccountsUnit;

{ TUsersService }

class function TUsersService.GetAccounts: TObjectList<TAccount>;
var
    Request: THttpRequest;
    Response: THttpResponse;
begin
    Request.Url := GET_ACCOUNTS_URL;
    Request.Method := TRESTRequestMethod.rmPOST;
    Response := THttpUtil.Execute(Request);
    Result := TAccounts.Parse(Response.Content);
end;

end.
