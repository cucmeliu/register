inherited PrintRangeForm: TPrintRangeForm
  Caption = #33539#22260#25171#21360
  ClientHeight = 194
  ClientWidth = 350
  OnCreate = FormCreate
  ExplicitWidth = 356
  ExplicitHeight = 222
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel [0]
    Left = 48
    Top = 96
    Width = 48
    Height = 16
    Caption = #25171#21360#20174
  end
  object Label2: TLabel [1]
    Left = 192
    Top = 96
    Width = 16
    Height = 16
    Caption = #21040
  end
  inherited pnlTop: TPanel
    Width = 350
    ExplicitWidth = 350
    inherited imgTop: TImage
      Width = 350
      ExplicitWidth = 350
      ExplicitHeight = 17
    end
    inherited lblTitle: TLabel
      Width = 350
      Height = 60
      Font.Height = -9
      Font.Name = #23435#20307
      ExplicitWidth = 350
      ExplicitHeight = 9
    end
  end
  inherited pnlBottom: TPanel
    Top = 144
    Width = 350
    ExplicitTop = 144
    ExplicitWidth = 350
    inherited pnlBottomButton: TPanel
      Left = 126
      ExplicitLeft = 126
      inherited bbtAction: TBitBtn
        Caption = #25171#21360
        Default = True
        ModalResult = 1
        OnClick = bbtActionClick
      end
      inherited bbtFinish: TBitBtn
        Caption = #21462#28040
        ModalResult = 2
      end
    end
  end
  object seFrom: TSpinEdit
    Left = 104
    Top = 93
    Width = 82
    Height = 26
    MaxValue = 100000
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object seTo: TSpinEdit
    Left = 214
    Top = 93
    Width = 75
    Height = 26
    MaxValue = 100000
    MinValue = 1
    TabOrder = 3
    Value = 2
  end
  object adods: TADODataSet
    Connection = DM.ac
    CursorType = ctStatic
    CommandText = 'select * from hjinfo'
    Parameters = <>
    Left = 232
    Top = 16
    object adodsyear: TSmallintField
      DisplayLabel = #24180#20221
      FieldName = 'year'
    end
    object adodsid: TSmallintField
      DisplayLabel = #25143#21035
      FieldName = 'id'
    end
    object adodsname: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'name'
    end
    object adodsgender: TWideStringField
      DisplayLabel = #24615#21035
      FieldName = 'gender'
      Size = 2
    end
    object adodsnationality: TWideStringField
      DisplayLabel = #27665#26063
      FieldName = 'nationality'
      Size = 10
    end
    object adodsbirthday: TDateTimeField
      DisplayLabel = #20986#29983#26085#26399
      FieldName = 'birthday'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object adodsbirthplace: TWideStringField
      DisplayLabel = #20986#29983#22320
      FieldName = 'birthplace'
      Size = 50
    end
    object adodsnative: TWideStringField
      DisplayLabel = #31821#36143
      FieldName = 'native'
      Size = 60
    end
    object adodsregdate: TDateTimeField
      DisplayLabel = #30331#35760#26085#26399
      FieldName = 'regdate'
    end
    object adodsjob: TWideStringField
      DisplayLabel = #32844#19994
      FieldName = 'job'
      Size = 10
    end
    object adodsservice: TWideStringField
      DisplayLabel = #26381#21153#22788#25152
      FieldName = 'service'
      Size = 50
    end
    object adodsaddress: TWideStringField
      DisplayLabel = #20303#22336
      FieldName = 'address'
      Size = 50
    end
    object adodscomedate: TDateTimeField
      FieldName = 'comedate'
    end
    object adodscomereason: TWideStringField
      FieldName = 'comereason'
      Size = 50
    end
    object adodsschoolyear: TWordField
      DisplayLabel = #23398#21046
      FieldName = 'schoolyear'
    end
  end
  object ds: TDataSource
    DataSet = adods
    Left = 256
    Top = 16
  end
end
