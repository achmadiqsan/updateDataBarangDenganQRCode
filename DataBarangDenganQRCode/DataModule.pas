unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOLogin: TADOTable;
    ADOBarang: TADOTable;
    DSLogin: TDataSource;
    DSBarang: TDataSource;
    ADOBarangproductId: TWideStringField;
    ADOBarangProductName: TWideStringField;
    ADOBarangimage: TWideStringField;
    ADOBarangqty: TBCDField;
    ADOBarangunitPrice: TBCDField;
    ADOBaranginventoryValue: TBCDField;
    ADOBarangreorderQuantity: TBCDField;
    ADOBarangdateChecked: TDateTimeField;
    ADOBarangqrCode: TMemoField;
    ADOBarangfromImage: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
