unit UCtrlListP2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ControlList, Vcl.WinXCtrls;

type
  TFormSpots = class(TForm)
    ControlList1: TControlList;
    Label1: TLabel;
    Shape1: TShape;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Timer1: TTimer;
    chkmemo: TCheckBox;
    ChkItemNo: TCheckBox;
    ActiveTimer: TToggleSwitch;
    procedure FormCreate(Sender: TObject);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlList1BeforeDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure ControlList1AfterDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure chkmemoClick(Sender: TObject);
    procedure ChkItemNoClick(Sender: TObject);
    procedure ActiveTimerClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FormSpots: TFormSpots;

implementation

{$R *.dfm}

procedure TFormSpots.ActiveTimerClick(Sender: TObject);
begin
Timer1.Enabled:=ActiveTimer.State=tssOn;
end;

procedure TFormSpots.Button1Click(Sender: TObject);
begin
Memo1.Lines.Clear;
end;

procedure TFormSpots.ChkItemNoClick(Sender: TObject);
begin
ControlList1.Refresh;
end;

procedure TFormSpots.chkmemoClick(Sender: TObject);
begin
Memo1.Visible:=chkmemo.Checked;
end;

procedure TFormSpots.ControlList1AfterDrawItems(ACanvas: TCanvas; ARect: TRect);
begin
if chkmemo.Checked then Memo1.Lines.Add('AfterDrawItems');
if ActiveTimer.State=tssOn then Timer1.Enabled:=True;
end;

procedure TFormSpots.ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
if chkmemo.Checked then Memo1.Lines.Add('BeforeDrawItem index '+AIndex.ToString);
if ChkItemNo.Checked then Label1.Caption:='Elément '+AIndex.ToString
                     else Label1.Caption:=EmptyStr;
Shape1.Brush.Color:=Random($FFFFFF);
end;

procedure TFormSpots.ControlList1BeforeDrawItems(ACanvas: TCanvas; ARect: TRect);
begin
if chkmemo.Checked then Memo1.Lines.Add('BeforeDrawItems');
Timer1.Enabled:=False;
end;

procedure TFormSpots.FormCreate(Sender: TObject);
begin
ControlList1.Enabled:=False;
COntrolList1.ItemCount:=20;
memo1.Lines.Clear;
ControlList1.Enabled:=True;
end;

procedure TFormSpots.Timer1Timer(Sender: TObject);
begin
ControlList1.Refresh;
end;

end.
