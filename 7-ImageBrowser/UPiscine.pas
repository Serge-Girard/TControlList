unit UPiscine;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.IOUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ControlList, Vcl.Grids,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Imaging.GIFImg, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Vcl.Samples.Bind.Editors, Data.Bind.Components, Vcl.Samples.Spin,
  Vcl.NumberBox;

type
  TForm1 = class(TForm)
    ControlList1: TControlList;
    Label1: TLabel;
    Panel1: TPanel;
    imgBrowser: TImage;
    LblBrowser: TLabel;
    SpeedButton1: TSpeedButton;
    edtDir: TEdit;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToPropertyItemWidth: TLinkControlToProperty;
    LinkControlToPropertyItemHeight: TLinkControlToProperty;
    Hauteur: TNumberBox;
    Largeur: TNumberBox;
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { D�clarations priv�es }
     FileList: TArray<String>;
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Vcl.FileCtrl;

function aFilter(const Path: string; const SearchRec: TSearchRec): Boolean;
// TFilterPredicate non utilis�e
// const extensions = '.png,.jpg,.jpeg,.bmp,.ico,.gif'; // extensions voulues
begin
//  result := extensions.Contains(ExtractFileExt(SearchRec.Name).ToLower);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Memo1.Visible := CheckBox1.Checked;
end;

procedure TForm1.ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
  if Length(FileList) = 0 then
    exit; // par pr�caution
  LblBrowser.Caption := TPath.GetFileNameWithoutExtension(FileList[AIndex]);

  // un peu plus q'un simple Stretch pour l'image ?
  // obtenir les informations fichier
  var
    vImage: TImage := TImage.Create(self);
  try
    vImage.AutoSize := True;
    // todo : am�liorer
    vImage.Picture.LoadFromFile(FileList[AIndex]);
    imgBrowser.Stretch := (vImage.Height > imgBrowser.Height) OR
      (vImage.Width > imgBrowser.Width);
    imgBrowser.AutoSize := not imgBrowser.Stretch;
    imgBrowser.Center := not imgBrowser.Stretch;
    imgBrowser.Picture.LoadFromFile(FileList[AIndex]);
  finally
    vImage.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edtDir.Text := '';
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  dir: String;
begin
  if SelectDirectory('Choisissez le r�pertoire', ExtractFilePath(edtdir.text), dir,
    [sdshowEdit, sdShowShares, sdShowFiles], self) then
  begin
    edtDir.Text := dir;
    ControlList1.Enabled := False; // d�sactiver le TControlList
    // r�cup�rer la liste des fichiers images
    // utilisation d'un TFilterPredicate (aFilter)
    // FileList := TDirectory.GetFiles(dir, '*.png');
    FileList := TDirectory.GetFiles(dir, '*.*',
      function(const Path: string; const SearchRec: TSearchRec): Boolean
      const
        extensions = '.png,.jpg,.jpeg,.bmp,.ico,.gif'; // extensions voulues
      begin
        result := extensions.Contains(ExtractFileExt(SearchRec.Name).ToLower);
      end);
    if Memo1.Visible then
    begin
      Memo1.Lines.Clear;
      for var s: String in FileList do
        Memo1.Lines.Add(ExtractFileName(s));
    end;
    // indiquer le nombre d'�l�ments que contiendra la liste
    ControlList1.ItemCount := Length(FileList);
    // activer la liste (ce qui lancera le onBeforeDrawItem)
    ControlList1.Enabled := True;
  end;

end;

end.
