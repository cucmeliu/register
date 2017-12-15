object NormalModeForm: TNormalModeForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'NormalModeForm'
  ClientHeight = 468
  ClientWidth = 394
  Color = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object imgTop: TImage
      Left = 0
      Top = 0
      Width = 394
      Height = 60
      Align = alClient
      Stretch = True
      ExplicitWidth = 792
    end
    object lblTitle: TLabel
      Left = 0
      Top = 0
      Width = 394
      Height = 60
      Align = alClient
      Alignment = taCenter
      Caption = #39029#38754#26631#39064
      Font.Charset = GB2312_CHARSET
      Font.Color = clPurple
      Font.Height = -32
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      ExplicitWidth = 132
      ExplicitHeight = 33
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 418
    Width = 394
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object pnlBottomButton: TPanel
      Left = 170
      Top = 0
      Width = 224
      Height = 50
      Align = alRight
      ParentColor = True
      TabOrder = 0
      object bbtAction: TBitBtn
        Left = 16
        Top = 8
        Width = 89
        Height = 33
        Caption = #27983#35272
        TabOrder = 0
      end
      object bbtFinish: TBitBtn
        Left = 111
        Top = 8
        Width = 89
        Height = 33
        Cancel = True
        Caption = #23436#25104
        TabOrder = 1
        OnClick = bbtFinishClick
      end
    end
  end
end
