object NewRecForm: TNewRecForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25143#31821#20449#24687
  ClientHeight = 379
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object bbtSave: TBitBtn
    Left = 392
    Top = 341
    Width = 101
    Height = 30
    Caption = #20445#23384'(&S)'
    TabOrder = 4
    OnClick = bbtSaveClick
  end
  object bbtClose: TBitBtn
    Left = 499
    Top = 341
    Width = 101
    Height = 30
    Caption = #20851#38381'(&C)'
    TabOrder = 5
    OnClick = bbtCloseClick
  end
  object Panel1: TPanel
    Left = 8
    Top = -1
    Width = 617
    Height = 38
    TabOrder = 0
    object Label1: TLabel
      Left = 42
      Top = 13
      Width = 32
      Height = 19
      Caption = #25143#21035
    end
    object Label10: TLabel
      Left = 219
      Top = 13
      Width = 64
      Height = 19
      Caption = #25143#20027#22995#21517
    end
    object Label11: TLabel
      Left = 405
      Top = 13
      Width = 80
      Height = 19
      Caption = #19982#25143#20027#20851#31995
    end
    object HukouType: TComboBox
      Left = 80
      Top = 9
      Width = 133
      Height = 27
      ItemHeight = 19
      ItemIndex = 0
      TabOrder = 0
      Text = #38750#20892#19994#38598#20307#25143
      Items.Strings = (
        #38750#20892#19994#38598#20307#25143
        #20892#19994#25143)
    end
    object Master: TEdit
      Left = 289
      Top = 5
      Width = 110
      Height = 27
      TabOrder = 1
    end
    object Relation: TComboBox
      Left = 491
      Top = 5
      Width = 110
      Height = 27
      ItemHeight = 19
      ItemIndex = 0
      TabOrder = 2
      Text = #38750#20146#23646
      Items.Strings = (
        #38750#20146#23646)
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 37
    Width = 617
    Height = 146
    TabOrder = 1
    object Label3: TLabel
      Left = 251
      Top = 16
      Width = 32
      Height = 19
      Caption = #24615#21035
    end
    object Label4: TLabel
      Left = 10
      Top = 82
      Width = 64
      Height = 19
      Caption = #20986#29983#26085#26399
    end
    object Label5: TLabel
      Left = 453
      Top = 16
      Width = 32
      Height = 19
      Caption = #27665#26063
    end
    object Label6: TLabel
      Left = 235
      Top = 82
      Width = 48
      Height = 19
      Caption = #20986#29983#22320
    end
    object Label7: TLabel
      Left = 42
      Top = 116
      Width = 32
      Height = 19
      Caption = #31821#36143
    end
    object Label9: TLabel
      Left = 42
      Top = 16
      Width = 32
      Height = 19
      Caption = #22995#21517
    end
    object Label2: TLabel
      Left = 219
      Top = 116
      Width = 64
      Height = 19
      Caption = #36523#20221#35777#21495
    end
    object Label16: TLabel
      Left = 421
      Top = 116
      Width = 64
      Height = 19
      Caption = #31614#21457#26085#26399
    end
    object Label24: TLabel
      Left = 26
      Top = 50
      Width = 48
      Height = 19
      Caption = #26366#29992#21517
    end
    object Label25: TLabel
      Left = 235
      Top = 50
      Width = 48
      Height = 19
      Caption = #30417#25252#20154
    end
    object Label26: TLabel
      Left = 421
      Top = 50
      Width = 64
      Height = 19
      Caption = #30417#25252#20851#31995
    end
    object Label27: TLabel
      Left = 421
      Top = 82
      Width = 64
      Height = 19
      Caption = #23447#25945#20449#20208
    end
    object Gender: TRadioGroup
      Left = 289
      Top = 1
      Width = 110
      Height = 40
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        #30007
        #22899)
      TabOrder = 1
    end
    object Name: TEdit
      Left = 80
      Top = 12
      Width = 116
      Height = 27
      TabOrder = 0
    end
    object Birthday: TDateTimePicker
      Left = 80
      Top = 78
      Width = 113
      Height = 27
      Date = 40763.949994050920000000
      Time = 40763.949994050920000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object Nationality: TComboBox
      Left = 491
      Top = 12
      Width = 110
      Height = 27
      ItemHeight = 19
      TabOrder = 2
    end
    object BirthPlace: TEdit
      Left = 289
      Top = 78
      Width = 110
      Height = 27
      TabOrder = 7
    end
    object Native: TEdit
      Left = 80
      Top = 112
      Width = 113
      Height = 27
      TabOrder = 9
    end
    object IDCard: TEdit
      Left = 289
      Top = 112
      Width = 110
      Height = 27
      TabOrder = 10
    end
    object CardSignDate: TDateTimePicker
      Left = 491
      Top = 112
      Width = 110
      Height = 27
      Date = 40792.864492997690000000
      Time = 40792.864492997690000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object otherName: TEdit
      Left = 80
      Top = 46
      Width = 115
      Height = 27
      TabOrder = 3
    end
    object Guardian: TEdit
      Left = 289
      Top = 46
      Width = 110
      Height = 27
      TabOrder = 4
    end
    object GuardRela: TComboBox
      Left = 491
      Top = 46
      Width = 110
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 19
      ParentFont = False
      TabOrder = 5
      Items.Strings = (
        #29238#20146
        #27597#20146
        #32769#24072
        #20854#20182)
    end
    object Religion: TComboBox
      Left = 491
      Top = 78
      Width = 110
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 19
      ParentFont = False
      TabOrder = 8
      Items.Strings = (
        #26080#23447#25945#20449#20208
        #20315#25945
        #36947#25945
        #22522#30563#25945
        #22825#20027#25945
        #31302#26031#26519)
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 183
    Width = 617
    Height = 73
    TabOrder = 2
    object Label17: TLabel
      Left = 10
      Top = 10
      Width = 64
      Height = 19
      Caption = #25991#21270#31243#24230
    end
    object Label18: TLabel
      Left = 219
      Top = 10
      Width = 64
      Height = 19
      Caption = #23130#23035#29366#20917
    end
    object Label19: TLabel
      Left = 421
      Top = 10
      Width = 64
      Height = 19
      Caption = #20853#24441#29366#20917
    end
    object Label20: TLabel
      Left = 42
      Top = 43
      Width = 32
      Height = 19
      Caption = #36523#39640
    end
    object Label21: TLabel
      Left = 251
      Top = 43
      Width = 32
      Height = 19
      Caption = #34880#22411
    end
    object Label22: TLabel
      Left = 453
      Top = 43
      Width = 32
      Height = 19
      Caption = #32844#19994
    end
    object Label28: TLabel
      Left = 161
      Top = 43
      Width = 32
      Height = 19
      Caption = #21400#31859
    end
    object Education: TComboBox
      Left = 80
      Top = 6
      Width = 116
      Height = 27
      ItemHeight = 19
      ItemIndex = 1
      TabOrder = 0
      Text = #30740#31350#29983
      Items.Strings = (
        #21338#22763
        #30740#31350#29983
        #26412#31185
        #22823#19987)
    end
    object Marrage: TComboBox
      Left = 289
      Top = 6
      Width = 110
      Height = 27
      ItemHeight = 19
      ItemIndex = 0
      TabOrder = 1
      Text = #26410#23130
      Items.Strings = (
        #26410#23130
        #24050#23130)
    end
    object Military: TComboBox
      Left = 491
      Top = 6
      Width = 110
      Height = 27
      ItemHeight = 19
      ItemIndex = 0
      TabOrder = 2
      Text = #26410#26381#20853#24441
      Items.Strings = (
        #26410#26381#20853#24441
        #24050#26381#20853#24441)
    end
    object BloodType: TComboBox
      Left = 289
      Top = 39
      Width = 110
      Height = 27
      ItemHeight = 19
      ItemIndex = 0
      TabOrder = 4
      Text = 'O'
      Items.Strings = (
        'O'
        'AB'
        'A'
        'B'
        #19981#26126)
    end
    object Career: TEdit
      Left = 491
      Top = 39
      Width = 110
      Height = 27
      TabOrder = 5
    end
    object Height: TEdit
      Left = 80
      Top = 39
      Width = 75
      Height = 27
      TabOrder = 3
      Text = '170'
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 256
    Width = 617
    Height = 81
    TabOrder = 3
    object Label8: TLabel
      Left = 251
      Top = 15
      Width = 32
      Height = 19
      Caption = #20303#22336
    end
    object Label12: TLabel
      Left = 42
      Top = 44
      Width = 32
      Height = 19
      Caption = #20309#26102
    end
    object Label13: TLabel
      Left = 201
      Top = 44
      Width = 32
      Height = 19
      Caption = #20309#22240
    end
    object Label14: TLabel
      Left = 329
      Top = 44
      Width = 48
      Height = 19
      Caption = #30001#20309#22320
    end
    object Label15: TLabel
      Left = 537
      Top = 44
      Width = 64
      Height = 19
      Caption = #36801#26469#26412#24066
    end
    object Label23: TLabel
      Left = 10
      Top = 10
      Width = 64
      Height = 19
      Caption = #26381#21153#22788#25152
    end
    object Address: TEdit
      Left = 289
      Top = 6
      Width = 313
      Height = 27
      TabOrder = 1
    end
    object MoveTime: TDateTimePicker
      Left = 80
      Top = 40
      Width = 115
      Height = 27
      Date = 40792.851529791670000000
      Time = 40792.851529791670000000
      TabOrder = 2
    end
    object MoveReason: TComboBox
      Left = 239
      Top = 40
      Width = 84
      Height = 27
      ItemHeight = 19
      ItemIndex = 0
      TabOrder = 3
      Text = #27605#19994
      Items.Strings = (
        #27605#19994
        #21319#23398)
    end
    object FromWhere: TEdit
      Left = 383
      Top = 40
      Width = 148
      Height = 27
      TabOrder = 4
    end
    object ServicePlace: TEdit
      Left = 80
      Top = 7
      Width = 113
      Height = 27
      TabOrder = 0
    end
  end
end
