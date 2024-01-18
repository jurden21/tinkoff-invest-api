unit TinkoffClientUnit;

interface

uses
    System.Generics.Collections,
    AccountUnit, GetInfoResponseUnit;

type
    TTinkoffClient = class
    public
        class function GetAccounts: TObjectList<TAccount>;
        class function GetInfo: TGetInfoResponse;
    end;

implementation

uses
    UsersServiceUnit;

{ TTinkoffClient }

class function TTinkoffClient.GetAccounts: TObjectList<TAccount>;
begin
    Result := TUsersService.GetAccounts;
end;

class function TTinkoffClient.GetInfo: TGetInfoResponse;
begin
    Result := TUsersService.GetInfo;
end;

end.
