unit UntDm;

interface

uses
  SysUtils, Classes, IBDatabase, DB;

type
  TDm = class(TDataModule)
    IdbIntsys: TIBDatabase;
    ItrIntsys: TIBTransaction;
  end;

var
  Dm: TDm;

implementation

{$R *.dfm}

end.
 