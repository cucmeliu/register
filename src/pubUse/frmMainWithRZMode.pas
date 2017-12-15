unit frmMainWithRZMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmMainMode, RzGroupBar, ActnList, ComCtrls;

type
  TMainModeWithRZForm = class(TMainModeForm)
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainModeWithRZForm: TMainModeWithRZForm;

implementation

{$R *.dfm}

end.
