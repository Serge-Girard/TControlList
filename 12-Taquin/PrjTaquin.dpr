program PrjTaquin;

uses
  Vcl.Forms,
  UTaquin in 'UTaquin.pas' {Formtaquin},
  ControlListTaquinHelper in 'ControlListTaquinHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormtaquin, Formtaquin);
  Application.Run;
end.
