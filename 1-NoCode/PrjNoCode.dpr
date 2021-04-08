program PrjNoCode;

uses
  Vcl.Forms,
  uNoCode in '..\..\uNoCode.pas' {mainform};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.
