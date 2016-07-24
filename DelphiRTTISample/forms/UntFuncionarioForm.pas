unit UntFuncionarioForm;

interface

uses
  Forms,
  UntBaseForm, UntBaseCadastroForm,
  Data, StdCtrls, Buttons, Text, Controls, Classes, ExtCtrls, Windows;

type
  TFuncionarioForm = class(TBaseCadastroForm)
    PanHeader: TPanel;
    lblCodig_Func: TLabel;
    txtCodig_Func: TText;
    PanContent: TPanel;
    lblNomeF_Func: TLabel;
    txtNomeF_Func: TText;
    lblDtAdm_Func: TLabel;
    txtDtAdm_Func: TData;
    lblDtAfa_Func: TLabel;    
    txtDtAfa_Func: TData;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtCodig_FuncKeyPress(Sender: TObject; var Key: Char);    
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure LimparCampos; override;
    procedure HabilitarCampos(habilitar: boolean = true); override;
    procedure CarregarCampos;
    function ValidarFormulario: boolean;
    procedure GravarCampos;    
  end;

var
  FuncionarioForm: TFuncionarioForm;

implementation

{$R *.dfm}

uses
  SysUtils,
  UntFuncionario,
  UntFuncionarioDAO,
  UntSessionManager;

procedure TFuncionarioForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FuncionarioForm := nil;
end;

procedure TFuncionarioForm.txtCodig_FuncKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    key := #0;
    if StrToIntDef(txtCodig_Func.Text, 0) > 0 then
      CarregarCampos;
  end;
end;

procedure TFuncionarioForm.btnGravarClick(Sender: TObject);
begin
  inherited;
  if ValidarFormulario then
    GravarCampos;
end;

procedure TFuncionarioForm.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFuncionarioForm.LimparCampos;
begin
  inherited;
  if txtCodig_Func.CanFocus then
    txtCodig_Func.SetFocus;
end;

procedure TFuncionarioForm.HabilitarCampos(habilitar: boolean);
begin
  inherited HabilitarCampos(habilitar);
  txtCodig_Func.Enabled := not habilitar;
  if habilitar then
  begin
    if txtCodig_Func.CanFocus then
      txtCodig_Func.SetFocus;
  end
  else
  begin
    if txtNomeF_Func.CanFocus then
      txtNomeF_Func.SetFocus;
  end;
end;

procedure TFuncionarioForm.CarregarCampos;
var
  obj: TFuncionario;
  dao: TFuncionarioDAO;
begin
  dao := TFuncionarioDAO.Create;
  try
    obj := dao.Obter(StrToInt(txtCodig_Func.Text));
    if obj <> nil then
    begin
      HabilitarCampos;
      ParseObjectToForm(obj);
    end;
  finally
    dao.Free;
  end;
end;

function TFuncionarioForm.ValidarFormulario: boolean;
begin
  result := false;

  result := true;
end;

procedure TFuncionarioForm.GravarCampos;
var
  obj: TFuncionario;
  dao: TFuncionarioDAO;
begin
  dao := TFuncionarioDAO.Create;
  try
    obj := TFuncionario.Create;
    HabilitarCampos(false);
    ParseFormToObject(obj);
    obj.Empre_Func := TSessionManager.Session.Codig_Empr;
    if dao.Gravar(obj) then
      Application.MessageBox('Registro salvo com sucesso!', 'Parabéns!', MB_OK + MB_ICONINFORMATION);
  finally
    dao.Free;
  end;
end;

end.
