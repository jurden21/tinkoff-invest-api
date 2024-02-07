unit GetAccountsResponseUnit;

interface

uses
    System.Generics.Collections, System.JSON, AccountUnit;

type
    TGetAccountsResponse = class
    private
        FAccounts: TObjectList<TAccount>;
    public
        property Accounts: TObjectList<TAccount> read FAccounts;
        constructor Create;
        destructor Destroy; override;
        class function Parse(AContent: String): TGetAccountsResponse;
    end;

implementation

{ TGetAccountsResponse }

constructor TGetAccountsResponse.Create;
begin
    FAccounts := TObjectList<TAccount>.Create;
end;

destructor TGetAccountsResponse.Destroy;
begin
    FAccounts.Free;
    inherited;
end;

class function TGetAccountsResponse.Parse(AContent: String): TGetAccountsResponse;
var
    Json: TJSONObject;
    ListJson: TJSONArray;
    Index: Integer;
begin
    Json := TJsonObject.ParseJSONValue(AContent) as TJSONObject;
    Result := TGetAccountsResponse.Create;
    ListJson := Json.FindValue('accounts') as TJSONArray;
    for Index := 0 to ListJson.Count - 1 do
        Result.Accounts.Add(TAccount.Create(ListJson.Items[Index]));
    Json.Free;
end;

end.
