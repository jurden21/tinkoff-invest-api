unit AccountsUnit;

interface

uses
    System.SysUtils, System.Generics.Collections, System.Json,
    AccountUnit;

type
    TAccounts = class
    public
        class function Parse(AJson: String): TObjectList<TAccount>;
    end;

implementation

{ TAccounts }

class function TAccounts.Parse(AJson: String): TObjectList<TAccount>;
var
    Json: TJSONObject;
    AccountsJson: TJSONArray;
    Index: Integer;
begin
    Result := TObjectList<TAccount>.Create;
    Json := TJsonObject.ParseJSONValue(AJson) as TJSONObject;
    AccountsJson := Json.FindValue('accounts') as TJSONArray;
    for Index := 0 to AccountsJson.Count - 1 do
        Result.Add(TAccount.Create(AccountsJson.Items[Index]));
end;

end.
