object frmExample: TfrmExample
  Left = 704
  Top = 508
  Caption = #54045#48716' '#55092#54224#50629#51312#54924' API SDK for Delphi'
  ClientHeight = 316
  ClientWidth = 1115
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
    Caption = #54045#48716#54924#50896' '#49324#50629#51088#48264#54840' :'
  end
  object Label2: TLabel
    Left = 302
    Top = 20
    Width = 99
    Height = 13
    AutoSize = False
    Caption = #54045#48716#54924#50896' '#50500#51060#46356' :'
  end
  object Label4: TLabel
    Left = 734
    Top = 20
    Width = 43
    Height = 13
    AutoSize = False
    Caption = 'URL : '
  end
  object GroupBox7: TGroupBox
    Left = 16
    Top = 48
    Width = 1089
    Height = 169
    Caption = #54045#48716' '#44592#48376' API'
    TabOrder = 12
    object GroupBox8: TGroupBox
      Left = 768
      Top = 16
      Width = 144
      Height = 145
      Caption = #50672#46041#44284#44552' '#54252#51064#53944
      TabOrder = 0
      object btnGetBalance: TButton
        Left = 9
        Top = 19
        Width = 129
        Height = 25
        Caption = #51092#50668#54252#51064#53944' '#51312#54924
        TabOrder = 0
        OnClick = btnGetBalanceClick
      end
      object btnGetChargeURL: TButton
        Left = 9
        Top = 50
        Width = 129
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetChargeURLClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 80
        Width = 129
        Height = 25
        Caption = #54252#51064#53944' '#44208#51228#45236#50669' URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 112
        Width = 129
        Height = 25
        Caption = #54252#51064#53944' '#49324#50857#45236#50669' URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
    object GroupBox9: TGroupBox
      Left = 920
      Top = 16
      Width = 147
      Height = 122
      Caption = #54028#53944#45320#44284#44552' '#54252#51064#53944
      TabOrder = 1
      object btnGetPartnerPoint: TButton
        Left = 8
        Top = 18
        Width = 127
        Height = 25
        Caption = #54028#53944#45320#54252#51064#53944' '#51312#54924
        TabOrder = 0
        OnClick = btnGetPartnerPointClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 48
        Width = 128
        Height = 25
        Caption = #54252#51064#53944' '#52649#51204' URL'
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
    Caption = #45812#45817#51088' '#44288#47144
    TabOrder = 9
    object btnRegistContact: TButton
      Left = 8
      Top = 16
      Width = 129
      Height = 25
      Caption = #45812#45817#51088' '#52628#44032
      TabOrder = 0
      OnClick = btnRegistContactClick
    end
    object btnListContact: TButton
      Left = 7
      Top = 80
      Width = 129
      Height = 25
      Caption = #45812#45817#51088' '#47785#47197' '#51312#54924
      TabOrder = 1
      OnClick = btnListContactClick
    end
    object btnUpdateContact: TButton
      Left = 7
      Top = 112
      Width = 129
      Height = 25
      Caption = #45812#45817#51088' '#51221#48372' '#49688#51221
      TabOrder = 2
      OnClick = btnUpdateContactClick
    end
    object btnGetContactInfo: TButton
      Left = 8
      Top = 48
      Width = 129
      Height = 25
      Caption = #45812#45817#51088' '#51221#48372' '#54869#51064
      TabOrder = 3
      OnClick = btnGetContactInfoClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 332
    Top = 66
    Width = 141
    Height = 118
    Caption = #54045#48716' '#44592#48376' URL'
    TabOrder = 8
  end
  object GroupBox2: TGroupBox
    Left = 165
    Top = 66
    Width = 148
    Height = 119
    Caption = #54252#51064#53944' '#44288#47144
    TabOrder = 6
    object btnGetChargeInfo: TButton
      Left = 8
      Top = 16
      Width = 128
      Height = 25
      Caption = #44284#44552#51221#48372' '#54869#51064
      TabOrder = 0
      OnClick = btnGetChargeInfoClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 29
    Top = 67
    Width = 127
    Height = 118
    Caption = #54924#50896' '#51221#48372
    TabOrder = 5
    object btnCheckID: TButton
      Left = 8
      Top = 49
      Width = 113
      Height = 25
      Caption = #50500#51060#46356' '#51473#48373' '#54869#51064
      TabOrder = 0
      OnClick = btnCheckIDClick
    end
  end
  object btnGetUnitCost: TButton
    Left = 173
    Top = 115
    Width = 128
    Height = 25
    Caption = #51312#54924' '#45800#44032' '#54869#51064
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
    Caption = #54924#50896' '#44032#51077
    TabOrder = 3
    OnClick = btnJoinMemberClick
  end
  object btnCheckIsMember: TButton
    Left = 37
    Top = 84
    Width = 113
    Height = 25
    Caption = #44032#51077#50668#48512' '#54869#51064
    TabOrder = 4
    OnClick = btnCheckIsMemberClick
  end
  object btnGetAccessURL: TButton
    Left = 341
    Top = 82
    Width = 117
    Height = 25
    Caption = #54045#48716' '#47196#44536#51064' URL'
    TabOrder = 7
    OnClick = btnGetAccessURLClick
  end
  object GroupBox5: TGroupBox
    Left = 16
    Top = 224
    Width = 569
    Height = 58
    Caption = #55092#54224#50629#51312#54924' '#44288#47144' API'
    TabOrder = 10
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 92
      Height = 13
      Caption = #51312#54924' '#49324#50629#51088#48264#54840' :  '
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
      Caption = #45800#44148' '#51312#54924
      TabOrder = 1
      OnClick = btnCheckCorpNumClick
    end
    object btnCheckCorpNums: TButton
      Left = 361
      Top = 15
      Width = 88
      Height = 32
      Caption = #45824#47049' '#51312#54924
      TabOrder = 2
      OnClick = btnCheckCorpNumsClick
    end
  end
  object GroupBox6: TGroupBox
    Left = 632
    Top = 65
    Width = 144
    Height = 119
    Caption = #54924#49324#51221#48372' '#44288#47144
    TabOrder = 11
    object btnGetCorpInfo: TButton
      Left = 12
      Top = 16
      Width = 121
      Height = 25
      Caption = #54924#49324#51221#48372' '#51312#54924
      TabOrder = 0
      OnClick = btnGetCorpInfoClick
    end
    object btnUpdateCorpInfo: TButton
      Left = 12
      Top = 48
      Width = 121
      Height = 25
      Caption = #54924#49324#51221#48372' '#49688#51221
      TabOrder = 1
      OnClick = btnUpdateCorpInfoClick
    end
  end
  object txtURL: TEdit
    Left = 784
    Top = 17
    Width = 312
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 13
  end
end
