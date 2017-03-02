object Dm: TDm
  OldCreateOrder = False
  Left = 589
  Top = 382
  Height = 276
  Width = 395
  object Database: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Transaction
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 44
    Top = 40
  end
  object Transaction: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 112
    Top = 40
  end
end
