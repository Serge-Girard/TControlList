unit USpot1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ControlList;

type
  TForm1 = class(TForm)
    ControlList1: TControlList;
    Image1: TImage;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure ComboBox1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ComboBox1Change(Sender: TObject);
// Changement de masque
begin
case Combobox1.ItemIndex of
  0 : begin
        ControlList1.ColumnLayout:=cltSingle;
        ControlList1.ItemWidth:=0;
  end;
  1 : begin
      ControlList1.ColumnLayout:=cltMultiTopToBottom;
      ControlList1.ItemWidth:=150;
  end;
  2 : begin
      ControlList1.ColumnLayout:=cltMultiLeftToRight;
      ControlList1.ItemWidth:=150;
  end;
end;
end;

end.
