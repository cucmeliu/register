unit frmDM;

interface

uses
  SysUtils, Classes, DB, ADODB, RpBase, RpSystem, RpDefine, RpRave, Forms;

type
  TDM = class(TDataModule)
    ac: TADOConnection;
    rvPrj: TRvProject;
    RvSystem1: TRvSystem;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
    ac.Connected := false;
    ac.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Data\hj.mdb;Persist Security Info=False;Jet OLEDB:Database Password=1323537';
    ac.Connected := true;

    rvPrj.ProjectFile := ExtractFileDir(Application.ExeName)+'\rpt\hjrpt.rav';
end;

end.
