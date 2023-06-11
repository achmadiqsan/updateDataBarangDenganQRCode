unit USettingUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFUser = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Edit1: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUser: TFUser;

implementation

uses DataModule;

{$R *.dfm}

procedure TFUser.FormCreate(Sender: TObject);
// code untuk disable close button pada form :
var
  hSysMenu:HMENU;
begin
  hSysMenu:=GetSystemMenu(Self.Handle,False);
  if hSysMenu <> 0 then
  begin
    EnableMenuItem(hSysMenu,SC_CLOSE,MF_BYCOMMAND or MF_GRAYED);
    DrawMenuBar(Self.Handle);
  end;
end;

procedure TFUser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if DM.ADOLogin.IsEmpty then
     MessageDlg('Data Kosong',mtInformation,[mbok],0)
     else
     begin
       Edit1.Text:= DM.ADOLogin['username'];
       Edit3.Text:= DM.ADOLogin['password'];
     end;
  end;
end;

procedure TFUser.Edit2Change(Sender: TObject);
begin
  if Edit2.Text ='' then
     begin
       DM.ADOLogin.Close;
       DM.ADOLogin.Open;
       DM.ADOLogin.Filtered := false;
     end
  Else
     begin
       DM.ADOLogin.Close;
       DM.ADOLogin.Open;
       DM.ADOLogin.Filtered := False;
       DM.ADOLogin.Filter :='username LIKE '+Quotedstr('%'+Edit2.Text+'%');
       DM.ADOLogin.Filtered := True;
     end;
end;

procedure TFUser.Panel2Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    MessageDlg('Username Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  if Edit3.Text = '' then
    MessageDlg('Password Tidak Boleh Kosong',mtInformation,[mbok],0)
  else
  if DM.ADOLogin.Locate('username',edit2.Text,[]) then
    MessageDlg('Username Telah Ada',mtInformation,[mbok],0)
  else
    begin
      DM.ADOLogin.Append;
      DM.ADOLogin['username'] := Edit1.Text;
      DM.ADOLogin['password'] := Edit3.Text;
      DM.ADOLogin.Post;
      Edit1.Clear;
      Edit3.Clear;
    end;
end;

procedure TFUser.Panel3Click(Sender: TObject);
begin
  if DM.ADOLogin.IsEmpty then
   MessageDlg('Data Kosong',mtInformation,[mbok],0)
  else
  if Application.MessageBox('Yakin Hapus Data ???','Pesan',MB_YESNO or MB_ICONQUESTION)=MrYes then
     begin
       DM.ADOLogin.Delete;
       Edit1.Clear;
       Edit3.Clear;
     end;
end;

procedure TFUser.Panel4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
end;

procedure TFUser.Panel5Click(Sender: TObject);
begin
  close;
end;

end.
