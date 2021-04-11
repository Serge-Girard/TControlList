unit UFishCard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.Bind.Controls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.ControlList, System.ImageList,
  Vcl.ImgList, System.Generics.Collections;

type
   TFrmFishCard = class(TForm)
    ControlList1: TControlList;
    BindNavigator1: TBindNavigator;
    Graphique: TImage;
    lblNom: TLabel;
    Notes: TLabel;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    Lblnbvue: TLabel;
    sbVu: TControlListButton;
    sbErreur: TControlListButton;
    ImageList1: TImageList;
    procedure FormResize(Sender: TObject);
    procedure sbVuClick(Sender: TObject);
    procedure sbErreurClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList1EnableControl(const AIndex: Integer;
      AControl: TControl; var AEnabled: Boolean);
    procedure ControlList1ShowControl(const AIndex: Integer; AControl: TControl;
      var AVisible: Boolean);
  private
    { Déclarations privées }
     Compte : TDictionary<integer,integer>;
  public
    { Déclarations publiques }
  end;

var
  FrmFishCard: TFrmFishCard;

implementation

{$R *.dfm}


procedure TFrmFishCard.ControlList1BeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var nombre : integer;
begin
 if Compte.TryGetValue(AIndex,nombre)
   then begin
          Lblnbvue.Caption:='Vu '+Nombre.ToString+' fois';
          lblnbvue.Height:=43;
   end
   else Lblnbvue.Caption:='Pas vu';
end;

procedure TFrmFishCard.ControlList1EnableControl(const AIndex: Integer;
  AControl: TControl; var AEnabled: Boolean);
// désactiver un contrôle
var nombre : integer;
begin
 if AControl=sbErreur then AEnabled:=Compte.TryGetValue(AIndex,nombre);
end;

procedure TFrmFishCard.ControlList1ShowControl(const AIndex: Integer;
  AControl: TControl; var AVisible: Boolean);
// Cacher un contrôle
var nombre : integer;
begin
  if Sametext(AControl.Name,'lblnbvue') then AVisible:=Compte.TryGetValue(AIndex,nombre);
end;

procedure TFrmFishCard.FormCreate(Sender: TObject);
begin
Compte:=TDictionary<integer,Integer>.Create;
end;

procedure TFrmFishCard.FormResize(Sender: TObject);
begin
ControlList1.ItemWidth:=ControlList1.Width;
ControlList1.ItemHeight:=ControlList1.Height;
end;

procedure TFrmFishCard.sbVuClick(Sender: TObject);
var nombre : integer;
begin
if Compte.TryGetValue(Controllist1.ItemIndex,Nombre)
   then nombre:=nombre+1 else nombre:=1;
Compte.AddOrSetValue(Controllist1.ItemIndex,nombre);
ControlList1.Refresh;
end;

procedure TFrmFishCard.sbErreurClick(Sender: TObject);
var nombre : integer;
begin
if Compte.TryGetValue(Controllist1.ItemIndex,nombre) then
  Compte.AddOrSetValue(Controllist1.ItemIndex,nombre-1);
if nombre-1<=0 then Compte.Remove(Controllist1.ItemIndex);
ControlList1.Refresh;
end;

end.
