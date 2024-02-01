unit GetPositionsResponseUnit;

interface

uses
    System.Generics.Collections;

type
    TGetPositionsResponse = class
    private
//        FMoney: TObjectList<TMoneyValue>;
//        FBlocked: TObjectList<TMoneyValue>;
//        FSecurities: TObjectList<TPositionsSecurities>;
//        FFeatures: TObjectList<TPositionsFeatures>;
//        FOptions: TObjectList<TPositionsOptions>;
//        FLimitsLoadingInProgress: Boolean;
    public
        class function Parse(AContent: String): TGetPositionsResponse;
    end;

implementation

{ TGetPositionsResponse }

class function TGetPositionsResponse.Parse(AContent: String): TGetPositionsResponse;
begin
    Result := TGetPositionsResponse.Create;
    Writeln(AContent);
end;

end.
