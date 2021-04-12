program PrjCtrlListNoel;

uses
  Vcl.Forms,
  UctrlListNoel in 'UctrlListNoel.pas' {Form15},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Golden Graphite');
  Application.CreateForm(TForm15, Form15);
  Application.Run;
end.
