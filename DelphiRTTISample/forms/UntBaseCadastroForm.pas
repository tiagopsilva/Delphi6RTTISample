unit UntBaseCadastroForm;

interface

uses
  Forms,
  UntBaseForm,
  Classes, StdCtrls, TypInfo;

type
  TBaseCadastroForm = class(TBaseForm)
  protected
    procedure LimparCampos; virtual;
    procedure HabilitarCampos(habilitar: boolean = true); virtual;
    procedure ParseFormToObject(obj: TObject);
    procedure ParseObjectToForm(obj: TObject);
  end;

implementation

{$R *.dfm}

uses
  SysUtils, StrUtils, UntRttiHelper;

{ TBaseCadastroForm }

procedure TBaseCadastroForm.LimparCampos;
var
  comp: TComponent;
  index: integer;
begin
  for index := 0 to pred(self.ComponentCount) do
  begin
    comp := self.Components[index];
    if comp is TCustomEdit then
      TCustomEdit(comp).Clear;
    if comp is TCustomCombobox then
      TCustomCombobox(comp).ItemIndex := -1;
  end;
end;

procedure TBaseCadastroForm.HabilitarCampos(habilitar: boolean);
var
  comp: TComponent;
  compAux: TComponent;
  index: integer;
begin
  for index := 0 to pred(self.ComponentCount) do
  begin
    comp := self.Components[index];

    if comp is TCustomEdit then
      TCustomEdit(comp).Enabled := habilitar;

    if comp is TCustomCombobox then
      TCustomCombobox(comp).Enabled := habilitar;
  end;

  compAux := self.FindComponent('btnGravar');
  if (compAux <> nil) and (compAux is TButton) then
    TButton(compAux).Enabled := not habilitar;

  compAux := self.FindComponent('btnCancelar');
  if (compAux <> nil) and (compAux is TButton) then
    TButton(compAux).Enabled := not habilitar;
end;

procedure TBaseCadastroForm.ParseFormToObject(obj: TObject);
var
  index: integer;
  comp: TComponent;
begin
  for index := 0 to pred(self.ComponentCount) do
  begin
    comp := self.Components[index];

    if comp is TCustomEdit then
      TFormParser.ParseComponentToObject(comp, obj);
  end;
end;

procedure TBaseCadastroForm.ParseObjectToForm(obj: TObject);
var
  index: integer;
  comp: TComponent;
begin
  for index := 0 to pred(self.ComponentCount) do
  begin
    comp := self.Components[index];

    if comp is TCustomEdit then
      TFormParser.ParseObjectToComponent(obj, comp);
  end;
end;

end.
