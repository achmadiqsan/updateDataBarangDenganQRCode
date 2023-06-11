unit UDataBarangDenganQRCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, jpeg, Grids, DBGrids, CJVBarCode,
  ExtDlgs,pngimage;

type
  TFMenu = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Edit8: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Image1: TImage;
    Label10: TLabel;
    Edit9: TEdit;
    Image3: TImage;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Panel7: TPanel;
    Label13: TLabel;
    Panel8: TPanel;
    Label14: TLabel;
    Panel9: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Image5: TImage;
    Panel10: TPanel;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Edit10: TEdit;
    Panel11: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel12: TPanel;
    Label17: TLabel;
    Image2: TImage;
    Image4: TImage;
    procedure Panel1Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

uses
  DataModule, ULogin, httpsend;


function Ribuan(Edit:TEdit):string;
var
  NilaiRupiah : string;
  AngkaRupiah : Currency;
begin
  if Edit.Text='' then Exit;
  NilaiRupiah := Edit.Text;
  NilaiRupiah := StringReplace(NilaiRupiah,',','',[rfReplaceAll,rfIgnoreCase]);
  NilaiRupiah := StringReplace(NilaiRupiah,'.','',[rfReplaceAll,rfIgnoreCase]);
  AngkaRupiah := StrToCurrDef(NilaiRupiah,0);
  Edit.Text := FormatCurr('#,###',AngkaRupiah);
  Edit.SelStart := Length(Edit.Text)
end;

function HapusFormat(Nilai:TEdit):Integer;
var
  hasil : String;
begin
  hasil := Nilai.text;
  hasil := StringReplace(hasil,',','',[rfReplaceAll,rfIgnoreCase]);
  hasil := StringReplace(hasil,'.','',[rfReplaceAll,rfIgnoreCase]);
  Result := StrToInt(hasil);
end;

{$R *.dfm}

procedure TFMenu.Panel1Click(Sender: TObject);
var
  png: TPNGObject;
