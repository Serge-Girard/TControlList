unit UCtrlListDragDrop;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.ImageList,
  System.Math, // System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList,
  Vcl.ControlList, Vcl.VirtualImage, Vcl.StdCtrls, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.Generics.Collections, Vcl.ComCtrls,
  Vcl.TabNotBk, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Vcl.Buttons, Data.DB,
  FireDAC.Comp.Client, ControlListHelper, Vcl.ExtCtrls;

type
  TFormDragdrop = class(TForm)
    ImageCollection1: TImageCollection;
    ControlList2: TControlList;
    VirtualImage3: TVirtualImage;
    btnReset: TButton;
    FDConnection1: TFDConnection;
    btnSingle: TSpeedButton;
    btnToptoBottom: TSpeedButton;
    btnLeftToRight: TSpeedButton;
    btnInfo: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ImageList1: TImageList;
    ControlList_W: TControlList;
    Label5: TLabel;
    VirtualImage1: TVirtualImage;
    lblTitre: TLabel;
    ControlListButton1: TControlListButton;
    spdBtnTitle: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ControlList_WBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList_WDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ControlList_WDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ControlList2BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ControlList_WAfterDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList_WBeforeDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure ControlList2StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnLeftToRightClick(Sender: TObject);
    procedure btnSingleClick(Sender: TObject);
    procedure btnToptoBottomClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure ControlList_WAfterDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure FormResize(Sender: TObject);
    procedure ControlList_WGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ControlListButton1Click(Sender: TObject);
    procedure spdBtnTitleClick(Sender: TObject);
  private
    { Déclarations privées }
    itemidx: Integer; // index image à dropper
    ItemImages: TDictionary<Integer, Integer>;
    ItemsVisibles: TDictionary<Integer, TRect>;
  public
    { Déclarations publiques }
  end;

var
  FormDragdrop: TFormDragdrop;

const
  nbItems = 21;

implementation

{$R *.dfm}

procedure TFormDragdrop.ControlList_WAfterDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
var sRect : TRect;
begin
  sRect:=ControlList_W._GetItemRect(AIndex);
  ItemsVisibles.AddOrSetValue(AIndex,sRect);
end;

procedure TFormDragdrop.ControlList_WAfterDrawItems(ACanvas: TCanvas; ARect: TRect);
//var
//  I: Integer;
//  R: TRect;
begin
//// Debug, information sur les rectangles mémorisés
//  Memo1.Lines.Clear;
//  memo1.Lines.Add(Format('GetScrollPos %d,%d',
//                         [GetScrollPos(ControlList_W.Handle,SB_VERT),
//                         GetScrollPos(ControlList_W.Handle,SB_HORZ)]));
//  for I := 0 to ControlList_W.ItemCount - 1 do
//  begin
//    if ItemsVisibles.ContainsKey(I) then
//    begin
//      R := ItemsVisibles.Items[I];
//      Memo1.Lines.Add(Format('Item %d Rect %d,%d %d,%d', [I, R.Left, R.Top,
//        R.Width, R.Height]));
//    end;
//  end;
end;

procedure TFormDragdrop.ControlList_WBeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
var
  imagenumber: Integer;
begin
  lblTitre.Caption := 'Item ' + AIndex.ToString;
  if ItemImages.TryGetValue(AIndex, imagenumber) then
    VirtualImage1.ImageIndex := imagenumber
  else
    VirtualImage1.ImageIndex := -1;
end;

procedure TFormDragdrop.ControlList_WBeforeDrawItems(ACanvas: TCanvas; ARect: TRect);
begin
  ItemsVisibles.Clear;
end;

procedure TFormDragdrop.ControlList_WDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  rIndex: Integer;
begin
  rIndex:=ControlList_W._ItemAtPos(X,Y,ItemsVisibles);
  if rIndex > -1 then
    ItemImages.AddOrSetValue(rIndex, ControlList2.ItemIndex);
end;

procedure TFormDragdrop.ControlList_WDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TControlList;
end;

procedure TFormDragdrop.ControlList_WGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
Handled:=true;
case Eventinfo.GestureID of
  sgiDown : ControlList_W._PageDown;
  sgiUp   : ControlList_W._PageUp;
  else Handled:=False;
