unit UntMainForm;

interface

uses
  Forms, Menus, Classes;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    mrCadastros: TMenuItem;
    miFuncionarios: TMenuItem;
    procedure miFuncionariosClick(Sender: TObject);
  private
    procedure OpenForm(formClass: TFormClass; out form);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  UntFuncionarioForm;

{ TMainForm }

procedure TMainForm.OpenForm(formClass: TFormClass; out form);
var
  index: integer;
  exists: boolean;
begin
  for index := 0 to pred(Screen.FormCount) do
  begin
    if Screen.Forms[index] is formClass then
    begin
      Screen.Forms[index].Show;
      exit;
    end;
  end;

  TForm(form) := formClass.Create(Application);
  with TForm(form) do
  begin
    Top := 0;
    Left := 0;
    Icon := self.Icon;
  end;
end;

procedure TMainForm.miFuncionariosClick(Sender: TObject);
begin
  OpenForm(TFuncionarioForm, FuncionarioForm);
end;

end.
