{******************************************************************************}
{
{ �˺� �������ȸ API Delphi SDK Example
{ Delphi ���� Ʃ�丮�� �ȳ� : https://developers.popbill.com/guide/closedown/delphi/getting-started/tutorial
{
{ ������Ʈ ���� : 2024-02-27
{ ����������� ����ó : 1600-9854
{ ����������� �̸��� : code@linkhubcorp.com
{
{ <�׽�Ʈ �������� �غ����>
{ 1) API Key ���� (������û �� ���Ϸ� ���޵� ����)
{     - LinkID : ��ũ��꿡�� �߱��� ��ũ���̵�
{     - SecretKey : ��ũ��꿡�� �߱��� ���Ű
{ 2) SDK ȯ�漳�� �ɼ� ����
{    - IsTest : ����ȯ�� ����, true-�׽�Ʈ, false-�(Production), (�⺻��:true)
{    - IsThrowException : ���� ó�� ����, true-���, false-�̻��, (�⺻��:true)
{    - IPRestrictOnOff : ������ū IP ���� ����, true-���, false-�̻��, (�⺻��:true)
{    - UseLocalTimeYN : ���ýý��� �ð� ��뿩��, true-���, false-�̻��, (�⺻��:true)
{
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Popbill, PopbillClosedown;

const

        // ��ũ���̵�
        LinkID = 'TESTER';

        // ���Ű
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
        // �������ȸ ��� �ʱ�ȭ
        closedownService := TClosedownService.Create(LinkID,SecretKey);

        // ����ȯ�� ����, true-�׽�Ʈ, false-�(Production), (�⺻��:true)
        closedownService.IsTest := true;

        // ���� ó�� ����, true-���, false-�̻��, (�⺻��:true)
        closedownService.IsThrowException := true;

        // ������ū IP ���� ����, true-���, false-�̻��, (�⺻��:true)
        closedownService.IPRestrictOnOff := true;

        // ���ýý��� �ð� ��뿩��, true-���, false-�̻��, (�⺻��:true)
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
        { ����ڹ�ȣ 1�ǿ� ���� ����������� Ȯ���մϴ�.
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
                tmp := 'corpNum (����ڹ�ȣ) : '+ corpState.corpNum + #13;
                tmp := tmp + 'taxType (����� ��������) : '+ corpState.taxType + #13;
                tmp := tmp + 'typeDate(�������� ��ȯ����) : '+ corpState.typeDate + #13;
                tmp := tmp + 'state (���������) : '+ corpState.state + #13;
                tmp := tmp + 'stateDate(���������) : '+ corpState.stateDate + #13;
                tmp := tmp + 'checkDate(����û Ȯ������) : '+ corpState.checkDate + #13#13;

                tmp := tmp + '* taxType (����� ��������) : null-��Ȯ��, 10-�Ϲݰ�����, 20-�鼼������, 30-���̰�����, 31-���̰�����(���ݰ�꼭 �߱޻����), 40-�񿵸�����, �������' +#13;
                tmp := tmp + '* state (���������) : null-��Ȯ��, 0-��ϵ��� ���� ����ڹ�ȣ, 1-�����, 2-���, 3-�޾�';

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
        { �ټ����� ����ڹ�ȣ�� ���� ����������� Ȯ���մϴ�. (�ִ� 1,000��)
        { - https://developers.popbill.com/reference/closedown/delphi/api/check#CheckCorpNums
        {**********************************************************************}

        //��ȸ�� ����ڹ�ȣ ���, �ִ� 1000��
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
                tmp := '* taxType (����� ��������) : null-��Ȯ��, 10-�Ϲݰ�����, 20-�鼼������, 30-���̰�����, 31-���̰�����(���ݰ�꼭 �߱޻����), 40-�񿵸�����, �������' +#13;
                tmp := tmp + '* state (���������) : null-��Ȯ��, 0-��ϵ��� ���� ����ڹ�ȣ, 1-�����, 2-���, 3-�޾�' +#13#13;

                for i := 0 to Length(StateList) -1 do
                begin
                        tmp := tmp +'corpNum(����ڹ�ȣ) : '+ StateList[i].corpNum + #13;
                        tmp := tmp +'taxType(����� ��������) : '+ StateList[i].taxType + #13;
                        tmp := tmp +'typeDate(�������� ��ȯ����) : '+ StateList[i].typeDate + #13;
                        tmp := tmp +'state(���������) : '+ StateList[i].state + #13;
                        tmp := tmp +'stateDate(���������) : '+ StateList[i].stateDate + #13;
                        tmp := tmp +'checkDate(����û Ȯ������) : '+ StateList[i].checkDate + #13#13;
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
        { ����ڸ� ����ȸ������ ����ó���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#JoinMember
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '1234567890';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := closedownService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ����ڹ�ȣ�� ��ȸ�Ͽ� ����ȸ�� ���Կ��θ� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#CheckIsMember
        {**********************************************************************}

        try
                response := closedownService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetBalance
        {**********************************************************************}
        
        try
                balance := closedownService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ����� ��ȸ�� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetUnitCost
        {**********************************************************************}

        try
                unitcost := closedownService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(closedownService.LastErrCode) + #10#13 +'����޽��� : '+ closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('��ȸ�ܰ� : '+ FloatToStr(unitcost));
        end;

end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �˺� ����Ʈ�� �α��� ���·� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#GetAccessURL
        {**********************************************************************}

        try
                resultURL := closedownService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := closedownService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetPartnerBalance
        {**********************************************************************}
        
        try
                balance := closedownService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;

end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ����ϰ��� �ϴ� ���̵��� �ߺ����θ� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#CheckID
        {**********************************************************************}
        
        try
                response := closedownService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� �����(�˺� �α��� ����)�� �߰��մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := closedownService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
               ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;

end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := closedownService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
               tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchRole(����� ����) | ';
                tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

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
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ �����մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';

        try
                response := closedownService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
               ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := closedownService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                 tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
                 tmp := tmp + 'CeoName (��ǥ�ڼ���) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := closedownService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage(IntToStr(closedownService.LastErrCode) + ' | ' +  closedownService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 + '����޽��� : '+ response.Message);
        end;
       
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TClosedownChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� �������ȸ API ���� ���������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := closedownService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(closedownService.LastErrCode) + #10#13 +'����޽��� : '+ closedownService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := closedownService.getPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����Ʈ �������� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := closedownService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����Ʈ ��볻�� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := closedownService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
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
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/closedown/delphi/api/member#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := closedownService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if closedownService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(closedownService.LastErrCode) + #10#13 +'����޽��� : '+ closedownService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
