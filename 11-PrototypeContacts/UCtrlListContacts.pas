unit UCtrlListContacts;

interface

uses System.SysUtils
  // nécessaire pour obtenir la date système, le type TFileName
    , System.Generics.Collections
  // nécessaire pour la déclaration de liste d'objets
    , System.Generics.Defaults, System.Classes, System.types,
  System.NetEncoding, System.DateUtils // nécessaire pour EncodeDate
    , VCL.graphics, VCL.Imaging.pngimage, System.UITypes;

type
  TContact = Class
  strict private
    FNom: String;
    FDate: String;
    FPhoto: TPicture;
  private
    function EnCSV: String;
    procedure CSVversObjet(Data: String);
    procedure SetNom(const Value: String);
    procedure SetDate(const Value: String);
    procedure SetPhoto(const Value: TPicture);
  public
    constructor Create(); overload;
    constructor Create(Nom: String; UneDate: String; Photo: TPicture); overload;
    property ContactNom: String read FNom write SetNom;
    property ContactDate: String read FDate write SetDate;
    property ContactPhoto: TPicture read FPhoto write SetPhoto;
  end;

procedure P_DonneesInternes;

procedure SauvegarderTexte(const destination: TFileName);
procedure ChargerTexte(const source: TFileName);

var
  MesContacts: TObjectList<TContact>;

implementation

{ TEvenement }

constructor TContact.Create;
// création par défaut
begin
  FNom := '<A faire>';
  FDate := FormatDateTime('dd/mm/yyyy', date);
  FPhoto := nil;
end;

constructor TContact.Create(Nom: String; UneDate: String; Photo: TPicture);
// création objet
begin
  FNom := Nom;
  FDate := UneDate;
  FPhoto := Photo;
end;

procedure TContact.CSVversObjet(Data: String);
// transformation d'une ligne CSV en objet TEvenement
var
  SL: TStringList; // sert à parser la ligne
  procedure BitmapFromBase64(Base64: string; Photo: TPicture);
  var
    Input: TStringStream;
    Output: TBytesStream;
    Encoding: TBase64Encoding;
  begin
    Input := TStringStream.Create(Base64, TEncoding.ASCII);
    try
      Output := TBytesStream.Create;
      try
        Encoding := TBase64Encoding.Create(0);
        try
          Encoding.Decode(Input, Output);
          Output.Position := 0;
          Photo.LoadFromStream(Output);
        finally
          Encoding.Free;
        end;
      finally
        Output.Free;
      end;
    finally
      Input.Free;
    end;
  end;

begin
  SL := TStringList.Create;
  try
    SL.QuoteChar := '"'; // indique l'utilisation des " pour les chaînes
    SL.CommaText := Data;
    FNom := SL[0];
    FDate := SL[1];
    FPhoto := TPicture.Create;
    BitmapFromBase64(SL[2], FPhoto);
  finally
    SL.Free;
  end;
end;

function TContact.EnCSV: String;
  function Base64FromBitmap(Bitmap: TPicture): string;
  var
    Input: TBytesStream;
    Output: TStringStream;
    Encoding: TBase64Encoding;
  begin
    Input := TBytesStream.Create;
    try
      Bitmap.SaveToStream(Input);
      Input.Position := 0;
      Output := TStringStream.Create('', TEncoding.ASCII);
      try
        Encoding := TBase64Encoding.Create(0);
        try
          Encoding.Encode(Input, Output);
          Result := Output.DataString;
        finally
          Encoding.Free;
        end;
      finally
        Output.Free;
      end;
    finally
      Input.Free;
    end;
  end;

begin
  Result := Format('"%s",%s,"%s"', [FNom, FDate, Base64FromBitmap(FPhoto)]);
end;

procedure TContact.SetDate(const Value: String);
begin
  FDate := Value;
end;

procedure TContact.SetNom(const Value: String);
begin
  FNom := Value;
end;

procedure TContact.SetPhoto(const Value: TPicture);
begin
  FPhoto := Value;
end;

procedure P_DonneesInternes;
// Chargement de valeurs internes
begin
  if not FileExists('contacts.txt') then
  begin
    MesContacts.Add(TContact.Create('Enfant 1', '01/01/2021', TPicture.Create));
    MesContacts[0].ContactPhoto.LoadFromFile('..\..\Child_1.png');
    MesContacts.Add(TContact.Create('Enfant 2', '02/01/2021', TPicture.Create));
    MesContacts[1].ContactPhoto.loadFromFile('..\..\Child_2.png');
    MesContacts.Add(TContact.Create('Enfant 3', '03/01/2021', TPicture.Create));
    MesContacts[2].ContactPhoto.loadFromFile('..\..\Child_3.png');
    MesContacts.Add(TContact.Create('Enfant 4', '04/01/2021', TPicture.Create));
    MesContacts[3].ContactPhoto.loadFromFile('..\..\Child_4.png');
    MesContacts.Add(TContact.Create('Enfant 5', '05/01/2021', TPicture.Create));
    MesContacts[4].ContactPhoto.loadFromFile('..\..\Child_5.png');
    MesContacts.Add(TContact.Create('Japonaise', '06/01/2021',
      TPicture.Create));
    MesContacts[5].ContactPhoto.loadFromFile('..\..\Japan_2.png');
    MesContacts.Add(TContact.Create('Enfant 7', '07/01/2021', TPicture.Create));
    MesContacts[6].ContactPhoto.loadFromFile('..\..\Child_7.png');
    SauvegarderTexte('contacts.txt');  // jeu d'essai
  end
  else
  begin
    ChargerTexte('contacts.txt');
  end;
end;

procedure SauvegarderTexte(const destination: TFileName);
// Sauvegarde des données au format Texte
var
  F: TextFile;
  unContact: TContact;
begin
  AssignFile(F, destination);
  ReWrite(F);
  for unContact in MesContacts do
    WriteLn(F, unContact.EnCSV);
  CloseFile(F);
end;

procedure ChargerTexte(const source: TFileName);
// Chargement du fichier au format texte
var
  F: TextFile;
  Data: String;
  unContact: TContact;
begin
  MesContacts.Clear;
  AssignFile(F, source);
  Reset(F);
  while not EOF(F) do
  begin
    Readln(F, Data);
    unContact := TContact.Create;
    unContact.CSVversObjet(Data);
    MesContacts.Add(unContact);
  end;
  CloseFile(F);
end;

initialization

MesContacts := TObjectList<TContact>.Create;

finalization

// MesContacts.Free;
// inutile car MesEvenements est libéré à la destruction du TProtypeBindSource
// si OwnsObject est égal à True au moment de la création de l'adaptateur
end.
