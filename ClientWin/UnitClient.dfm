object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077
  ClientHeight = 464
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 344
    Top = 16
    Width = 43
    Height = 13
    Caption = #1053#1080#1082#1085#1077#1081#1084
  end
  object Label2: TLabel
    Left = 344
    Top = 64
    Width = 24
    Height = 13
    Caption = #1048#1075#1088#1072
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 8
    Width = 329
    Height = 241
    Align = alCustom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALUE'
        Width = 100
        Visible = True
      end>
  end
  object NickEdit: TEdit
    Left = 344
    Top = 35
    Width = 129
    Height = 21
    Hint = #1101#1084#1084#1084' '#1085#1077#1090#1090#1090#1089#1089#1089
    AutoSelect = False
    AutoSize = False
    ReadOnly = True
    TabOrder = 1
  end
  object GameEdit: TEdit
    Left = 344
    Top = 83
    Width = 129
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object RefreshUserButton: TButton
    Left = 344
    Top = 160
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
    OnClick = RefreshUserButtonClick
  end
  object ApplyChangesUsers: TButton
    Left = 344
    Top = 216
    Width = 153
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 4
    OnClick = ApplyChangesUsersClick
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 255
    Width = 329
    Height = 186
    DataSource = DataSource2
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NICKNAME'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GAME'
        Width = 84
        Visible = True
      end>
  end
  object RefreshGamesData: TButton
    Left = 344
    Top = 360
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 6
    OnClick = RefreshGamesDataClick
  end
  object ApplyChangesGames: TButton
    Left = 343
    Top = 416
    Width = 153
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    TabOrder = 7
    OnClick = ApplyChangesGamesClick
  end
  object Edit1: TEdit
    Left = 528
    Top = 360
    Width = 169
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object Edit2: TEdit
    Left = 528
    Top = 410
    Width = 169
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 144
    Top = 168
  end
  object EMSProvider1: TEMSProvider
    ApiVersion = '2'
    URLHost = 'localhost'
    URLPort = 8080
    Left = 520
    Top = 7
  end
  object BackendEndpoint1: TBackendEndpoint
    Provider = EMSProvider1
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'type'
        Value = 'userdata'
      end>
    Resource = 'Gamers'
    Response = RESTResponse1
    Left = 616
    Top = 7
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 616
    Top = 71
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Active = True
    Dataset = ClientDataSet1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALUE'
        DataType = ftInteger
      end>
    Response = RESTResponse1
    RootElement = 'data'
    Left = 616
    Top = 135
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      090100009619E0BD0100000018000000030005000000030000009B0002494404
      00010000000000044E414D450100490000000100055749445448020002001E00
      0556414C5545040001000000000001000A4348414E47455F4C4F47040082000F
      0000000100000000000000040000000200000000000000040000000300000000
      0000000400000004000000000000000400000005000000000000000400000004
      000100000007656C656374726FE40000000400020000000B6D616E6372656570
      6D616E420100000400030000000F73747269636B656E6D61706C653035D00500
      000400040000000E706F6C6963656D616E206675636B39050000040005000000
      086D617274796E6F769A020000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALUE'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
        Size = 20
      end
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    StoreDefs = True
    AfterPost = ClientDataSet1AfterPost
    Left = 616
    Top = 199
  end
  object ClientDataSet2: TClientDataSet
    PersistDataPacket.Data = {
      240100009619E0BD0100000018000000020005000000030000009F00084E4943
      4B4E414D450100490000000100055749445448020002001E000447414D450100
      490000000100055749445448020002001E0001000A4348414E47455F4C4F4704
      0082000F00000001000000000000000400000002000000000000000400000003
      0000000000000004000000040000000000000004000000050000000000000004
      000000040007656C656374726F05326F64617404000B6D616E63726565706D61
      6E0D626565627261696E627265616B04000E737472696B656E6D61706C653035
      0E6B6C617661636F6361676F6E6B6904000E706F6C6963656D616E206675636B
      082D7375646F206B750400086D617274796E6F7613626C61636B206C69766520
      6164646974696F6E}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NICKNAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GAME'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = ClientDataSet2AfterPost
    Left = 784
    Top = 199
  end
  object BackendEndpoint2: TBackendEndpoint
    Provider = EMSProvider1
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'type'
        Value = 'gamedata'
      end>
    Resource = 'Gamers'
    Response = RESTResponse2
    Left = 784
    Top = 7
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 784
    Top = 71
  end
  object RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter
    Active = True
    Dataset = ClientDataSet2
    FieldDefs = <
      item
        Name = 'NICKNAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GAME'
        DataType = ftString
        Size = 30
      end>
    Response = RESTResponse2
    RootElement = 'data'
    Left = 784
    Top = 135
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 152
    Top = 392
  end
  object BackendEndpoint3: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'type'
        Value = 'userdata'
      end
      item
        Kind = pkREQUESTBODY
        Name = 'body'
      end>
    Resource = 'Gamers'
    Response = RESTResponse3
    Left = 464
    Top = 168
  end
  object RESTResponse3: TRESTResponse
    ContentType = 'application/json'
    Left = 464
    Top = 248
  end
  object BackendEndpoint4: TBackendEndpoint
    Provider = EMSProvider1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'type'
        Value = 'gamesdata'
      end
      item
        Kind = pkREQUESTBODY
        Name = 'body'
      end>
    Resource = 'Gamers'
    Response = RESTResponse4
    Left = 456
    Top = 368
  end
  object RESTResponse4: TRESTResponse
    Left = 456
    Top = 448
  end
end
