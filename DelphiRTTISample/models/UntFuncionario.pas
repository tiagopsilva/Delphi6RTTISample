unit UntFuncionario;

interface

type
  TFuncionario = class
  private
    FEmpre_Func: integer;
    FCodig_Func: integer;
    FNomeF_Func: string;
    FDtAdm_Func: TDateTime; // data de admissão
    FDtAfa_Func: TDateTime; // data de afastamento
  public
    property Empre_Func: integer read FEmpre_Func write FEmpre_Func;
    property Codig_Func: integer read FCodig_Func write FCodig_Func;
    property NomeF_Func: string  read FNomeF_Func write FNomeF_Func;
    property DtAdm_Func: TDateTime read FDtAdm_Func write FDtAdm_Func;
    property DtAfa_Func: TDateTime read FDtAfa_Func write FDtAfa_Func;
  end;

implementation

end.
