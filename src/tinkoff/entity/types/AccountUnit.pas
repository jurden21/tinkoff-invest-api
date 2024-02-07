unit AccountUnit;

interface

uses
    System.SysUtils, System.Json,
    AccountTypeUnit, AccountStatusUnit, AccountAccessLevelUnit;

type
    TAccount = class
    private
        FId: String;
        FTyp: TAccountType;
        FName: String;
        FStatus: TAccountStatus;
        FOpenedDate: TDate;
        FClosedDate: TDate;
        FAccessLevel: TAccountAccessLevel;
    public
        property Id: String read FId;
        property Typ: TAccountType read FTyp;
        property Name: String read FName;
        property Status: TAccountStatus read FStatus;
        property OpenedDate: TDate read FOpenedDate;
        property ClosedDate: TDate read FClosedDate;
        property AccessLevel: TAccountAccessLevel read FAccessLevel;
        constructor Create(AValue: TJsonValue);
        function ToString: String; override;
    end;

implementation

uses
    JsonUtilUnit;

{ TAccount }

constructor TAccount.Create(AValue: TJsonValue);
begin
    FId := TJsonUtil.ReadString(AValue, 'id');
    FTyp := TAccountType.ValueByName(TJsonUtil.ReadString(AValue, 'type'));
    FName := TJsonUtil.ReadString(AValue, 'name');
    FStatus := TAccountStatus.ValueByName(TJsonUtil.ReadString(AValue, 'status'));
    FOpenedDate := TJsonUtil.ReadDate(AValue, 'openedDate');
    FClosedDate := TJsonUtil.ReadDate(AValue, 'closedDate');
    FAccessLevel := TAccountAccessLevel.ValueByName(TJsonUtil.ReadString(AValue, 'accessLevel'));
end;

function TAccount.ToString: String;
begin
    Result := Format('TAccount{Id=%s, Type=%s, Name=%s}', [Id, Typ.Name, Name]);
end;

end.
