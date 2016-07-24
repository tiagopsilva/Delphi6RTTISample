inherited FuncionarioForm: TFuncionarioForm
  Left = 433
  Top = 471
  Caption = 'FuncionarioForm'
  ClientHeight = 204
  ClientWidth = 525
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Name = 'Calibri'
  PixelsPerInch = 96
  TextHeight = 15
  object PanHeader: TPanel
    Left = 5
    Top = 8
    Width = 514
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object lblCodig_Func: TLabel
      Left = 12
      Top = 10
      Width = 117
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'C'#243'digo:'
      Layout = tlCenter
    end
    object txtCodig_Func: TText
      Left = 135
      Top = 10
      Width = 109
      Height = 21
      MaxLength = 6
      TabOrder = 0
      OnKeyPress = txtCodig_FuncKeyPress
      CampoObrigatorio = False
      Mask = '######'
      EnterToTab = True
      Direcionais = True
      ColorTextOnFocus = cl3DLight
      ColorTextNotFocus = clWhite
      ColorFontOnFocus = clBlack
      ColorFontNotFocus = clBlack
    end
  end
  object PanContent: TPanel
    Left = 5
    Top = 52
    Width = 514
    Height = 119
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object lblNomeF_Func: TLabel
      Left = 12
      Top = 15
      Width = 117
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome:'
      Layout = tlCenter
    end
    object lblDtAdm_Func: TLabel
      Left = 12
      Top = 39
      Width = 117
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Data de Admiss'#227'o:'
      Layout = tlCenter
    end
    object lblDtAfa_Func: TLabel
      Left = 12
      Top = 63
      Width = 117
      Height = 21
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Data de Afastamento:'
      Layout = tlCenter
    end
    object txtNomeF_Func: TText
      Left = 135
      Top = 15
      Width = 330
      Height = 21
      MaxLength = 6
      TabOrder = 0
      CampoObrigatorio = False
      Mask = '######'
      EnterToTab = True
      Direcionais = True
      ColorTextOnFocus = cl3DLight
      ColorTextNotFocus = clWhite
      ColorFontOnFocus = clBlack
      ColorFontNotFocus = clBlack
    end
    object txtDtAdm_Func: TData
      Left = 135
      Top = 39
      Width = 67
      Height = 21
      TabOrder = 1
      EnterToTab = True
      Direcionais = True
      TipoData = dtDiaMesAno
      Valida = False
      Requerido = False
      ColorTextOnFocus = cl3DLight
      ColorTextNotFocus = clWhite
      ColorFontOnFocus = clBlack
      ColorFontNotFocus = clBlack
    end
    object txtDtAfa_Func: TData
      Left = 135
      Top = 63
      Width = 67
      Height = 21
      TabOrder = 2
      EnterToTab = True
      Direcionais = True
      TipoData = dtDiaMesAno
      Valida = False
      Requerido = False
      ColorTextOnFocus = cl3DLight
      ColorTextNotFocus = clWhite
      ColorFontOnFocus = clBlack
      ColorFontNotFocus = clBlack
    end
  end
  object btnGravar: TBitBtn
    Left = 359
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnGravarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancelar: TBitBtn
    Left = 439
    Top = 176
    Width = 80
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
    Kind = bkCancel
  end
end
