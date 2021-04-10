unit Uapnee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient, Vcl.ControlList;

type
  Tmainform = class(TForm)
    ControlList1: TControlList;
    Image1: TImage;
    lblCommon: TLabel;
    lblNotes: TLabel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1SpeciesNo: TFloatField;
    ClientDataSet1Category: TStringField;
    ClientDataSet1Common_Name: TStringField;
    ClientDataSet1SpeciesName: TStringField;
    ClientDataSet1Lengthcm: TFloatField;
    ClientDataSet1Length_In: TFloatField;
    ClientDataSet1Notes: TMemoField;
    ClientDataSet1Graphic: TGraphicField;
    procedure FormCreate(Sender: TObject);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  mainform: Tmainform;

implementation

{$R *.dfm}

procedure Tmainform.ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
Clientdataset1.RecNo:=AIndex+1;
lblCommon.Caption:=ClientDataSet1Common_Name.AsString;
lblNotes.Caption:=ClientDataSet1Notes.AsString;
var mStream :TmemoryStream := TmemoryStream.Create;
TBlobField(ClientDataSet1Graphic).SaveToStream(mstream);
// du au type de stockage dans le fichier, obligation d'une petite manipulation
mStream.Position:=8;
Image1.Picture.LoadFromStream(mStream);
end;

procedure Tmainform.FormCreate(Sender: TObject);
begin
ClientDataset1.Open;
ControlList1.ItemCount:=ClientDataset1.RecordCount;
end;

end.
