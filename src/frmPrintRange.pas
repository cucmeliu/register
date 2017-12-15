unit frmPrintRange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmNormalMode, StdCtrls, Buttons, ExtCtrls, Spin, DB, ADODB;

type
  TPrintRangeForm = class(TNormalModeForm)
    Label1: TLabel;
    Label2: TLabel;
    seFrom: TSpinEdit;
    seTo: TSpinEdit;
    adods: TADODataSet;
    adodsyear: TSmallintField;
    adodsid: TSmallintField;
    adodsname: TWideStringField;
    adodsgender: TWideStringField;
    adodsnationality: TWideStringField;
    adodsbirthday: TDateTimeField;
    adodsbirthplace: TWideStringField;
    adodsnative: TWideStringField;
    adodsregdate: TDateTimeField;
    adodsjob: TWideStringField;
    adodsservice: TWideStringField;
    adodsaddress: TWideStringField;
    adodscomedate: TDateTimeField;
    adodscomereason: TWideStringField;
    adodsschoolyear: TWordField;
    ds: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bbtActionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fromID, toID: integer;
    isOK: boolean;
  end;

var
  PrintRangeForm: TPrintRangeForm;

implementation

uses frmDM, unitPubMethod;

{$R *.dfm}

procedure TPrintRangeForm.bbtActionClick(Sender: TObject);
begin
  inherited;
  fromID := seFrom.Value;
  toID := seTo.Value;
  isOK := true;
  close;
end;

procedure TPrintRangeForm.FormCreate(Sender: TObject);
begin
  inherited;
  isOK := false;
end;

end.
