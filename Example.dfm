object frmExample: TfrmExample
  Left = 377
  Top = 230
  Width = 643
  Height = 269
  Caption = '팝빌 휴폐업조회 API SDK for Delphi'
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
    Width = 79
    Height = 13
    AutoSize = False
    Caption = '사업자번호 :'
  end
  object Label2: TLabel
    Left = 230
    Top = 20
    Width = 79
    Height = 13
    AutoSize = False
    Caption = '팝빌아이디 :'
  end
  object GroupBox4: TGroupBox
    Left = 448
    Top = 49
    Width = 144
    Height = 86
    Caption = '파트너 관련'
    TabOrder = 12
  end
  object GroupBox3: TGroupBox
    Left = 300
    Top = 50
    Width = 135
    Height = 85
    Caption = '기타'
    TabOrder = 10
  end
  object GroupBox2: TGroupBox
    Left = 157
    Top = 50
    Width = 132
    Height = 86
    Caption = '포인트 관련'
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 21
    Top = 51
    Width = 127
    Height = 84
    Caption = '회원 정보'
    TabOrder = 6
  end
  object btnGetUnitCost: TButton
    Left = 167
    Top = 99
    Width = 112
    Height = 25
    Caption = '요금 단가 확인'
    TabOrder = 0
    OnClick = btnGetUnitCostClick
  end
  object btnGetBalance: TButton
    Left = 167
    Top = 67
    Width = 111
    Height = 25
    Caption = '잔여포인트 조회'
    TabOrder = 1
    OnClick = btnGetBalanceClick
  end
  object txtCorpNum: TEdit
    Left = 97
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 309
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 3
    Text = 'testkorea'
  end
  object btnJoinMember: TButton
    Left = 29
    Top = 69
    Width = 108
    Height = 25
    Caption = '회원 가입'
    TabOrder = 4
    OnClick = btnJoinMemberClick
  end
  object btnCheckIsMember: TButton
    Left = 29
    Top = 99
    Width = 108
    Height = 25
    Caption = '가입여부 확인'
    TabOrder = 5
    OnClick = btnCheckIsMemberClick
  end
  object btnGetPopbillURL_login: TButton
    Left = 309
    Top = 66
    Width = 117
    Height = 25
    Caption = '팝빌 로그인 URL'
    TabOrder = 8
    OnClick = btnGetPopbillURL_loginClick
  end
  object btnGetPopbillURL_chrg: TButton
    Left = 309
    Top = 98
    Width = 117
    Height = 25
    Caption = '포인트 충전 URL'
    TabOrder = 9
    OnClick = btnGetPopbillURL_chrgClick
  end
  object btnGetPartnerPoint: TButton
    Left = 457
    Top = 66
    Width = 124
    Height = 25
    Caption = '파트너포인트 확인'
    TabOrder = 11
    OnClick = btnGetPartnerPointClick
  end
  object GroupBox5: TGroupBox
    Left = 24
    Top = 152
    Width = 569
    Height = 58
    Caption = '휴폐업조회 관련 API'
    TabOrder = 13
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 99
      Height = 13
      Caption = '조회 사업자번호 :  '
    end
    object txtCheckCorpNum: TEdit
      Left = 132
      Top = 21
      Width = 121
      Height = 21
      ImeName = 'Microsoft IME 2010'
      TabOrder = 0
      Text = '4108600477'
    end
    object btnCheckCorpNum: TButton
      Left = 262
      Top = 18
      Width = 75
      Height = 25
      Caption = '단건 조회'
      TabOrder = 1
      OnClick = btnCheckCorpNumClick
    end
    object btnCheckCorpNums: TButton
      Left = 353
      Top = 17
      Width = 75
      Height = 25
      Caption = '대량 조회'
      TabOrder = 2
      OnClick = btnCheckCorpNumsClick
    end
  end
end
