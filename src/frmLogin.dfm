inherited LoginForm: TLoginForm
  Caption = #27426#36814#30331#24405#25143#31821#31649#29702#31995#32479
  ClientHeight = 220
  ClientWidth = 307
  ExplicitWidth = 313
  ExplicitHeight = 245
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 56
    Top = 88
    Width = 32
    Height = 16
    Caption = #29992#25143
  end
  object Label2: TLabel [1]
    Left = 56
    Top = 120
    Width = 32
    Height = 16
    Caption = #23494#30721
  end
  inherited pnlTop: TPanel
    Width = 307
    inherited imgTop: TImage
      Width = 307
    end
    inherited lblTitle: TLabel
      Width = 307
      Height = 60
    end
  end
  inherited pnlBottom: TPanel
    Top = 170
    Width = 307
    TabOrder = 3
    inherited pnlBottomButton: TPanel
      Left = 83
      inherited bbtAction: TBitBtn
        Caption = #30331#24405
        Default = True
        OnClick = bbtActionClick
      end
      inherited bbtFinish: TBitBtn
        Caption = #21462#28040
      end
    end
  end
  object eUser: TEdit
    Left = 104
    Top = 85
    Width = 121
    Height = 24
    TabOrder = 1
  end
  object ePasswd: TEdit
    Left = 104
    Top = 117
    Width = 121
    Height = 24
    PasswordChar = '*'
    TabOrder = 2
  end
end
