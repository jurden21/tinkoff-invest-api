unit GetPositionsResponseUnit;

interface

uses
    System.Generics.Collections, System.JSON,
    MoneyValueUnit;

type
    TGetPositionsResponse = class
    private
        FMoney: TObjectList<TMoneyValue>;
        FBlocked: TObjectList<TMoneyValue>;
//        FSecurities: TObjectList<TPositionsSecurities>;
//        FFeatures: TObjectList<TPositionsFeatures>;
//        FOptions: TObjectList<TPositionsOptions>;
//        FLimitsLoadingInProgress: Boolean;
    public
        property Money: TObjectList<TMoneyValue> read FMoney;
        property Blocked: TObjectList<TMoneyValue> read FBlocked;
        constructor Create;
        destructor Destroy; override;
        class function Parse(AContent: String): TGetPositionsResponse;
    end;

implementation

{ TGetPositionsResponse }

constructor TGetPositionsResponse.Create;
begin
    FMoney := TObjectList<TMoneyValue>.Create;
    FBlocked := TObjectList<TMoneyValue>.Create;
end;

destructor TGetPositionsResponse.Destroy;
begin
    FBlocked.Free;
    FMoney.Free;
    inherited;
end;

class function TGetPositionsResponse.Parse(AContent: String): TGetPositionsResponse;
var
    Json: TJSONObject;
    ListJson: TJSONArray;
    Index: Integer;
begin
    Json := TJsonObject.ParseJSONValue(AContent) as TJSONObject;
    Result := TGetPositionsResponse.Create;
    ListJson := Json.FindValue('money') as TJSONArray;
    for Index := 0 to ListJson.Count - 1 do
        Result.Money.Add(TMoneyValue.Create(ListJson.Items[Index]));
    ListJson := Json.FindValue('blocked') as TJSONArray;
    for Index := 0 to ListJson.Count - 1 do
        Result.Blocked.Add(TMoneyValue.Create(ListJson.Items[Index]));
    Json.Free;
end;

end.
