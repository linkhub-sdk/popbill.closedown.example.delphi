object frmExample: TfrmExample
  Left = 505
  Top = 259
  Width = 838
  Height = 354
  Caption = '�˺� �������ȸ API SDK for Delphi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 20
    Width = 132
    Height = 13
    AutoSize = False
    Caption = '�˺�ȸ�� ����ڹ�ȣ :'
  end
  object Label2: TLabel
    Left = 302
    Top = 20
    Width = 99
    Height = 13
    AutoSize = False
    Caption = '�˺�ȸ�� ���̵� :'
  end
  object GroupBox7: TGroupBox
    Left = 16
    Top = 48
    Width = 782
    Height = 174
    Caption = '�˺� �⺻ API'
    TabOrder = 14
  end
  object GroupBox4: TGroupBox
    Left = 480
    Top = 65
    Width = 144
    Height = 144
    Caption = '����� ����'
    TabOrder = 11
    object btnRegistContact: TButton
      Left = 8
      Top = 16
      Width = 129
      Height = 25
      Caption = '����� �߰�'
      TabOrder = 0
      OnClick = btnRegistContactClick
    end
    object btnListContact: TButton
      Left = 7
      Top = 48
      Width = 129
      Height = 25
      Caption = '����� ��� ��ȸ'
      TabOrder = 1
      OnClick = btnListContactClick
    end
    object btnUpdateContact: TButton
      Left = 7
      Top = 80
      Width = 129
      Height = 25
      Caption = '����� ���� ����'
      TabOrder = 2
      OnClick = btnUpdateContactClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 324
    Top = 66
    Width = 141
    Height = 144
    Caption = '�˺� �⺻ URL'
    TabOrder = 10
  end
  object GroupBox2: TGroupBox
    Left = 165
    Top = 66
    Width = 148
    Height = 145
    Caption = '����Ʈ ����'
    TabOrder = 7
    object btnGetPartnerPoint: TButton
      Left = 8
      Top = 82
      Width = 124
      Height = 25
      Caption = '��Ʈ������Ʈ ��ȸ'
      TabOrder = 0
      OnClick = btnGetPartnerPointClick
    end
    object btnGetChargeInfo: TButton
      Left = 8
      Top = 16
      Width = 124
      Height = 25
      Caption = '�������� Ȯ��'
      TabOrder = 1
      OnClick = btnGetChargeInfoClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 29
    Top = 67
    Width = 127
    Height = 144
    Caption = 'ȸ�� ����'
    TabOrder = 6
    object btnCheckID: TButton
      Left = 8
      Top = 49
      Width = 108
      Height = 25
      Caption = 'ID �ߺ� Ȯ��'
      TabOrder = 0
      OnClick = btnCheckIDClick
    end
  end
  object btnGetUnitCost: TButton
    Left = 175
    Top = 179
    Width = 125
    Height = 25
    Caption = '��ȸ �ܰ� Ȯ��'
    TabOrder = 0
    OnClick = btnGetUnitCostClick
  end
  object btnGetBalance: TButton
    Left = 175
    Top = 115
    Width = 122
    Height = 25
    Caption = '�ܿ�����Ʈ ��ȸ'
    TabOrder = 1
    OnClick = btnGetBalanceClick
  end
  object txtCorpNum: TEdit
    Left = 161
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 405
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 3
    Text = 'testkorea'
  end
  object btnJoinMember: TButton
    Left = 37
    Top = 149
    Width = 108
    Height = 25
    Caption = 'ȸ�� ����'
    TabOrder = 4
    OnClick = btnJoinMemberClick
  end
  object btnCheckIsMember: TButton
    Left = 37
    Top = 84
    Width = 108
    Height = 25
    Caption = '���Կ��� Ȯ��'
    TabOrder = 5
    OnClick = btnCheckIsMemberClick
  end
  object btnGetPopbillURL_login: TButton
    Left = 333
    Top = 82
    Width = 117
    Height = 25
    Caption = '�˺� �α��� URL'
    TabOrder = 8
    OnClick = btnGetPopbillURL_loginClick
  end
  object btnGetPopbillURL_chrg: TButton
    Left = 333
    Top = 114
    Width = 117
    Height = 25
    Caption = '����Ʈ ���� URL'
    TabOrder = 9
    OnClick = btnGetPopbillURL_chrgClick
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 232
    Width = 569
    Height = 58
    Caption = '�������ȸ ���� API'
    TabOrder = 12
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 99
      Height = 13
      Caption = '��ȸ ����ڹ�ȣ :  '
    end
    object txtCheckCorpNum: TEdit
      Left = 132
      Top = 21
      Width = 121
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
      Text = '6798700433'
    end
    object btnCheckCorpNum: TButton
      Left = 262
      Top = 15
      Width = 83
      Height = 31
      Caption = '�ܰ� ��ȸ'
      TabOrder = 1
      OnClick = btnCheckCorpNumClick
    end
    object btnCheckCorpNums: TButton
      Left = 361
      Top = 15
      Width = 88
      Height = 32
      Caption = '�뷮 ��ȸ'
      TabOrder = 2
      OnClick = btnCheckCorpNumsClick
    end
  end
  object GroupBox6: TGroupBox
    Left = 640
    Top = 65
    Width = 144
    Height = 143
    Caption = 'ȸ������ ����'
    TabOrder = 13
    object btnGetCorpInfo: TButton
      Left = 12
      Top = 16
      Width = 121
      Height = 25
      Caption = 'ȸ������ ��ȸ'
      TabOrder = 0
      OnClick = btnGetCorpInfoClick
    end
    object btnUpdateCorpInfo: TButton
      Left = 12
      Top = 48
      Width = 121
      Height = 25
      Caption = 'ȸ������ ����'
      TabOrder = 1
      OnClick = btnUpdateCorpInfoClick
    end
  end
end
