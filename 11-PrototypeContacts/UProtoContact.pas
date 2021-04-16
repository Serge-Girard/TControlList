unit UProtoContact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.GenData, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Controls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Bind.Navigator, Vcl.ComCtrls, Vcl.StdCtrls, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.ObjectScope, Vcl.Imaging.pngimage, Vcl.ControlList,
  Vcl.Bind.GenData, UCtrlListContacts, Vcl.ExtDlgs;

type
  TForm14 = class(TForm)
    ControlList1: TControlList;
    cPhoto: TImage;
    Cnom: TLabel;
    Cdate: TLabel;
    Contacts: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    Photo: TImage;
    Nom: TEdit;
    Datec: TDateTimePicker;
    BindNavigator1: TBindNavigator;
    btnPost: TButton;
    btnSauver: TButton;
    procedure ControlList1AfterDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
    procedure ContactsCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure btnPostClick(Sender: TObject);
    procedure btnSauverClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

{$DEFINE DATA}
{.$UNDEF DATA}  // pour voir les données du protypebindsource

procedure TForm14.BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
begin
//if Button=TnavigateButton.nbPost then
// begin
//    MesContacts[ControlList1.ItemIndex].Contactnom:=nom.text;
//    MesContacts[ControlList1.ItemIndex].ContactDate:=FormatDateTime('dd/mm/yyyy',Datec.Date);
// end;
end;

procedure TForm14.btnPostClick(Sender: TObject);
begin
{$IFDEF DATA}
  MesContacts[ControlList1.ItemIndex].Contactnom:=nom.text;
  MesContacts[ControlList1.ItemIndex].ContactDate:=FormatDateTime('dd/mm/yyyy',Datec.Date);
  ControlList1.Refresh;
{$ENDIF}
end;

procedure TForm14.btnSauverClick(Sender: TObject);
begin
SauvegarderTexte('contacts.txt');
end;

procedure TForm14.ContactsCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
{$IFDEF DATA}
 P_DonneesInternes;
 ABindSourceAdapter:=TListBindSourceAdapter<TContact>.Create(self,MesContacts, True);
 ControlList1.ItemCount:=MesContacts.Count;
{$ENDIF}
end;

procedure TForm14.ControlList1AfterDrawItems(ACanvas: TCanvas; ARect: TRect);
var aStream : TMemoryStream;
    {$IFDEF DATA}avar : TPicture;{$ELSE} avar : TBitmap;{$ENDIF}
begin
if  Contacts.ItemIndex<>ControlList1.ItemIndex then Contacts.ItemIndex:=ControlList1.ItemIndex;
{$IFDEF DATA}
Nom.Text:=MesContacts[ControlList1.ItemIndex].ContactNom;
DateC.Date:=StrToDate(MesContacts[ControlList1.ItemIndex].ContactDate);
aStream:=TmemoryStream.Create;
try
    avar:=MesContacts[ControlList1.ItemIndex].ContactPhoto;
    if assigned( avar) then
     begin
      avar.savetostream(astream);
      aStream.Position:=0;
      Photo.Picture.LoadFromStream(aStream);
     end;
finally
  aStream.Free;
end;
{$ELSE}
// Utilisation du TProtypeBindSource
Nom.Text:=Contacts.DataGenerator.FindField('ContactNom').GetTValue.asString;
DateC.Date:=StrToDate(Contacts.DataGenerator.FindField('ContactDate').GetTValue.asString);
aStream:=TmemoryStream.Create;
try
   try
     avar:=Contacts.DataGenerator.FindField('ContactPhoto').GetTValue.AsType<TBitmap>;
    if assigned( avar) then
     begin
      avar.savetostream(astream);
      aStream.Position:=0;
      Photo.Picture.LoadFromStream(aStream);
     end;
    except
     on e:Exception do
      Showmessage(e.Message)
   end;
finally
  aStream.Free;
end;
{$ENDIF}
end;

end.
