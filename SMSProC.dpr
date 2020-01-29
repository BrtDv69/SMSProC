program SMSProC;

uses
  Forms,
  Registry,
  Windows,
  Controls,
  Dialogs,
  Main in 'Main.pas' {frmMain},
  About in 'About.pas' {frmAbout},
  Like in 'Like.pas' {frmLike},
  Misk in 'Misk.pas',
  DM in 'DM.pas' {frmDM: TDataModule},
  ExportOptions in 'ExportOptions.pas' {frmExportOptions},
  devex_loc in 'devex_loc.pas',
  AdminProg in 'AdminProg.pas' {frmAdminProg},
  Services in 'Services.pas' {frmServices},
  Questions in 'Questions.pas' {frmQuestions},
  Templates in 'Templates.pas' {frmTemplates},
  Prizes in 'Prizes.pas' {frmPrizes},
  Mssges in 'Mssges.pas' {frmMessages},
  LikeServices in 'LikeServices.pas' {frmLikeServices},
  LikeAnal in 'LikeAnal.pas' {frmLikeAnal},
  SVAnalTotal in 'SVAnalTotal.pas' {frmSVAnalTotal},
  ISUsers in 'ISUsers.pas' {frmISUsers},
  SVCompetitors in 'SVCompetitors.pas' {frmSVCompetitors},
  SendedSMS in 'SendedSMS.pas' {frmSendedSMS},
  AdminUsers in 'AdminUsers.pas' {frmAdminUsers},
  Operators in 'Operators.pas' {frmOperators},
  Sockets in 'Sockets.pas' {frmSockets},
  Test in 'Test.pas' {frmTest},
  LogIn in 'LogIn.pas' {frmLogIn},
  PswdChange in 'PswdChange.pas' {frmPswdChange};

{$R *.res}
var Reg: TRegistry;
    tc : Cardinal;

begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  If (Reg.KeyExists('\Software\BertSoftware\SMSProC\SetUp')) then
   Begin
    Reg.OpenKeyReadOnly('\Software\BertSoftware\SMSProC\SetUp');
    If (Reg.ValueExists('Path')) then
     Begin
      Reg.Free;
      Application.Initialize;
      frmAbout := TfrmAbout.Create(Application);
      tc := GetTickCount;
      frmAbout.ClientWidth := frmAbout.Image1.Picture.Width;
      frmAbout.ClientHeight := frmAbout.Image1.Picture.Height;
      frmAbout.Show;
      frmAbout.Update;
      Application.Title := 'SMSProC';
      Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLogIn, frmLogIn);
  While Abs(GetTickCount-tc)<2000 do
       Application.ProcessMessages;
      frmAbout.Free;
      frmLogIn.ShowModal;
      If (frmLogIn.ModalResult=mrOK) then
       Begin
        frmMain.dxStatusBar1.Panels[0].Text := frmLogIn.lcUserName.Text;
        frmLogIn.Free;
        Application.CreateForm(TfrmDM, frmDM);
        Application.Run
       End
      else
       Begin
        frmLogIn.Free;
        frmMain.Close
       End;
     End
   End
  else
   Begin
    Reg.Free;
    MessageDlg('Программный продукт не установлен.',mtError,[mbOK],0)
   End
end.
