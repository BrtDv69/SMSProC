unit Prizes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Like, DB, dxBar, FIBDataSet, pFIBDataSet, cxGridCustomPopupMenu,
  cxGridPopupMenu, FIBDatabase, pFIBDatabase, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxDBEdit, StdCtrls, ExtCtrls, LikeServices, pFIBQuery, cxGraphics;

type
  TfrmPrizes = class(TfrmLikeServices)
    fibdsPrizeServices: TpFIBDataSet;
    fibdsPrizeServicesID: TFIBIntegerField;
    fibdsPrizeServicesSERVICE_ID: TFIBIntegerField;
    fibdsPrizeServicesS_ID: TFIBIntegerField;
    fibdsPrizeServicesS_DESCRIPTION: TFIBStringField;
    dsPrizeServices: TDataSource;
    fibdsMainListID: TFIBIntegerField;
    fibdsMainListNAME: TFIBStringField;
    fibdsMainListVALID: TFIBIntegerField;
    fibdsMainListCOMMENTS: TFIBStringField;
    fibdsPrizeServicesPRIZE_ID: TFIBIntegerField;
    fibdsPrizeServicesSMS_COUNT: TFIBIntegerField;
    tvMainServicesSERVICE_ID: TcxGridDBColumn;
    tvMainServicesS_ID: TcxGridDBColumn;
    tvMainServicesS_DESCRIPTION: TcxGridDBColumn;
    tvMainServicesSMS_COUNT: TcxGridDBColumn;
    tvMainListNAME: TcxGridDBColumn;
    tvMainListVALID: TcxGridDBColumn;
    tvMainListCOMMENTS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Run; override;
    procedure OpenAll; override;
    procedure dsMainListStateChange(Sender: TObject);
    procedure fibdsMainListBeforeScroll(DataSet: TDataSet);
    procedure sbApplyClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure fibdsPrizeServicesUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
    procedure tvMainServicesCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvMainServicesCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvMainServicesEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrizes: TfrmPrizes;

implementation

uses DM;

{$R *.dfm}

var BkMrkIDMainList: Integer = 0;
    BkMrkIDPrizeServices: Integer = 0;

procedure TfrmPrizes.FormCreate(Sender: TObject);
begin
 FName := 'Справочник призов';
 inherited;
end;

procedure TfrmPrizes.Run;
begin
 OpenAll;
 Show
end;

procedure TfrmPrizes.OpenAll;
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
 If (fibdsPrizeServices.Active) then
  fibdsPrizeServices.ReopenLocate('ID')
 else
  Begin
   fibdsPrizeServices.FullRefresh;
   If (BkMrkIDPrizeServices<>0) then
    fibdsPrizeServices.Locate('ID',BkMrkIDPrizeServices,[])
  End;
end;

procedure TfrmPrizes.dsMainListStateChange(Sender: TObject);
begin
 SetACButtons((fibdsMainList.State in [dsEdit,dsInsert]) or (fibdsMainList.UpdatesPending) or
              (fibdsPrizeServices.State in [dsEdit,dsInsert]) or (fibdsPrizeServices.UpdatesPending))
end;

procedure TfrmPrizes.fibdsMainListBeforeScroll(DataSet: TDataSet);
begin
 If ((fibdsPrizeServices.State in [dsEdit,dsInsert]) or
     (fibdsPrizeServices.UpdatesPending)) then
  sbApply.Click
end;

procedure TfrmPrizes.sbApplyClick(Sender: TObject);
begin
 If (MessageDlg('Сохранить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.ApplyUpdates;
   fibdsPrizeServices.ApplyUpdates;
   BkMrkIDMainList := fibdsMainListID.Value;
   BkMrkIDPrizeServices := fibdsPrizeServicesID.Value;
   trMain.Commit;
   OpenAll;
   SetACButtons(False)
  End
end;

procedure TfrmPrizes.sbCancelClick(Sender: TObject);
begin
 If (MessageDlg('Отменить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.BeforeScroll := nil;
   fibdsMainList.CancelUpdates;
   fibdsPrizeServices.CancelUpdates;
   SetACButtons(False);
   fibdsMainList.BeforeScroll := fibdsMainListBeforeScroll
  End
end;

procedure TfrmPrizes.fibdsPrizeServicesUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
 var fibqLocalAux : TpFIBQuery;
begin
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := fibdsMainList.Database;
 fibqLocalAux.Transaction := fibdsMainList.Transaction;
 fibqLocalAux.SQL.Clear;
 If (fibdsPrizeServicesID.IsNull) and Not(fibdsPrizeServicesSERVICE_ID.IsNull) then
  fibqLocalAux.SQL.Add('insert into PRIZE_SERVICES (SERVICE_ID,PRIZE_ID,SMS_COUNT) values ('+fibdsPrizeServicesS_ID.AsString+','+fibdsPrizeServicesPRIZE_ID.AsString+','+fibdsPrizeServicesSMS_COUNT.AsString+')');
 If not(fibdsPrizeServicesID.IsNull) and (fibdsPrizeServicesSERVICE_ID.IsNull) then
  fibqLocalAux.SQL.Add('delete from I_RESPONCE_SERVICES where (ID='+fibdsPrizeServicesID.AsString+')');
 If (fibqLocalAux.SQL.Count>0) then
  fibqLocalAux.ExecQuery;
 fibqLocalAux.Free;
 UpdateAction := uaApplied
end;

procedure TfrmPrizes.tvMainServicesCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 If (AViewInfo.GridRecord.Values[tvMainServicesSERVICE_ID.Index]=null) then
  ACanvas.Font.Style := []
 else
  ACanvas.Font.Style := [fsBold]
end;

procedure TfrmPrizes.tvMainServicesCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 If (fibdsMainList.RecordCount>0) and (ACellViewInfo.Text<>'') then
  Begin
   If Not(fibdsPrizeServices.State=dsEdit) then
    fibdsPrizeServices.Edit;
   If (fibdsPrizeServicesSERVICE_ID.IsNull) then
    Begin
     fibdsPrizeServicesSERVICE_ID.Value := fibdsPrizeServicesS_ID.AsInteger;
     fibdsPrizeServicesPRIZE_ID.Value := fibdsMainListID.AsInteger
    End
   else
    Begin
     fibdsPrizeServicesSERVICE_ID.Clear;
     fibdsPrizeServicesSMS_COUNT.Clear
    End;
   fibdsPrizeServices.Post;
   AHandled := True
  End
end;

procedure TfrmPrizes.tvMainServicesEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
 AAllow := not(fibdsPrizeServicesSERVICE_ID.IsNull) 
end;

end.
