unit LogIn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Registry,
  ExtCtrls, StdCtrls, Buttons, Db, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxDropDownEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  LbCipher, LbString, cxMaskEdit, dxBar, cxButtons, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, pFIBQuery;

type
  TfrmLogIn = class(TForm)
    Panel1: TPanel;
    edPassword: TcxTextEdit;
    lcUserName: TcxComboBox;
    sbOK: TcxButton;
    sbCancel: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    dbLogin: TpFIBDatabase;
    trLogIn: TpFIBTransaction;
    procedure sbCancelClick(Sender: TObject);
    procedure sbOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogIn: TfrmLogIn;

implementation

uses Misk, Main;

{$R *.DFM}

procedure TfrmLogIn.sbCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel
end;

procedure TfrmLogIn.sbOKClick(Sender: TObject);
 var MsgStr : String;
     LayoutName : Array [0..KL_NAMELENGTH] of Char;
     Key256 : TKey256;
     fibqLocalAux : TpFIBQuery;
     Password : String;
     EnabledStr : String; 

     procedure CleanUpTree(ItemLinks: TdxBarItemLinks);
           var k : Integer;
     begin
      For k := Pred(ItemLinks.Count) downto 0  do
       If (Pos(ItemLinks.Items[k].Caption,'ОкнаПомощьВыход')=0) then
        If (ItemLinks[k].Item is TdxBarSubItem) then
         CleanUpTree(TdxBarSubItem(ItemLinks[k].Item).ItemLinks)
        else
         If (Pos(';'+ItemLinks.BarManager.MainForm.Name+'.'+ItemLinks.Items[k].Item.Name+';',EnabledStr)=0) then
          ItemLinks[k].Item.Free;
      For k := Pred(ItemLinks.Count) downto 0  do
       If (ItemLinks[k].Item is TdxBarSubItem) then
        If (TdxBarSubItem(ItemLinks[k].Item).ItemLinks.Count=0) then
         ItemLinks[k].Item.Free;
     end;

