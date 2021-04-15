unit UProtoCouleurs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.GenData, Vcl.StdCtrls,
  Vcl.ControlList, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid, Vcl.ExtCtrls,
  Vcl.NumberBox, Data.Bind.Controls, Vcl.Buttons, Vcl.Bind.Navigator;

type
  TFormCouleurs = class(TForm)
    Couleurs: TPrototypeBindSource;
    ControlList1: TControlList;
    LblItem: TLabel;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceCouleurs: TLinkGridToDataSource;
    LblCouleur: TLabel;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    Panel1: TPanel;
    Label3: TLabel;
    NomCouleur: TLabel;
    Couleur: TShape;
    NumberBox1: TNumberBox;
    BindNavigator1: TBindNavigator;
    Label1: TLabel;
    lblLie: TLabel;
    ShapeLie: TShape;
    Shape2: TShape;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkPropertyToFieldBrushColor: TLinkPropertyToField;
    LinkControlToPropertyItemIndex: TLinkControlToProperty;
    Image1: TImage;
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList1ItemClick(Sender: TObject);
    procedure ControlList1AfterDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormCouleurs: TFormCouleurs;

implementation

{$R *.dfm}

uses System.UITypes;

procedure TFormCouleurs.ControlList1AfterDrawItems(ACanvas: TCanvas;
  ARect: TRect);
begin
  // positionnement dans "fichier"
  Couleurs.ItemIndex := ControlList1.ItemIndex;
  // écriture des valeurs
  Couleur.Brush.Color := Couleurs.DataGenerator.FindField('Color1')
    .GetTValue.AsInteger;
  NomCouleur.Caption := Couleurs.DataGenerator.FindField('ColorsName1')
    .GetTValue.AsString;
end;

procedure TFormCouleurs.ControlList1BeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  FontColor: TColor;

  function IsDark(AColor: TColor): Boolean;
  // Paul Toth dans forum
  var
    Color: Integer;
  begin
    Color := ColorToRGB(AColor); // conversion clXXX en couleur RGB
    Result := 0.2125 * TColorRec(Color).R + 0.7174 * TColorRec(Color).G + 0.0721
      * TColorRec(Color).B <= 128;
  end;

begin
  ACanvas.Brush.Color := Couleurs.DataGenerator.FindField('Color1')
    .GetTValue.AsInteger;
  ACanvas.FillRect(ARect);

  if IsDark(ACanvas.Brush.Color) then
    FontColor := clWhite
  else
    FontColor := clBlack;
  LblCouleur.Font.Color := FontColor;
  LblItem.Font.Color := FontColor;
  LblItem.Caption := Format('Item n°%d', [AIndex]);
end;

procedure TFormCouleurs.ControlList1ItemClick(Sender: TObject);
begin
  NumberBox1.Value := ControlList1.ItemIndex;
end;

procedure TFormCouleurs.FormCreate(Sender: TObject);
begin
  NumberBox1.MaxValue := ControlList1.ItemCount - 1;
end;

end.
