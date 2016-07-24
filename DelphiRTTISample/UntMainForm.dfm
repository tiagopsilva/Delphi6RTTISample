object MainForm: TMainForm
  Left = 323
  Top = 184
  Width = 922
  Height = 611
  Caption = 'Formul'#225'rio Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 88
    Top = 92
    object mrCadastros: TMenuItem
      Caption = 'Cadastros'
      object miFuncionarios: TMenuItem
        Caption = 'Funcionarios'
        OnClick = miFuncionariosClick
      end
    end
  end
end
