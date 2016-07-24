unit UntFuncionarioDAO;

interface

uses
  IBQuery,
  UntSessionManager,
  UntCustomDAO, UntFuncionario;

type
  TFuncionarioDAO = class(TCustomDAO)
    function Obter(codig_func: integer): TFuncionario;
    function Gravar(obj: TFuncionario): boolean;
  end;

implementation

uses
  UntDm, UntLibrary;

{ TFuncionarioDAO }

function TFuncionarioDAO.Obter(codig_func: integer): TFuncionario;
var
  sql: string;
  qry: TIBQuery;
begin
  result := nil;
  
  sql := ' select * from TabFpFunc ' +
         ' where Empre_Func = :Empre_Func ' +
         '   and Codig_Func = :Codig_Func ';

  qry := CreateQuery(sql);
  try
    qry.ParamByName('Empre_Func').AsInteger := TSessionManager.Session.Codig_Empr;
    qry.ParamByName('Codig_Func').AsInteger := codig_func;
    qry.Open;
    if qry.RecordCount > 0 then
    begin
      result := TFuncionario.Create;
      ParseQueryRecordToObject(qry, result);
    end;
  finally
    qry.Free;
  end;
end;

function TFuncionarioDAO.Gravar(obj: TFuncionario): boolean;
var
  sqlAtual, sqlInsert: string;
  qryAtual, qryInsert: TIBQuery;
begin
  result := false;

  sqlAtual := ' select * from TabFpFunc ' +
              ' where Empre_Func = :Empre_Func ' +
              '   and Codig_Func = :Codig_Func ';

  sqlInsert := ' update TabFpFunc set' +
               ' NomeF_Func = :NomeF_Func, ' +
               ' DtAdm_Func = :DtAdm_Func, ' +
               ' DtAfa_Func = :DtAfa_Func ' +
               ' where Empre_Func = :Empre_Func ' +
               '   and Codig_Func = :Codig_Func ';

  qryAtual := CreateQuery(sqlAtual);
  qryInsert := CreateQuery(sqlInsert);
  try
    qryAtual.ParamByName('Empre_Func').AsInteger := IIf(obj.Empre_Func > 0, obj.Empre_Func, TSessionManager.Session.Codig_Empr);
    qryAtual.ParamByName('Codig_Func').AsInteger := obj.Codig_Func;
    qryAtual.Open;
    if qryAtual.RecordCount > 0 then
    begin
      ParseDataChangedToQryInsert(qryAtual, qryInsert, obj);
      // para garantir
      qryInsert.ParamByName('Empre_Func').AsInteger := IIf(obj.Empre_Func > 0, obj.Empre_Func, TSessionManager.Session.Codig_Empr);
      qryInsert.ExecSQL;
      Dm.ItrIntsys.Commit;
    end;
  finally
    qryAtual.Free;
    qryInsert.Free;
  end;
end;

end.
