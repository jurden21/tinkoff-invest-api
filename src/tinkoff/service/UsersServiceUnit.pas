unit UsersServiceUnit;

interface

uses
    System.Generics.Collections, REST.Types,
    GetAccountsResponseUnit, GetInfoResponseUnit;

type
    TUsersService = class
    private const
        BASE_URL = 'https://invest-public-api.tinkoff.ru/rest/tinkoff.public.invest.api.contract.v1.';
        SERVICE_URL = BASE_URL + 'UsersService/';
        GET_ACCOUNTS_URL = SERVICE_URL + 'GetAccounts';
        GET_INFO_URL = SERVICE_URL + 'GetInfo';
    public
        class function GetAccounts(AKey: String): TGetAccountsResponse;
        class function GetInfo(AKey: String): TGetInfoResponse;
    end;

implementation

uses
    HttpUtilUnit;

{ TUsersService }

class function TUsersService.GetAccounts(AKey: String): TGetAccountsResponse;
var
    Request: THttpRequest;
    Response: THttpResponse;
begin
    Request.Key := AKey;
    Request.Url := GET_ACCOUNTS_URL;
    Request.Method := TRESTRequestMethod.rmPOST;
    Request.Body := Request.EMPTY_BODY;
    Response := THttpUtil.Execute(Request);
    Result := TGetAccountsResponse.Parse(Response.Content);
end;

// GetMarginAttributes

// GetUserTariff

class function TUsersService.GetInfo(AKey: String): TGetInfoResponse;
var
    Request: THttpRequest;
    Response: THttpResponse;
begin
    Request.Key := AKey;
    Request.Url := GET_INFO_URL;
    Request.Method := TRESTRequestMethod.rmPOST;
    Request.Body := Request.EMPTY_BODY;
    Response := THttpUtil.Execute(Request);
    Result := TGetInfoResponse.Parse(Response.Content);
end;

end.
