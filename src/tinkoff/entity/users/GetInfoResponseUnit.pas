unit GetInfoResponseUnit;

interface

uses
    System.SysUtils, System.Classes, System.JSON;

type
    TGetInfoResponse = class
    private
        FPremStatus: Boolean;
        FQualStatus: Boolean;
        FQualifiedForWorkWith: TStringList;
        FTariff: String;
    public
        property PremStatus: Boolean read FPremStatus write FPremStatus;
        property QualStatus: Boolean read FQualStatus write FQualStatus;
        property QualifiedForWorkWith: TStringList read FQualifiedForWorkWith write FQualifiedForWorkWith;
        property Tariff: String read FTariff write FTariff;
        constructor Create;
        destructor Destroy; override;
        class function Parse(AContent: String): TGetInfoResponse;
        function ToString: String; override;
    end;

implementation

uses
    JsonUtilUnit;

{ TGetInfoResponse }

constructor TGetInfoResponse.Create;
begin

end;

destructor TGetInfoResponse.Destroy;
begin
    FQualifiedForWorkWith.Free;
    inherited;
end;

class function TGetInfoResponse.Parse(AContent: String): TGetInfoResponse;
var
    Json: TJSONObject;
begin
    Json := TJsonObject.ParseJSONValue(AContent) as TJSONObject;
    Result := TGetInfoResponse.Create;
    Result.PremStatus := TJsonUtil.ReadBool(Json, 'premStatus');
    Result.QualStatus := TJsonUtil.ReadBool(Json, 'qualStatus');
    Result.QualifiedForWorkWith := TJsonUtil.ReadStringList(Json, 'qualifiedForWorkWith');
    Result.Tariff := TJsonUtil.ReadString(Json, 'tariff');
    Json.Free;
end;

function TGetInfoResponse.ToString: String;
begin
    Result := Format('TGetInfoResponse{PremStatus=%s, QualStatus=%s, QualifiedForWorkWith=%s, Tariff=%s}',
        [BoolToStr(PremStatus, True), BoolToStr(QualStatus, True), QualifiedForWorkWith.DelimitedText, Tariff]);
end;

end.
