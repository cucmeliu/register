unit frmChildModeNoTitle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TChildModeNoTitleForm = class(TForm)
    pnlBottom: TPanel;
    pnlBottomButton: TPanel;
    bbtAction: TBitBtn;
    bbtFinish: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildModeNoTitleForm: TChildModeNoTitleForm;

implementation

{$R *.dfm}

end.
