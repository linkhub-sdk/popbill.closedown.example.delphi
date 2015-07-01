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
        //�������ȸ ��� �ʱ�ȭ.
        closedownService := TClosedownService.Create(LinkID,SecretKey);

        //����ȯ�� ������, true(�׽�Ʈ��), false(�����)
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
        tmp := tmp + 'stateDate(���������) : '+ corpState.stateDate + #13;
        tmp := tmp + 'checkDate(����û Ȯ������) : '+ corpState.checkDate + #13#13;

        tmp := tmp + '* type (��� ����) : null-�˼�����, 1-�Ϲݰ�����, 2-�鼼������, 3-���̰�����, 4-�񿵸�����, �������' +#13;
        tmp := tmp + '* state (���������) : null-�˼�����, 0-��ϵ��� ���� ����ڹ�ȣ, 1-�����, 2-���, 3-�޾�';

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

end.
