unit frmPrintOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TPrintOptionForm = class(TForm)
    GroupBox1: TGroupBox;
    HukouType: TCheckBox;
    master: TCheckBox;
    relation: TCheckBox;
    name: TCheckBox;
    gender: TCheckBox;
    birthday: TCheckBox;
    Nationality: TCheckBox;
    Native: TCheckBox;
    BirthPlace: TCheckBox;
    IDCard: TCheckBox;
    CardSignDate: TCheckBox;
    Education: TCheckBox;
    Marrage: TCheckBox;
    Military: TCheckBox;
    Height: TCheckBox;
    BloodType: TCheckBox;
    Career: TCheckBox;
    ServicePlace: TCheckBox;
    Address: TCheckBox;
    MoveReason: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    eCopName: TEdit;
    rgPrintType: TRadioGroup;
    Label2: TLabel;
    othername: TCheckBox;
    Religion: TCheckBox;
    Guardian: TCheckBox;
    GuardRela: TCheckBox;
    cbAll: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintOptionForm: TPrintOptionForm;

implementation

uses unitPubMethod, unitPrintOption;

{$R *.dfm}

procedure TPrintOptionForm.BitBtn1Click(Sender: TObject);
var
  printOption: TPrintOption;
begin
    if (trim(eCopName.Text)='') then
    begin
      infoMsg('单位名称必填');
      eCopName.SetFocus;
      exit;
    end;
    WriteStrIni('SETTING', 'COMPANY', trim(eCopName.Text));

    WriteIntIni('SETTING', 'PRINTTYPE', rgPrintType.ItemIndex);

    printOption := TPrintOption.Create;

    printOption.HukouType := HukouType.Checked;
    printOption.Master := master.Checked;
    printOption.Relation := relation.Checked;
    printOption.Name := name.Checked;
    printOption.Gender := gender.Checked;
    printOption.Birthday := birthday.Checked;
    printOption.Nationality := Nationality.Checked;
    printOption.Native := Native.Checked;
    printOption.BirthPlace := BirthPlace.Checked;
    printOption.IDCard := IDCard.Checked;
    printOption.CardSignDate := CardSignDate.Checked;
    printOption.Education := Education.Checked;
    printOption.Marrage := Marrage.Checked;
    printOption.Military := Military.Checked;
    printOption.Height := Height.Checked;
    printOption.BloodType := BloodType.Checked;
    printOption.Career := Career.Checked;
    printOption.ServicePlace := ServicePlace.Checked;
    printOption.Address := Address.Checked;
    printOption.MoveReason := MoveReason.Checked;

    printOption.OtherName := OtherName.Checked ;
    printOption.Religion := Religion.Checked;
    printOption.Guardian := Guardian.Checked;
    printOption.GuardRela := GuardRela.Checked;
    
    printOption.writeIsPrint;
    printOption.Free;
    infoMsg('保存成功，请继续');

end;

procedure TPrintOptionForm.BitBtn2Click(Sender: TObject);
begin
    close;
end;

procedure TPrintOptionForm.cbAllClick(Sender: TObject);
var
  i: integer;
begin
    for I := 0 to GroupBox1.ControlCount - 1 do
    begin
      if (GroupBox1.Controls[i].ClassName = 'TCheckBox') then
        (GroupBox1.Controls[i] as TCheckBox).Checked :=cbAll.Checked;
    end;
      
end;

procedure TPrintOptionForm.FormShow(Sender: TObject);
var
  printOption: TPrintOption;
begin

    eCopName.Text := ReadStrIni('SETTING', 'COMPANY', '西安格瑞艾普科技有限公司');
    rgPrintType.ItemIndex := ReadIntIni('SETTING', 'PRINTTYPE', 0);

    printOption := TPrintOption.Create;
    printOption.readIsPrint;

    HukouType.Checked := printOption.HukouType;
    master.Checked := printOption.master;
    relation.Checked := printOption.relation;
    name.Checked := printOption.name;
    gender.Checked := printOption.gender;
    birthday.Checked := printOption.birthday;
    Nationality.Checked := printOption.Nationality;
    Native.Checked := printOption.Native;
    BirthPlace.Checked := printOption.BirthPlace;
    IDCard.Checked := printOption.IDCard;
    CardSignDate.Checked := printOption.CardSignDate;
    Education.Checked := printOption.Education;
    Marrage.Checked := printOption.Marrage;
    Military.Checked := printOption.Military;
    Height.Checked := printOption.Height;
    BloodType.Checked := printOption.BloodType;
    Career.Checked := printOption.Career;
    ServicePlace.Checked := printOption.ServicePlace;
    Address.Checked := printOption.Address;
    MoveReason.Checked := printOption.MoveReason;

    OtherName.Checked := printOption.OtherName;
    Religion.Checked := printOption.Religion;
    Guardian.Checked := printOption.Guardian;
    GuardRela.Checked := printOption.GuardRela;

    printOption.Free;
    
end;

end.
