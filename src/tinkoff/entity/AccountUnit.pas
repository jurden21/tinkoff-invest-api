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

{ TAccount }

constructor TAccount.Create(AValue: TJsonValue);
var
    Str: String;
begin
    AValue.TryGetValue('id', FId);
    AValue.TryGetValue('type', Str);
    FTyp := TAccountType.ValueByName(Str);
    AValue.TryGetValue('name', FName);
    AValue.TryGetValue('status', Str);
    FStatus := TAccountStatus.ValueByName(Str);
    AValue.TryGetValue('openedDate', Str);
//    FOpenedDate := StrToDate(Str.Substring(0, 10));
    AValue.TryGetValue('closedDate', Str);
//    FClosedDate := StrToDate(Str.Substring(0, 10));
    AValue.TryGetValue('accessLevel', Str);
    FAccessLevel := TAccountAccessLevel.ValueByName(Str);
end;

function TAccount.ToString: String;
begin
    Result := Format('TAccount{Id=%s, Type=%s, Name=%s}', [Id, Typ.Name, Name]);
end;

end.
