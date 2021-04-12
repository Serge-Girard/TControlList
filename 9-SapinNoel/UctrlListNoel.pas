unit UctrlListNoel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.ControlList, Vcl.StdCtrls;

type
  TForm15 = class(TForm)
    ControlList1: TControlList;
    Shape1: TShape;
    ToggleSwitch1: TToggleSwitch;
    Timer1: TTimer;
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);  // effet girlande lumineuse
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
  procedure sommet;
  begin
    ACanvas.Pen.Color:=clGreen;
    ACanvas.Brush.Color:=clGreen;
    ACanvas.Polygon([TPoint.Create(ARect.Width div 2,Arect.Top),
                     TPoint.Create(0,ARect.Bottom),
                     ARect.BottomRight])
  end;
  procedure brancheGauche;
  begin
    ACanvas.Pen.Color:=clGreen;
    ACanvas.Brush.Color:=clGreen;
    ACanvas.Polygon([TPoint.Create(ARect.width,ARect.top),
                     TPoint.Create(0,ARect.Bottom),
                     ARect.BottomRight])
  end;
  procedure BrancheDroite;
  begin
    ACanvas.Pen.Color:=clGreen;
    ACanvas.Brush.Color:=clGreen;
    ACanvas.Polygon([ARect.TopLeft,
                     TPoint.Create(0,ARect.Bottom),
                     ARect.BottomRight])

  end;

begin
    // le canvas se dessine avant les controles
    case AIndex of
      2:
        sommet;
      6, 11, 15, 20:
        brancheGauche;
      8, 13, 19, 24:
        BrancheDroite;
      7, 12, 16, 17, 18, 21, 22, 23:
        begin
          ACanvas.Brush.Color := clGreen;
          ACanvas.FillRect(ARect);
        end;
    end;

  // Dessin des "boules"
  // todo : mieux positionner les "boules"
  case AIndex of
    0, 1, 3, 4, 5, //7,
    9, 10,11,13,14,
    15, 19:
      Shape1.Visible := False;
  else
    begin
      if AIndex>24 then Shape1.Shape:=stRoundSquare
                   else Shape1.Shape:=stCircle;
      Shape1.Visible := true;
      Shape1.Brush.Color := Random($FFFFFF); // couleur aléatoire
    end;
  end;
end;

procedure TForm15.FormResize(Sender: TObject);
begin
//  toujours avoir 5 colonnes 6 lignes
ControlList1.ItemWidth:=ControlList1.ClientWidth div 5;
ControlList1.ItemHeight:=ControlList1.ClientHeight div 6;
end;

procedure TForm15.Timer1Timer(Sender: TObject);
begin
ControlList1.Refresh;
end;

procedure TForm15.ToggleSwitch1Click(Sender: TObject);
begin
  ControlList1.Enabled := False;
  ControlList1.ItemCount := 0;
  if ToggleSwitch1.State = tssOn then
    ControlList1.ItemCount := 30;
  ControlList1.Enabled := False;
end;

end.
