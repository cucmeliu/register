unit frmMainMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ComCtrls;

type
  TMainModeForm = class(TForm)
    alMain: TActionList;
    StatusBar1: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainModeForm: TMainModeForm;

implementation

{$R *.dfm}

end.
