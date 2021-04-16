object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'Gestion de contacts (sans BDD)'
  ClientHeight = 532
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    697
    532)
  PixelsPerInch = 96
  TextHeight = 13
  object Photo: TImage
    Left = 472
    Top = 8
    Width = 113
    Height = 137
    Proportional = True
    Stretch = True
  end
  object ControlList1: TControlList
    Left = 0
    Top = 0
    Width = 353
    Height = 532
    Align = alLeft
    ItemCount = 40
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ParentColor = False
    TabOrder = 0
    OnAfterDrawItems = ControlList1AfterDrawItems
    object cPhoto: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 73
      Height = 64
      Align = alLeft
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000640000
        0064080600000070E29554000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000003DD4944415478DAEDD95B4814511CC7F17F12BAA29B
        85D88A44655B115E10A3A7A297A830A2C2A0A02428B2B0C00C41BA1865D2C510
        2213CA6E144405054937927A8C7A8A44BC10A55812E2268BE92AAE1296E7C02C
        AE3B634897F94DFE3E20AEB333B23BDF3D67CEE83411F92104639A3008945010
        5766BAB832D2EC7E3D5352B0A945828DCDFA7128C8CC6D5BF417FD7BDFEE3DD0
        5F0A83006010300C028641C03008180601C3206018040C83806110300C028641
        C03008180601C320601C1564E0D56BE9AB7D2A43AD6DFAE7E9C91E71E7AC16F7
        9A5512E5769B1EF3BDCB27BDB54FF4B123FD0312151F27712B574842EE067D3C
        1AC704F1959D96C1770DFA84C62C5EA8B70D7D68D5273966A1573C278F464419
        6EFF2C5DA565A17DA2177965F8639B0EAA7E4FF2E932894E9D67F75B0BE39820
        9F366E95593BF3C246C3482020FE9A1BA39FFE37E25EB75612F7E5871DF3656F
        A11E2189FBF78C8EA435A1ED81BA97E2BF744D8F903957ABED7E6B611C13444D
        396AAA194F9D7075E2D5277EEEDD9B11DBAD4EBA114B3D8734753926C844D4E8
        51E63FBE1FDAA6A6ABCEA212895D9A259EB2D288638C2930A5AA126ADAFA6F82
        8C1F214AC7F65DFAFB9C2B17C3AE2F6AAAEBC8DB6D7A8CDD1C1F64F06DBDF8CA
        CF8E4E67CB25A9E4A0E973EA829E5858A047821A39FEEA1A7D61F71C3F22B1CB
        B2ED7E0B611C1D447DD27D27CEE8939B5C512EAEB42511FBA86B4F776555C4F6
        A49222D36B92DD1C1B646C8C842DB9326BC7B6887DC62E7BD5088AF6A6CA705B
        BB5E9571D9FB078D9D76AC62A8155467F161FD78FC8937422929E72BB8CAFA1D
        6A0AF25FBEAE1F27151FB0BC06A87D02CF5F584E4DC6546615D42E8E0AD273FB
        9EF43EA8D54BD9C482FC093FD9C67D86D5B5C55869592D8BEDE29820BD0F1F49
        CFAD3BA677E4668C7B1306F90B8CBBEEC99C3CE3C64FFDB92561F3A688E78D29
        CB6CB96C2747043146C764EE1B8C7B10B59A9A7DEC50D82809B6BC97AFA7CEE9
        D597D508B28B238274575ED04B557583173523DE72BF68EF82B00BB47161578C
        6347FAFA437FBEB71A3D7672441063FAF915B3294D8D86C0B33A19AC6F08FD3F
        24363B4BDCEB73A04686C11141A6120601C3206018040C83806110300C028641
        C03008180601C3206018040C83806110300C028641C03008180601C320601804
        0C83806110300C028641C03008180601C3206018040C83806110300C028641C0
        3008180601C3206018040C83806110300C028641C03008180601C3206018040C
        83806110300C028641C03008180601C3206018040C83806110300C028641C030
        08180601C3206018040C8380310DE2CA4C1757469ADDAF6D4A0A36B548B0B159
        3F0E05210C0C02E627796BEB2E9FB190F40000000049454E44AE426082}
      Proportional = True
      Stretch = True
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 70
    end
    object Cnom: TLabel
      Left = 104
      Top = 8
      Width = 55
      Height = 13
      Caption = 'Mary Harris'
    end
    object Cdate: TLabel
      Left = 104
      Top = 40
      Width = 56
      Height = 13
      Caption = '01/11/2021'
    end
  end
  object Nom: TEdit
    Left = 472
    Top = 168
    Width = 193
    Height = 21
    TabOrder = 1
  end
  object Datec: TDateTimePicker
    Left = 472
    Top = 208
    Width = 105
    Height = 21
    Date = 44301.000000000000000000
    Time = 0.481430567131610600
    TabOrder = 2
  end
  object BindNavigator1: TBindNavigator
    Left = 393
    Top = 274
    Width = 272
    Height = 49
    DataSource = Contacts
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Orientation = orHorizontal
    TabOrder = 3
    OnClick = BindNavigator1Click
  end
  object btnPost: TButton
    Left = 472
    Top = 235
    Width = 75
    Height = 33
    Caption = 'Changer'
    TabOrder = 4
    OnClick = btnPostClick
  end
  object btnSauver: TButton
    Left = 448
    Top = 482
    Width = 177
    Height = 42
    Anchors = [akLeft, akBottom]
    Caption = 'Sauvegarder Contacts.txt'
    TabOrder = 5
    OnClick = btnSauverClick
  end
  object Contacts: TPrototypeBindSource
    AutoActivate = True
    AutoPost = False
    RecordCount = 40
    FieldDefs = <
      item
        Name = 'ContactPhoto'
        FieldType = ftBitmap
        Generator = 'Bitmaps'
        Options = [optShuffle]
        ReadOnly = True
      end
      item
        Name = 'ContactNom'
        Generator = 'ContactNames'
        Options = [optShuffle]
        ReadOnly = False
      end
      item
        Name = 'ContactDate'
        Generator = 'Date'
        Options = [optShuffle]
        ReadOnly = False
      end>
    ScopeMappings = <>
    OnCreateAdapter = ContactsCreateAdapter
    Left = 384
    Top = 80
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 380
    Top = 21
    object LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource
      Category = 'Liaisons rapides'
      DataSource = Contacts
      GridControl = ControlList1
      Columns = <>
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = Contacts
      FieldName = 'ContactPhoto'
      Control = cPhoto
      Track = False
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Liaisons rapides'
      DataSource = Contacts
      FieldName = 'ContactNom'
      Component = Cnom
      ComponentProperty = 'Caption'
    end
    object LinkPropertyToFieldCaption2: TLinkPropertyToField
      Category = 'Liaisons rapides'
      DataSource = Contacts
      FieldName = 'ContactDate'
      Component = Cdate
      ComponentProperty = 'Caption'
    end
  end
end