begin
 If (GetKeyState(VK_CONTROL)<0) then
  Begin
   If (trLogIn.InTransaction) then
    trLogIn.Commit;
   dbLogin.Connected := False;
   dbLogin.ConnectParams.UserName := lcUserName.Text;
   Password := dbLogin.ConnectParams.Password;
   dbLogin.ConnectParams.Password := edPassword.Text;
   dbLogin.ConnectParams.RoleName := '';
   dbLogin.ConnectParams.CharSet := 'WIN1251';
   try
    dbLogin.Connected := True;
    If (DefParams=nil) then
     DefParams := TStringList.Create;
    DefParams.Add(lcUserName.Text);
    DefParams.Add(edPassword.Text);
    DefParams.Add('');
    ModalResult := mrOK
   except
    dbLogin.Connected := False;
    dbLogin.ConnectParams.UserName := 'UserList';
    dbLogin.ConnectParams.Password := Password;
    dbLogin.ConnectParams.CharSet := 'WIN1251';
    dbLogin.Connected := True;
    trLogIn.StartTransaction
   end;
  End
 else
  Begin
   fibqLocalAux := TpFIBQuery.Create(Nil);
   fibqLocalAux.Database := dbLogIn;
   fibqLocalAux.Transaction := trLogIn;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('select DB_USER_NAME, DB_USER_PASSWORD, ROLE_NAME from');
   fibqLocalAux.SQL.Add('GET_USER('#39+lcUserName.Text+#39', '#39+GetName(edPassword.Text,20)+#39')');
   fibqLocalAux.ExecQuery;
   If (fibqLocalAux.Fields[0].IsNull) then
    Begin
     edPassword.Text := '';
     MsgStr := '';
     If Odd(GetKeyState(VK_CAPITAL)) then
      MsgStr := '- Клавиша Caps Lock включена!'+#13#10;
     MsgStr := MsgStr+'- Раскладка клавиатуры ';
     GetKeyboardLayoutName(@LayoutName);
     If (LayoutName='00000419') then {LANG_RUSSIAN}
      MsgStr := MsgStr+'РУССКАЯ!';
     If (LayoutName='00000409') then {LANG_ENGLISH}
      MsgStr := MsgStr+'АНГЛИЙСКАЯ!';
     MessageDlg('Обратите внимание: '+#13#10+MsgStr,mtInformation,[mbOK],0);
     fibqLocalAux.Free;
     Exit
    End;
   If (DefParams=nil) then
    DefParams := TStringList.Create;
   DefParams.Clear;
   DefParams.Add(fibqLocalAux.FieldByName('DB_USER_NAME').AsString);
   DefParams.Add(fibqLocalAux.FieldByName('DB_USER_PASSWORD').AsString);
   DefParams.Add(fibqLocalAux.FieldByName('ROLE_NAME').AsString);
   fibqLocalAux.Free;
   dbLogin.Close;
   dbLogin.ConnectParams.UserName := DefParams[0];
   dbLogin.ConnectParams.Password := DefParams[1];
   dbLogin.ConnectParams.RoleName := DefParams[2];
   try
    dbLogin.Open;
   except
    edPassword.Text := '';
    MsgStr := '';
    If Odd(GetKeyState(VK_CAPITAL)) then
     MsgStr := '- Клавиша Caps Lock включена!'+#13#10;
    MsgStr := MsgStr+'- Раскладка клавиатуры ';
    GetKeyboardLayoutName(@LayoutName);
    If (LayoutName='00000419') then {LANG_RUSSIAN}
     MsgStr := MsgStr+'РУССКАЯ!';
    If (LayoutName='00000409') then {LANG_ENGLISH}
     MsgStr := MsgStr+'АНГЛИЙСКАЯ!';
    MessageDlg('Обратите внимание: '+#13#10+MsgStr,mtInformation,[mbOK],0);
    Exit
   end;
   fibqLocalAux := TpFIBQuery.Create(Nil);
   fibqLocalAux.Database := dbLogIn;
   fibqLocalAux.Transaction := trLogIn;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('SELECT UV.VISIBLE_NAME FROM USERS_VISIBLES UV, USERS U');
   fibqLocalAux.SQL.Add('WHERE (U.ID=UV.USER_ID) and (U.DB_USER_NAME='''+DefParams[0]+''')');
   If Not(trLogIn.InTransaction) then
    trLogIn.StartTransaction;
   fibqLocalAux.ExecQuery;
   EnabledStr := ';';
   While Not(fibqLocalAux.Eof) do
    Begin
     EnabledStr := EnabledStr+fibqLocalAux.Fields[0].AsString+';';
     fibqLocalAux.Next
    End;    // while
   fibqLocalAux.Close;
   fibqLocalAux.Free; 
   CleanUpTree(frmMain.dxBarManager.Bars[0].ItemLinks);
   dbLogin.Close;
   ModalResult := mrOK
  End
end;

procedure TfrmLogIn.FormCreate(Sender: TObject);
 var Reg : TRegistry;
     Key256 : TKey256;
     fibqLocalAux : TpFIBQuery;
begin
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 dbLogin.DatabaseName := '';
 If (Reg.KeyExists('\Software\BertSoftware\SMSProC\SetUp')) then
  Begin
   Reg.OpenKeyReadOnly('\Software\BertSoftware\SMSProC\SetUp');
   dbLogin.DatabaseName :=Reg.ReadString('Path')
  End;
 Reg.Free;
 GenerateLMDKey(Key256, SizeOf(Key256), '¬ЎлмyWІО=`бюЪ БєyX†f0“Ъвљ 845098yhfjb hJLUGLI,. ., **&*^#');
 dbLogin.ConnectParams.UserName := 'UserList';
 dbLogin.ConnectParams.Password :=RDLEncryptStringCBCEx('vvlxZH7SR6g0SxlHanLmLo+F8qW/nWuMVzdLdByRgpA=', Key256, 32, False);
 dbLogin.ConnectParams.CharSet := 'WIN1251';
 try
  dbLogin.Connected := True;
 except
  MessageDlg('Программа не установлена, либо отсутствует сервер баз данных!',mtError,[mbOK],0);
  Application.Terminate
 end;
 trLogIn.StartTransaction;
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := dbLogIn;
 fibqLocalAux.Transaction := trLogIn;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.Add('select USER_NAME from USER_LIST order by 1');
 fibqLocalAux.ExecQuery;
 lcUserName.Properties.Items.Clear;
 While NOT (fibqLocalAux.Eof) do
  Begin
   lcUserName.Properties.Items.Add(fibqLocalAux.FieldByName('USER_NAME').AsString);
   fibqLocalAux.Next
  End;
 fibqLocalAux.Close;
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_CURRENT_USER;
 Reg.OpenKeyReadOnly('\Software\BertSoftware\SMSProC');
 lcUserName.Text := Reg.ReadString('LastLogOn');
 Reg.Free
end;

procedure TfrmLogIn.FormClose(Sender: TObject; var Action: TCloseAction);
 var Reg: TRegistry;
begin
 If (ModalResult=mrOK) then
  Begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_CURRENT_USER;
   try
    Reg.OpenKey('\Software\BertSoftware\SMSProC',True);
    Reg.WriteString('LastLogOn', lcUserName.Text);
   finally
    Reg.Free
   end
  End;
 dbLogin.Connected := False
end;

end.
