unit UntDm;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDm = class(TDataModule)
    Database: TIBDatabase;
    Transaction: TIBTransaction;
  end;

var
  Dm: TDm;

implementation

{$R *.dfm}

end.
 