object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'ControlList : No'#235'l'
  ClientHeight = 453
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ControlList1: TControlList
    Left = 0
    Top = 0
    Width = 406
    Height = 427
    Cursor = crHandPoint
    Align = alClient
    Enabled = False
    ItemWidth = 70
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ColumnLayout = cltMultiTopToBottom
    ItemSelectionOptions.HotColor = clNone
    ItemSelectionOptions.FocusedColor = clNone
    ParentColor = False
    TabOrder = 0
    OnBeforeDrawItem = ControlList1BeforeDrawItem
    object Shape1: TShape
      Left = 16
      Top = 16
      Width = 40
      Height = 40
      Align = alCustom
      Shape = stCircle
    end
  end
  object ToggleSwitch1: TToggleSwitch
    AlignWithMargins = True
    Left = 10
    Top = 430
    Width = 386
    Height = 20
    Margins.Left = 10
    Margins.Right = 10
    Align = alBottom
    TabOrder = 1
    OnClick = ToggleSwitch1Click
    ExplicitWidth = 103
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 264
    Top = 400
  end
end
