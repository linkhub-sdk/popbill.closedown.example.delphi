unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Popbill, PopbillClosedown;
  
const
         //��ũ���̵�.
        LinkID = 'TESTER';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
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
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    txtCheckCorpNum: TEdit;
    Label3: TLabel;
    btnCheckCorpNum: TButton;
    btnCheckCorpNums: TButton;
    btnCheckID: TButton;
    btnGetPartnerPoint: TButton;
    GroupBox6: TGroupBox;
    btnRegistContact: TButton;
    btnListContact: TButton;
    btnUpdateContact: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox7: TGroupBox;
    btnGetChargeInfo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnCheckCorpNumClick(Sender: TObject);
    procedure btnCheckCorpNumsClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPopbillURL_loginClick(Sender: TObject);
    procedure btnGetPopbillURL_chrgClick(Sender: TObject);
    procedure btnGetPartnerPointClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
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
        //�������ȸ ��� �ʱ�ȭ.
        closedownService := TClosedownService.Create(LinkID,SecretKey);

        //����ȯ�� ������, true(�׽�Ʈ��), false(�����)
        closedownService.IsTest := true;

        //Exception ó�� ������, true(�⺻��)
        closedownService.IsThrowException := true;
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
        tmp := tmp + 'stateDate(���������) : '+ corpState.stateDate + #13;
        tmp := tmp + 'checkDate(����û Ȯ������) : '+ corpState.checkDate + #13#13;

        tmp := tmp + '* type (��� ����) : null-�˼�����, 1-�Ϲݰ�����, 2-�鼼������, 3-���̰�����, 4-�񿵸�����, �������' +#13;
        tmp := tmp + '* state (���������) : null-�˼�����, 0-��ϵ��� ���� ����ڹ�ȣ, 1-�����, 2-���, 3-�޾�';

        corpState.Free;
        
        ShowMessage(tmp);

end;


procedure TfrmExample.btnCheckCorpNumsClick(Sender: TObject);
var
        CorpNumList : Array Of String;
        StateList : TCorpStateList;
        tmp : string;
        i : Integer;
begin
        //��ȸ�� ����ڹ�ȣ ���, �ִ� 1000��
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

        tmp := '* type (��� ����) : null-�˼�����, 1-�Ϲݰ�����, 2-�鼼������, 3-���̰�����, 4-�񿵸�����, �������' +#13;
        tmp := tmp + '* state (���������) : null-�˼�����, 0-��ϵ��� ���� ����ڹ�ȣ, 1-�����, 2-���, 3-�޾�' +#13#13;
        
        for i := 0 to Length(StateList) -1 do
        begin
                tmp := tmp +'corpNum : '+ StateList[i].corpNum + #13;
                tmp := tmp +'type : '+ StateList[i].ctype + #13;
                tmp := tmp +'state : '+ StateList[i].state + #13;
                tmp := tmp +'stateDate(���������) : '+ StateList[i].stateDate + #13;
                tmp := tmp +'checkDate(����û Ȯ������) : '+ StateList[i].checkDate + #13#13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        joinInfo.LinkID := LinkID;  //��ũ���̵�
        joinInfo.CorpNum := '1231212312'; //����ڹ�ȣ '-' ����.
        joinInfo.CEOName := '��ǥ�ڼ���';
        joinInfo.CorpName := '��ȣ';
        joinInfo.Addr := '�ּ�';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '����';
        joinInfo.BizClass := '����';
        joinInfo.ID     := 'userid';  //6�� �̻� 20�� �̸�.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6�� �̻� 20�� �̸�.
        joinInfo.ContactName := '����ڸ�';
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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

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

        ShowMessage('��ȸ�ܰ� : '+ FloatToStr(unitcost));

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

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := closedownService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        joinInfo.id := 'userid';                        // [�ʼ�] ���̵� (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';               // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.personName := '����ڼ���';            // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 30�� �̳�)
        joinInfo.tel := '070-7510-3710';                // [�ʼ�] ����ó
        joinInfo.hp := '010-1111-2222';                 // �޴�����ȣ
        joinInfo.fax := '02-6442-9700';                 // �ѽ���ȣ
        joinInfo.email := 'test@test.com';              // [�ʼ�] �̸���
        joinInfo.searchAllAllowYN := false;             // ��ȸ����(true ȸ����ȸ/ false ������ȸ)
        joinInfo.mgrYN     := false;                    // ������ ���ѿ��� 

        try
                response := closedownService.RegistContact(txtCorpNum.text,joinInfo,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin

        try
                InfoList := closedownService.ListContact(txtCorpNum.text,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        contactInfo := TContactInfo.Create;

        contactInfo.personName := '�׽�Ʈ �����';      // ����ڸ�
        contactInfo.tel := '070-7510-3710';             // ����ó
        contactInfo.hp := '010-4324-1111';              // �޴�����ȣ
        contactInfo.email := 'test@test.com';           // �̸��� �ּ�
        contactInfo.fax := '02-6442-9799';              // �ѽ���ȣ
        contactInfo.searchAllAllowYN := true;           // ȸ����ȸ ���ѿ���
        contactInfo.mgrYN := false;                     // ������ ��ȯ ���� 

        try
                response := closedownService.UpdateContact(txtCorpNum.text,contactInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        try
                corpInfo := closedownService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);


end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        corpInfo := TCorpInfo.Create;

        corpInfo.ceoname := '��ǥ�ڸ�';         //��ǥ�ڸ�
        corpInfo.corpName := '�˺�';    // ȸ���
        corpInfo.bizType := '����';             // ����
        corpInfo.bizClass := '����';            // ����
        corpInfo.addr := '����Ư���� ������ ������� 517';  // �ּ�

        try
                response := closedownService.UpdateCorpInfo(txtCorpNum.text,corpInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TClosedownChargeInfo;
        tmp : String;
begin

        try
                chargeInfo := closedownService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);
end;

end.
