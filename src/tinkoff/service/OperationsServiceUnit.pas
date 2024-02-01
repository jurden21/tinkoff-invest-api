unit OperationsServiceUnit;

interface

uses
    System.Generics.Collections, REST.Types,
    AccountUnit,
    GetPositionsRequestUnit, GetPositionsResponseUnit;

type
    TOperationsService = class
    private const
        BASE_URL = 'https://invest-public-api.tinkoff.ru/rest/tinkoff.public.invest.api.contract.v1.';
        SERVICE_URL = BASE_URL + 'OperationsService/';
        GET_POSITIONS_URL = SERVICE_URL + 'GetPositions';
    public
        class function GetPositions(AKey: String; ARequest: TGetPositionsRequest): TGetPositionsResponse;
    end;

implementation

uses
    HttpUtilUnit;

{ TOperationsService }

class function TOperationsService.GetPositions(AKey: String; ARequest: TGetPositionsRequest): TGetPositionsResponse;
var
    Request: THttpRequest;
    Response: THttpResponse;
begin
    Request.Key := AKey;
    Request.Url := GET_POSITIONS_URL;
    Request.Method := TRESTRequestMethod.rmPOST;
    Request.Body := ARequest.Body;
    Response := THttpUtil.Execute(Request);
    Result := TGetPositionsResponse.Parse(Response.Content);
end;

end.
