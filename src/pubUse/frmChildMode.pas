unit frmChildMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Buttons;

type
  TChildModForm = class(TForm)
    pnlTop: TPanel;
    imgTop: TImage;
    lblTitle: TLabel;
    pnlBottom: TPanel;
    pnlBottomButton: TPanel;
    bbtAction: TBitBtn;
    bbtFinish: TBitBtn;
    procedure bbtFinishClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildModForm: TChildModForm;

implementation

{$R *.dfm}

procedure TChildModForm.bbtFinishClick(Sender: TObject);
begin
        self.Close;
end;

procedure TChildModForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        Action := cafree;
end;

procedure TChildModForm.FormPaint(Sender: TObject);
begin
        lblTitle.Caption := Caption;
end;

procedure TChildModForm.FormShow(Sender: TObject);
begin
                try
        imgTop.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'//img//top.jpg');
                except
                end;
end; 

end.
