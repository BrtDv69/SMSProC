unit Templates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Like, DB, dxBar, FIBDataSet, pFIBDataSet, cxGridCustomPopupMenu,
  cxGridPopupMenu, FIBDatabase, pFIBDatabase, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxDBEdit, StdCtrls, ExtCtrls;

type
  TfrmTemplates = class(TfrmLike)
    fibdsMainListID: TFIBIntegerField;
    fibdsMainListSERVICE_ID: TFIBIntegerField;
    fibdsMainListPREV_MSG: TFIBStringField;
    fibdsMainListNEXT_MSG: TFIBStringField;
    fibdsMainListPRIZE_MSG: TFIBStringField;
    fibdsMainListCOMMENTS: TFIBStringField;
    fibdsServices: TpFIBDataSet;
    dsServices: TDataSource;
    fibdsServicesID: TFIBIntegerField;
    fibdsServicesSERVICE_DESCRIPTION: TFIBStringField;
    fibdsServicesVALID: TFIBIntegerField;
    tvMainListSERVICE_ID: TcxGridDBColumn;
    tvMainListPREV_MSG: TcxGridDBColumn;
    tvMainListNEXT_MSG: TcxGridDBColumn;
    tvMainListPRIZE_MSG: TcxGridDBColumn;
    tvMainListCOMMENTS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Run; override;
    procedure OpenAll; override;
    procedure sbApplyClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemplates: TfrmTemplates;

implementation

uses DM;

{$R *.dfm}

var BkMrkIDMainList: Integer = 0;

procedure TfrmTemplates.FormCreate(Sender: TObject);
begin
 FName := 'Шаблоны СМС Викторин';
 inherited;
end;

procedure TfrmTemplates.Run;
begin
 OpenAll;
 Show
end;

procedure TfrmTemplates.OpenAll;
begin
 inherited;
 If Not(frmDM.trMain.InTransaction) then
  frmDM.trMain.StartTransaction;
 fibdsServices.FullRefresh;
 If (fibdsMainList.Active) then
  fibdsMainList.ReopenLocate('ID')
 else
  Begin
   fibdsMainList.FullRefresh;
   If (BkMrkIDMainList<>0) then
    fibdsMainList.Locate('ID',BkMrkIDMainList,[])
  End
end;

procedure TfrmTemplates.sbApplyClick(Sender: TObject);
begin
 If (MessageDlg('Сохранить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.ApplyUpdates;
   BkMrkIDMainList := fibdsMainListID.Value;
   trMain.Commit;
   OpenAll;
   SetACButtons(False)
  End
end;

procedure TfrmTemplates.sbCancelClick(Sender: TObject);
begin
 If (MessageDlg('Отменить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.CancelUpdates;
   SetACButtons(False)
  End
end;

end.
