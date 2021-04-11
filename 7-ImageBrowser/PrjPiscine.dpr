program PrjPiscine;

uses
  Vcl.Forms,
  UPiscine in 'UPiscine.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
