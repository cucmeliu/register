object ChildModeNoTitleForm: TChildModeNoTitleForm
  Left = 0
  Top = 0
  Caption = 'ChildModeNoTitleForm'
  ClientHeight = 523
  ClientWidth = 735
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 473
    Width = 735
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    ExplicitLeft = -366
    ExplicitTop = 166
    ExplicitWidth = 792
    object pnlBottomButton: TPanel
      Left = 511
      Top = 0
      Width = 224
      Height = 50
      Align = alRight
      ParentColor = True
      TabOrder = 0
      ExplicitLeft = 568
      object bbtAction: TBitBtn
        Left = 16
        Top = 8
        Width = 89
        Height = 33
        Caption = 'Action'
        TabOrder = 0
      end
      object bbtFinish: TBitBtn
        Left = 111
        Top = 8
        Width = 89
        Height = 33
        Caption = 'Finish'
        TabOrder = 1
      end
    end
  end
end
