unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TFLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel3: TPanel;
    procedure Panel3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses DataModule, UDataBarangDenganQRCode, USettingUser;

{$R *.dfm}

procedure TFLogin.Panel3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFLogin.Panel2Click(Sender: TObject);
begin
  if edit2.Text ='' then
     MessageDlg('Nama User Kosong',mtinformation,[mbok],0)
  Else
  if edit3.Text ='' then
     MessageDlg('Password Kosong',mtinformation,[mbok],0)
  Else
  if(Edit2.Text = 'CREATOR') and (Edit3.Text = 'CREATOR') then
  begin
    FUser.Show;
  end
  else
    begin
       if DM.ADOLogin.Locate('username',edit2.Text,[]) then
           Begin
              if edit3.Text = DM.ADOLogin['password'] then
                 Begin
                    begin
                      // untuk menampilkan Menu :
                      FMenu.Show;
                      // untuk menghide login :
                      FLogin.Hide;
                    end;
                 End
              Else
                 MessageDlg('Password Salah !!!',mtinformation,[mbok],0);
           End
        else MessageDlg('Username Salah !!!',mtinformation,[mbok],0);
    end;
end;

procedure TFLogin.FormActivate(Sender: TObject);
begin
Edit2.Clear;
Edit3.Clear;
Edit2.SetFocus;
end;

end.
