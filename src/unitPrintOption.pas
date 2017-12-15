unit unitPrintOption;

interface

type
  TPrintOption = class
  private
    FMoveReason: boolean;
    FCardSignDate: boolean;
    FName: boolean;
    FMarrage: boolean;
    FIDCard: boolean;
    FBirthday: boolean;
    FMaster: boolean;
    FServicePlace: boolean;
    FGender: boolean;
    FEducation: boolean;
    FNationality: boolean;
    FNative: boolean;
    FBloodType: boolean;
    FHukouType: boolean;
    FAddress: boolean;
    FRelation: boolean;
    FHeight: boolean;
    FCareer: boolean;
    FBirthPlace: boolean;
    FMilitary: boolean;
    FReligion: boolean;
    FGuardian: boolean;
    FOtherName: boolean;
    FGuardRela: boolean;
    procedure SetAddress(const Value: boolean);
    procedure SetBirthday(const Value: boolean);
    procedure SetBirthPlace(const Value: boolean);
    procedure SetBloodType(const Value: boolean);
    procedure SetCardSignDate(const Value: boolean);
    procedure SetCareer(const Value: boolean);
    procedure SetEducation(const Value: boolean);
    procedure SetGender(const Value: boolean);
    procedure SetHeight(const Value: boolean);
    procedure SetHukouType(const Value: boolean);
    procedure SetIDCard(const Value: boolean);
    procedure SetMarrage(const Value: boolean);
    procedure SetMaster(const Value: boolean);
    procedure SetMilitary(const Value: boolean);
    procedure SetMoveReason(const Value: boolean);
    procedure SetName(const Value: boolean);
    procedure SetNationality(const Value: boolean);
    procedure SetNative(const Value: boolean);
    procedure SetRelation(const Value: boolean);
    procedure SetServicePlace(const Value: boolean);
    procedure SetGuardian(const Value: boolean);
    procedure SetGuardRela(const Value: boolean);
    procedure SetOtherName(const Value: boolean);
    procedure SetReligion(const Value: boolean);
  public
    procedure readIsPrint();
    procedure writeIsPrint();

  published
    property HukouType: boolean read FHukouType write SetHukouType;
    property Master: boolean read FMaster write SetMaster;
    property Relation: boolean read FRelation write SetRelation;
    property Name: boolean read FName write SetName;
    property Gender: boolean read FGender write SetGender;
    property Birthday: boolean read FBirthday write SetBirthday;
    property Nationality: boolean read FNationality write SetNationality;
    property Native: boolean read FNative write SetNative;
    property BirthPlace: boolean read FBirthPlace write SetBirthPlace;
    property IDCard: boolean read FIDCard write SetIDCard;
    property CardSignDate: boolean read FCardSignDate write SetCardSignDate;
    property Education: boolean read FEducation write SetEducation;
    property Marrage: boolean read FMarrage write SetMarrage;
    property Military: boolean read FMilitary write SetMilitary;
    property Height: boolean read FHeight write SetHeight;
    property BloodType: boolean read FBloodType write SetBloodType;
    property Career: boolean read FCareer write SetCareer;
    property ServicePlace: boolean read FServicePlace write SetServicePlace;
    property Address: boolean read FAddress write SetAddress;
    property MoveReason: boolean read FMoveReason write SetMoveReason;

    property OtherName: boolean read FOtherName write SetOtherName;
    property Religion: boolean read FReligion write SetReligion;
    property Guardian: boolean read FGuardian write SetGuardian;
    property GuardRela: boolean read FGuardRela write SetGuardRela;
  end;


implementation

uses unitPubMethod;

{ TPrintOption }

procedure TPrintOption.readIsPrint;
begin
    HukouType := ReadBoolIni('PRINTITEM', 'HukouType', true);
    master := ReadBoolIni('PRINTITEM', 'master', true);
    relation := ReadBoolIni('PRINTITEM', 'relation', true);
    name := ReadBoolIni('PRINTITEM', 'name', true);
    gender := ReadBoolIni('PRINTITEM', 'gender', true);
    birthday := ReadBoolIni('PRINTITEM', 'birthday', true);
    Nationality := ReadBoolIni('PRINTITEM', 'Nationality', true);
    Native := ReadBoolIni('PRINTITEM', 'Native', true);
    BirthPlace := ReadBoolIni('PRINTITEM', 'BirthPlace', true);
    IDCard := ReadBoolIni('PRINTITEM', 'IDCard', true);
    CardSignDate := ReadBoolIni('PRINTITEM', 'CardSignDate', true);
    Education := ReadBoolIni('PRINTITEM', 'Education', true);
    Marrage := ReadBoolIni('PRINTITEM', 'Marrage', true);
    Military := ReadBoolIni('PRINTITEM', 'Military', true);
    Height := ReadBoolIni('PRINTITEM', 'Height', true);
    BloodType := ReadBoolIni('PRINTITEM', 'BloodType', true);
    Career := ReadBoolIni('PRINTITEM', 'Career', true);
    ServicePlace := ReadBoolIni('PRINTITEM', 'ServicePlace', true);
    Address := ReadBoolIni('PRINTITEM', 'Address', true);
    MoveReason := ReadBoolIni('PRINTITEM', 'MoveReason', true);

    OtherName := ReadBoolIni('PRINTITEM', 'OtherName', true);
    Religion := ReadBoolIni('PRINTITEM', 'Religion', true);
    Guardian := ReadBoolIni('PRINTITEM', 'Guardian', true);
    GuardRela := ReadBoolIni('PRINTITEM', 'GuardRela', true);

