unit unitRegister;

interface

uses Windows, Registry, Controls, SysUtils, DateUtils;

type

TMyRegister  = class

private
procedure writeKeyVal(RegistKey, key, val: string);
//function legelCheck: boolean;
public

function  isRegisted(RegistKey, EncryKey: string): boolean;  
function isLegel(startDate: Tdatetime; key, startDateEncode: string): boolean;
function tryRegister(RegistKey, macCode, key, sn: string): boolean;

function isSerialNumOK(macCode, key, sn: string): boolean;

function countLeftTryDays(startDate: TDatetime; tryDays: integer): integer;

end;

implementation

uses unitHardware, Md5, unitProductInfo, DESUnit, unitPubMethod;

{ TMyRegister }



{ TMyRegister }

function TMyRegister.countLeftTryDays(startDate: TDatetime;
  tryDays: integer): integer;
begin
    result := tryDays - DaysBetween(startDate, now);
end;

function TMyRegister.isLegel(startDate: Tdatetime; key, startDateEncode: string): boolean;
begin
    result := false;
    
    if (DESEncrypt(FormatDatetime('yyyy-mm-dd', startDate), key)
      = startDateEncode) then
      begin
          result := true;
      end;
    
    
end;

function TMyRegister.isRegisted(RegistKey, EncryKey: string): boolean;
var
  reg: TRegistry;
  sn: string;
  hi: THardwareInfo;
begin
  result := false;

  sn := '';
  reg := TRegistry.Create;
  reg.rootkey:=HKEY_LOCAL_MACHINE;

  if not reg.OpenKey(RegistKey, true) then
  begin
  
  end
  else
    begin
      if reg.ValueExists('SN') then
      begin
        sn := reg.ReadString('SN');
      end;

      if not (sn = '') then
      begin
          hi := THardwareInfo.Create;

          if isSerialNumOK(DESEncrypt(trim(hi.GetIdeSerialNumber),
            EncryKey),
            EncryKey, sn) then
              result := true;
            
          hi.Free;
      end;     
    end;

    reg.CloseKey;
    reg.Free;   

end;

// ����ע�ᣬע��ɹ��򷵻�true�����򷵻�false
function TMyRegister.isSerialNumOK(macCode, key, sn: string): boolean;
var
  hwCode: string;
begin
  result := false;

  hwCode := DESDecrypt(macCode, key);
    
  if sn = MD5Print(
          MD5String(
          PAnsiChar(hwCode))) then
  begin
        result := true;
  end;
end;


function TMyRegister.tryRegister(RegistKey, macCode, key, sn: string): boolean;
begin
  result := false;
  if isSerialNumOK(macCode, key, sn) then
  begin
      writeKeyVal(RegistKey, 'SN', sn);
      result := true;
  end;   

end;

procedure TMyRegister.writeKeyVal(RegistKey, key, val: string);
var
  reg: TRegistry;
begin
    reg := TRegistry.Create;
    reg.rootkey:=HKEY_LOCAL_MACHINE;
    reg.OpenKey(RegistKey, true);
    reg.WriteString(key, val);
    reg.CloseKey;
    reg.Free;

end;

end.
