object frmExample: TfrmExample
  Left = 704
  Top = 508
  Width = 1131
  Height = 355
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
    Width = 132
    Height = 13
    AutoSize = False
    Caption = '팝빌회원 사업자번호 :'
  end
  object Label2: TLabel
    Left = 302
    Top = 20
    Width = 99
    Height = 13
    AutoSize = False
    Caption = '팝빌회원 아이디 :'
  end
  object GroupBox7: TGroupBox
    Left = 16
    Top = 48
    Width = 1089
    Height = 169
    Caption = '팝빌 기본 API'
    TabOrder = 12
    object GroupBox8: TGroupBox
      Left = 768
      Top = 16
      Width = 144
      Height = 145
      Caption = '연동과금 포인트'
      TabOrder = 0
      object btnGetBalance: TButton
        Left = 9
        Top = 19
        Width = 129
        Height = 25
        Caption = '잔여포인트 조회'
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 9
        Top = 50
        Width = 129
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 80
        Width = 129
        Height = 25
        Caption = '포인트 결제내역 URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 112
        Width = 129
        Height = 25
        Caption = '포인트 사용내역 URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox9: TGroupBox
      Left = 920
      Top = 16
      Width = 147
      Height = 122
      Caption = '파트너과금 포인트'
      TabOrder = 1
      object btnGetPartnerPoint: TButton
        Left = 8
        Top = 18
        Width = 127
        Height = 25
        Caption = '파트너포인트 조회'
        TabOrder = 0
        OnClick = btnGetPartnerPointClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 48
        Width = 128
        Height = 25
        Caption = '포인트 충전 URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 480
    Top = 65
    Width = 144
    Height = 144
    Caption = '담당자 관련'
    TabOrder = 9
    object btnRegistContact: TButton
      Left = 8
      Top = 16
      Width = 129
      Height = 25
      Caption = '담당자 추가'
      TabOrder = 0
      OnClick = btnRegistContactClick
    end
    object btnListContact: TButton
      Left = 7
      Top = 80
      Width = 129
      Height = 25
      Caption = '담당자 목록 조회'
      TabOrder = 1
      OnClick = btnListContactClick
    end
    object btnUpdateContact: TButton
      Left = 7
      Top = 112
      Width = 129
      Height = 25
      Caption = '담당자 정보 수정'
      TabOrder = 2
      OnClick = btnUpdateContactClick
    end
    object btnGetContactInfo: TButton
      Left = 8
      Top = 48
      Width = 129
      Height = 25
      Caption = '담당자 정보 확인'
      TabOrder = 3
      OnClick = btnGetContactInfoClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 332
    Top = 66
    Width = 141
    Height = 118
    Caption = '팝빌 기본 URL'
    TabOrder = 8
  end
  object GroupBox2: TGroupBox
    Left = 165
    Top = 66
    Width = 148
    Height = 119
    Caption = '포인트 관련'
    TabOrder = 6
    object btnGetChargeInfo: TButton
      Left = 8
      Top = 16
      Width = 128
      Height = 25
      Caption = '과금정보 확인'
      TabOrder = 0
      OnClick = btnGetChargeInfoClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 29
    Top = 67
    Width = 127
    Height = 118
    Caption = '회원 정보'
    TabOrder = 5
    object btnCheckID: TButton
      Left = 8
      Top = 49
      Width = 113
      Height = 25
      Caption = '아이디 중복 확인'
      TabOrder = 0
      OnClick = btnCheckIDClick
    end
  end
  object btnGetUnitCost: TButton
    Left = 173
    Top = 115
    Width = 128
    Height = 25
    Caption = '조회 단가 확인'
    TabOrder = 0
    OnClick = btnGetUnitCostClick
  end
  object txtCorpNum: TEdit
    Left = 161
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 405
    Top = 17
    Width = 123
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 2
    Text = 'testkorea'
  end
  object btnJoinMember: TButton
    Left = 37
    Top = 147
    Width = 113
    Height = 25
    Caption = '회원 가입'
    TabOrder = 3
    OnClick = btnJoinMemberClick
  end
  object btnCheckIsMember: TButton
    Left = 37
    Top = 84
    Width = 113
    Height = 25
    Caption = '가입여부 확인'
    TabOrder = 4
    OnClick = btnCheckIsMemberClick
  end
  object btnGetAccessURL: TButton
    Left = 341
    Top = 82
    Width = 117
    Height = 25
    Caption = '팝빌 로그인 URL'
    TabOrder = 7
    OnClick = btnGetAccessURLClick
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 224
    Width = 569
    Height = 58
    Caption = '휴폐업조회 관련 API'
    TabOrder = 10
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 92
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
      Text = '6798700433'
    end
    object btnCheckCorpNum: TButton
      Left = 262
      Top = 15
      Width = 83
      Height = 31
      Caption = '단건 조회'
      TabOrder = 1
      OnClick = btnCheckCorpNumClick
    end
    object btnCheckCorpNums: TButton
      Left = 361
      Top = 15
      Width = 88
      Height = 32
      Caption = '대량 조회'
      TabOrder = 2
      OnClick = btnCheckCorpNumsClick
    end
  end
  object GroupBox6: TGroupBox
    Left = 632
    Top = 65
    Width = 144
    Height = 119
    Caption = '회사정보 관련'
    TabOrder = 11
    object btnGetCorpInfo: TButton
      Left = 12
      Top = 16
      Width = 121
      Height = 25
      Caption = '회사정보 조회'
      TabOrder = 0
      OnClick = btnGetCorpInfoClick
    end
    object btnUpdateCorpInfo: TButton
      Left = 12
      Top = 48
      Width = 121
      Height = 25
      Caption = '회사정보 수정'
      TabOrder = 1
      OnClick = btnUpdateCorpInfoClick
    end
  end
end