end;

procedure TPrintOption.SetAddress(const Value: boolean);
begin
  FAddress := Value;
end;

procedure TPrintOption.SetBirthday(const Value: boolean);
begin
  FBirthday := Value;
end;

procedure TPrintOption.SetBirthPlace(const Value: boolean);
begin
  FBirthPlace := Value;
end;

procedure TPrintOption.SetBloodType(const Value: boolean);
begin
  FBloodType := Value;
end;

procedure TPrintOption.SetCardSignDate(const Value: boolean);
begin
  FCardSignDate := Value;
end;

procedure TPrintOption.SetCareer(const Value: boolean);
begin
  FCareer := Value;
end;

procedure TPrintOption.SetEducation(const Value: boolean);
begin
  FEducation := Value;
end;

procedure TPrintOption.SetGender(const Value: boolean);
begin
  FGender := Value;
end;

procedure TPrintOption.SetGuardian(const Value: boolean);
begin
  FGuardian := Value;
end;

procedure TPrintOption.SetGuardRela(const Value: boolean);
begin
  FGuardRela := Value;
end;

procedure TPrintOption.SetHeight(const Value: boolean);
begin
  FHeight := Value;
end;

procedure TPrintOption.SetHukouType(const Value: boolean);
begin
  FHukouType := Value;
end;

procedure TPrintOption.SetIDCard(const Value: boolean);
begin
  FIDCard := Value;
end;

procedure TPrintOption.SetMarrage(const Value: boolean);
begin
  FMarrage := Value;
end;

procedure TPrintOption.SetMaster(const Value: boolean);
begin
  FMaster := Value;
end;

procedure TPrintOption.SetMilitary(const Value: boolean);
begin
  FMilitary := Value;
end;

procedure TPrintOption.SetMoveReason(const Value: boolean);
begin
  FMoveReason := Value;
end;

procedure TPrintOption.SetName(const Value: boolean);
begin
  FName := Value;
end;

procedure TPrintOption.SetNationality(const Value: boolean);
begin
  FNationality := Value;
end;

procedure TPrintOption.SetNative(const Value: boolean);
begin
  FNative := Value;
end;

procedure TPrintOption.SetOtherName(const Value: boolean);
begin
  FOtherName := Value;
end;

procedure TPrintOption.SetRelation(const Value: boolean);
begin
  FRelation := Value;
end;

procedure TPrintOption.SetReligion(const Value: boolean);
begin
  FReligion := Value;
end;

procedure TPrintOption.SetServicePlace(const Value: boolean);
begin
  FServicePlace := Value;
end;

procedure TPrintOption.writeIsPrint;
begin
    WriteBoolIni('PRINTITEM', 'HukouType', HukouType);
    WriteBoolIni('PRINTITEM', 'Master', master);
    WriteBoolIni('PRINTITEM', 'Relation', relation);
    WriteBoolIni('PRINTITEM', 'Name', name);
    WriteBoolIni('PRINTITEM', 'Gender', gender);
    WriteBoolIni('PRINTITEM', 'Birthday', birthday);
    WriteBoolIni('PRINTITEM', 'Nationality', Nationality);
    WriteBoolIni('PRINTITEM', 'Native', Native);
    WriteBoolIni('PRINTITEM', 'BirthPlace', BirthPlace);
    WriteBoolIni('PRINTITEM', 'IDCard', IDCard);
    WriteBoolIni('PRINTITEM', 'CardSignDate', CardSignDate);
    WriteBoolIni('PRINTITEM', 'Education', Education);
    WriteBoolIni('PRINTITEM', 'Marrage', Marrage);
    WriteBoolIni('PRINTITEM', 'Military', Military);
    WriteBoolIni('PRINTITEM', 'Height', Height);
    WriteBoolIni('PRINTITEM', 'BloodType', BloodType);
    WriteBoolIni('PRINTITEM', 'Career', Career);
    WriteBoolIni('PRINTITEM', 'ServicePlace', ServicePlace);
    WriteBoolIni('PRINTITEM', 'Address', Address);
    WriteBoolIni('PRINTITEM', 'MoveReason', MoveReason);

    WriteBoolIni('PRINTITEM', 'OtherName', OtherName);
    WriteBoolIni('PRINTITEM', 'Religion', Religion);
    WriteBoolIni('PRINTITEM', 'Guardian', Guardian);
    WriteBoolIni('PRINTITEM', 'GuardRela', GuardRela);
end;


end.
