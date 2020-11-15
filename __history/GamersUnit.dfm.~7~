object GamersResource1: TGamersResource1
  OldCreateOrder = False
  Height = 235
  Width = 392
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\databases\TESTBASE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1251'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 88
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from new_table;')
    Left = 192
    Top = 88
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from games;')
    Left = 288
    Top = 88
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'update new_table set NAME = :in_name, "VALUE" = :in_value where ' +
        'ID = :id;')
    Left = 192
    Top = 160
    ParamData = <
      item
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        Name = 'IN_VALUE'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object FDQuery4: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'update games set NICKNAME = :in_nick, GAME = :in_game where NICK' +
        'NAME = :nick;')
    Left = 288
    Top = 160
    ParamData = <
      item
        Name = 'IN_NICK'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end
      item
        Name = 'IN_GAME'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end
      item
        Name = 'NICK'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end>
  end
end
