unit UntSessionManager;

interface

type
  TSessionManager = class
  private
    FCodig_Empr: integer;
  public
    constructor Create; reintroduce;
  public
    property Codig_Empr: integer read FCodig_Empr write FCodig_Empr;
    class function Session: TSessionManager;
  end;


implementation

{ TSessionManager }

uses
  SysUtils;

var
  SessionManager: TSessionManager;

constructor TSessionManager.Create;
begin
  raise Exception.Create('Esta classe é uma Singleton!' +#13+
    'Obtenha uma instância por meio do método TSessionManager.Session');
end;

class function TSessionManager.Session: TSessionManager;
begin
  if SessionManager = nil then
    SessionManager := inherited Create;
  result := SessionManager;
end;

initialization

finalization
  if SessionManager <> nil then
    FreeAndNil(sessionManager);

end.
