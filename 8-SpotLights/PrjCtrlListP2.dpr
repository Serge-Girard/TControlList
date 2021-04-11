program PrjCtrlListP2;

uses
  Vcl.Forms,
  UCtrlListP2 in '..\..\UCtrlListP2.pas' {FormSpots},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Golden Graphite');
  Application.CreateForm(TFormSpots, FormSpots);
  Application.Run;
end.
