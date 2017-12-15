unit frmFlash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons, Shellapi;

type
  TFlashForm = class(TForm)
    img: TImage;
    lblCompanyName: TLabel;
    lblSchool: TLabel;
    lblProdName2: TLabel;
    lblHint: TLabel;
    lblEmail: TLabel;
    lblProdName: TLabel;
    lblCopyright: TLabel;
    lblProdMaker: TLabel;
    lblVersion: TLabel;
    procedure lblEmailClick(Sender: TObject);
    procedure imgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlashForm: TFlashForm;

implementation

uses unitPubMethod, unitProductInfo;


{$R *.dfm}

procedure TFlashForm.FormShow(Sender: TObject);
var
  prodInfo: TProductInfo;
begin
    prodInfo := TProductInfo.Create;
    lblCompanyName.Caption := ReadStrIni('SETTING', 'COMPANY', '西安格瑞艾普科技有限公司');

    lblProdName.Caption := prodInfo.ProdName;
    lblProdName2.Caption := prodInfo.ProdName;

    lblVersion.Caption := prodInfo.ProdVersion;
    lblCopyright.Caption := prodInfo.CopyRight;
    lblProdMaker.Caption := prodInfo.ProdMaker;
    lblEmail.Caption := prodInfo.Email;
    prodInfo.Free;
end;

procedure TFlashForm.imgClick(Sender: TObject);
begin
close;
end;

procedure TFlashForm.lblEmailClick(Sender: TObject);
begin
ShellExecute(handle, nil,
      'mailto:cucme@163.com',
      nil, nil, sw_shownormal);
end;

end.
