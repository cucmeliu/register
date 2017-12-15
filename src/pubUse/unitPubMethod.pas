{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: FileName:  unitPubMethod                                ::
  ::                                                         ::
  :: Description: The most used method for windows app       ::
  ::         development, unconsider of spec app             ::
             ����ķ��������õ�Ӧ�ó����еĳ��������
  :: Copyright (c) 2000-2006 cucme.Liu@China                 ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web:    email:                                          ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }

unit unitPubMethod;

interface

uses windows, Forms, DateUtils, db, ADODB, DBGrids, Graphics, IniFiles,
  SysUtils, ComObj, ActiveX, ShlObj;

function DayOfWeekInChinese(dt: TDatetime): string;
function FindChildWindows(childForm: string): boolean;
function IsMethodGranted(rightStr: String; rightIdx: byte): boolean;

procedure DBGridSort(aDBGrid: TDBGrid; Column: TColumn; aDataSet: TCustomadoDataSet);

procedure InfoMsg(aHandle: Longword; aMsg: pChar); overload;
procedure WarnMsg(aHandle: Longword; aMsg: pChar); overload;
procedure ErroMsg(aHandle: Longword; aMsg: pChar); overload;
function  ConfMsg(aHandle: Longword; aMsg: pChar): boolean; overload;

procedure InfoMsg(aMsg: pChar); overload;
procedure WarnMsg(aMsg: pChar); overload;
procedure ErroMsg(aMsg: pChar); overload;
function  ConfMsg(aMsg: pChar): boolean;  overload;

procedure InfoMsg(aMsg: string); overload;
procedure WarnMsg(aMsg: string); overload;
procedure ErroMsg(aMsg: string); overload;
function  ConfMsg(aMsg: string): boolean;  overload;

procedure WriteBoolIni(Section, Ident: string; Value: boolean);
function ReadBoolIni(Section, Ident: string; Default: boolean): boolean;


procedure WriteIntIni(Section, Ident: string; Value: integer);
function ReadIntIni(Section, Ident: string; Default: integer): integer;

procedure WriteFloatIni(Section, Ident: string; Value: real);
function ReadFloatIni(Section, Ident: string; Default: real): real;

procedure WriteDateIni(Section, Ident: string; Value: TDateTime);
function ReadDateIni(Section, Ident: string; Default: TDateTime): TDateTime;

procedure WriteStrIni(Section, Ident: string; Value: string);
function ReadStrIni(Section, Ident: string; Default: string): string;

procedure CreateLink(ProgramPath, ProgramArg, LinkPath, Descr: String);
procedure CreateDesktopLink(ProgramPath, ProgramArg, LinkFileName, Descr: String);

//For DLL Declare
procedure MyAboutWin(AHandle: THandle; appName, appVersion: PChar); stdcall; external 'myCommDialogs.dll';
procedure MyAboutWinEx(AHandle: THandle; prjName, appName, appVersion: PChar);  stdcall; external 'myCommDialogs.dll';
procedure MyAboutWinExEx(AHandle: THandle; prjName, appName, appVersion, copyright, author: PChar); stdcall;  external 'myCommDialogs.dll';
//    MyAboutWin(application.Handle, pchar('����ϵ�����֮�ɼ��Ǽ�'), 'V2.3 (build050322)');

implementation

