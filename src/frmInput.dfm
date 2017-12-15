inherited InputForm: TInputForm
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #25143#31821#20449#24687#24405#20837
  ClientHeight = 526
  ClientWidth = 975
  Font.Height = -19
  OnCreate = FormCreate
  ExplicitWidth = 983
  ExplicitHeight = 560
  PixelsPerInch = 96
  TextHeight = 19
  inherited pnlTop: TPanel
    Width = 975
    ExplicitWidth = 975
    inherited imgTop: TImage
      Width = 975
      ExplicitWidth = 657
    end
    inherited lblTitle: TLabel
      Width = 975
      Height = 60
      Font.Color = clRed
    end
  end
  inherited pnlBottom: TPanel
    Top = 476
    Width = 975
    ExplicitTop = 476
    ExplicitWidth = 975
    object SpeedButton2: TSpeedButton [0]
      Left = 531
      Top = 6
      Width = 98
      Height = 36
      Action = ActionAdd
      Anchors = [akTop, akRight]
    end
    object SpeedButton1: TSpeedButton [1]
      Left = 635
      Top = 6
      Width = 98
      Height = 36
      Action = ActionEdit
      Anchors = [akTop, akRight]
    end
    object Label1: TLabel [2]
      Left = 23
      Top = 8
      Width = 76
      Height = 19
      Caption = #25171#21360#26085#26399
    end
    inherited pnlBottomButton: TPanel
      Left = 751
      ExplicitLeft = 751
      inherited bbtAction: TBitBtn
        Action = ActionRefresh
        Caption = #21047#26032'(&R)'
      end
      inherited bbtFinish: TBitBtn
        Caption = #23436#25104'(&C)'
      end
    end
    object BitBtn2: TBitBtn
      Left = 256
      Top = 6
      Width = 120
      Height = 36
      Cursor = crHandPoint
      Action = ActionPrintAll
      Anchors = [akTop, akRight]
      Caption = #25171#21360#25152#26377
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 382
      Top = 6
      Width = 122
      Height = 36
      Cursor = crHandPoint
      Action = ActionPrintSingle
      Anchors = [akTop, akRight]
      Caption = #25171#21360#36873#20013'(&P)'
      TabOrder = 2
    end
    object dtpPrintDate: TDateTimePicker
      Left = 105
      Top = 8
      Width = 135
      Height = 27
      Date = 40803.721797048610000000
      Time = 40803.721797048610000000
      TabOrder = 3
    end
  end
  object GroupBox3: TGroupBox
    Left = 23
    Top = 66
    Width = 928
    Height = 63
    Anchors = [akLeft, akTop, akRight]
    Caption = #26174#31034
    TabOrder = 2
    DesignSize = (
      928
      63)
    object Label10: TLabel
      Left = 17
      Top = 28
      Width = 114
      Height = 19
      Caption = #36801#20837#26102#38388#20171#20110
    end
    object Label19: TLabel
      Left = 793
      Top = 28
      Width = 118
      Height = 19
      Anchors = [akTop, akRight]
      Caption = #20849'        '#20154
    end
    object lblTotal: TLabel
      Left = 818
      Top = 24
      Width = 73
      Height = 25
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '0'
      Color = clGray
      Font.Charset = GB2312_CHARSET
      Font.Color = clYellow
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 551
      Top = 16
      Width = 98
      Height = 36
      Action = ActionShowAll
    end
    object BitBtn4: TBitBtn
      Left = 439
      Top = 16
      Width = 98
      Height = 36
      Action = ActionShow
      Caption = #26174#31034'(&S)'
      TabOrder = 0
    end
    object dtpBDate: TDateTimePicker
      Left = 145
      Top = 20
      Width = 128
      Height = 27
      Date = 40793.892056319450000000
      Time = 40793.892056319450000000
      TabOrder = 1
    end
    object dtpEDate: TDateTimePicker
      Left = 289
      Top = 20
      Width = 128
      Height = 27
      Date = 40793.892086805560000000
      Time = 40793.892086805560000000
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 23
    Top = 135
    Width = 928
    Height = 330
    Hint = #25353#20303'Ctrl'#20877#28857#20987#40736#26631#21487#20197#36873#25321#22810#26465#35760#24405#25171#21360
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = ds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = ActionEditExecute
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #22995#21517
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gender'
        Title.Caption = #24615#21035
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nationality'
        Title.Caption = #27665#26063
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Native'
        Title.Caption = #31821#36143
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BirthPlace'
        Title.Caption = #20986#29983#22320
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDCard'
        Title.Caption = #36523#20221#35777
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Education'
        Title.Caption = #25945#32946
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marrage'
        Title.Caption = #23130#21542
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Military'
        Title.Caption = #20853#24441
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Height'
        Title.Caption = #36523#39640
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BloodType'
        Title.Caption = #34880#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Career'
        Title.Caption = #32844#19994
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ServicePlace'
        Title.Caption = #26381#21153#22788
        Width = 120
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Left = 160
    Top = 32
    object ActionAdd: TAction
      Caption = #28155#21152'(&A)'
      OnExecute = ActionAddExecute
    end
    object ActionEdit: TAction
      Caption = #20462#25913'(&E)'
      OnExecute = ActionEditExecute
    end
    object ActionDel: TAction
      Caption = #21024#38500'(&D)'
      OnExecute = ActionDelExecute
    end
    object ActionRefresh: TAction
      Caption = #21047#26032'(&R)'
      OnExecute = ActionRefreshExecute
    end
    object ActionShow: TAction
      Caption = #26174#31034'(&S)'
      OnExecute = ActionShowExecute
    end
    object ActionPrintList: TAction
      Caption = #25171#21360#25253#34920'(&W)'
      OnExecute = ActionPrintListExecute
    end
    object ActionPrintSingle: TAction
      Caption = #25171#21360#36873#20013'(&P)'
      OnExecute = ActionPrintSingleExecute
    end
    object ActionPrintAll: TAction
      Caption = #25171#21360#25152#26377
      OnExecute = ActionPrintAllExecute
    end
    object ActionPrintRange: TAction
      Caption = #25171#21360#33539#22260
    end
    object ActionShowAll: TAction
      Caption = #25152#26377'(&L)'
      OnExecute = ActionShowAllExecute
    end
  end
  object ds: TDataSource
    DataSet = adods
    Left = 160
    Top = 224
  end
  object adods: TADODataSet
    Connection = DM.ac
    CursorType = ctStatic
    AfterOpen = adodsAfterOpen
    AfterPost = adodsAfterPost
    AfterRefresh = adodsAfterRefresh
    CommandText = 'select * from records'
    Parameters = <>
    Left = 120
    Top = 224
  end
  object rvdscAll: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adods
    Left = 272
    Top = 32
  end
  object RvDataSetConnection2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 304
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    Left = 488
    Top = 208
    object N1: TMenuItem
      Action = ActionAdd
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = ActionEdit
      Default = True
    end
    object D1: TMenuItem
      Action = ActionDel
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = ActionPrintSingle
    end
    object N6: TMenuItem
      Action = ActionPrintAll
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object W1: TMenuItem
      Action = ActionPrintList
    end
  end
  object adodsRange: TADODataSet
    Connection = DM.ac
    Parameters = <>
    Left = 784
    Top = 24
  end
end
