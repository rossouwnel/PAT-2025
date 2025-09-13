object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Simulation'
  ClientHeight = 615
  ClientWidth = 1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1087
    Height = 615
    ActivePage = tsLogin
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tsLogin: TTabSheet
      Caption = 'tsLogin'
      object pnlLogin: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 585
        Align = alClient
        TabOrder = 0
        object lblUsername: TLabel
          Left = 390
          Top = 149
          Width = 77
          Height = 23
          Caption = 'Username'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblLPassword: TLabel
          Left = 390
          Top = 229
          Width = 70
          Height = 23
          Caption = 'Password'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblCreateAccount: TLabel
          Left = 390
          Top = 432
          Width = 128
          Height = 15
          Caption = 'Dont'#39't have an account?'
        end
        object pnlHeading1: TPanel
          Left = 1
          Top = 1
          Width = 1077
          Height = 41
          Align = alTop
          Caption = 'Login or Sign up'
          TabOrder = 0
        end
        object btnRegister: TButton
          Left = 390
          Top = 472
          Width = 250
          Height = 41
          Align = alCustom
          Caption = 'btnRegister'
          TabOrder = 1
          OnClick = btnRegisterClick
        end
        object edtLUsername: TEdit
          Left = 390
          Top = 178
          Width = 250
          Height = 23
          TabOrder = 2
        end
        object edtLPassword: TEdit
          Left = 390
          Top = 258
          Width = 250
          Height = 23
          TabOrder = 3
        end
        object cbxSH1: TCheckBox
          Left = 663
          Top = 261
          Width = 97
          Height = 17
          Align = alCustom
          Caption = 'show/hide'
          TabOrder = 4
          OnClick = cbxSH1Click
        end
        object btnLogin: TButton
          Left = 390
          Top = 344
          Width = 250
          Height = 41
          Align = alCustom
          Caption = 'btnLogin'
          TabOrder = 5
          OnClick = btnLoginClick
        end
      end
    end
    object tsRegister: TTabSheet
      Caption = 'tsRegister'
      ImageIndex = 1
      object pnlRegister: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 585
        Align = alClient
        TabOrder = 0
        object lblRUsername: TLabel
          Left = 375
          Top = 197
          Width = 105
          Height = 23
          Caption = 'lblRUsername'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblCPassword: TLabel
          Left = 375
          Top = 368
          Width = 136
          Height = 23
          Caption = 'Confirm Password'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblRPassword: TLabel
          Left = 375
          Top = 279
          Width = 98
          Height = 23
          Caption = 'lblRPassword'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btnReturn: TButton
          Left = 375
          Top = 513
          Width = 249
          Height = 41
          Align = alCustom
          Caption = 'Return'
          TabOrder = 0
          OnClick = btnReturnClick
        end
        object pnlHeading2: TPanel
          Left = 1
          Top = 1
          Width = 1077
          Height = 41
          Align = alTop
          Caption = 'pnlHeading2'
          TabOrder = 1
        end
        object edtRUsername: TEdit
          Left = 375
          Top = 233
          Width = 249
          Height = 23
          TabOrder = 2
        end
        object edtRPassword: TEdit
          Left = 375
          Top = 323
          Width = 249
          Height = 23
          TabOrder = 3
        end
        object edtCPassword: TEdit
          Left = 375
          Top = 397
          Width = 249
          Height = 23
          TabOrder = 4
        end
        object cbxSH2: TCheckBox
          Left = 648
          Top = 322
          Width = 97
          Height = 25
          Caption = 'show/hide'
          TabOrder = 5
          OnClick = cbxSH2Click
        end
        object cbxSHC: TCheckBox
          Left = 648
          Top = 396
          Width = 97
          Height = 25
          Caption = 'show/hide'
          TabOrder = 6
          OnClick = cbxSHCClick
        end
        object btnRLogin: TButton
          Left = 375
          Top = 442
          Width = 249
          Height = 41
          Align = alCustom
          Caption = 'Register'
          TabOrder = 7
          OnClick = btnRLoginClick
        end
      end
    end
    object tsOptions: TTabSheet
      Caption = 'tsOptions'
      ImageIndex = 2
      object pnlOptions: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 585
        Align = alClient
        TabOrder = 0
        object lblHeadingPnl3: TLabel
          Left = 216
          Top = 136
          Width = 632
          Height = 45
          Caption = 'Hi there friend, what are we learning today?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -33
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btnFlashcards: TButton
          Left = 263
          Top = 400
          Width = 553
          Height = 25
          Caption = 'Flashcards'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnFlashcardsClick
        end
        object btnSim: TButton
          Left = 263
          Top = 328
          Width = 553
          Height = 25
          Caption = 'Simulations'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnSimClick
        end
      end
    end
    object tsSim1: TTabSheet
      Caption = 'tsSim1'
      ImageIndex = 3
      object pnlSim1: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 585
        Align = alClient
        TabOrder = 0
        object pbxH1: TPaintBox
          Left = 200
          Top = 200
          Width = 625
          Height = 153
          OnPaint = pbxH1Paint
        end
        object pbxNH: TPaintBox
          Left = 200
          Top = 25
          Width = 625
          Height = 153
          OnPaint = pbxNHPaint
        end
        object pnlNH: TPanel
          Left = 1
          Top = 359
          Width = 1077
          Height = 225
          Align = alBottom
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object lblN: TLabel
            Left = 112
            Top = 59
            Width = 128
            Height = 31
            Caption = 'N'#8322'-Molekule'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblH1: TLabel
            Left = 423
            Top = 59
            Width = 127
            Height = 31
            Caption = 'H'#8322'-Molekule'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblNH: TLabel
            Left = 775
            Top = 59
            Width = 154
            Height = 31
            Caption = 'NH'#8323'-Molekules'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblPlus1: TLabel
            Left = 288
            Top = 112
            Width = 80
            Height = 31
            Caption = 'lblPlus1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lblArrow1: TLabel
            Left = 616
            Top = 112
            Width = 99
            Height = 31
            Caption = 'lblArrow1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -23
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object sedN: TSpinEdit
            Left = 112
            Top = 88
            Width = 121
            Height = 72
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -47
            Font.Name = 'Segoe UI'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 0
            Value = 0
            OnChange = sedNChange
          end
          object sedH1: TSpinEdit
            Left = 423
            Top = 88
            Width = 121
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
            OnChange = sedH1Change
          end
          object sedNH: TSpinEdit
            Left = 775
            Top = 88
            Width = 121
            Height = 24
            MaxValue = 0
            MinValue = 0
            TabOrder = 2
            Value = 0
            OnChange = sedNHChange
          end
          object btnRevealNH: TButton
            Left = 976
            Top = 1
            Width = 100
            Height = 223
            Align = alRight
            Caption = 'btnRevealNH'
            TabOrder = 3
            OnClick = btnRevealNHClick
          end
        end
        object pnlSim1Menu: TPanel
          Left = 893
          Top = 1
          Width = 185
          Height = 358
          Align = alRight
          Caption = 'pnlSim1Menu'
          Color = clMenuHighlight
          ParentBackground = False
          TabOrder = 1
          object btnNext1: TButton
            Left = 16
            Top = 152
            Width = 153
            Height = 25
            Caption = 'btnNext1'
            TabOrder = 0
          end
        end
      end
    end
    object tsFlashcards: TTabSheet
      Caption = 'tsFlashcards'
      ImageIndex = 6
      object pnlFlashcard1: TPanel
        Left = 0
        Top = 0
        Width = 1079
        Height = 585
        Align = alClient
        TabOrder = 0
        object lblQuestion: TLabel
          Left = 120
          Top = 38
          Width = 587
          Height = 62
          Caption = 
            'Question 1: What is the balanced form of this equation?'#13#10'H'#8322' + O'#8322 +
            ' '#8594' H'#8322'O'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAnswer: TLabel
          Left = 120
          Top = 354
          Width = 98
          Height = 30
          Caption = 'lblAnswer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rgpQuestion: TRadioGroup
          Left = 120
          Top = 162
          Width = 729
          Height = 152
          Caption = 'Choose an Option'
          Items.Strings = (
            '1'
            '2'
            '3'
            '4')
          TabOrder = 0
        end
        object btnMarkAnswer: TButton
          AlignWithMargins = True
          Left = 120
          Top = 447
          Width = 137
          Height = 65
          Caption = 'Mark Answer'
          TabOrder = 1
          OnClick = btnMarkAnswerClick
        end
        object btnNextFlashcard: TButton
          Left = 752
          Top = 450
          Width = 137
          Height = 59
          Caption = 'Next Question'
          TabOrder = 2
        end
      end
    end
    object tsResultsScreen: TTabSheet
      Caption = 'tsResultsScreen'
      ImageIndex = 5
      object lblCorrectPercent: TLabel
        Left = 192
        Top = 152
        Width = 7
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnBackToMenuRes: TButton
        Left = 288
        Top = 352
        Width = 145
        Height = 25
        Caption = 'Back to Menu'
        TabOrder = 0
        OnClick = btnBackToMenuResClick
      end
    end
  end
end
