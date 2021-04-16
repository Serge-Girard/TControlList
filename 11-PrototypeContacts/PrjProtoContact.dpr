program PrjProtoContact;





uses
  Vcl.Forms,
  UProtoContact in 'UProtoContact.pas' {Form14},
  UCtrlListContacts in 'UCtrlListContacts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm14, Form14);
  Application.Run;
end.
