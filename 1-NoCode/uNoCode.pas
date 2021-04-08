unit uNoCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.ControlList;

type
  Tmainform = class(TForm)
    ControlList1: TControlList;
    ClientDataSet1: TClientDataSet;
    Image1: TImage;
    lblCommon: TLabel;
    lblspecies: TLabel;
    lblNotes: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkPropertyToFieldCaption2: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldCaption3: TLinkPropertyToField;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  mainform: Tmainform;

implementation

{$R *.dfm}

end.
