program PrjFishcard;

uses
  Vcl.Forms,
  UFishCard in 'UFishCard.pas' {FrmFishCard};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmFishCard, FrmFishCard);
  Application.Run;
end.
