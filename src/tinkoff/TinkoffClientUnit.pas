unit TinkoffClientUnit;

interface

uses
    System.Generics.Collections,
    AccountUnit, GetInfoResponseUnit;

type
    TTinkoffClient = class
    private
        FKey: String;
    public
        constructor Create(AKey: String);
        function GetAccounts: TObjectList<TAccount>;
        function GetInfo: TGetInfoResponse;
    end;

implementation

uses
    UsersServiceUnit;

{ TTinkoffClient }

constructor TTinkoffClient.Create(AKey: String);
begin
    FKey := AKey;
end;

function TTinkoffClient.GetAccounts: TObjectList<TAccount>;
begin
    Result := TUsersService.GetAccounts(FKey);
end;

function TTinkoffClient.GetInfo: TGetInfoResponse;
begin
    Result := TUsersService.GetInfo(FKey);
end;

end.
