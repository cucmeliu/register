unit frmRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Clipbrd, unitRegister, Registry;

type
  TRegisterForm = class(TForm)
    Label1: TLabel;
    EditMacCode: TEdit;
    btnCopy: TButton;
    Label2: TLabel;
    btnRegist: TButton;
    Label3: TLabel;
    btnClose: TButton;
    Label4: TLabel;
    pnlStatus: TPanel;
    memoLicense: TMemo;
    editSerialNo: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnRegistClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FMyRegister: TMyRegister;


  public
    { Public declarations }
  end;

var
  RegisterForm: TRegisterForm;

implementation

uses unitPubMethod, unitHardware, DESUnit, unitProductInfo;

{$R *.dfm}

procedure TRegisterForm.btnCopyClick(Sender: TObject);
begin
  // 
   Clipboard.AsText := EditMacCode.Text;
  InfoMsg('�Ѹ��Ƶ�������');
end;

procedure TRegisterForm.btnRegistClick(Sender: TObject);
begin
  if trim(editSerialNo.Text)='' then
  begin
    infoMsg('������ע���룡');
    exit;
  end;

  if FMyRegister.tryRegister(TProductInfo.RegistKey,
    EditMacCode.Text,
    TProductInfo.EncryKey ,
    trim(editSerialNo.Text)) then
    begin
        infoMsg('ע��ɹ����������������ע�ᣡ');
    end else
      WarnMsg('ע�������');

end;


procedure TRegisterForm.btnCloseClick(Sender: TObject);
begin
  close;       
end;

procedure TRegisterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMyRegister.Free;
end;

procedure TRegisterForm.FormCreate(Sender: TObject);
begin
  FMyRegister := TMyRegister.Create;

end;         

procedure TRegisterForm.FormShow(Sender: TObject);
var
  hi: THardwareInfo;
  reg: TRegistry;
  sn: string;
begin

  if FMyRegister.isRegisted(TProductInfo.RegistKey,
    TProductInfo.EncryKey) then
  begin
      pnlStatus.Font.Color := clGreen;
      pnlStatus.Caption := '��ע��,���ǺϷ��û�';
      btnRegist.Enabled := false;
  end else
  begin
      pnlStatus.Font.Color := clRed;
      pnlStatus.Caption := 'δע��,���ܽ��д�ӡ';
  end;

  hi := THardwareInfo.Create;
  EditMacCode.Text := DESEncrypt(trim(hi.GetIdeSerialNumber), 'CUCME');//TProductInfo.EncryKey);
  hi.Free;

  sn := '';
  reg := TRegistry.Create;
  reg.rootkey:=HKEY_LOCAL_MACHINE;
  if reg.OpenKey(TProductInfo.RegistKey, true)
    and reg.ValueExists('SN') then
      sn := reg.ReadString('SN');

  reg.Free;
  
  editSerialNo.Text := sn;

  memoLicense.Lines.LoadFromFile('.\licence.txt');
end;

end.