begin
 if Edit1.Text ='' then
    MessageDlg('Product ID Kosong',mtInformation,[mbok],0)
 else
 if Edit2.Text ='' then
    MessageDlg('Qty Kosong',mtInformation,[mbok],0)
 else
 if Edit3.Text ='' then
    MessageDlg('Invetory Value Kosong',mtInformation,[mbok],0)
 else
 if Edit4.Text ='' then
    MessageDlg('Image Path Kosong',mtInformation,[mbok],0)
 else
 if Edit5.Text ='' then
    MessageDlg('Product Name Kosong',mtInformation,[mbok],0)
 else
 if Edit6.Text ='' then
    MessageDlg('Unit Price Kosong',mtInformation,[mbok],0)
 else
 if Edit7.Text ='' then
    MessageDlg('Reorder Kosong',mtInformation,[mbok],0)
 else
 if Edit8.Text ='' then
    MessageDlg('QRCode Kosong',mtInformation,[mbok],0)
 else
 if Dm.ADOBarang.Locate('productId',Edit1.Text,[]) then
    MessageDlg('Product ID Telah Ada',mtInformation,[mbok],0)
 else
  begin
    //
    DM.ADOBarang.Append;
    DM.ADOBarang['productId'] := Edit1.Text;
    DM.ADOBarang['ProductName'] := Edit5.Text;
    DM.ADOBarang['image'] := Edit4.Text;
    DM.ADOBarang['qty'] := HapusFormat(Edit2);
    DM.ADOBarang['unitPrice'] := HapusFormat(Edit6);
    DM.ADOBarang['inventoryValue'] := HapusFormat(Edit3);
    DM.ADOBarang['reorderQuantity'] := HapusFormat(Edit7);
    DM.ADOBarang['dateChecked'] := DateTimePicker1.Date;
    DM.ADOBarang['qrCode'] := Edit8.Text;
    DM.ADOBarang['fromImage'] := Label17.Caption;
    DM.ADOBarang.Post;
    image1.Picture.SaveToFile('D:\DataBarangDenganQRCode\foto\'+Edit1.Text+'.jpg');
    //
    png := TPNGObject.Create;
    png.Assign(image2.Picture);
    png.SaveToFile('D:\DataBarangDenganQRCode\imageqrcode\'+Edit1.Text+'.png');
    png.Free;
    //
    Edit1.Clear;Edit2.Clear;
    Edit3.Clear;Edit4.Clear;
    Edit5.Clear;Edit6.Clear;
    Edit7.Clear;Edit8.Clear;
    DateTimePicker1.Date := Now;
    Image1.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
    Image2.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
//    CJVBarCode1.Texto := '789786260021';
    Panel1.Enabled := True;
    Panel2.Enabled := False;
    Panel3.Enabled := False;
  end;
end;

procedure TFMenu.Panel5Click(Sender: TObject);
var
  HTTP: THTTPSend;
  url: String;
  URLData: String;
  png: TPNGObject;
begin
  if Edit1.Text <> '' then
  begin
//    CJVBarCode1.Texto := Edit1.Text;
      // URL to post to
      url := 'http://chart.apis.google.com/chart';
      // Generate POST data
      URLData := 'chs='+IntToStr(185)+'x'+IntToStr(129)+'&';
      URLData := URLData + 'cht=qr&chld=M&';
      URLData := URLData + 'chl=' + Edit1.Text;
      // Create HTTP Object, connect and post
      HTTP := THTTPSend.Create;
      png := TPNGObject.Create;
      try
        HTTP.Document.Write(Pointer(URLData)^, Length(URLData));
        HTTP.MimeType := 'application/x-www-form-urlencoded';
        HTTP.HTTPMethod('POST', URL);
      except
        showmessage('Unable to connect to Google API!');
        exit;
      end;
      // Load image data
      try
        png.LoadFromStream(Http.Document);
        image2.Picture.Assign(png);
      except
        showmessage('Unable to load retrieved image data');
        exit;
      end;
      // Clean up
      HTTP.Free;
      png.Free;
      Edit8.Text := 'D:\DataBarangDenganQRCode\imageqrcode\'+Edit1.Text+'.png';
  end
  else
  begin
    MessageDlg('Silahkan Isi Product ID Terlebih Dahulu',mtInformation,[mbok],0);
  end;
end;

procedure TFMenu.Panel4Click(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    if OpenPictureDialog1.Execute then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      label17.Caption := OpenPictureDialog1.FileName;
      Edit4.Text := 'D:\DataBarangDenganQRCode\foto\'+Edit1.Text+'.jpg';
    end;
  end
  else
  begin
    MessageDlg('Silahkan Isi Product ID Terlebih Dahulu',mtInformation,[mbok],0);
  end;
end;

procedure TFMenu.FormActivate(Sender: TObject);
begin
  Dm.ADOBarang.Close;
  Dm.ADOBarang.Open;
  Dm.ADOBarang.Filtered := false;
  ComboBox1.Text := 'PILIH JENIS PENCARIAN';
  Edit10.Clear;
  Edit1.Clear;Edit2.Clear;
  Edit3.Clear;Edit4.Clear;
  Edit5.Clear;Edit6.Clear;
  Edit7.Clear;Edit8.Clear;
  DateTimePicker1.Date := Now;
//  CJVBarCode1.Texto := '789786260021';
  Image1.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
  Image2.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
  Label17.Caption := 'Label17';
  Edit1.Enabled := True;
  Panel1.Enabled := True;
  Panel2.Enabled := False;
  Panel3.Enabled := False;
  Edit9.Clear;
  Image3.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
  Image4.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
//  CJVBarCode2.Texto := '789786260021';
  Panel6.Caption := '';
  Label11.Caption := '';
  Panel7.Caption := '0';
  Panel8.Caption := 'Rp. 0';
  Panel9.Caption := 'Rp. 0';
end;

procedure TFMenu.Panel11Click(Sender: TObject);
begin
  if ComboBox1.Text = 'PILIH JENIS PENCARIAN' then
    begin
        Dm.ADOBarang.Close;
        Dm.ADOBarang.Open;
        Dm.ADOBarang.Filtered := false;
    end
  else
  if (ComboBox1.Text = 'Product Id') and (Edit10.Text <> '') then
    begin
      Dm.ADOBarang.Close;
      Dm.ADOBarang.Open;
      Dm.ADOBarang.Filtered := False;
      DM.ADOBarang.Filter :='productId LIKE '+Quotedstr('%'+Edit10.Text+'%');
      Dm.ADOBarang.Filtered := True;
    end
  else
  if (ComboBox1.Text = 'Product Name') and (Edit10.Text <> '') then
    begin
      Dm.ADOBarang.Close;
      Dm.ADOBarang.Open;
      Dm.ADOBarang.Filtered := False;
      DM.ADOBarang.Filter :='ProductName LIKE '+Quotedstr('%'+Edit10.Text+'%');
      Dm.ADOBarang.Filtered := True;
    end
  else
  if (ComboBox1.Text = 'Unit Price') and (Edit10.Text <> '') then
    begin
      Dm.ADOBarang.Close;
      Dm.ADOBarang.Open;
      Dm.ADOBarang.Filtered := False;
      DM.ADOBarang.Filter :='unitPrice = '+Edit10.Text;
      Dm.ADOBarang.Filtered := True;
    end
  else
    begin
      MessageDlg('JENIS PENCARIAN TIDAK DI KETAHUI!!!',mtInformation,[mbok],0)
    end;
end;


procedure TFMenu.Panel12Click(Sender: TObject);
begin
  Dm.ADOBarang.Close;
  Dm.ADOBarang.Open;
  Dm.ADOBarang.Filtered := false;
  ComboBox1.Text := 'PILIH JENIS PENCARIAN';
  Edit10.Clear;
  Edit1.Clear;Edit2.Clear;
  Edit3.Clear;Edit4.Clear;
  Edit5.Clear;Edit6.Clear;
  Edit7.Clear;Edit8.Clear;
  DateTimePicker1.Date := Now;
//  CJVBarCode1.Texto := '789786260021';
  Image2.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
  Image1.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
  Label17.Caption := 'Label17';
  Edit1.Enabled := True;
  Panel1.Enabled := True;
  Panel2.Enabled := False;
  Panel3.Enabled := False;
  Edit9.Clear;
  Image3.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
  Image4.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
//  CJVBarCode2.Texto := '789786260021';
  Panel6.Caption := '';
  Label11.Caption := '';
  Panel7.Caption := '0';
  Panel8.Caption := 'Rp. 0';
  Panel9.Caption := 'Rp. 0';
end;

procedure TFMenu.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    //
    Edit1.Text := DM.ADOBarang['productId']  ;
    Edit5.Text := DM.ADOBarang['ProductName']  ;
    Edit4.Text := DM.ADOBarang['image']  ;
    Edit8.Text := DM.ADOBarang['qrCode']  ;
    Label17.Caption := DM.ADOBarang['image']  ;
    Edit2.Text := DM.ADOBarang['qty']  ;
    Edit6.Text := DM.ADOBarang['unitPrice']  ;
    Edit3.Text := DM.ADOBarang['inventoryValue']  ;
    Edit7.Text := DM.ADOBarang['reorderQuantity']  ;
    DateTimePicker1.Date := DM.ADOBarang['dateChecked']  ;
//    CJVBarCode1.Texto := DM.ADOBarang['productId'];
    Image2.Picture.LoadFromFile(DM.ADOBarang['qrCode']);
    Image1.Picture.LoadFromFile(DM.ADOBarang['image']);
    Edit1.Enabled := False;
    Panel1.Enabled := False;
    Panel2.Enabled := True;
    Panel3.Enabled := True;
    Edit9.SetFocus;
  end;
end;

procedure TFMenu.Panel2Click(Sender: TObject);
begin
 if Edit1.Text ='' then
    MessageDlg('Product ID Kosong',mtInformation,[mbok],0)
 else
 if Edit2.Text ='' then
    MessageDlg('Qty Kosong',mtInformation,[mbok],0)
 else
 if Edit3.Text ='' then
    MessageDlg('Invetory Value Kosong',mtInformation,[mbok],0)
 else
 if Edit4.Text ='' then
    MessageDlg('Image Path Kosong',mtInformation,[mbok],0)
 else
 if Edit5.Text ='' then
    MessageDlg('Product Name Kosong',mtInformation,[mbok],0)
 else
 if Edit6.Text ='' then
    MessageDlg('Unit Price Kosong',mtInformation,[mbok],0)
 else
 if Edit7.Text ='' then
    MessageDlg('Reorder Kosong',mtInformation,[mbok],0)
 else
 if Edit8.Text ='' then
    MessageDlg('QR Code Path Kosong',mtInformation,[mbok],0)
 else
  begin
    //
    DM.ADOBarang.Edit;
    DM.ADOBarang['productId'] := Edit1.Text;
    DM.ADOBarang['ProductName'] := Edit5.Text;
    if Edit4.Text <> Label17.Caption then
      begin
      //DeleteFile(Label17.Caption);
      image1.Picture.SaveToFile('D:\DataBarangDenganQRCode\foto\'+Edit1.Text+'.jpg');
      DM.ADOBarang['fromImage'] := Label17.Caption;
      end
    else
      begin
      DM.ADOBarang['image'] := Edit4.Text;
      end;
    //
    image2.Picture.SaveToFile('D:\DataBarangDenganQRCode\imageqrcode\'+Edit1.Text+'.jpg');
    DM.ADOBarang['qrCode'] := Edit8.Text;
    DM.ADOBarang['qty'] := HapusFormat(Edit2);
    DM.ADOBarang['unitPrice'] := HapusFormat(Edit6);
    DM.ADOBarang['inventoryValue'] := HapusFormat(Edit3);
    DM.ADOBarang['reorderQuantity'] := HapusFormat(Edit7);
    DM.ADOBarang['dateChecked'] := DateTimePicker1.Date;
    DM.ADOBarang.Post;
    Edit1.Clear;Edit2.Clear;
    Edit3.Clear;Edit4.Clear;
    Edit5.Clear;Edit6.Clear;
    Edit7.Clear;Edit8.Clear;
    DateTimePicker1.Date := Now;
//    CJVBarCode1.Texto := '789786260021';
    Label17.Caption := 'Label17';
    Edit1.Enabled := True;
    Image1.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
    Image2.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
    Panel1.Enabled := True;
    Panel2.Enabled := False;
    Panel3.Enabled := False;
    //ShowMessage('DATA BERHASIL DI UPDATE');
  end;
end;

procedure TFMenu.Panel3Click(Sender: TObject);
begin
if DM.ADOBarang.IsEmpty then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
else
if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
   begin
     DeleteFile(Label17.Caption);
     DeleteFile(Edit8.Text);
     Dm.ADOBarang.Delete;
     Edit1.Clear;Edit2.Clear;
     Edit3.Clear;Edit4.Clear;
     Edit5.Clear;Edit6.Clear;
     Edit7.Clear;//Edit8.Clear;
     DateTimePicker1.Date := Now;
//     CJVBarCode1.Texto := '789786260021';
     Label17.Caption := 'Label17';
     Edit1.Enabled := True;
     Image1.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
     Image2.Picture.LoadFromFile('D:\DataBarangDenganQRCode\assets\none.jpg');
     Panel1.Enabled := True;
      Panel2.Enabled := False;
      Panel3.Enabled := False;
   end;
end;

procedure TFMenu.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFMenu.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFMenu.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFMenu.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not(key in['0'..'9', #8, #13, #32,#44,#46]) then
  begin
  key :=#0;
  MessageDlg('Nilai yang diinput harus angka !!!',mtError,[mbOK],0);
  end;
end;

procedure TFMenu.Edit2Change(Sender: TObject);
begin
  Ribuan(Edit2);
end;

procedure TFMenu.Edit6Change(Sender: TObject);
begin
  Ribuan(Edit6);
end;

procedure TFMenu.Edit3Change(Sender: TObject);
begin
  Ribuan(Edit3);
end;

procedure TFMenu.Edit7Change(Sender: TObject);
begin
  Ribuan(Edit7);
end;

procedure TFMenu.Edit9Change(Sender: TObject);
begin
  if Edit9.Text <> '' then
  begin
    if Dm.ADOBarang.Locate('productId',Edit1.Text,[]) then
      begin
        Panel6.Caption := DM.ADOBarang['productId']  ;
        Label11.Caption := DM.ADOBarang['ProductName']  ;
        Image3.Picture.LoadFromFile(DM.ADOBarang['image']);
        Image4.Picture.LoadFromFile(DM.ADOBarang['qrcode']);
//        CJVBarCode2.Texto := DM.ADOBarang['productId'];
        Panel7.Caption  := FormatFloat('#,#0.00;(#,#0.00);#,#0.00',DM.ADOBarang['qty']);
        Panel8.Caption  := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',DM.ADOBarang['unitPrice']);
        Panel9.Caption  := 'Rp. ' + FormatFloat('#,#0.00;(#,#0.00);#,#0.00',DM.ADOBarang['inventoryValue']);
      end
    else
      begin
        MessageDlg('DATA TIDAK DI KENALI',mtInformation,[mbok],0);
      end;
  end;
end;

procedure TFMenu.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
//if Key=#13 then
//begin
//  if Dm.ADOBarang.Locate('productId',Edit1.Text,[]) then
//      begin
//        Panel6.Caption := DM.ADOBarang['productId']  ;
//        Label11.Caption := DM.ADOBarang['ProductName']  ;
//        Image1.Picture.LoadFromFile(DM.ADOBarang['image']);
//        CJVBarCode2.Texto := DM.ADOBarang['productId'];
//        Panel7.Caption  := 'Rp. ' + FloatToStr(DM.ADOBarang['qty'])  ;
//        Panel8.Caption  := 'Rp. ' + FloatToStr(DM.ADOBarang['unitPrice'])  ;
//        Panel9.Caption  := 'Rp. ' + FloatToStr(DM.ADOBarang['inventoryValue'])  ;
//      end
//    else
//      begin
//        MessageDlg('DATA TIDAK DI KENALI',mtInformation,[mbok],0);
//      end;
//end;

end;

procedure TFMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// untuk menampilkan Menu :
FMenu.Hide;
// untuk menghide login :
FLogin.Show;
end;

end.
