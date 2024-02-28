{******************************************************************************}
{
{ 팝빌 휴폐업조회 API Delphi SDK Example
{ Delphi 연동 튜토리얼 안내 : https://developers.popbill.com/guide/closedown/delphi/getting-started/tutorial
{
{ 업데이트 일자 : 2024-02-27
{ 연동기술지원 연락처 : 1600-9854
{ 연동기술지원 이메일 : code@linkhubcorp.com
{
{ <테스트 연동개발 준비사항>
{ 1) API Key 변경 (연동신청 시 메일로 전달된 정보)
{     - LinkID : 링크허브에서 발급한 링크아이디
{     - SecretKey : 링크허브에서 발급한 비밀키
{ 2) SDK 환경설정 옵션 설정
{    - IsTest : 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
{    - IsThrowException : 예외 처리 설정, true-사용, false-미사용, (기본값:true)
{    - IPRestrictOnOff : 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
{    - UseLocalTimeYN : 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
{
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Popbill, PopbillClosedown;

const

        // 링크아이디
        LinkID = 'TESTER';

        // 비밀키
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';
type
  TfrmExample = class(TForm)
    btnGetUnitCost: TButton;
    txtCorpNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtUserID: TEdit;
    btnJoinMember: TButton;
    btnCheckIsMember: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnGetAccessURL: TButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    txtCheckCorpNum: TEdit;
    Label3: TLabel;
    btnCheckCorpNum: TButton;
    btnCheckCorpNums: TButton;
    btnCheckID: TButton;
    GroupBox6: TGroupBox;
    btnRegistContact: TButton;
    btnListContact: TButton;
    btnUpdateContact: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox7: TGroupBox;
    btnGetChargeInfo: TButton;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    btnGetPartnerPoint: TButton;
    btnGetPartnerURL_CHRG: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    txtURL: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnCheckCorpNumClick(Sender: TObject);
    procedure btnCheckCorpNumsClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetPartnerPointClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
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
        // 휴폐업조회 모듈 초기화
        closedownService := TClosedownService.Create(LinkID,SecretKey);

        // 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
        closedownService.IsTest := true;

        // 예외 처리 설정, true-사용, false-미사용, (기본값:true)
        closedownService.IsThrowException := true;

        // 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
        closedownService.IPRestrictOnOff := true;

        // 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
        closedownService.UseLocalTimeYN := false;
end;

function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.FormClose(Sender: TObject; var Action:TCloseAction);
begin
        closedownService.Free;
        Action := caFree;
end;


procedure TfrmExample.btnCheckCorpNumClick(Sender: TObject);
var
        corpState : TCorpState;
        tmp : string;
begin
        {**********************************************************************}
        { 사업자번호 1건에 대한 휴폐업정보를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/check#CheckCorpNum
        {**********************************************************************}

        try
                corpState := closedownService.checkCorpNum(txtCheckCorpNum.text, txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                tmp := 'corpNum (사업자번호) : '+ corpState.corpNum + #13;
                tmp := tmp + 'taxType (사업자 과세유형) : '+ corpState.taxType + #13;
                tmp := tmp + 'typeDate(과세유형 전환일자) : '+ corpState.typeDate + #13;
                tmp := tmp + 'state (휴폐업상태) : '+ corpState.state + #13;
                tmp := tmp + 'stateDate(휴폐업일자) : '+ corpState.stateDate + #13;
                tmp := tmp + 'checkDate(국세청 확인일자) : '+ corpState.checkDate + #13#13;

                tmp := tmp + '* taxType (사업자 과세유형) : null-미확인, 10-일반과세자, 20-면세과세자, 30-간이과세자, 31-간이과세자(세금계산서 발급사업자), 40-비영리법인, 국가기관' +#13;
                tmp := tmp + '* state (휴폐업상태) : null-미확인, 0-등록되지 않은 사업자번호, 1-사업중, 2-폐업, 3-휴업';

                corpState.Free;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnCheckCorpNumsClick(Sender: TObject);
var
        CorpNumList : Array Of String;
        StateList : TCorpStateList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 다수건의 사업자번호에 대한 휴폐업정보를 확인합니다. (최대 1,000건)
        { - https://developers.popbill.com/reference/closedown/delphi/api/check#CheckCorpNums
        {**********************************************************************}

        //조회할 사업자번호 목록, 최대 1000건
        SetLength(CorpNumList,3);
        CorpNumList[0] := '1234567890';
        CorpNumList[1] := '1234512345';
        CorpNumList[2] := '6798700433';

        try
                StateList := closedownService.checkCorpNums(CorpNumList, txtCorpNum.Text);

        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                tmp := '* taxType (사업자 과세유형) : null-미확인, 10-일반과세자, 20-면세과세자, 30-간이과세자, 31-간이과세자(세금계산서 발급사업자), 40-비영리법인, 국가기관' +#13;
                tmp := tmp + '* state (휴폐업상태) : null-미확인, 0-등록되지 않은 사업자번호, 1-사업중, 2-폐업, 3-휴업' +#13#13;

                for i := 0 to Length(StateList) -1 do
                begin
                        tmp := tmp +'corpNum(사업자번호) : '+ StateList[i].corpNum + #13;
                        tmp := tmp +'taxType(사업자 과세유형) : '+ StateList[i].taxType + #13;
                        tmp := tmp +'typeDate(과세유형 전환일자) : '+ StateList[i].typeDate + #13;
                        tmp := tmp +'state(휴폐업상태) : '+ StateList[i].state + #13;
                        tmp := tmp +'stateDate(휴폐업일자) : '+ StateList[i].stateDate + #13;
                        tmp := tmp +'checkDate(국세청 확인일자) : '+ StateList[i].checkDate + #13#13;
                end;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { 사용자를 연동회원으로 가입처리합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#JoinMember
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '1234567890';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := closedownService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사업자번호를 조회하여 연동회원 가입여부를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#CheckIsMember
        {**********************************************************************}

        try
                response := closedownService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetBalance
        {**********************************************************************}
        
        try
                balance := closedownService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { 휴폐업 조회시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetUnitCost
        {**********************************************************************}

        try
                unitcost := closedownService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(closedownService.LastErrCode) + #10#13 +'응답메시지 : '+ closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('조회단가 : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 사이트에 로그인 상태로 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#GetAccessURL
        {**********************************************************************}

        try
                resultURL := closedownService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := closedownService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetPartnerPointClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := closedownService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사용하고자 하는 아이디의 중복여부를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#CheckID
        {**********************************************************************}
        
        try
                response := closedownService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 담당자(팝빌 로그인 계정)를 추가합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := closedownService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
               ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;

end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 목록을 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := closedownService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
               tmp := 'id(아이디) | email(이메일) | hp(휴대폰) | personName(성명) | searchRole(담당자 권한) | ';
                tmp := tmp + 'tel(연락처) | fax(팩스) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';
                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin

        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 수정합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';

        try
                response := closedownService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
               ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := closedownService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                 tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
                 tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := closedownService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 + '응답메시지 : '+ response.Message);
        end;
       
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TClosedownChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 휴폐업조회 API 서비스 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := closedownService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(closedownService.LastErrCode) + #10#13 +'응답메시지 : '+ closedownService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := closedownService.getPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 결제내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := closedownService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := closedownService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 확인합니다.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := closedownService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(closedownService.LastErrCode) + #10#13 +'응답메시지 : '+ closedownService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
