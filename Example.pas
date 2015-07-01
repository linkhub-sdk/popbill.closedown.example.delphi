unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Popbill, PopbillClosedown;
  
const
         //링크아이디.
        LinkID = 'TESTER';
        // 파트너 통신용 비밀키. 유출 주의.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';
type
  TfrmExample = class(TForm)
    btnGetUnitCost: TButton;
    btnGetBalance: TButton;
    txtCorpNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtUserID: TEdit;
    btnJoinMember: TButton;
    btnCheckIsMember: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnGetPopbillURL_login: TButton;
    btnGetPopbillURL_chrg: TButton;
    GroupBox3: TGroupBox;
    btnGetPartnerPoint: TButton;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    txtCheckCorpNum: TEdit;
    Label3: TLabel;
    btnCheckCorpNum: TButton;
    btnCheckCorpNums: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCheckCorpNumClick(Sender: TObject);
    procedure btnCheckCorpNumsClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPopbillURL_loginClick(Sender: TObject);
    procedure btnGetPopbillURL_chrgClick(Sender: TObject);
    procedure btnGetPartnerPointClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;
  closedownService : TClosedownService;

implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        //휴폐업조회 모듈 초기화.
        closedownService := TClosedownService.Create(LinkID,SecretKey);

        //연동환경 설정값, true(테스트용), false(상업용)
        closedownService.IsTest := true;
end;

procedure TfrmExample.btnCheckCorpNumClick(Sender: TObject);
var
        corpState : TCorpState;
        tmp : string;
begin
        try
                corpState := closedownService.checkCorpNum(txtCheckCorpNum.text, txtCorpNum.Text, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'corpNum : '+ corpState.corpNum + #13;
        tmp := tmp + 'type : '+ corpState.ctype + #13;
        tmp := tmp + 'state : '+ corpState.state + #13;
        tmp := tmp + 'stateDate(휴폐업일자) : '+ corpState.stateDate + #13;
        tmp := tmp + 'checkDate(국세청 확인일자) : '+ corpState.checkDate + #13#13;

        tmp := tmp + '* type (사업 유형) : null-알수없음, 1-일반과세자, 2-면세과세자, 3-간이과세자, 4-비영리법인, 국가기관' +#13;
        tmp := tmp + '* state (휴폐업상태) : null-알수없음, 0-등록되지 않은 사업자번호, 1-사업중, 2-폐업, 3-휴업';

        ShowMessage(tmp);

end;


procedure TfrmExample.btnCheckCorpNumsClick(Sender: TObject);
var
        CorpNumList : Array Of String;
        StateList : TCorpStateList;
        tmp : string;
        i : Integer;
begin
        //조회할 사업자번호 목록, 최대 1000건
        SetLength(CorpNumList,3);
        CorpNumList[0] := '1234567890';
        CorpNumList[1] := '4352343543';
        CorpNumList[2] := '4108600477';

        try
                StateList := closedownService.checkCorpNums(CorpNumList, txtCorpNum.Text, txtUserID.text);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := '* type (사업 유형) : null-알수없음, 1-일반과세자, 2-면세과세자, 3-간이과세자, 4-비영리법인, 국가기관' +#13;
        tmp := tmp + '* state (휴폐업상태) : null-알수없음, 0-등록되지 않은 사업자번호, 1-사업중, 2-폐업, 3-휴업' +#13#13;
        
        for i := 0 to Length(StateList) -1 do
        begin
                tmp := tmp +'corpNum : '+ StateList[i].corpNum + #13;
                tmp := tmp +'type : '+ StateList[i].ctype + #13;
                tmp := tmp +'state : '+ StateList[i].state + #13;
                tmp := tmp +'stateDate(휴폐업일자) : '+ StateList[i].stateDate + #13;
                tmp := tmp +'checkDate(국세청 확인일자) : '+ StateList[i].checkDate + #13#13;
        end;
        ShowMessage(tmp);

end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        joinInfo.LinkID := LinkID;  //링크아이디
        joinInfo.CorpNum := '1231212312'; //사업자번호 '-' 제외.
        joinInfo.CEOName := '대표자성명';
        joinInfo.CorpName := '상호';
        joinInfo.Addr := '주소';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '업태';
        joinInfo.BizClass := '업종';
        joinInfo.ID     := 'userid';  //6자 이상 20자 미만.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6자 이상 20자 미만.
        joinInfo.ContactName := '담당자명';
        joinInfo.ContactTEL :='02-999-9999';
        joinInfo.ContactHP := '010-1234-5678';
        joinInfo.ContactFAX := '02-999-9998';
        joinInfo.ContactEmail := 'test@test.com';

        try
                response := closedownService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := closedownService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        try
                balance := closedownService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        try
                unitcost := closedownService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('조회단가 : '+ FloatToStr(unitcost));

end;

procedure TfrmExample.btnGetPopbillURL_loginClick(Sender: TObject);
var
  resultURL : String;

begin
        try
                resultURL := closedownService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopbillURL_chrgClick(Sender: TObject);
var
  resultURL : String;

begin
        try
                resultURL := closedownService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPartnerPointClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := closedownService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));
end;

end.
