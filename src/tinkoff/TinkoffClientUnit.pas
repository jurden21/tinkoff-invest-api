unit TinkoffClientUnit;

interface

uses
    System.Generics.Collections,
    AccountUnit;

type
    TTinkoffClient = class
    public
        class function GetAccounts: TObjectList<TAccount>;
    end;

implementation

uses
    UsersServiceUnit;

{ TTinkoffClient }

class function TTinkoffClient.GetAccounts: TObjectList<TAccount>;
begin
    Result := TUsersService.GetAccounts;
end;

end.
