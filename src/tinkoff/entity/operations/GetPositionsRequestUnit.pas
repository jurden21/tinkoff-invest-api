unit GetPositionsRequestUnit;

interface

type
    TGetPositionsRequest = class
    private
        FAccountId: String;
    public
        property AccountId: String read FAccountId;
        constructor Create(AAccountId: String);
        function Body: String;
    end;

implementation

uses
    System.JSON;

{ TGetPositionsRequest }

constructor TGetPositionsRequest.Create(AAccountId: String);
begin
    FAccountId := AAccountId;
end;

function TGetPositionsRequest.Body: String;
var
    Body: TJsonObject;
begin
    Body := TJSONObject.Create;
    try
       Body.AddPair('account_id', FAccountId);
       Result := Body.ToJSON;
    finally
       Body.Free;
    end;
end;

end.
