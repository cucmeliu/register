unit frmInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmChildMode, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids,
  ActnList, DB, ADODB, Mask, DBCtrls, RpDefine, RpCon, RpConDS, RVClass, RVCsStd,
  DateUtils, Menus, unitPerson, unitPrintOption;

type

  TInputForm = class(TChildModForm)
    ActionList1: TActionList;
    ActionAdd: TAction;
    ds: TDataSource;
    adods: TADODataSet;
    ActionRefresh: TAction;
    ActionShow: TAction;
    ActionPrintList: TAction;
    ActionPrintSingle: TAction;
    rvdscAll: TRvDataSetConnection;
    RvDataSetConnection2: TRvDataSetConnection;
    ActionPrintAll: TAction;
    PopupMenu1: TPopupMenu;
    ActionDel: TAction;
    D1: TMenuItem;
    ActionPrintRange: TAction;
    adodsRange: TADODataSet;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label19: TLabel;
    lblTotal: TLabel;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    ActionEdit: TAction;
    dtpBDate: TDateTimePicker;
    dtpEDate: TDateTimePicker;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    SpeedButton3: TSpeedButton;
    ActionShowAll: TAction;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    dtpPrintDate: TDateTimePicker;
    N6: TMenuItem;
    W1: TMenuItem;
    N7: TMenuItem;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ActionDelExecute(Sender: TObject);
    procedure adodsAfterPost(DataSet: TDataSet);
    procedure adodsAfterRefresh(DataSet: TDataSet);
    procedure adodsAfterOpen(DataSet: TDataSet);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
    procedure ActionPrintSingleExecute(Sender: TObject);
    procedure ActionPrintListExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionEditExecute(Sender: TObject);
    procedure ActionShowAllExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionPrintAllExecute(Sender: TObject);
  private
    { Private declarations }

    //FPrintType: byte;

    function getPersonInfo(): TPerson;
    procedure printAPerson(a: TPerson; printOption: TPrintOption; printtype: byte=0);


    procedure statBetween(bDate, eDate: TDate); 
  public
    { Public declarations }
  end;


var
  InputForm: TInputForm;

implementation

uses frmDM, unitPubMethod, frmAdjust, frmPrintRange, frmNewRec, frmPrintOption;

{$R *.dfm}

procedure TInputForm.ActionAddExecute(Sender: TObject);
var
  frm: TNewRecForm;
begin
  inherited;
    frm := TNewRecForm.Create(nil);
    frm.addRecord;
    frm.ShowModal;
    frm.Free;

    adods.Close;
    adods.Open;
end;

procedure TInputForm.ActionDelExecute(Sender: TObject);
begin
  inherited;
    if confMsg(self.Handle, '真的要删除此人记录吗？删除后无法恢复。') then
        adods.Delete;
end;

procedure TInputForm.ActionEditExecute(Sender: TObject);
var
  frm: TNewRecForm;
begin
    if adods.RecordCount = 0 then
    begin
        infoMsg('当前没有记录，不能进行编辑');
        exit;
    end;

    frm := TNewRecForm.Create(nil);
    frm.editRecord(adods.FieldByName('id').AsString);       
    frm.ShowModal;
    frm.Free;

    adods.Refresh;
end;

procedure TInputForm.ActionPrintListExecute(Sender: TObject);
var
    MyPage: TRavePage;
begin
  inherited;

    if not confmsg('确定要打印当前所有列表吗？') then
        exit;

    dm.rvPrj.Open;
    MyPage := dm.rvPrj.ProjMan.FindRaveComponent('ReportAll.Page1',
        nil) as TRavePage;
    (dm.rvPrj.ProjMan.FindRaveComponent('txtCompanyName', MyPage) as TRaveText).Text
        := ReadStrIni('SETTING', 'COMPANY', '西安格瑞艾普科技有限公司');

    dm.rvPrj.ExecuteReport('ReportAll');
    dm.rvPrj.Close;
end;

procedure TInputForm.ActionPrintAllExecute(Sender: TObject);
var
  i: integer;
  pt: byte;
  po: TPrintOption;
