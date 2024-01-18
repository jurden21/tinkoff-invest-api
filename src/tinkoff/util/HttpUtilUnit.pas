unit HttpUtilUnit;

interface

uses
    REST.Client, REST.Types;

type
    THttpRequest = record
    private
        FUrl: String;
        FMethod: TRESTRequestMethod;
    public
        property Url: String read FUrl write FUrl;
        property Method: TRESTRequestMethod read FMethod write FMethod;
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
        class function Execute(Request: THttpRequest): THttpResponse;
    end;

implementation

uses
    ApplicationContextUnit;

{ THttpUtil }

class function THttpUtil.Execute(Request: THttpRequest): THttpResponse;
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
        RESTRequest.Method := Request.Method;
        RESTRequest.Params.AddItem('Authorization', TApplicationContext.GetAuthorization, pkHTTPHEADER, [poDoNotEncode],
            TRESTContentType.ctAPPLICATION_JSON);
        RESTRequest.Params.AddItem('Contect-Type', 'application/json', pkHTTPHEADER, [poDoNotEncode],
            TRESTContentType.ctAPPLICATION_JSON);
        RESTClient.BaseURL := Request.Url;
        RESTRequest.AddBody('{}');
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
