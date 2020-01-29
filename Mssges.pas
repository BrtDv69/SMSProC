unit Mssges;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Like, DB, dxBar, FIBDataSet, pFIBDataSet, cxGridCustomPopupMenu,
  cxGridPopupMenu, FIBDatabase, pFIBDatabase, cxSplitter, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxDBEdit, StdCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxLabel, LikeServices, pFIBQuery,
  cxGraphics, Menus;

type
  TfrmMessages = class(TfrmLikeServices)
    fibdsMainListID: TFIBIntegerField;
    fibdsMainListRESPONCE: TFIBStringField;
    fibdsMainListVALID: TFIBIntegerField;
    fibdsMainListCOMMENTS: TFIBStringField;
    fibdsResponceServices: TpFIBDataSet;
    dsResponceServices: TDataSource;
    fibdsResponceServicesID: TFIBIntegerField;
    fibdsResponceServicesSERVICE_ID: TFIBIntegerField;
    fibdsResponceServicesS_ID: TFIBIntegerField;
    fibdsResponceServicesS_DESCRIPTION: TFIBStringField;
    fibdsResponceServicesRESPONCE_ID: TFIBIntegerField;
    tvMainServicesSERVICE_ID: TcxGridDBColumn;
    tvMainServicesS_ID: TcxGridDBColumn;
    tvMainServicesS_DESCRIPTION: TcxGridDBColumn;
    tvMainListRESPONCE: TcxGridDBColumn;
    tvMainListVALID: TcxGridDBColumn;
    tvMainListCOMMENTS: TcxGridDBColumn;
    fibdsMainListRESPONCE_NUMBER: TFIBIntegerField;
    tvMainListRESPONCE_NUMBER: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Run; override;
    procedure OpenAll; override;
    procedure dsMainListStateChange(Sender: TObject);
    procedure fibdsMainListBeforeScroll(DataSet: TDataSet);
    procedure sbApplyClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure fibdsResponceServicesUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
    procedure tvMainServicesCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvMainServicesCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessages: TfrmMessages;

implementation

uses DM;

{$R *.dfm}

var BkMrkIDMainList: Integer = 0;
    BkMrkIDResponceServices: Integer = 0;

procedure TfrmMessages.FormCreate(Sender: TObject);
begin
 FName := 'Справочник сообщений Информационных Сервисов';
 inherited
end;

procedure TfrmMessages.Run;
begin
 OpenAll;
 Show
end;

procedure TfrmMessages.OpenAll;
begin
 inherited;
 If Not(frmDM.trMain.InTransaction) then
  frmDM.trMain.StartTransaction;
 If (fibdsMainList.Active) then
  fibdsMainList.ReopenLocate('ID')
 else
  Begin
   fibdsMainList.FullRefresh;
   If (BkMrkIDMainList<>0) then
    fibdsMainList.Locate('ID',BkMrkIDMainList,[])
  End;
 If (fibdsResponceServices.Active) then
  fibdsResponceServices.ReopenLocate('ID')
 else
  Begin
   fibdsResponceServices.FullRefresh;
   If (BkMrkIDResponceServices<>0) then
    fibdsResponceServices.Locate('ID',BkMrkIDResponceServices,[])
  End;
end;

procedure TfrmMessages.dsMainListStateChange(Sender: TObject);
begin
 SetACButtons((fibdsMainList.State in [dsEdit,dsInsert]) or (fibdsMainList.UpdatesPending) or
              (fibdsResponceServices.State in [dsEdit,dsInsert]) or (fibdsResponceServices.UpdatesPending))
end;

procedure TfrmMessages.fibdsMainListBeforeScroll(DataSet: TDataSet);
begin
 If ((fibdsResponceServices.State in [dsEdit,dsInsert]) or
     (fibdsResponceServices.UpdatesPending)) then
  sbApply.Click
end;

procedure TfrmMessages.sbApplyClick(Sender: TObject);
begin
 If (MessageDlg('Сохранить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.ApplyUpdates;
   fibdsResponceServices.ApplyUpdates;
   BkMrkIDMainList := fibdsMainListID.Value;
   BkMrkIDResponceServices := fibdsResponceServicesID.Value;
   trMain.Commit;
   OpenAll;
   SetACButtons(False)
  End
end;

procedure TfrmMessages.sbCancelClick(Sender: TObject);
begin
 If (MessageDlg('Отменить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.BeforeScroll := nil;
   fibdsMainList.CancelUpdates;
   fibdsResponceServices.CancelUpdates;
   SetACButtons(False);
   fibdsMainList.BeforeScroll := fibdsMainListBeforeScroll
  End
end;

procedure TfrmMessages.fibdsResponceServicesUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
 var fibqLocalAux : TpFIBQuery;
begin
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := fibdsMainList.Database;
 fibqLocalAux.Transaction := fibdsMainList.Transaction;
 fibqLocalAux.SQL.Clear;
 If (fibdsResponceServicesID.IsNull) and Not(fibdsResponceServicesSERVICE_ID.IsNull) then
  fibqLocalAux.SQL.Add('insert into I_RESPONCE_SERVICES (SERVICE_ID,RESPONCE_ID) values ('+fibdsResponceServicesS_ID.AsString+','+fibdsResponceServicesRESPONCE_ID.AsString+')');
 If not(fibdsResponceServicesID.IsNull) and (fibdsResponceServicesSERVICE_ID.IsNull) then
  fibqLocalAux.SQL.Add('delete from I_RESPONCE_SERVICES where (ID='+fibdsResponceServicesID.AsString+')');
 If (fibqLocalAux.SQL.Count>0) then
  fibqLocalAux.ExecQuery;
 fibqLocalAux.Free;
 UpdateAction := uaApplied
end;

procedure TfrmMessages.tvMainServicesCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 If (N1.Checked) then
  Exit;
 If (AViewInfo.GridRecord.Values[tvMainServicesSERVICE_ID.Index]=null) then
  ACanvas.Font.Style := []
 else
  ACanvas.Font.Style := [fsBold]
end;

procedure TfrmMessages.tvMainServicesCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 If (fibdsMainList.RecordCount>0) and (ACellViewInfo.Text<>'') and (AButton=mbLeft) and
     Not(N1.Checked) then
  Begin
   If Not(fibdsResponceServices.State=dsEdit) then
    fibdsResponceServices.Edit;
   If (fibdsResponceServicesSERVICE_ID.IsNull) then
    Begin
     fibdsResponceServicesSERVICE_ID.Value := fibdsResponceServicesS_ID.AsInteger;
     fibdsResponceServicesRESPONCE_ID.Value := fibdsMainListID.AsInteger;
    End
   else
    fibdsResponceServicesSERVICE_ID.Clear;
   fibdsResponceServices.Post;
   AHandled := True
  End
end;

procedure TfrmMessages.N1Click(Sender: TObject);
begin
 N1.Checked := Not N1.Checked;
 If (N1.Checked) then
  Begin
   fibdsMainList.ParamByName('WHERE').AsString := 'where exists(select * '+
               'from I_RESPONCE_SERVICES RS '+
              'where (RS.RESPONCE_ID=R.ID) and (RS.SERVICE_ID=:S_ID))';
   fibdsResponceServices.DataSource := nil;
   fibdsResponceServices.Open;
   fibdsMainList.DataSource := dsResponceServices
  End
 else
  Begin
   fibdsMainList.ParamByName('WHERE').AsString := '';
   fibdsMainList.DataSource := nil;
   fibdsMainList.Open;
   fibdsResponceServices.DataSource := dsMainList
  End
end;

end.
