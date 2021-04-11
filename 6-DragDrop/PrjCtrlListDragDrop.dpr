program PrjCtrlListDragDrop;

uses
  Vcl.Forms,
  UCtrlListDragDrop in 'UCtrlListDragDrop.pas' {FormDragdrop},
  ControlListHelper in 'ControlListHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDragdrop, FormDragdrop);
  Application.Run;
end.
