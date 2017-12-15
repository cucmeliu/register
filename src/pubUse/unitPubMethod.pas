{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: FileName:  unitPubMethod                                ::
  ::                                                         ::
  :: Description: The most used method for windows app       ::
  ::         development, unconsider of spec app             ::
             这里的方法不会用到应用程序中的常量或变量
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
//    MyAboutWin(application.Handle, pchar('教务系列软件之成绩登记'), 'V2.3 (build050322)');

implementation

(*********************************************************************
//  func：DayOfWeekInChinese
//  Desc：判断某天是星期几
//  Parm：
//  Rslt：
//  Note：
//  Auth：cucme.Liu @ 2006.
//  Updt：
//********************************************************************)
function DayOfWeekInChinese(dt: TDatetime): string;
  function DayOfWeekInChineseNum(d: byte): string;
  begin
       case d of
          1: result := '一';
          2: result := '二';
          3: result := '三';
          4: result := '四';
          5: result := '五';
          6: result := '六';
          7: result := '天';
          else ;
       end;
  end;
begin
        result := '星期' + DayOfWeekInChineseNum(DayOfTheWeek(dt));
end;

(*********************************************************************
//  func： FindChildWindows
//  Desc： 查看当前要打开的窗体是否已打开，如已打开则提到最前面
//  Parm：窗体的类名
//  Rslt： true: 已经存在，false：未打开，打开之
//  Note：FindChildWindows(TReturnForm.ClassName)
//  Auth：cucme.Liu @ 2005.
//  Updt：
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
//  func：IsMethodGranted
//  Desc：一个应用程序有多个功能时，判断某个功能对用户是否可用
//  Parm：
           rightStr所有功能对应的0,1编码序列，即：'1100111'
                1为有该功能的使用权，0为没有；
           rightIdx某个功能对应的索引，即按顺序编号应用程序的各功能
//  Rslt：
//  Note：
//  Auth：cucme.Liu @ 2006.
//  Updt：
//********************************************************************)
function IsMethodGranted(rightStr: String; rightIdx: byte): boolean;
begin
        result := false;
        if rightIdx > Length(rightStr) then exit;
        
        if rightStr[rightIdx] = '1' then result := true
        else result := false;
end;

//对DBGrid进行排序
procedure DBGridSort(aDBGrid: TDBGrid; Column: TColumn; aDataSet: TCustomadoDataSet);
var
    i : integer;
begin
 
  for i:= 1 to aDBGrid.Columns.Count do
  begin
//恢复所有标题字体为默认
    aDBGrid.Columns[i-1].Title.Font.Color := clWindowText;
    aDBGrid.Columns[i-1].Title.Font.Style := [];
  end;
  if aDataSet.Sort<>(Column.FieldName+' ASC') then      //判断原排序方式
  begin
    aDataSet.Sort := Column.FieldName+' ASC';
    Column.Title.Font.Color := clRed;          //改变标题行字体为红色，表示当前的排序方式为升序
    Column.Title.Font.Style := [fsBold];
  end
  else begin
    aDataSet.Sort := Column.FieldName+' DESC';
    Column.Title.Font.Color := clBlue;         //改变标题行字体为红色，表示当前的排序方式为降序
    Column.Title.Font.Style := [fsBold];
  end;
end;
//end of 对DBGrid进行排序

//Start of  消息框
procedure InfoMsg(aHandle: Longword; aMsg: pChar);
begin
        MessageBox(aHandle, aMsg, '提示信息',
                MB_OK + MB_ICONINFORMATION);
end;

procedure WarnMsg(aHandle: Longword; aMsg: pChar);
begin
        MessageBox(aHandle, aMsg, '警告信息',
                MB_OK + MB_ICONWARNING);
end;

procedure ErroMsg(aHandle: Longword; aMsg: pChar);
begin
        MessageBox(aHandle, aMsg, '错误信息',
                MB_OK + MB_ICONERROR);
end;

function  ConfMsg(aHandle: Longword; aMsg: pChar): boolean;
begin
        if MessageBox(aHandle, aMsg, '确认信息',
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

//end of 消息框

//start of Ini 文件操作
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
//end of INI 文件操作

//start Register 注册表操作

//end of Register 注册表操作

//产生快捷方式
procedure CreateLink(ProgramPath, ProgramArg, LinkPath, Descr: String);
var 
  AnObj: IUnknown;
  ShellLink: IShellLink;
  AFile: IPersistFile;
  FileName: WideString;
begin 
  if UpperCase(ExtractFileExt(LinkPath))<> '.LNK' then //检查扩展名是否正确
  begin
    raise Exception.Create('快捷方式的扩展名必须是''LNK''!');//若不是则产生异常
  end;
  try
    OleInitialize(nil);//初始化OLE库，在使用OLE函数前必须调用初始化
    AnObj := CreateComObject(CLSID_ShellLink);//根据给定的ClassID生成一个COM对象，此处是快捷方式
    ShellLink := AnObj as IShellLink;//强制转换为快捷方式接口
    AFile := AnObj as IPersistFile;//强制转换为文件接口
    //设置快捷方式属性，此处只设置了几个常用的属性
    ShellLink.SetPath(PChar(ProgramPath)); // 快捷方式的目标文件，一般为可执行文件
    ShellLink.SetArguments(PChar(ProgramArg));// 目标文件参数
    ShellLink.SetWorkingDirectory(PChar(ExtractFilePath(ProgramPath)));//目标文件的工作目录
    ShellLink.SetDescription(PChar(Descr));// 对目标文件的描述
    FileName := LinkPath;//把文件名转换为WideString类型
    AFile.Save(PWChar(FileName), False);//保存快捷方式
  finally 
  OleUninitialize;//关闭OLE库，此函数必须与OleInitialize成对调用 
  end;

  
  (*
  也可以在程序组或启动菜单里创建快捷方式，如下（补充上面的代码）：   
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
