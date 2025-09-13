object frmSignup: TfrmSignup
  Left = 0
  Top = 0
  Caption = 'Sign Up'
  ClientHeight = 348
  ClientWidth = 688
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlLogin: TPanel
    Left = 88
    Top = 48
    Width = 481
    Height = 233
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
    object Label1: TLabel
      Left = 95
      Top = 122
      Width = 94
      Height = 15
      Caption = 'ConfirmPassword'
    end
    object pnlHeading: TPanel
      Left = 1
      Top = 1
      Width = 479
      Height = 41
      Align = alTop
      Caption = 'Sign Up'
      TabOrder = 0
      OnClick = pnlHeadingClick
    end
    object btnRegister: TButton
      Left = 256
      Top = 176
      Width = 105
      Height = 25
      Caption = 'Register'
      TabOrder = 1
    end
    object btnLogin: TButton
      Left = 121
      Top = 176
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
    object cbxSH1: TCheckBox
      Left = 322
      Top = 96
      Width = 97
      Height = 17
      Caption = 'show/hide'
      TabOrder = 5
    end
    object edtCPassword: TEdit
      Left = 195
      Top = 122
      Width = 121
      Height = 23
      TabOrder = 6
    end
    object CheckBox2: TCheckBox
      Left = 322
      Top = 125
      Width = 97
      Height = 17
      Caption = 'show/hide'
      TabOrder = 7
    end
  end
end
