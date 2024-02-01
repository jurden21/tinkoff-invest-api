unit TinkoffClientUnit;

interface

uses
    System.Generics.Collections,
    AccountUnit,
    GetInfoResponseUnit, GetPositionsRequestUnit, GetPositionsResponseUnit;

type
    TTinkoffClient = class
    private
        FKey: String;
    public
        constructor Create(AKey: String);
        function GetAccounts: TObjectList<TAccount>;
        function GetInfo: TGetInfoResponse;
        function GetPositions(ARequest: TGetPositionsRequest): TGetPositionsResponse;
    end;

implementation

uses
    UsersServiceUnit, OperationsServiceUnit;

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

function TTinkoffClient.GetPositions(ARequest: TGetPositionsRequest): TGetPositionsResponse;
begin
    Result := TOperationsService.GetPositions(FKey, ARequest);
end;

end.
