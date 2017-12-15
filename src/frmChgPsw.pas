unit frmChgPsw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmNormalMode, StdCtrls, Buttons, ExtCtrls, Registry;

type
  TChgPswForm = class(TNormalModeForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    eOUser: TEdit;
    eOPsw: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    eNUser: TEdit;
    eNewPsw: TEdit;
    Label5: TLabel;
    eNewPswConf: TEdit;
    procedure bbtActionClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function checkOld(user, psw: string): boolean;
    function checkNew(): boolean;
    function checkNULL(): boolean;
    procedure writeUP();
  public
    { Public declarations }
  end;

var
  ChgPswForm: TChgPswForm;

implementation

uses unitPubMethod, unitProductInfo, Md5;

{$R *.dfm}

procedure TChgPswForm.bbtActionClick(Sender: TObject);
begin
  inherited;
    if not checkOld(eOUser.Text, eOPsw.Text) then
    begin
      infoMsg(self.Handle, '原用户名或密码不正确，请重新输入！');
      exit;
    end;

    if not checkNULL() then
    begin
      infoMsg(self.Handle, '请填写完整新用户名和密码！');
      exit;
    end;

    if not checkNew() then
    begin
      infoMsg(self.Handle, '两次输入的密码不相同，请重新输入！');
      exit;
    end;

    writeUP();
    InfoMsg(self.Handle, '用户名和密码修改成功！');  

end;

function TChgPswForm.checkNew(): boolean;
begin
  result := false;
  if (eNewPswConf.Text = eNewPsw.Text) then
    result := true;
  
end;

function TChgPswForm.checkNULL: boolean;
begin
  result := false;
  if ((eNUser.Text<>'') and (eNewPsw.Text<>'') and (eNewPswConf.Text<>'')) then
    result := true;
end;

function TChgPswForm.checkOld(user, psw: string): boolean;
var
  u, p: string;
  reg: TRegistry;
begin
  result := false;

  reg := TRegistry.Create;
  with reg do
  begin
    rootkey:=HKEY_LOCAL_MACHINE;//确定打开注册表的主键。
    if openkey(TProductInfo.RegistKey, true) then
    begin
       if ValueExists('USER') then
            u   := ReadString('USER')
        else  u := 'admin';

        if ValueExists('PASSWD') then
            p   := ReadString('PASSWD')
        else p := MD5Print(MD5String(pchar('admin')));
    end;

  end;
  psw := MD5Print(MD5String(pchar(psw)));

  if ((u=user) and (p=psw)) then
    result := true;

end;

procedure TChgPswForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if key=#13 then
    begin
        key:=#0;
        Perform(CM_DialogKey,VK_TAB,0);
    end;
end;

procedure TChgPswForm.writeUP;
var
  reg: TRegistry;
begin

  reg := TRegistry.Create;
  with reg do
  begin
    rootkey:=HKEY_LOCAL_MACHINE;//确定打开注册表的主键。
    if openkey(TProductInfo.RegistKey, true) then
    begin
        WriteString('USER', eNUser.Text);
        WriteString('PASSWD', MD5Print(
              MD5String(pchar(trim(eNewPswConf.Text)))));


    end;
  end;
  reg.CloseKey;
  reg.Free;

end;

end.
