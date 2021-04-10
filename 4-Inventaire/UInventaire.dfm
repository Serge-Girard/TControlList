object FormInventaire: TFormInventaire
  Left = 0
  Top = 0
  ActiveControl = BindNavigator1
  Caption = 'Jeu de Capture virtuelle'
  ClientHeight = 600
  ClientWidth = 915
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
  object Splitter1: TSplitter
    Left = 441
    Top = 0
    Height = 600
    ExplicitTop = 8
  end
  object ControlList1: TControlList
    Left = 0
    Top = 0
    Width = 441
    Height = 600
    Align = alLeft
    ItemHeight = 120
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    TabOrder = 0
    TabStop = False
    OnBeforeDrawItem = ControlList1BeforeDrawItem
    OnEnableControl = ControlList1EnableControl
    OnShowControl = ControlList1ShowControl
    OnItemClick = ControlList1ItemClick
    OnItemDblClick = ControlList1ItemDblClick
    object Image1: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 214
      Height = 114
      Align = alLeft
      Stretch = True
    end
    object lblName: TLabel
      Left = 223
      Top = 6
      Width = 186
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
    end
    object lblNotes: TLabel
      Left = 223
      Top = 25
      Width = 210
      Height = 56
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      WordWrap = True
    end
    object ControlListButton1: TControlListButton
      Left = 280
      Top = 87
      Width = 129
      Height = 30
      Caption = 'Oops, je me suis tromp'#233
      LinkHotColor = clHighlight
      OnClick = ControlListButton1Click
    end
    object lblcount: TLabel
      Left = 224
      Top = 97
      Width = 37
      Height = 13
      Caption = 'lblcount'
    end
  end
  object ListView1: TListView
    Left = 444
    Top = 0
    Width = 200
    Height = 600
    Align = alLeft
    Checkboxes = True
    Columns = <
      item
        AutoSize = True
        Caption = 'Nom'
      end>
    ColumnClick = False
    TabOrder = 1
    TabStop = False
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 644
    Top = 0
    Width = 271
    Height = 600
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 2
    object Label1: TLabel
      Left = 27
      Top = 117
      Width = 28
      Height = 13
      Caption = 'Notes'
    end
    object Label2: TLabel
      Left = 24
      Top = 69
      Width = 63
      Height = 13
      Caption = 'Nom commun'
    end
    object Label3: TLabel
      Left = 72
      Top = 27
      Width = 103
      Height = 23
      Alignment = taCenter
      Caption = 'Traduction'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BindNavigator1: TBindNavigator
      Left = 24
      Top = 536
      Width = 228
      Height = 41
      DataSource = BindSourceDB1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
      Orientation = orHorizontal
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 24
      Top = 88
      Width = 225
      Height = 21
      TabOrder = 1
    end
    object edtNotes: TMemo
      Left = 24
      Top = 136
      Width = 225
      Height = 369
      TabOrder = 2
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'D:\serge\Documents\Embarcadero\Studio\Projets\Sidney\biolife.cds'
    Params = <>
    Left = 80
    Top = 320
    object ClientDataSet1SpeciesNo: TFloatField
      FieldName = 'Species No'
    end
    object ClientDataSet1Common_Name: TStringField
      FieldName = 'Common_Name'
      Size = 30
    end
    object ClientDataSet1Notes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 50
    end
    object ClientDataSet1Graphic: TGraphicField
      FieldName = 'Graphic'
      ReadOnly = True
      BlobType = ftGraphic
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = ClientDataSet1
    ScopeMappings = <>
    Left = 184
    Top = 248
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 84
    Top = 245
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      GridControl = ControlList1
      Columns = <>
    end
    object LinkListControlToField1: TLinkListControlToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'Common_Name'
      Control = ListView1
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'Common_Name'
      Component = lblName
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'Notes'
      Component = lblNotes
      ComponentProperty = 'Caption'
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'Graphic'
      Control = Image1
      Direction = linkDataToControl
      Track = False
    end
    object LinkControlToField2: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'Notes'
      Control = edtNotes
      Track = False
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'Common_Name'
      Control = edtName
      Track = True
    end
  end
end
