unit MoneyValueUnit;

interface

uses
    System.SysUtils, System.JSON;

type
    TMoneyValue = class
    private
        FCurrency: String;
        FUnits: Int64;
        FNano: Int32;
    public
        property Currency: String read FCurrency;
        property Units: Int64 read FUnits;
        property Nano: Integer read FNano;
        constructor Create(AValue: TJsonValue);
        function ToString: String; override;
    end;

implementation

uses
    JsonUtilUnit;

{ TMoneyValue }

constructor TMoneyValue.Create(AValue: TJsonValue);
begin
    FCurrency := TJsonUtil.ReadString(AValue, 'currency');
    FUnits := TJsonUtil.ReadInt64(AValue, 'units');
    FNano := TJsonUtil.ReadInteger(AValue, 'nano');
end;

function TMoneyValue.ToString: String;
begin
    Result := Format('TMoneyValue{Currency=%s, Units=%d, Nano=%d}', [Currency, Units, Nano]);
end;

end.