(*********************************************************************
//  func��DayOfWeekInChinese
//  Desc���ж�ĳ�������ڼ�
//  Parm��
//  Rslt��
//  Note��
//  Auth��cucme.Liu @ 2006.
//  Updt��
//********************************************************************)
function DayOfWeekInChinese(dt: TDatetime): string;
  function DayOfWeekInChineseNum(d: byte): string;
  begin
       case d of
          1: result := 'һ';
          2: result := '��';
          3: result := '��';
          4: result := '��';
          5: result := '��';
          6: result := '��';
          7: result := '��';
          else ;
       end;
  end;
begin
        result := '����' + DayOfWeekInChineseNum(DayOfTheWeek(dt));
end;

(*********************************************************************
//  func�� FindChildWindows
//  Desc�� �鿴��ǰҪ�򿪵Ĵ����Ƿ��Ѵ򿪣����Ѵ����ᵽ��ǰ��
//  Parm�����������
//  Rslt�� true: �Ѿ����ڣ�false��δ�򿪣���֮
//  Note��FindChildWindows(TReturnForm.ClassName)
//  Auth��cucme.Liu @ 2005.
//  Updt��
Usage Example:
    if not FindChildWindows(TClassRoom.ClassName) then
    begin
        ClassRoom := TClassRoom.Create(nil);
        ClassRoom.Show;
    end;

//********************************************************************)
function FindChildWindows(childForm: string): boolean;
var
  i: integer;
begin
        Result:=False;
        for i:=0 to Screen.FormCount-1 do
        begin
                if  Screen.Forms[i].ClassName=childForm then
                begin
                        Result:=True;
                        Screen.Forms[i].BringToFront;
                        Screen.Forms[i].Invalidate;
                        break;
                end;
        end;
end;


(*********************************************************************
//  func��IsMethodGranted
//  Desc��һ��Ӧ�ó����ж������ʱ���ж�ĳ�����ܶ��û��Ƿ����
//  Parm��
           rightStr���й��ܶ�Ӧ��0,1�������У�����'1100111'
                1Ϊ�иù��ܵ�ʹ��Ȩ��0Ϊû�У�
           rightIdxĳ�����ܶ�Ӧ������������˳����Ӧ�ó���ĸ�����
//  Rslt��
//  Note��
//  Auth��cucme.Liu @ 2006.
//  Updt��
//********************************************************************)
function IsMethodGranted(rightStr: String; rightIdx: byte): boolean;
begin
        result := false;
        if rightIdx > Length(rightStr) then exit;
        
        if rightStr[rightIdx] = '1' then result := true
        else result := false;
end;

//��DBGrid��������
procedure DBGridSort(aDBGrid: TDBGrid; Column: TColumn; aDataSet: TCustomadoDataSet);
var
    i : integer;
begin
 
  for i:= 1 to aDBGrid.Columns.Count do
  begin
//�ָ����б�������ΪĬ��
    aDBGrid.Columns[i-1].Title.Font.Color := clWindowText;
    aDBGrid.Columns[i-1].Title.Font.Style := [];
  end;
  if aDataSet.Sort<>(Column.FieldName+' ASC') then      //�ж�ԭ����ʽ
  begin
    aDataSet.Sort := Column.FieldName+' ASC';
    Column.Title.Font.Color := clRed;          //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
    Column.Title.Font.Style := [fsBold];
  end
  else begin
    aDataSet.Sort := Column.FieldName+' DESC';
    Column.Title.Font.Color := clBlue;         //�ı����������Ϊ��ɫ����ʾ��ǰ������ʽΪ����
    Column.Title.Font.Style := [fsBold];
  end;
end;
//end of ��DBGrid��������

//Start of  ��Ϣ��
procedure InfoMsg(aHandle: Longword; aMsg: pChar);
begin
        MessageBox(aHandle, aMsg, '��ʾ��Ϣ',
                MB_OK + MB_ICONINFORMATION);
end;

procedure WarnMsg(aHandle: Longword; aMsg: pChar);
begin
        MessageBox(aHandle, aMsg, '������Ϣ',
                MB_OK + MB_ICONWARNING);
end;

procedure ErroMsg(aHandle: Longword; aMsg: pChar);
begin
        MessageBox(aHandle, aMsg, '������Ϣ',
                MB_OK + MB_ICONERROR);
end;

function  ConfMsg(aHandle: Longword; aMsg: pChar): boolean;
begin
        if MessageBox(aHandle, aMsg, 'ȷ����Ϣ',
                MB_YESNO + MB_ICONQUESTION)=IDYES then
                result := True
        else result := false;
end;

procedure InfoMsg(aMsg: pChar);
begin
   InfoMsg(application.Handle, aMsg);
end;

procedure WarnMsg(aMsg: pChar);
begin
   WarnMsg(application.Handle, aMsg);
end;

procedure ErroMsg(aMsg: pChar);
begin
    ErroMsg(application.Handle, aMsg);
end;

function  ConfMsg(aMsg: pChar): boolean;
begin
    result := ConfMsg(application.Handle, aMsg);
end;

procedure InfoMsg(aMsg: string);
begin
    InfoMsg(application.Handle, pAnsiChar(aMsg));
end;

procedure WarnMsg(aMsg: string); overload;
begin
   WarnMsg(application.Handle, pAnsiChar(aMsg));
end;

procedure ErroMsg(aMsg: string); overload;
begin
    ErroMsg(application.Handle, pAnsiChar(aMsg));
end;

function  ConfMsg(aMsg: string): boolean;  overload;
begin
    result := ConfMsg(application.Handle, pAnsiChar(aMsg));
end;

//end of ��Ϣ��

//start of Ini �ļ�����
procedure WriteBoolIni(Section, Ident: string; Value: boolean);
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        aIni.WriteBool(Section, Ident, Value);
        aIni.Free;
end;

function ReadBoolIni(Section, Ident: string; Default: boolean): boolean;
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        result := aIni.ReadBool(Section, Ident, Default);
        aIni.Free;
end;

procedure WriteIntIni(Section, Ident: string; Value: integer);
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        aIni.WriteInteger(Section, Ident, Value);
        aIni.Free;
end;

function ReadIntIni(Section, Ident: string; Default: integer): integer;
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        result := aIni.ReadInteger(Section, Ident, Default);
        aIni.Free;
end;

procedure WriteFloatIni(Section, Ident: string; Value: real);
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        aIni.WriteFloat(Section, Ident, Value);
        aIni.Free;
end;

function ReadFloatIni(Section, Ident: string; Default: real): real;
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        result := aIni.ReadFloat(Section, Ident, Default);
        aIni.Free;
end;

procedure WriteDateIni(Section, Ident: string; Value: TDateTime);
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        aIni.WriteDate(Section, Ident, Value);
        aIni.Free;
end;

function ReadDateIni(Section, Ident: string; Default: TDateTime): TDateTime;
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        result := aIni.ReadDate(Section, Ident, Default);
        aIni.Free;
end;

procedure WriteStrIni(Section, Ident: string; Value: string);
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        aIni.WriteString(Section, Ident, Value);
        aIni.Free;
end;

function ReadStrIni(Section, Ident: string; Default: string): string;
var
  aIni: TIniFile;
begin
        aIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+ '\SETTINGS.ini');
        result := aIni.ReadString(Section, Ident, Default);
        aIni.Free;
end;
//end of INI �ļ�����

//start Register ע������

//end of Register ע������

//������ݷ�ʽ
procedure CreateLink(ProgramPath, ProgramArg, LinkPath, Descr: String);
var 
  AnObj: IUnknown;
  ShellLink: IShellLink;
  AFile: IPersistFile;
  FileName: WideString;
begin 
  if UpperCase(ExtractFileExt(LinkPath))<> '.LNK' then //�����չ���Ƿ���ȷ
  begin
    raise Exception.Create('��ݷ�ʽ����չ��������''LNK''!');//������������쳣
  end;
  try
    OleInitialize(nil);//��ʼ��OLE�⣬��ʹ��OLE����ǰ������ó�ʼ��
    AnObj := CreateComObject(CLSID_ShellLink);//���ݸ�����ClassID����һ��COM���󣬴˴��ǿ�ݷ�ʽ
    ShellLink := AnObj as IShellLink;//ǿ��ת��Ϊ��ݷ�ʽ�ӿ�
    AFile := AnObj as IPersistFile;//ǿ��ת��Ϊ�ļ��ӿ�
    //���ÿ�ݷ�ʽ���ԣ��˴�ֻ�����˼������õ�����
    ShellLink.SetPath(PChar(ProgramPath)); // ��ݷ�ʽ��Ŀ���ļ���һ��Ϊ��ִ���ļ�
    ShellLink.SetArguments(PChar(ProgramArg));// Ŀ���ļ�����
    ShellLink.SetWorkingDirectory(PChar(ExtractFilePath(ProgramPath)));//Ŀ���ļ��Ĺ���Ŀ¼
    ShellLink.SetDescription(PChar(Descr));// ��Ŀ���ļ�������
    FileName := LinkPath;//���ļ���ת��ΪWideString����
    AFile.Save(PWChar(FileName), False);//�����ݷ�ʽ
  finally 
  OleUninitialize;//�ر�OLE�⣬�˺���������OleInitialize�ɶԵ��� 
  end;

  
  (*
  Ҳ�����ڳ�����������˵��ﴴ����ݷ�ʽ�����£���������Ĵ��룩��   
  procedure   TfrmMain.btnStartupClick(Sender:   TObject);   
  begin   
          SHGetSpecialFolderLocation(0,CSIDL_STARTUP,PIDL);   
          Fillchar(startupdirectory,Max_Path+1,0);   
          SHGetPathFromIDList(PIDL,StartupDirectory);   
          LinkFilename   :=   StartupDirectory   +   '\Delphi.lnk';   
          tmpPFile.Save(pWChar(LinkFilename),FALSE);   
  end;   
    
  procedure   TfrmMain.btnProgramClick(Sender:   TObject);   
  begin   
          SHGetSpecialFolderLocation(0,     CSIDL_PROGRAMS,PIDL);   
          Fillchar(startupdirectory,Max_Path+1,0);   
          SHGetPathFromIDList(PIDL,StartupDirectory);   
          if   not   DirectoryExists(StartupDirectory+'\Delphi')   then   
          begin   
                  MkDir(StartupDirectory+'\Delphi');   
          end;   
          LinkFilename   :=   StartupDirectory   +   '\Delphi\Delphi.lnk';   
          tmpPFile.Save(pWChar(LinkFilename),FALSE);   
  end;   
  *)

  end;

procedure CreateDesktopLink(ProgramPath, ProgramArg, LinkFileName, Descr: String);
var
  PIDL   :   PItemIDList;   
  StartupDirectory   :   array[0..MAX_PATH]   of   Char;
//  LinkFilename   :   WideString;
begin

  SHGetSpecialFolderLocation(0,CSIDL_DESKTOPDIRECTORY,PIDL);
  Fillchar(StartupDirectory,Max_Path+1,0);
  SHGetPathFromIDList(PIDL,StartupDirectory);
  //LinkFilename := StartupDirectory + LinkFileName;
  CreateLink(ProgramPath, ProgramArg, StartupDirectory +'\\'+ LinkFileName, Descr);

end;

end.
