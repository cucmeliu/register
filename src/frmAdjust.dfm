inherited AdjustForm: TAdjustForm
  Caption = #36873#39033
  ClientHeight = 433
  ClientWidth = 377
  OnCreate = FormCreate
  ExplicitWidth = 383
  ExplicitHeight = 461
  PixelsPerInch = 96
  TextHeight = 16
  object Label15: TLabel [0]
    Left = 26
    Top = 177
    Width = 32
    Height = 16
    Caption = #20303#22336
  end
  object Label11: TLabel [1]
    Left = 28
    Top = 139
    Width = 32
    Height = 16
    Caption = #24180#20221
  end
  object Label1: TLabel [2]
    Left = 26
    Top = 361
    Width = 238
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = #20445#23384#21518#35831#37325#26032#36827#20837#20449#24687#36755#20837#31383#21475
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 293
  end
  object Label2: TLabel [3]
    Left = 188
    Top = 96
    Width = 32
    Height = 16
    Caption = #32844#19994
  end
  object Label3: TLabel [4]
    Left = 28
    Top = 96
    Width = 32
    Height = 16
    Caption = #25143#21035
  end
  object Label4: TLabel [5]
    Left = 188
    Top = 137
    Width = 32
    Height = 16
    Caption = #30331#35760
  end
  object Label7: TLabel [6]
    Left = 28
    Top = 299
    Width = 80
    Height = 16
    Caption = #20309#22240#30001#20309#22320
  end
  object Label5: TLabel [7]
    Left = 28
    Top = 267
    Width = 32
    Height = 16
    Caption = #20309#26102
  end
  object Bevel1: TBevel [8]
    Left = 26
    Top = 221
    Width = 224
    Height = 28
    Shape = bsBottomLine
    Style = bsRaised
  end
  object Label6: TLabel [9]
    Left = 26
    Top = 225
    Width = 224
    Height = 16
    Caption = #20309#26102#20309#22240#30001#20309#22320#36801#26469#26412#24066#65288#21439#65289
  end
  inherited pnlTop: TPanel
    Width = 377
    ExplicitWidth = 377
    inherited imgTop: TImage
      Width = 377
      ExplicitWidth = 281
    end
    inherited lblTitle: TLabel
      Width = 377
      Height = 60
    end
  end
  inherited pnlBottom: TPanel
    Top = 383
    Width = 377
    TabOrder = 8
    ExplicitTop = 383
    ExplicitWidth = 377
    inherited pnlBottomButton: TPanel
      Left = 153
      ExplicitLeft = 153
      inherited bbtAction: TBitBtn
        Caption = #20445#23384
        OnClick = bbtActionClick
      end
    end
  end
  object eAddress: TEdit
    Left = 73
    Top = 174
    Width = 281
    Height = 24
    TabOrder = 5
    Text = #33714#20141#36335'60'#21495
  end
  object seYear: TSpinEdit
    Left = 74
    Top = 134
    Width = 88
    Height = 26
    MaxValue = 2050
    MinValue = 1990
    TabOrder = 3
    Value = 2008
  end
  object eJob: TEdit
    Left = 235
    Top = 93
    Width = 121
    Height = 24
    TabOrder = 2
    Text = #23398#29983
  end
  object seID: TSpinEdit
    Left = 75
    Top = 94
    Width = 87
    Height = 26
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object dtpRegDate: TDateTimePicker
    Left = 235
    Top = 131
    Width = 121
    Height = 24
    Date = 39755.918365520830000000
    Time = 39755.918365520830000000
    TabOrder = 4
  end
  object dtpcomedate: TDateTimePicker
    Left = 75
    Top = 259
    Width = 121
    Height = 24
    Date = 39748.907018761570000000
    Time = 39748.907018761570000000
    TabOrder = 6
  end
  object eComeReason: TEdit
    Left = 28
    Top = 321
    Width = 328
    Height = 24
    TabOrder = 7
    Text = #21319#23398
  end
end
