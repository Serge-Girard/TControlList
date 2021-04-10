program PrjInventaire;

uses
  Vcl.Forms,
  UInventaire in 'UInventaire.pas' {FormInventaire},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Calypso');
  Application.CreateForm(TFormInventaire, FormInventaire);
  Application.Run;
end.
