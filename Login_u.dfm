object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 325
  ClientWidth = 702
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlLogin: TPanel
    Left = 104
    Top = 56
    Width = 481
    Height = 193
    TabOrder = 0
    object lblUsername: TLabel
      Left = 136
      Top = 67
      Width = 53
      Height = 15
      Caption = 'Username'
    end
    object Label2: TLabel
      Left = 139
      Top = 93
      Width = 50
      Height = 15
      Caption = 'Password'
    end
    object pnlHeading: TPanel
      Left = 1
      Top = 1
      Width = 479
      Height = 41
      Align = alTop
      Caption = 'Login or Sign up'
      TabOrder = 0
      OnClick = pnlHeadingClick
      ExplicitLeft = 168
      ExplicitTop = 16
      ExplicitWidth = 185
    end
    object btnRegister: TButton
      Left = 256
      Top = 136
      Width = 105
      Height = 25
      Caption = 'Register'
      TabOrder = 1
    end
    object btnLogin: TButton
      Left = 121
      Top = 136
      Width = 105
      Height = 25
      Caption = 'Login'
      TabOrder = 2
    end
    object edtUsername: TEdit
      Left = 195
      Top = 64
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object edtPassword: TEdit
      Left = 195
      Top = 93
      Width = 121
      Height = 23
      TabOrder = 4
    end
    object CheckBox1: TCheckBox
      Left = 322
      Top = 96
      Width = 97
      Height = 17
      Caption = 'show/hide'
      TabOrder = 5
    end
  end
end
