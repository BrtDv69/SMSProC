unit ISUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Like, DB, dxBar, FIBDataSet, pFIBDataSet, cxGridCustomPopupMenu,
  cxGridPopupMenu, FIBDatabase, pFIBDatabase, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxDBEdit, StdCtrls, ExtCtrls, cxButtons, pFIBQuery;

type
  TfrmISUsers = class(TfrmLike)
    fibdsServices: TpFIBDataSet;
    fibdsServicesID: TFIBIntegerField;
    fibdsServicesSERVICE_DESCRIPTION: TFIBStringField;
    fibdsServicesVALID: TFIBIntegerField;
    dsServices: TDataSource;
    fibdsOperators: TpFIBDataSet;
    dsOperators: TDataSource;
    fibdsOperatorsID: TFIBIntegerField;
    fibdsOperatorsNAME: TFIBStringField;
    fibdsMainListID: TFIBIntegerField;
    fibdsMainListSERVICE_ID: TFIBIntegerField;
    fibdsMainListPHONE_NUMBER: TFIBStringField;
    fibdsMainListOPERATOR_ID: TFIBIntegerField;
    fibdsMainListREGISTRATION_DATE: TFIBDateField;
    fibdsMainListSMS_COUNT: TFIBIntegerField;
    tvMainListSERVICE_ID: TcxGridDBColumn;
    tvMainListPHONE_NUMBER: TcxGridDBColumn;
    tvMainListOPERATOR_ID: TcxGridDBColumn;
    tvMainListREGISTRATION_DATE: TcxGridDBColumn;
    tvMainListSMS_COUNT: TcxGridDBColumn;
    btnSend: TcxButton;
    btnCancel: TcxButton;
    mSMS: TcxMemo;
    procedure FormCreate(Sender: TObject);
    procedure Run; override;
    procedure OpenAll; override;
    procedure btnCancelClick(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure tvMainListSelectionChanged(Sender: TcxCustomGridTableView);
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmISUsers: TfrmISUsers;

implementation

uses DM;

{$R *.dfm}

var BkMrkIDMainList: Integer = 0;

procedure TfrmISUsers.FormCreate(Sender: TObject);
begin
 FName := 'Пользователи ИС';
 inherited;
end;

procedure TfrmISUsers.Run;
begin
 OpenAll;
 Show
end;

procedure TfrmISUsers.OpenAll;
begin
 inherited;
 If Not(frmDM.trMain.InTransaction) then
  frmDM.trMain.StartTransaction;
 fibdsServices.FullRefresh;
 fibdsOperators.FullRefresh;
 If (fibdsMainList.Active) then
  fibdsMainList.ReopenLocate('ID')
 else
  Begin
   fibdsMainList.FullRefresh;
   If (BkMrkIDMainList<>0) then
    fibdsMainList.Locate('ID',BkMrkIDMainList,[])
  End
end;

procedure TfrmISUsers.btnCancelClick(Sender: TObject);
begin
 cxSplitter1.CloseSplitter
end;

procedure TfrmISUsers.cxSplitter1AfterClose(Sender: TObject);
begin
 tvMainList.OptionsSelection.MultiSelect := False
end;

procedure TfrmISUsers.cxSplitter1AfterOpen(Sender: TObject);
begin
 tvMainList.OptionsSelection.MultiSelect := True
end;

procedure TfrmISUsers.Panel1Resize(Sender: TObject);
begin
 btnCancel.Left := btnCancel.Parent.Width-77;
 btnSend.Left := btnCancel.Parent.Width-161
end;

procedure TfrmISUsers.tvMainListSelectionChanged(
  Sender: TcxCustomGridTableView);
begin
 btnSend.Enabled := (tvMainList.Controller.SelectedRecordCount>0)
end;

procedure TfrmISUsers.btnSendClick(Sender: TObject);
 var fibqLocalAux : TpFIBQuery;
     I: Integer;
begin
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := fibdsMainList.Database;
 fibqLocalAux.Transaction := fibdsMainList.Transaction;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.Add('insert into OUT_SMS_POOL (OPERATOR_ID,SOCKET_ID,PHONE_NUMBER,SERVICE_ID,MSG)');
 fibqLocalAux.SQL.Add('values (:OPERATOR_ID,(select first 1 S.ID from L_SOCKETS S where (S.OPERATOR_ID=:OPERATOR_ID)),:PHONE_NUMBER,:SERVICE_ID,:MSG)');
 For I := 0 to Pred(tvMainList.Controller.SelectedRecordCount) do    // Iterate
  Begin
   fibqLocalAux.ParamByName('OPERATOR_ID').AsInteger := tvMainList.DataController.Values[tvMainList.Controller.SelectedRecords[I].Index,tvMainListOPERATOR_ID.Index];
   fibqLocalAux.ParamByName('PHONE_NUMBER').AsString := tvMainList.DataController.Values[tvMainList.Controller.SelectedRecords[I].Index,tvMainListPHONE_NUMBER.Index];
   fibqLocalAux.ParamByName('SERVICE_ID').AsInteger := tvMainList.DataController.Values[tvMainList.Controller.SelectedRecords[I].Index,tvMainListSERVICE_ID.Index];
   fibqLocalAux.ParamByName('MSG').AsString := mSMS.Text;
   fibqLocalAux.ExecQuery
  End;    // for
 fibqLocalAux.Free;
 trMain.CommitRetaining;
 tvMainList.Controller.ClearSelection;
 cxSplitter1.CloseSplitter
end;

end.