begin
  inherited;
    if not confMsg('确定要打印当有列出的所有记录吗？') then exit;

    pt := ReadIntIni('SETTING', 'PRINTTYPE', 0);
    po := TPrintOption.Create;
    po.readIsPrint;

    with DBGrid1.DataSource.DataSet do
    begin
        First();
        while not DBGrid1.DataSource.DataSet.Eof do         
        begin
            printAPerson(getPersonInfo(), po, pt);
            next();
        end;
    end;

end;

procedure TInputForm.ActionPrintSingleExecute(Sender: TObject);
var
  i: integer;
  pt: byte;
  po: TPrintOption;
begin
  inherited;
    if not confMsg('确定要打印选中的记录吗？') then exit;

    pt := ReadIntIni('SETTING', 'PRINTTYPE', 0);
    po := TPrintOption.Create;
    po.readIsPrint;

    with DBGrid1.DataSource.DataSet do
        for   i:=0 to DBGrid1.SelectedRows.Count-1   do
        begin
            GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
            printAPerson(getPersonInfo(), po, pt);
        end;
    
end;

procedure TInputForm.ActionRefreshExecute(Sender: TObject);
begin
  inherited;
    adods.Close;
    adods.Open;
end;

procedure TInputForm.ActionShowAllExecute(Sender: TObject);
begin
  inherited;
    adods.Close;
    adods.CommandText := 'select * from records ORDER BY MoveTime DESC ';
    adods.Open;
end;

procedure TInputForm.ActionShowExecute(Sender: TObject);
begin
    statBetween(incDay(dtpBDate.DateTime, -1), incDay(dtpEDate.DateTime));
end;

procedure TInputForm.adodsAfterOpen(DataSet: TDataSet);
begin
  inherited;
    lblTotal.Caption := inttostr(DataSet.RecordCount);
end;

procedure TInputForm.adodsAfterPost(DataSet: TDataSet);
begin
  inherited;
    lblTotal.Caption := inttostr(DataSet.RecordCount);
end;

procedure TInputForm.adodsAfterRefresh(DataSet: TDataSet);
begin
  inherited;
    lblTotal.Caption := inttostr(DataSet.RecordCount);
end;

procedure TInputForm.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  DBGridSort(DBGrid1, Column, adods);
end;

procedure TInputForm.FormCreate(Sender: TObject);
begin
  inherited;
    //FPrintType := 0;
    dtpPrintDate.DateTime := now();
end;

procedure TInputForm.FormShow(Sender: TObject);
begin
  inherited;
    dtpEDate.DateTime := now();
    dtpBDate.DateTime  := incMonth(now, -1);
    statBetween(incDay(dtpBDate.DateTime, -1), incDay(dtpEDate.DateTime));

end;


function TInputForm.getPersonInfo: TPerson;
var
  rst : TPerson;
begin
    rst := TPerson.Create;
    rst.ID := adods.FieldByName('ID').AsString;

    rst.HukouType := adods.FieldByName('HukouType').AsString;
    rst.Master := adods.FieldByName('Master').AsString;
    rst.Relation := adods.FieldByName('Relation').AsString;

    rst.Name := adods.FieldByName('Name').AsString;
    rst.Gender := adods.FieldByName('Gender').AsString;
    rst.Birthday := adods.FieldByName('Birthday').AsDateTime;
    rst.Nationality := adods.FieldByName('Nationality').AsString;
    rst.Native := adods.FieldByName('Native').AsString;

    rst.BirthPlace := adods.FieldByName('BirthPlace').AsString;
    rst.IDCard := adods.FieldByName('IDCard').AsString;
    rst.CardSignDate := adods.FieldByName('CardSignDate').AsDateTime;
    rst.Education := adods.FieldByName('Education').AsString;
    rst.Marrage := adods.FieldByName('Marrage').AsString;

    rst.Military := adods.FieldByName('Military').AsString;
    rst.Height := adods.FieldByName('Height').AsInteger;
    rst.BloodType := adods.FieldByName('BloodType').AsString;
    rst.Career := adods.FieldByName('Career').AsString;
    rst.ServicePlace := adods.FieldByName('ServicePlace').AsString;

    rst.Address := adods.FieldByName('Address').AsString;
    rst.MoveTime := adods.FieldByName('MoveTime').AsDateTime;
    rst.MoveReason := adods.FieldByName('MoveReason').AsString;
    rst.FromWhere := adods.FieldByName('FromWhere').AsString;

    rst.OtherName := adods.FieldByName('OtherName').AsString;
    rst.Religion := adods.FieldByName('Religion').AsString;
    rst.Guardian := adods.FieldByName('Guardian').AsString;
    rst.GuardRela := adods.FieldByName('GuardRela').AsString;

    result := rst;
    
