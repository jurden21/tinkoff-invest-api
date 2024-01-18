unit AccountTypeUnit;

interface

uses
    System.SysUtils;

type
    TAccountType = (ACCOUNT_TYPE_UNKNOWN, ACCOUNT_TYPE_TINKOFF, ACCOUNT_TYPE_TINKOFF_IIS, ACCOUNT_TYPE_INVEST_BOX);

    TAccountTypeHelper = record helper for TAccountType
    private const
        Names: array [TAccountType] of String = (
            'ACCOUNT_TYPE_UNKNOWN', 'ACCOUNT_TYPE_TINKOFF', 'ACCOUNT_TYPE_TINKOFF_IIS', 'ACCOUNT_TYPE_INVEST_BOX');
    public
        function Name: string;
        class function ValueByName(Name: String): TAccountType; static;
    end;

implementation

{ TAccountTypeHelper }

function TAccountTypeHelper.Name: string;
begin
    Result := Names[Self];
end;

class function TAccountTypeHelper.ValueByName(Name: String): TAccountType;
begin
    Result := ACCOUNT_TYPE_UNKNOWN;
    for var AccountType := Low(TAccountType) to High(TAccountType) do
        if (Names[AccountType] = Name)
        then Result := AccountType;
end;

end.
