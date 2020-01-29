unit PswdChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, Like, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxButtons, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery;

type
  TfrmPswdChange = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edOldPassword: TcxTextEdit;
    edNewPassword1: TcxTextEdit;
    edNewPassword2: TcxTextEdit;
    btnOK: TcxButton;
    trMain: TpFIBTransaction;
    fibqPswChange: TpFIBQuery;
    procedure sbReFilterClick(Sender: TObject);
    procedure edOldPasswordKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPswdChange: TfrmPswdChange;

implementation

uses DM, Main, Misk;

{$R *.DFM}

procedure TfrmPswdChange.sbReFilterClick(Sender: TObject);
 var RowsAffected : Integer;
begin
 If Not (trMain.InTransaction) then
  trMain.StartTransaction;
 trMain.StartTransaction;
 fibqPswChange.ParamByName('USER_NAME').AsString := frmMain.dxStatusBar1.Panels[0].Text;
 fibqPswChange.ParamByName('OLD_PASSWORD').AsString := GetName(edOldPassword.Text,20);
 fibqPswChange.ParamByName('PASSWORD').AsString := GetName(edNewPassword1.Text,20);
 fibqPswChange.ExecQuery;
 RowsAffected := fibqPswChange.RowsAffected;
 If (RowsAffected=0) then
  MessageDlg('Неверно введен старый пароль!',mtError,[mbOK],0)
 else
  Begin
   If (RowsAffected>1) then
    Begin
     MessageDlg('Ошибка обновления, обратитесь к администратору!',mtError,[mbOK],0);
     trMain.Rollback;
     Exit
    End;
   trMain.Commit;
   MessageDlg('Пароль успешно изменен.',mtConfirmation,[mbOK],0);
   Close
  End
end;

procedure TfrmPswdChange.edOldPasswordKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 btnOK.Enabled := (edOldPassword.Text<>'') and (edNewPassword1.Text<>'') and
                  (edNewPassword1.Text=edNewPassword2.Text)
end;

end.