end;
end;

procedure TFormDragdrop.btnResetClick(Sender: TObject);
begin
  for var I := 0 to nbItems - 1 do
    ItemImages.AddOrSetValue(I, -1);
  ControlList_W.Refresh;
end;

procedure TFormDragdrop.btnSingleClick(Sender: TObject);
begin
  ControlList_W.ColumnLayout := cltsingle;
  ControlList_W.ItemWidth := 0;
  ControlList_W.Refresh;
end;

procedure TFormDragdrop.btnToptoBottomClick(Sender: TObject);
begin
  ControlList_W.ItemWidth := ControlList_W.ClientWidth div 2;
  ControlList_W.ColumnLayout := cltMultiTopToBottom;
  ControlList_W.Refresh;
end;

procedure TFormDragdrop.btnLeftToRightClick(Sender: TObject);
begin
//  nbLignes := (ControlList_W.Height - 28) div ControlList_W.ItemHeight;
//  nbcolonnes := ControlList_W.ItemCount div nbLignes;
//  if nbcolonnes * nbLignes < ControlList_W.ItemCount then
//    inc(nbcolonnes);
  ControlList_W.ColumnLayout := cltMultiLeftToRight;
  ControlList_W.ItemWidth := 140;
  ControlList_W.Refresh;
end;

procedure TFormDragdrop.btnInfoClick(Sender: TObject);
begin
// showmessage(Format('Helper : colonnes %d, lignes %d',
//            [ControlList_W._Columns, ControlList_W._Rows]));
//  showmessage(Format('Helper : colonnes %d, lignes %d  calculé %d,%d',
//    [ControlList_W._Columns, ControlList_W._Rows, nbcolonnes,
//    nbLignes]));
end;

procedure TFormDragdrop.ControlList2BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
  VirtualImage3.ImageIndex := AIndex;
end;

procedure TFormDragdrop.ControlList2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  itemidx := ControlList2.ItemIndex;
  if (Button = mbLeft) AND (ssShift in Shift) then
    ControlList2.BeginDrag(true);
end;

procedure TFormDragdrop.ControlList2StartDrag(Sender: TObject;
  var DragObject: TDragObject);
//var ABitmap : TBitmap;
begin
//aBitMap:=ImageCollection1.GetBitmap(itemidx,64,64);
//Image1.Picture.Bitmap:=aBitmap;
// Todo : Gosht Image
end;

procedure TFormDragdrop.ControlListButton1Click(Sender: TObject);
begin
showmessage(lbltitre.caption);
end;

procedure TFormDragdrop.FormCreate(Sender: TObject);
begin
  ItemImages := TDictionary<Integer, Integer>.Create;
  ItemsVisibles := TDictionary<Integer, TRect>.Create;
  ControlList_W.ItemCount := nbItems;
//  nbcolonnes := 1;
//  nbLignes := nbItems;
  for var I := 0 to nbItems - 1 do
    ItemImages.Add(I, -1);
  ControlList2.ItemCount := ImageCollection1.Images.Count;
end;

procedure TFormDragdrop.FormResize(Sender: TObject);
begin
ItemsVisibles.Clear;
ControlList_W.Refresh;
end;

procedure TFormDragdrop.spdBtnTitleClick(Sender: TObject);
begin
Showmessage(lbltitre.caption);
end;

procedure TFormDragdrop.SpeedButton1Click(Sender: TObject);
begin
ControlList_W._PageUp;
end;

procedure TFormDragdrop.SpeedButton2Click(Sender: TObject);
begin
ControlList_W._Home;
end;

procedure TFormDragdrop.SpeedButton3Click(Sender: TObject);
begin
ControlList_W._PageLeft;
end;

procedure TFormDragdrop.SpeedButton4Click(Sender: TObject);
begin
ControlList_W._PageRight;
end;

procedure TFormDragdrop.SpeedButton5Click(Sender: TObject);
begin
ControlList_W._PageDown;
end;

procedure TFormDragdrop.SpeedButton6Click(Sender: TObject);
begin
ControlList_W._End;
end;

end.
