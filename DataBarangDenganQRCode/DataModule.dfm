object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 294
  Width = 255
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\DataBarangDengan' +
      'QRCode\database\Database.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object ADOLogin: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'login'
    Left = 120
    Top = 32
  end
  object ADOBarang: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'barang'
    Left = 72
    Top = 96
    object ADOBarangproductId: TWideStringField
      FieldName = 'productId'
      Size = 255
    end
    object ADOBarangProductName: TWideStringField
      FieldName = 'ProductName'
      Size = 255
    end
    object ADOBarangimage: TWideStringField
      FieldName = 'image'
      Size = 50
    end
    object ADOBarangqty: TBCDField
      FieldName = 'qty'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOBarangunitPrice: TBCDField
      FieldName = 'unitPrice'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOBaranginventoryValue: TBCDField
      FieldName = 'inventoryValue'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOBarangreorderQuantity: TBCDField
      FieldName = 'reorderQuantity'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
    object ADOBarangdateChecked: TDateTimeField
      FieldName = 'dateChecked'
    end
    object ADOBarangqrCode: TMemoField
      FieldName = 'qrCode'
      BlobType = ftMemo
    end
    object ADOBarangfromImage: TMemoField
      FieldName = 'fromImage'
      BlobType = ftMemo
    end
  end
  object DSLogin: TDataSource
    DataSet = ADOLogin
    Left = 184
    Top = 40
  end
  object DSBarang: TDataSource
    DataSet = ADOBarang
    Left = 152
    Top = 104
  end
end
