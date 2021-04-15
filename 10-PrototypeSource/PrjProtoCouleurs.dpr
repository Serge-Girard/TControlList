program PrjProtoCouleurs;

uses
  Vcl.Forms,
  UProtoCouleurs in '..\..\UProtoCouleurs.pas' {FormCouleurs};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCouleurs, FormCouleurs);
  Application.Run;
end.
