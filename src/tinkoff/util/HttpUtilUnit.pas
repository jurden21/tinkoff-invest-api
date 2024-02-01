unit HttpUtilUnit;

interface

uses
    REST.Client, REST.Types;

type
    THttpRequest = record
    public const
        EMPTY_BODY = '{}';
    private
        FKey: String;
        FUrl: String;
        FMethod: TRESTRequestMethod;
        FBody: String;
    public
        property Key: String read FKey write FKey;
        property Url: String read FUrl write FUrl;
        property Method: TRESTRequestMethod read FMethod write FMethod;
        property Body: String read FBody write FBody;
    end;

    THttpResponse = record
    private
        FHeaders: String;
        FContent: String;
    public
        property Headers: String read FHeaders write FHeaders;
        property Content: String read FContent write FContent;
    end;

    THttpUtil = class
    public
        class function Execute(ARequest: THttpRequest): THttpResponse;
    end;

implementation

{ THttpUtil }

class function THttpUtil.Execute(ARequest: THttpRequest): THttpResponse;
var
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
begin
    RESTClient := TRESTClient.Create(nil);
    RESTRequest := TRESTRequest.Create(nil);
    RESTResponse := TRESTResponse.Create(nil);
    try
        RESTRequest.Client := RESTClient;
        RESTRequest.Response := RESTResponse;
        RESTRequest.Method := ARequest.Method;
        RESTRequest.Params.AddItem('Authorization', 'Bearer ' + ARequest.Key, pkHTTPHEADER, [poDoNotEncode],
            TRESTContentType.ctAPPLICATION_JSON);
        RESTRequest.Params.AddItem('Contect-Type', 'application/json', pkHTTPHEADER, [poDoNotEncode],
            TRESTContentType.ctAPPLICATION_JSON);
        RESTClient.BaseURL := ARequest.Url;
        RESTRequest.AddBody(ARequest.Body);
        RESTRequest.Execute;
        Result.Headers := RESTResponse.Headers.Text;
        Result.Content := RESTResponse.Content;
    finally
        RESTResponse.Free;
        RESTRequest.Free;
        RESTClient.Free;
    end;
end;

end.
