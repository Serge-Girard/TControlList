object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TControlList : Image Browser'
  ClientHeight = 587
  ClientWidth = 620
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
    Left = 185
    Top = 113
    Width = 435
    Height = 474
    Align = alClient
    ItemWidth = 200
    ItemHeight = 200
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ColumnLayout = cltMultiTopToBottom
    ParentColor = False
    TabOrder = 0
    OnBeforeDrawItem = ControlList1BeforeDrawItem
    object imgBrowser: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 194
      Height = 181
      Align = alClient
      Center = True
      IncrementalDisplay = True
      Proportional = True
      Stretch = True
      ExplicitLeft = -2
      ExplicitTop = -2
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object LblBrowser: TLabel
      Left = 0
      Top = 187
      Width = 200
      Height = 13
      Align = alBottom
      Caption = 'Label2'
      ExplicitWidth = 31
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 113
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      620
      113)
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 51
      Height = 13
      Caption = 'R'#233'pertoire'
    end
    object SpeedButton1: TSpeedButton
      Left = 585
      Top = 16
      Width = 23
      Height = 22
      Anchors = [akRight, akBottom]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FF0274AC
        0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274
        ACFF00FFFF00FFFF00FF0274AC138AC456B6E16ACBF84BBFF74ABFF74ABFF74A
        BFF74ABFF64ABFF74ABFF64BC0F72398CC0C81BAFF00FFFF00FF0274AC33AAE0
        2392C489D9FA54C7F854C7F753C7F854C7F754C7F854C7F854C7F853C7F7279D
        CEBAEBEF0274ACFF00FF0274AC57CAF80274AC99E2FB5ED1FA5ED1FA5ED1FA5E
        D1FA5ED1FA5FD1FA5ED1F85ED1F82CA1CEBAEBEF0274ACFF00FF0274AC5ED3FA
        0B81B782D5EF79E0FB6ADCFA69DCFB69DCFB6ADCFB69DCFB69DCFA6ADDFB2FA6
        CFBAEBEF097EB4FF00FF0274AC68DAFB2BA4D14AB1D796EBFB74E5FB74E5FB74
        E5FC74E5FC74E5FB74E5FC74E5FB33A9CFBAEBEFBAEBEF0274AC0274AC70E3FB
        5CD1EF1184B7FEFFFFB8F4FCBAF4FCBAF4FCBAF4FEB8F4FEBAF4FCB8F4FE83C9
        DEE3FEFEC5EFF60274AC0274AC7AEBFE7AEBFC0A7FB50274AC0274AC0274AC02
        74AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC83F2FE
        82F3FE82F3FE83F2FC83F3FE82F3FE83F2FE82F3FC83F2FE82F3FE82F3FE036F
        A7FF00FFFF00FFFF00FF0274ACFEFEFE89FAFF89FAFE89FAFE8AF8FE8AFAFE89
        F8FE8AFAFE8AFAFF89FAFF8AFAFF036FA7FF00FFFF00FFFF00FFFF00FF0274AC
        FEFEFE8FFEFF8FFEFF8FFEFF0274AC0274AC0274AC0274AC0274AC0274ACFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0274AC0274AC0274AC0274ACFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 8
      Top = 59
      Width = 62
      Height = 13
      Caption = 'Hauteur item'
    end
    object Label3: TLabel
      Left = 185
      Top = 59
      Width = 60
      Height = 13
      Caption = 'Largeur item'
    end
    object edtDir: TEdit
      Left = 72
      Top = 16
      Width = 507
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
    end
    object CheckBox1: TCheckBox
      Left = 1
      Top = 95
      Width = 618
      Height = 17
      Align = alBottom
      Caption = 'Voir la liste'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Hauteur: TNumberBox
      Left = 96
      Top = 56
      Width = 73
      Height = 21
      Decimal = 0
      MinValue = 100.000000000000000000
      MaxValue = 400.000000000000000000
      TabOrder = 2
      Value = 200.000000000000000000
      SpinButtonOptions.Placement = nbspCompact
    end
    object Largeur: TNumberBox
      Left = 266
      Top = 56
      Width = 71
      Height = 21
      Decimal = 0
      MinValue = 100.000000000000000000
      MaxValue = 400.000000000000000000
      TabOrder = 3
      Value = 200.000000000000000000
      SpinButtonOptions.Placement = nbspCompact
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 113
    Width = 185
    Height = 474
    Align = alLeft
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToPropertyItemWidth: TLinkControlToProperty
      Category = 'Liaisons rapides'
      Control = Largeur
      Track = True
      Component = ControlList1
      ComponentProperty = 'ItemWidth'
    end
    object LinkControlToPropertyItemHeight: TLinkControlToProperty
      Category = 'Liaisons rapides'
      Control = Hauteur
      Track = True
      Component = ControlList1
      ComponentProperty = 'ItemHeight'
    end
  end
end
