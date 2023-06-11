program PDataBarangDenganQRCode;

uses
  Forms,
  UDataBarangDenganQRCode in 'UDataBarangDenganQRCode.pas' {FMenu},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  USettingUser in 'USettingUser.pas' {FUser},
  httpsend in 'synapse\httpsend.pas',
  asn1util in 'synapse\asn1util.pas',
  blcksock in 'synapse\blcksock.pas',
  clamsend in 'synapse\clamsend.pas',
  dnssend in 'synapse\dnssend.pas',
  ftpsend in 'synapse\ftpsend.pas',
  ftptsend in 'synapse\ftptsend.pas',
  imapsend in 'synapse\imapsend.pas',
  ldapsend in 'synapse\ldapsend.pas',
  mimeinln in 'synapse\mimeinln.pas',
  mimemess in 'synapse\mimemess.pas',
  mimepart in 'synapse\mimepart.pas',
  nntpsend in 'synapse\nntpsend.pas',
  pingsend in 'synapse\pingsend.pas',
  pop3send in 'synapse\pop3send.pas',
  slogsend in 'synapse\slogsend.pas',
  smtpsend in 'synapse\smtpsend.pas',
  snmpsend in 'synapse\snmpsend.pas',
  sntpsend in 'synapse\sntpsend.pas',
  ssl_openssl in 'synapse\ssl_openssl.pas',
  ssl_openssl_lib in 'synapse\ssl_openssl_lib.pas',
  synachar in 'synapse\synachar.pas',
  synacode in 'synapse\synacode.pas',
  synacrypt in 'synapse\synacrypt.pas',
  synadbg in 'synapse\synadbg.pas',
  synafpc in 'synapse\synafpc.pas',
  synaicnv in 'synapse\synaicnv.pas',
  synaip in 'synapse\synaip.pas',
  synamisc in 'synapse\synamisc.pas',
  synaser in 'synapse\synaser.pas',
  synautil in 'synapse\synautil.pas',
  synsock in 'synapse\synsock.pas',
  pngextra in 'pngimage\pngextra.pas',
  pngimage in 'pngimage\pngimage.pas',
  pnglang in 'pngimage\pnglang.pas',
  zlibpas in 'pngimage\zlibpas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(TFUser, FUser);
  Application.Run;
end.
