object mainform: Tmainform
  Left = 0
  Top = 0
  Caption = 'Apn'#233'e : Remplissage sans LiveBindings'
  ClientHeight = 473
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ControlList1: TControlList
    Left = 0
    Top = 0
    Width = 467
    Height = 473
    Align = alClient
    ItemHeight = 100
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    TabOrder = 0
    OnBeforeDrawItem = ControlList1BeforeDrawItem
    ExplicitHeight = 515
    object Image1: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 154
      Height = 94
      Align = alLeft
      Proportional = True
      Stretch = True
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 100
    end
    object lblCommon: TLabel
      Left = 162
      Top = 2
      Width = 106
      Height = 19
      Caption = 'CommonName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNotes: TLabel
      Left = 163
      Top = 27
      Width = 281
      Height = 65
      AutoSize = False
      Caption = 'Notes'
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 
      'C:\Users\Public\Documents\Embarcadero\Studio\21.0\Samples\Data\b' +
      'iolife.cds'
    Params = <>
    Left = 352
    Top = 168
    object ClientDataSet1SpeciesNo: TFloatField
      FieldName = 'Species No'
    end
    object ClientDataSet1Category: TStringField
      FieldName = 'Category'
      Size = 15
    end
    object ClientDataSet1Common_Name: TStringField
      FieldName = 'Common_Name'
      Size = 30
    end
    object ClientDataSet1SpeciesName: TStringField
      FieldName = 'Species Name'
      Size = 40
    end
    object ClientDataSet1Lengthcm: TFloatField
      FieldName = 'Length (cm)'
    end
    object ClientDataSet1Length_In: TFloatField
      FieldName = 'Length_In'
    end
    object ClientDataSet1Notes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 50
    end
    object ClientDataSet1Graphic: TGraphicField
      FieldName = 'Graphic'
      BlobType = ftGraphic
    end
  end
end
