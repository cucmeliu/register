unit frmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmNormalMode, StdCtrls, Buttons, ExtCtrls;

type
  TLoginForm = class(TNormalModeForm)
    Label1: TLabel;
    Label2: TLabel;
    eUser: TEdit;
    ePasswd: TEdit;
    procedure bbtActionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function checkPasswd: integer;
  end;

var
  LoginForm: TLoginForm;

implementation

uses unitPubMethod;

{$R *.dfm}

procedure TLoginForm.bbtActionClick(Sender: TObject);
begin
  inherited;
  close;
end;

function TLoginForm.checkPasswd: integer;
var
  user, passwd: string;
begin
  inherited;
  result := 0;
  user := readStrIni('SETTING', 'USER', 'tsnc');
  passwd := readStrIni('SETTING', 'PASSWD', 'tsnc');
  if (eUser.Text = user) and (ePasswd.Text = passwd) then
    result := 1;

end;

end.
