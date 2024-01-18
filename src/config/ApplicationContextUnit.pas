unit ApplicationContextUnit;

interface

type
    TApplicationContext = class
    public
        class function GetAuthorization: String;
    end;

implementation

uses
    IniUtilUnit;

{ TApplicationContext }

class function TApplicationContext.GetAuthorization: String;
begin
    Result := 'Bearer ' + TIniUtil.ReadString('Tinkoff', 'Key');
end;

end.
