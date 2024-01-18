unit AccountAccessLevelUnit;

interface

uses
    System.SysUtils;

type
    TAccountAccessLevel = (ACCOUNT_ACCESS_LEVEL_UNKNOWN, ACCOUNT_ACCESS_LEVEL_READ_ONLY);

    TAccountAccessLevelHelper = record helper for TAccountAccessLevel
    private const
        Names: array [TAccountAccessLevel] of String = (
            'ACCOUNT_ACCESS_LEVEL_UNKNOWN', 'ACCOUNT_ACCESS_LEVEL_READ_ONLY');
    public
        function Name: string;
        class function ValueByName(Name: String): TAccountAccessLevel; static;
    end;

implementation

{ TAccountAccessLevelHelper }

function TAccountAccessLevelHelper.Name: string;
begin
    Result := Names[Self];
end;

class function TAccountAccessLevelHelper.ValueByName(Name: String): TAccountAccessLevel;
begin
    Result := ACCOUNT_ACCESS_LEVEL_UNKNOWN;
    for var AccountAccessLevel := Low(TAccountAccessLevel) to High(TAccountAccessLevel) do
        if (Names[AccountAccessLevel] = Name)
        then Result := AccountAccessLevel;
end;

end.
