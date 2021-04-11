object FormSpots: TFormSpots
  Left = 0
  Top = 0
  Caption = 'Spotlights'
  ClientHeight = 469
  ClientWidth = 448
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
    Width = 448
    Height = 337
    Align = alClient
    ItemWidth = 80
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ColumnLayout = cltMultiTopToBottom
    ParentColor = False
    TabOrder = 0
    OnBeforeDrawItem = ControlList1BeforeDrawItem
    OnAfterDrawItems = ControlList1AfterDrawItems
    OnBeforeDrawItems = ControlList1BeforeDrawItems
    ExplicitWidth = 402
    ExplicitHeight = 304
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 80
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Label1'
      ExplicitLeft = 16
      ExplicitTop = 8
      ExplicitWidth = 31
    end
    object Shape1: TShape
      AlignWithMargins = True
      Left = 3
      Top = 16
      Width = 74
      Height = 51
      Align = alClient
      Brush.Color = clRed
      Shape = stCircle
      ExplicitLeft = 13
      ExplicitTop = 24
      ExplicitWidth = 45
      ExplicitHeight = 43
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 337
    Width = 448
    Height = 108
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitTop = 336
    ExplicitWidth = 429
  end
  object Panel1: TPanel
    Left = 0
    Top = 445
    Width = 448
    Height = 24
    Align = alBottom
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 472
    ExplicitWidth = 402
    object Button1: TButton
      Left = 1
      Top = 1
      Width = 81
      Height = 22
      Align = alLeft
      Caption = 'Effacer Memo'
      TabOrder = 0
      OnClick = Button1Click
    end
    object chkmemo: TCheckBox
      Left = 96
      Top = 3
      Width = 113
      Height = 17
      Caption = 'Tracer dans m'#233'mo '
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chkmemoClick
    end
    object ChkItemNo: TCheckBox
      Left = 353
      Top = 4
      Width = 95
      Height = 17
      Caption = 'Voir item n'#176' '
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = ChkItemNoClick
    end
    object ActiveTimer: TToggleSwitch
      Left = 242
      Top = 2
      Width = 103
      Height = 20
      TabOrder = 3
      OnClick = ActiveTimerClick
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 304
    Top = 400
  end
end
