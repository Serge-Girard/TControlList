program PrjApnee;

uses
  Vcl.Forms,
  Uapnee in 'Uapnee.pas' {mainform};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.
