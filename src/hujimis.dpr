program hujimis;

uses
  Forms,
  SysUtils,
  frmMain in 'frmMain.pas' {MainForm},
  frmInput in 'frmInput.pas' {InputForm},
  frmAdjust in 'frmAdjust.pas' {AdjustForm},
  frmDM in 'frmDM.pas' {DM: TDataModule},
  frmFlash in 'frmFlash.pas' {FlashForm},
  frmLoginRemote in 'frmLoginRemote.pas' {LoginRemoteForm},
  frmChgPsw in 'frmChgPsw.pas' {ChgPswForm},
  frmPrintRange in 'frmPrintRange.pas' {PrintRangeForm},
  frmNewRec in 'frmNewRec.pas' {NewRecForm},
  unitPerson in 'unitPerson.pas',
  frmPrintOption in 'frmPrintOption.pas' {PrintOptionForm},
  unitPrintOption in 'unitPrintOption.pas',
  frmChildMode in 'pubUse\frmChildMode.pas' {ChildModForm},
  frmMainMode in 'pubUse\frmMainMode.pas' {MainModeForm},
  frmNormalMode in 'pubUse\frmNormalMode.pas' {NormalModeForm},
  unitPubMethod in 'pubUse\unitPubMethod.pas',
  unitDefines in 'unitDefines.pas',
  frmRegister in 'frmRegister.pas' {RegisterForm},
  unitRegister in 'unitRegister.pas',
  unitProductInfo in 'unitProductInfo.pas',
  unitHardware in 'pubUse\unitHardware.pas',
  DESUnit in 'pubUse\DESUnit.pas',
  Md5 in 'pubUse\Md5.pas';

{$R *.res}

begin

  Application.Initialize;
//  FILEPATH := extractfilepath(application.ExeName);
  Application.Title := '户籍管理系统';
  FlashForm:=TFlashForm.create(application);
  FlashForm.show;
  FlashForm.lblHint.Caption := '正在启动程序...';
  FlashForm.update;
  sleep(500);

  FlashForm.lblHint.Caption := '正在连接数据...';
  FlashForm.update;
  Application.CreateForm(Tdm, dm);
  sleep(1000);

  FlashForm.lblHint.Caption := '正在打开窗口...';
  FlashForm.update;
  Application.CreateForm(TLoginRemoteForm, LoginRemoteForm);
  LoginRemoteForm.ShowModal;

  if LoginRemoteForm.LoginResult = 0 then
  begin
        LoginRemoteForm.Free;
        FlashForm.Free;
        DM.Free;
        Application.Terminate;
  end else
      begin
        LoginRemoteForm.Free;
        Application.CreateForm(TMainForm, MainForm);
        MainForm.Show;

  //sleep(1000);

  FlashForm.lblHint.Caption := '启动完成';
  FlashForm.update;
  //sleep(500);

  FlashForm.hide;
  FlashForm.free;
        Application.processMessages;
        Application.Run;
      end;

  // Application.CreateForm(TLoginForm, LoginForm);
  // LoginForm.ShowModal;
  // if (LoginForm.checkPasswd<>1) then Application.Destroy ;


//  Application.Run;

end.
