unit frmLoginRemote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, jpeg, ExtCtrls, Registry;

type
  TLoginRemoteForm = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    eLoginPsw: TEdit;
    bbtLogin: TBitBtn;
    bbtCancle: TBitBtn;
    eLoginName: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtLoginClick(Sender: TObject);
    procedure bbtCancleClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure eLoginPswKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FLoginResult: byte;
    procedure SetLoginResult(const Value: byte);
    function checkPasswd: integer;
    { Private declarations }
  public
    { Public declarations }
  published
        property LoginResult: byte read FLoginResult write SetLoginResult;
  end;

var
  LoginRemoteForm: TLoginRemoteForm;

implementation

uses unitPubMethod, Md5, unitProductInfo;


{$R *.dfm}

{ TForm1 }

procedure TLoginRemoteForm.SetLoginResult(const Value: byte);
begin
  FLoginResult := Value;
end;

procedure TLoginRemoteForm.FormCreate(Sender: TObject);
begin
        FLoginResult := 0;
        //eIpAddress.Text := ReadStrIni('Host', 'Address', '.');
        //eLoginName.Text := ReadStrIni('Host', 'Name', 'cucme');
        //eLoginPsw.Text := ReadStrIni('Host', 'Password', 'cucme');
end;

procedure TLoginRemoteForm.bbtLoginClick(Sender: TObject);
begin 
  if (checkPasswd() = 1) then
  begin
    FLoginResult := 1;
    close;
  end else
  begin
    warnMsg(self.Handle, '用户名或密码错误，请重新输入！');
    eLoginName.SetFocus;
  end;
      {  dm.FConStr := 'Provider=SQLOLEDB.1;Password='
                + eLoginPsw.Text
                + ';Persist Security Info=True;User ID='
                + eLoginName.Text
                + ';Initial Catalog=DiskRent;Data Source='
                + eIpAddress.Text;

        if dm.LoginDB then
        begin
                //登录成功
                FLoginResult := 1;
                WriteStrIni('Host', 'Address', eIpAddress.Text);
                WriteStrIni('Host', 'Name', eLoginName.Text);
                WriteStrIni('Host', 'Password', eLoginPsw.Text);
                gGlobalData.AdminPsw := GetPassWord('Admin');

                close;
        end;
       }
end;

function TLoginRemoteForm.checkPasswd: integer;
var
  user, passwd: string;
  reg: TRegistry;
begin
  inherited;
  result := 0;

  reg := TRegistry.Create;

  user := 'admin';
  passwd := (MD5Print(MD5String(pchar('admin'))));
  with reg do
  begin
    rootkey:=HKEY_LOCAL_MACHINE;//确定打开注册表的主键。
    if openkey(TProductInfo.RegistKey, false) then
    begin
       if ValueExists('USER') then
            user   := ReadString('USER');

        if ValueExists('PASSWD') then
            passwd   := ReadString('PASSWD');
    end else begin
    
    end;
    reg.CloseKey;
  reg.Free;

  end;


  if (eLoginName.Text = user)
    and (MD5Print(MD5String(pchar(eLoginPsw.Text)))= passwd) then
    result := 1;
end;

procedure TLoginRemoteForm.bbtCancleClick(Sender: TObject);
begin
        FLoginResult := 0;
end;

procedure TLoginRemoteForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
        if key=#13 then
        begin
                key:=#0;
                Perform(CM_DialogKey,VK_TAB,0);
        end;
end;

procedure TLoginRemoteForm.eLoginPswKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key <> vk_return then exit;
        bbtLogin.Click;
        
end;

end.
