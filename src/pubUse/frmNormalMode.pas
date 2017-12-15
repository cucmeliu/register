unit frmNormalMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TNormalModeForm = class(TForm)
    pnlTop: TPanel;
    imgTop: TImage;
    lblTitle: TLabel;
    pnlBottom: TPanel;
    pnlBottomButton: TPanel;
    bbtAction: TBitBtn;
    bbtFinish: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtFinishClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NormalModeForm: TNormalModeForm;

implementation

{$R *.dfm}

procedure TNormalModeForm.bbtFinishClick(Sender: TObject);
begin
        self.Close;
end;

procedure TNormalModeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action := cafree;
end;

procedure TNormalModeForm.FormShow(Sender: TObject);
begin
        lblTitle.Caption := Caption;
                        try
        imgTop.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'//img//top.jpg');
                except
                end;
end;

end.
