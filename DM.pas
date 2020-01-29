unit DM;

interface

uses
  SysUtils, Classes, FIBDatabase, pFIBDatabase, ImgList, Controls,
  cxClasses, cxStyles, cxGridTableView, cxLookAndFeels, cxGridCardView,
  cxTL, DB, FIBDataSet, pFIBDataSet, Forms, Registry, Windows,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
  cxGrid, Dialogs, Graphics, cxEdit, cxEditRepositoryItems;

type
  TfrmDM = class(TDataModule)
    dbMain: TpFIBDatabase;
    ilDisabledButtons: TImageList;
    cxStyleRepository: TcxStyleRepository;
    stHeader: TcxStyle;
    stPreview: TcxStyle;
    cxIncSearch: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    ilButtons: TImageList;
    cxGridCardViewStyleSheet1: TcxGridCardViewStyleSheet;
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    stNeeded: TcxStyle;
    trMain: TpFIBTransaction;
    trLock: TpFIBTransaction;
    cxEditRepository1: TcxEditRepository;
    ImageComboBoxSelectRights: TcxEditRepositoryImageComboBoxItem;
    ilAux: TImageList;
    dbOwner: TpFIBDatabase;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDM: TfrmDM;

implementation

uses Main, Misk;

{$R *.dfm}

procedure TfrmDM.DataModuleCreate(Sender: TObject);
 var Reg : TRegistry;
begin
 Reg := TRegistry.Create;
 Reg.RootKey := HKEY_LOCAL_MACHINE;
 dbMain.DatabaseName := '';
 If (Reg.KeyExists('\Software\BertSoftware\SMSProC\SetUp')) then
  Begin
   Reg.OpenKeyReadOnly('\Software\BertSoftware\SMSProC\SetUp');
   If (Reg.ValueExists('Path')) then
    dbMain.DatabaseName := Reg.ReadString('Path')
  End;
 Reg.Free;
 If (dbMain.DatabaseName='') then
  Begin
   MessageDlg('Программа не установлена!',mtError,[mbOK],0);
   Application.Terminate
  End;
 dbMain.ConnectParams.UserName := DefParams[0];
 dbMain.ConnectParams.Password := DefParams[1];
 dbMain.ConnectParams.RoleName := DefParams[2];
 DefParams.Free;
 dbMain.Open;
 LoadKeyboardLayout('00000419', KLF_ACTIVATE)
end;

procedure TfrmDM.DataModuleDestroy(Sender: TObject);
begin
 dbMain.Connected := False;
end;

end.
