program DelphiRTTISample;

uses
  Forms,
  UntDm in 'UntDm.pas' {Dm: TDataModule},
  UntMainForm in 'UntMainForm.pas' {MainForm},
  UntBaseForm in 'forms\UntBaseForm.pas' {BaseForm},
  UntBaseCadastroForm in 'forms\UntBaseCadastroForm.pas' {BaseCadastroForm},
  UntFuncionarioForm in 'forms\UntFuncionarioForm.pas' {FuncionarioForm},
  UntLibrary in 'library\UntLibrary.pas',
  UntCustomDAO in 'dao\UntCustomDAO.pas',
  UntFuncionario in 'models\UntFuncionario.pas',
  UntFuncionarioDAO in 'dao\UntFuncionarioDAO.pas',
  UntSessionManager in 'library\UntSessionManager.pas',
  UntRttiHelper in 'library\UntRttiHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
