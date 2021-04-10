unit UInventaire;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Vcl.ControlList, Data.Bind.Components, Vcl.ComCtrls, Data.Bind.Grid,
  Data.Bind.DBScope, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,
  Vcl.DBCtrls, Vcl.Mask, System.Generics.Collections, Data.Bind.Controls,
  Vcl.Buttons, Vcl.Bind.Navigator;

type
  TFormInventaire = class(TForm)
    ControlList1: TControlList;
    ClientDataSet1: TClientDataSet;
    Image1: TImage;
    lblName: TLabel;
    lblNotes: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    ListView1: TListView;
    LinkListControlToField1: TLinkListControlToField;
    ControlListButton1: TControlListButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientDataSet1SpeciesNo: TFloatField;
    ClientDataSet1Common_Name: TStringField;
    ClientDataSet1Notes: TMemoField;
    ClientDataSet1Graphic: TGraphicField;
    Splitter1: TSplitter;
    Panel1: TPanel;
    BindNavigator1: TBindNavigator;
    lblcount: TLabel;
    edtName: TEdit;
    edtNotes: TMemo;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    procedure ControlList1ItemClick(Sender: TObject);
    procedure ControlList1EnableControl(const AIndex: Integer;
      AControl: TControl; var AEnabled: Boolean);
    procedure ControlListButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList1ItemDblClick(Sender: TObject);
    procedure ControlList1ShowControl(const AIndex: Integer; AControl: TControl;
      var AVisible: Boolean);
  private
    { Déclarations privées }
    Compte : TDictionary<integer,Cardinal>;
  public
    { Déclarations publiques }
  end;

var
  FormInventaire: TFormInventaire;

implementation

{$R *.dfm}

procedure TFormInventaire.ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
var nombre : Cardinal;
begin
 if Compte.TryGetValue(AIndex,nombre)
   then lblcount.Caption:=Nombre.ToString
   else lblCount.Caption:=Emptystr;
end;

procedure TFormInventaire.ControlList1EnableControl(const AIndex: Integer;
  AControl: TControl; var AEnabled: Boolean);
begin
if AControl is TControlListButton
   then AEnabled:=Compte.ContainsKey(AIndex);
end;

procedure TFormInventaire.ControlList1ItemClick(Sender: TObject);
//var nombre:cardinal;
begin
//if ListView1.Items.Count=0 then exit;   // étrange bug identique positionnement navigator
//try ListView1.Items[Controllist1.ItemIndex].Checked:=True; except end;
//if Compte.TryGetValue(Controllist1.ItemIndex,Nombre)
//   then nombre:=nombre+1 else nombre:=1;
//Compte.AddOrSetValue(Controllist1.ItemIndex,nombre);
//ControlList1.Refresh;
end;

procedure TFormInventaire.ControlList1ItemDblClick(Sender: TObject);
var nombre:cardinal;
begin
ListView1.Items[Controllist1.ItemIndex].Checked:=True;
if Compte.TryGetValue(Controllist1.ItemIndex,Nombre)
   then nombre:=nombre+1 else nombre:=1;
Compte.AddOrSetValue(Controllist1.ItemIndex,nombre);
ControlList1.Refresh;
end;

procedure TFormInventaire.ControlList1ShowControl(const AIndex: Integer;
  AControl: TControl; var AVisible: Boolean);
begin
if AControl is TControlListButton
   then  AVisible:=Compte.ContainsKey(AIndex);
end;

procedure TFormInventaire.ControlListButton1Click(Sender: TObject);
var nombre : cardinal;
begin
if Compte.TryGetValue(Controllist1.ItemIndex,nombre) then
  Compte.AddOrSetValue(Controllist1.ItemIndex,nombre-1);
if nombre-1<=0 then
  begin
   Compte.Remove(Controllist1.ItemIndex);
   ListView1.Items[Controllist1.ItemIndex].Checked:=False;
  end;
end;

procedure TFormInventaire.FormCreate(Sender: TObject);
begin
Compte:=TDictionary<integer,Cardinal>.Create;
ClientDataset1.Active:=true;
end;

end.