end;

procedure TInputForm.printAPerson(a: TPerson; printOption: TPrintOption; printtype: byte);
var
    MyPage: TRavePage;
    rpt: String;
begin
    dm.rvPrj.Open;
    // infoMsg('2');

    if printtype=1 then
        rpt := 'ReportSingle'
    else 
        rpt := 'ReportSingleM';

    MyPage := dm.rvPrj.ProjMan.FindRaveComponent(rpt+'.MainPage', nil) as TRavePage;

    with dm.rvPrj.ProjMan do
    begin

      if printOption.HukouType then
        (FindRaveComponent('txtHukouType', MyPage) as TRaveText).Text := a.HukouType
      else (FindRaveComponent('txtHukouType', MyPage) as TRaveText).Text := '';

      if printOption.Master then
        (FindRaveComponent('txtMaster', MyPage) as TRaveText).Text := a.Master
      else  (FindRaveComponent('txtMaster', MyPage) as TRaveText).Text := '';

      if printOption.Relation then
        (FindRaveComponent('txtRelation', MyPage) as TRaveText).Text := a.Relation
      else (FindRaveComponent('txtRelation', MyPage) as TRaveText).Text := '';

      (FindRaveComponent('txtName', MyPage) as TRaveText).Text := a.Name;
      (FindRaveComponent('txtGender', MyPage) as TRaveText).Text := a.Gender;
      (FindRaveComponent('txtNationality', MyPage) as TRaveText).Text := a.Nationality;

      if printOption.Birthday then
      begin
        (FindRaveComponent('txtBYear', MyPage) as TRaveText).Text := inttostr(Yearof(a.Birthday));
        (FindRaveComponent('txtBMonth', MyPage) as TRaveText).Text := inttostr(MonthOf(a.Birthday));
        (FindRaveComponent('txtBDay', MyPage) as TRaveText).Text := inttostr(DayOf(a.Birthday));
      end else begin
        (FindRaveComponent('txtBYear', MyPage) as TRaveText).Text := '';
        (FindRaveComponent('txtBMonth', MyPage) as TRaveText).Text := '';
        (FindRaveComponent('txtBDay', MyPage) as TRaveText).Text := '';      
      end;

      if printOption.BirthPlace then
        (FindRaveComponent('txtBPlace', MyPage) as TRaveText).Text := a.BirthPlace
      else (FindRaveComponent('txtBPlace', MyPage) as TRaveText).Text := '';

      if printOption.Address then
        (FindRaveComponent('txtAddress', MyPage) as TRaveText).Text := a.Address
      else (FindRaveComponent('txtAddress', MyPage) as TRaveText).Text := '';

      if printOption.Native then
        (FindRaveComponent('txtNative', MyPage) as TRaveText).Text := a.Native
      else (FindRaveComponent('txtNative', MyPage) as TRaveText).Text := '';

      if printOption.IDCard then
        (FindRaveComponent('txtIDCard', MyPage) as TRaveText).Text := a.IDCard
      else (FindRaveComponent('txtIDCard', MyPage) as TRaveText).Text := '';

      if printOption.CardSignDate then
         (FindRaveComponent('CardSignDate', MyPage) as TRaveText).Text := DateToStr(a.CardSignDate)
      else (FindRaveComponent('CardSignDate', MyPage) as TRaveText).Text := '';

      if printOption.Education then
        (FindRaveComponent('txtEducation', MyPage) as TRaveText).Text := a.Education
      else (FindRaveComponent('txtEducation', MyPage) as TRaveText).Text := '';

      if printOption.Marrage then
        (FindRaveComponent('txtMarrige', MyPage) as TRaveText).Text := a.Marrage
      else  (FindRaveComponent('txtMarrige', MyPage) as TRaveText).Text := '';

      if printOption.Military then
        (FindRaveComponent('txtMilitary', MyPage) as TRaveText).Text := a.Military
      else  (FindRaveComponent('txtMilitary', MyPage) as TRaveText).Text := '';

      if printOption.Height then
        (FindRaveComponent('txtHeight', MyPage) as TRaveText).Text := intToStr(a.Height)
      else (FindRaveComponent('txtHeight', MyPage) as TRaveText).Text := '';

      if printOption.BloodType then
        (FindRaveComponent('txtBlood', MyPage) as TRaveText).Text := a.BloodType
      else  (FindRaveComponent('txtBlood', MyPage) as TRaveText).Text := '';

      if printOption.Career then
        (FindRaveComponent('txtCareer', MyPage) as TRaveText).Text := a.Career
      else (FindRaveComponent('txtCareer', MyPage) as TRaveText).Text := '';

      if printOption.ServicePlace then
        (FindRaveComponent('txtServiceplace', MyPage) as TRaveText).Text := a.ServicePlace
      else (FindRaveComponent('txtServiceplace', MyPage) as TRaveText).Text := '';

      if printOption.MoveReason then
      begin
        (FindRaveComponent('txtMoveYear', MyPage) as TRaveText).Text := inttostr(Yearof(a.MoveTime));
        (FindRaveComponent('txtMoveMonth', MyPage) as TRaveText).Text := inttostr(MonthOf(a.MoveTime));
        (FindRaveComponent('txtMoveDay', MyPage) as TRaveText).Text := inttostr(DayOf(a.MoveTime));
        (FindRaveComponent('txtMoveReason', MyPage) as TRaveText).Text := ' 因 ' + a.MoveReason + ' 从 ' + a.FromWhere;
        (FindRaveComponent('txtPrintDate', MyPage) as TRaveText).Text := DateToStr(dtpPrintDate.DateTime);
      end else begin
        (FindRaveComponent('txtMoveYear', MyPage) as TRaveText).Text := '';
        (FindRaveComponent('txtMoveMonth', MyPage) as TRaveText).Text := '';
        (FindRaveComponent('txtMoveDay', MyPage) as TRaveText).Text := '';
        (FindRaveComponent('txtMoveReason', MyPage) as TRaveText).Text := '' ;
        (FindRaveComponent('txtPrintDate', MyPage) as TRaveText).Text := '';
      end;

      if printOption.OtherName then
        (FindRaveComponent('txtOthername', MyPage) as TRaveText).Text := a.OtherName
      else (FindRaveComponent('txtOthername', MyPage) as TRaveText).Text := '';

      if printOption.Guardian then
        (FindRaveComponent('txtGuardian', MyPage) as TRaveText).Text := a.Guardian
      else (FindRaveComponent('txtGuardian', MyPage) as TRaveText).Text := '';

      if printOption.GuardRela then
        (FindRaveComponent('txtGuardRela', MyPage) as TRaveText).Text := a.GuardRela
      else (FindRaveComponent('txtGuardRela', MyPage) as TRaveText).Text := '';

      if printOption.Religion then
        (FindRaveComponent('txtReligion', MyPage) as TRaveText).Text := a.Religion
      else (FindRaveComponent('txtReligion', MyPage) as TRaveText).Text := '';

    end;

    dm.rvPrj.ExecuteReport(rpt);

    dm.rvPrj.Close;

end;

procedure TInputForm.statBetween(bDate, eDate: TDate);
var
    SqlStr: widestring;     
begin
    bDate := DateOf(bDate);
    eDate := DateOf(eDate);

    SqlStr := 'SELECT * FROM records '
                + ' WHERE MoveTime > #' + datetimetostr(bDate) +  '# '
                + ' AND MoveTime < #' + datetimetostr(eDate) + '#'
                + ' ORDER BY MoveTime DESC ';

    adods.Close;
    adods.CommandText := SqlStr;
    adods.Open;
end;

end.
