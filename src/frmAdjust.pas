unit frmAdjust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmNormalMode, StdCtrls, Buttons, ExtCtrls, Spin, ComCtrls;

type
  TAdjustForm = class(TNormalModeForm)
    eAddress: TEdit;
    Label15: TLabel;
    Label11: TLabel;
    seYear: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    eJob: TEdit;
    Label3: TLabel;
    seID: TSpinEdit;
    Label4: TLabel;
    dtpRegDate: TDateTimePicker;
    Label7: TLabel;
    dtpcomedate: TDateTimePicker;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    eComeReason: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtActionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdjustForm: TAdjustForm;

implementation

uses unitPubMethod;

{$R *.dfm}

procedure TAdjustForm.bbtActionClick(Sender: TObject);
begin
  inherited;
    writeintini('SETTING', 'ID', seID.Value);
    writeintini('SETTING', 'YEAR', seYear.Value);

    WriteStrIni('SETTING', 'JOB', eJob.Text);
    WriteStrIni('SETTING', 'ADDRESS', eAddress.Text);
    
    WriteDateIni('SETTING', 'REGDATE', now);
end;

procedure TAdjustForm.FormCreate(Sender: TObject);
begin
  inherited;
    seid.Value := readintini('SETTING', 'ID', 1);
    seyear.Value := readintini('SETTING','YEAR', 2008);

    eJob.Text := readStrIni('SETTING', 'JOB', 'Ñ§Éú');
    eAddress.Text := readStrIni('SETTING', 'ADDRESS', 'Á«Í¤Â·60ºÅ');

    dtpRegDate.Date := readDateIni('SETTING', 'REGDATE', now); 
end;

end.
