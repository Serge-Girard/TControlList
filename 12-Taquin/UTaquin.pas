unit UTaquin;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ControlList,
  Vcl.Buttons,
  Vcl.ImgList, Vcl.StdCtrls, ControlListTaquinHelper, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.NumberBox, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImage, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components;

type
  TFormtaquin = class(TForm)
    ControlList1: TControlList;
    ImageList1: TImageList;
    btnMelange: TButton;
    Panel1: TPanel;
    ControlListButton1: TControlListButton;
    RadioGroup1: TRadioGroup;
    NumberBox1: TNumberBox;
    Modele: TVirtualImage;
    ImagesPleines: TImageCollection;
    BindingsList1: TBindingsList;
    LinkControlToPropertyImageIndex: TLinkControlToProperty;
    procedure FormCreate(Sender: TObject);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure btnMelangeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ControlList1AfterDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList1ItemClick(Sender: TObject);
    procedure ControlList1EnableControl(const AIndex: Integer;
      AControl: TControl; var AEnabled: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure NumberBox1Change(Sender: TObject);
  private
    { Déclarations privées }
    nbrMorceaux : word;
    morceaux: TDictionary<Integer, Integer>;
    procedure melange;
    function canmove(morceau : word) : boolean;
    procedure movemorceau(morceau: word);
    procedure SplitImage(IIndex : word);
  public
    { Déclarations publiques }
  end;

var
  Formtaquin: TFormtaquin;

implementation

{$R *.dfm}


procedure TFormtaquin.btnMelangeClick(Sender: TObject);
begin
  melange;
  ControlList1.Refresh;
end;

function TFormtaquin.canmove(morceau: word): boolean;
var l,c,lc : word;
    v : integer;
// vérification mouvement
begin
result:=false;
lc:=Trunc(sqrt(nbrMorceaux));
c:=morceau mod lc;
l:=(morceau div lc);
if ((l-1)>-1) AND (morceaux.Items[(l-1)*lc+c]=-1) then exit(true);
if (((l+1)<lc)) AND (morceaux.Items[(l+1)*lc+c]=-1) then exit(true);
if (((c-1)>-1)) AND (morceaux.Items[(l*lc)+(c-1)]=-1) then exit(true);
if (((c+1)<lc)) AND (morceaux.Items[(l*lc)+(c+1)]=-1) then exit(true);
end;

procedure TFormtaquin.ControlList1AfterDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
 VisibleItems.AddOrSetValue(AIndex, ControlList1._GetItemRect(AIndex));
end;

procedure TFormtaquin.ControlList1BeforeDrawItem(AIndex: Integer;
  ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
begin
  ControlListButton1.ImageIndex := morceaux.Items[AIndex];
end;

procedure TFormtaquin.ControlList1EnableControl(const AIndex: Integer;
  AControl: TControl; var AEnabled: Boolean);
begin
 AEnabled:=morceaux.Items[AIndex]>-1;
end;

procedure TFormtaquin.ControlList1ItemClick(Sender: TObject);
begin
if Morceaux.Items[ControlList1.ItemIndex]=-1 then exit;   // pas une pièce
if CanMove(ControlList1.ItemIndex) then
 begin
  MoveMorceau(ControlList1.ItemIndex);
 end;
end;

procedure TFormtaquin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(morceaux);
end;

procedure TFormtaquin.FormCreate(Sender: TObject);
begin
  nbrMorceaux:=16; // par défaut 4*4
  NumberBox1.MaxValue:=ImagesPleines.Count-1;
  NumberBox1.ValueInt:=0;
  morceaux := TDictionary<Integer, Integer>.create;
  melange;
  ControlList1.ItemCount:=NbrMorceaux;
  ControlList1.ItemWidth := ControlList1.clientWidth div Trunc(Sqrt(nbrMorceaux));
  ControlList1.ItemHeight := ControlList1.clientHeight div Trunc(Sqrt(nbrMorceaux));
end;

procedure TFormtaquin.melange;
// Nouveau mélange de pièce
var
  I, p: Integer;
  pieces: TList<Integer>;
begin
  pieces := TList<Integer>.create;
  try
    for I := -1 to NbrMorceaux-2 do
      pieces.Add(I);
    randomize;
    morceaux.Clear;
    for I := 0 to nbrMorceaux-1 do
    begin
      p := Random(pieces.Count);
      morceaux.Add(I, pieces[p]);
      pieces.Delete(p);
    end;
  finally
    pieces.Free;
  end;
end;

procedure TFormtaquin.movemorceau(morceau: word);
// Déplacement d'une pièce
var l,c : word;
    mt : word;
    pl : word;
begin
pl:=Trunc(Sqrt(nbrMorceaux));
c:=morceau mod pl;
l:=(morceau div pl);
if ((l-1)>-1) AND (morceaux.Items[(l-1)*pl+c]=-1) then mt:=(l-1)*pl+c;
if (((l+1)<pl)) AND (morceaux.Items[(l+1)*pl+c]=-1) then mt:=(l+1)*pl+c;
if (((c-1)>-1)) AND (morceaux.Items[(l*pl)+(c-1)]=-1) then mt:=(l*pl)+(c-1);
if (((c+1)<pl)) AND (morceaux.Items[(l*pl)+(c+1)]=-1) then mt:=(l*pl)+(c+1);
Morceaux.Items[mt]:=morceaux.Items[morceau];
morceaux.Items[morceau]:=-1;
end;

procedure TFormtaquin.NumberBox1Change(Sender: TObject);
begin
SplitImage(Numberbox1.ValueInt);
end;

procedure TFormtaquin.RadioGroup1Click(Sender: TObject);
begin
case RadioGroup1.ItemIndex of
 0 : nbrMorceaux:=3*3;
 1 : nbrMorceaux:=4*4;
 2 : nbrMorceaux:=5*5;
 3 : nbrMorceaux:=6*6;
end;
SplitImage(Numberbox1.ValueInt);
end;

procedure TFormtaquin.SplitImage(IIndex: word);
var cl : word;
    sBitmap,pBitmap : TBitmap;
    c: Integer;
    l: Integer;
begin
cl:=Trunc(Sqrt(nbrMorceaux));

// Modifier ControlList
ControlList1.ItemWidth:=(ControlList1.Width div cl)-ControlList1.ItemMargins.Left-ControlList1.ItemMargins.Right;
ControlList1.ItemHeight:=(ControlList1.Height div cl)-ControlList1.ItemMargins.Top-ControlList1.ItemMargins.Bottom;
ControlList1.Width:=ControlList1.Width+GetSystemMetrics(SM_CXVSCROLL);
ControlList1.ItemCount:=nbrMorceaux;

// effacer  le contenu de ImageList1
for c := Imagelist1.count-1 downto 0 do
   imagelist1.Delete(c);
imageList1.Height:=400 div cl; // 256 div cl;
imageList1.width:=400 div cl; // 256 div cl;

// découper l'image choisie
sbitmap:=TBitmap.Create;
try
  sBitmap:=imagespleines.GetBitmap(IINdex,400,400);
  pBitmap:=TBitmap.Create(imageList1.width,imageList1.height);
  try
   for l:= 0 to cl-1 do
    for c:=0 to cl-1 do
     begin
        pBitmap.Canvas.CopyRect(TRect.Create(0,0,imageList1.width,imageList1.height),
                                sBitmap.Canvas,
                                TRect.Create(imageList1.width*c,
                                             imagelist1.Height*l,
                                             imageList1.width*c+imageList1.width,
                                             imagelist1.Height*l+imageList1.height));
        imagelist1.Add(pbitmap,nil);
     end;
  finally
    pBitmap.Free;
  end;
finally
  sBitmap.Free;
end;
// supprimer un morceaux (toujours le coin en bas à droite
imagelist1.Delete(nbrMorceaux-1);
ControlList1.Width:=ControlList1.Width-GetSystemMetrics(SM_CXVSCROLL);
melange;
end;

end.
