unit SVAnalTotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LikeAnal, DB, dxBar, FIBDataSet, pFIBDataSet,
  cxGridCustomPopupMenu, cxGridPopupMenu, FIBDatabase, pFIBDatabase,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxFilter,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, cxContainer, cxEdit, cxTextEdit, cxMemo, cxDBEdit, StdCtrls,
  ExtCtrls, cxLabel, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmSVAnalTotal = class(TfrmLikeAnal)
    fibdsOperators: TpFIBDataSet;
    fibdsOperatorsID: TFIBIntegerField;
    fibdsOperatorsNAME: TFIBStringField;
    dsOperators: TDataSource;
    fibdsServices: TpFIBDataSet;
    fibdsServicesID: TFIBIntegerField;
    fibdsServicesSERVICE_DESCRIPTION: TFIBStringField;
    fibdsServicesVALID: TFIBIntegerField;
    dsServices: TDataSource;
    fibdsMainListSERVICE_KIND: TFIBIntegerField;
    fibdsMainListSERVICE_ID: TFIBIntegerField;
    fibdsMainListOPERATOR_ID: TFIBIntegerField;
    fibdsMainListSMS_DATE: TFIBDateField;
    fibdsMainListSMS_HOUR: TFIBSmallIntField;
    fibdsMainListPHONE_NUMBER: TFIBStringField;
    fibdsMainListSMS_COUNT: TFIBIntegerField;
    tvMainListSERVICE_KIND: TcxGridDBColumn;
    tvMainListSERVICE_ID: TcxGridDBColumn;
    tvMainListOPERATOR_ID: TcxGridDBColumn;
    tvMainListSMS_DATE: TcxGridDBColumn;
    tvMainListSMS_HOUR: TcxGridDBColumn;
    tvMainListPHONE_NUMBER: TcxGridDBColumn;
    tvMainListSMS_COUNT: TcxGridDBColumn;
    fibdsServiceKind: TpFIBDataSet;
    dsServiceKind: TDataSource;
    fibdsServiceKindID: TFIBIntegerField;
    fibdsServiceKindNAME: TFIBStringField;
    pnlPeriod: TPanel;
    btnOK: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    deStart: TcxDateEdit;
    deStop: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure RunAnal(ServiceKind, ReportType: Integer);
    procedure OpenAll; override;
    procedure fibdsMainListBeforeOpen(DataSet: TDataSet);
    procedure tvMainListColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure cxLabel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure grdMainListResize(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSVAnalTotal: TfrmSVAnalTotal;

implementation

uses DM, Main;

{$R *.dfm}

procedure TfrmSVAnalTotal.FormCreate(Sender: TObject);
 var D, M, Y: Word;
begin
 FName := 'Викторины - операторы';
 DecodeDate(Date, Y, M, D);
 If (M < 12) then
  Begin
   deStart.Date := EncodeDate(Y, M, 1);
   deStop.Date := EncodeDate(Y, M + 1, 1);
  End
 else
  Begin
   deStart.Date := EncodeDate(Y, M, 1);
   deStop.Date := EncodeDate(Y + 1, 1, 1);
  End;
 inherited;
end;

procedure TfrmSVAnalTotal.RunAnal(ServiceKind, ReportType: Integer);
 var k : Integer;
begin
 OpenAll;
 tvMainListSERVICE_KIND.DataBinding.Filter.Clear;
 tvMainListSERVICE_KIND.DataBinding.Filter.Root.AddItem(tvMainListSERVICE_KIND,foEqual,ServiceKind,fibdsServiceKind.Lookup('ID',ServiceKind,'NAME'));
 tvMainListSERVICE_KIND.DataBinding.Filter.Active := True;
 tvMainListSERVICE_KIND.Visible := True;
 tvMainListSERVICE_ID.Visible := True;
 tvMainListOPERATOR_ID.Visible := True;
 tvMainListSMS_DATE.Visible := (ReportType in [3,4]);
 tvMainListSMS_HOUR.Visible := (ReportType in [4]);
 tvMainListPHONE_NUMBER.Visible := (ReportType in [2]);
 Case ReportType of  //
  1: Case ServiceKind of  //
      1: FName := 'ИС - операторы';
      2: FName := 'Викторины - операторы';
     End;  // case
  2: Case ServiceKind of  //
      1: FName := 'ИС - операторы и номера';
      2: FName := 'Викторины - операторы и номера';
     End;  // case
  3: Case ServiceKind of  //
      1: FName := 'ИС - операторы и даты';
      2: FName := 'Викторины - операторы и даты';
     End;  // case
  4: Case ServiceKind of  //
      1: FName := 'ИС - операторы и время суток';
      2: FName := 'Викторины - операторы и время суток';
     End;  // case
 End;  // case
 With frmMain.dxBarManager.Bars[1].ItemLinks do // TaskBar
  For k := Pred(AvailableItemCount) downto 0 do
   With (AvailableItems[k].Item as TdxBarButton) do
    If (TForm(Tag)=frmSVAnalTotal) then
     Begin
      Caption := FName;
      Hint := FName;
      Break
     End;
 For k := 0 to Pred(frmMain.bliListWindows.Items.Count) do    // Iterate
  Begin
   If (frmMain.bliListWindows.Items.Objects[k] is TfrmSVAnalTotal) then
    If (TfrmSVAnalTotal(frmMain.bliListWindows.Items.Objects[k])=frmSVAnalTotal) then
     Begin
      frmMain.bliListWindows.Items.Strings[k] := FName;
      Break
     End;
  End;    // for
 Show
end;

procedure TfrmSVAnalTotal.OpenAll;
begin
 inherited;
 If Not(frmDM.trMain.InTransaction) then
  frmDM.trMain.StartTransaction;
 fibdsServices.FullRefresh;
 fibdsOperators.FullRefresh;
 fibdsServiceKind.FullRefresh
end;

procedure TfrmSVAnalTotal.fibdsMainListBeforeOpen(DataSet: TDataSet);
 var GroupStr : String;
begin
 GroupStr := '';
 If (tvMainListSERVICE_KIND.Visible) then
  Begin
   fibdsMainList.ParamByName('SERVICE_KIND').AsString := 'S.SERVICE_KIND';
   GroupStr := '1,'
  End
 else
  fibdsMainList.ParamByName('SERVICE_KIND').AsString := '1';
 If (tvMainListSERVICE_ID.Visible) then
  Begin
   fibdsMainList.ParamByName('SERVICE_ID').AsString := 'SH.SERVICE_ID';
   GroupStr := GroupStr+'2,'
  End
 else
  fibdsMainList.ParamByName('SERVICE_ID').AsString := '1';
 If (tvMainListOPERATOR_ID.Visible) then
  Begin
   fibdsMainList.ParamByName('OPERATOR_ID').AsString := 'SH.OPERATOR_ID';
   GroupStr := GroupStr+'3,'
  End
 else
  fibdsMainList.ParamByName('OPERATOR_ID').AsString := '1';
 If (tvMainListSMS_DATE.Visible) then
  Begin
   fibdsMainList.ParamByName('SMS_TIMESTAMP').AsString := 'SH.SMS_TIMESTAMP';
   GroupStr := GroupStr+'4,'
  End
 else
  fibdsMainList.ParamByName('SMS_TIMESTAMP').AsString := '''01.01.2006''';
 If (tvMainListSMS_HOUR.Visible) then
  Begin
   fibdsMainList.ParamByName('SMS_HOUR').AsString := 'extract(hour from SH.SMS_TIMESTAMP)';
   GroupStr := GroupStr+'5,'
  End
 else
  fibdsMainList.ParamByName('SMS_HOUR').AsString := '1';
 If (tvMainListPHONE_NUMBER.Visible) then
  Begin
   fibdsMainList.ParamByName('PHONE_NUMBER').AsString := 'SH.PHONE_NUMBER';
   GroupStr := GroupStr+'6,'
  End
 else
  fibdsMainList.ParamByName('PHONE_NUMBER').AsString := '''1''';
 GroupStr := Copy(GroupStr,1,Pred(Length(GroupStr)));
 fibdsMainList.ParamByName('group_by').AsString := GroupStr;
 fibdsMainList.ParamByName('START_DATE').AsDate := deStart.Date;
 fibdsMainList.ParamByName('STOP_DATE').AsDate := deStop.Date+1
end;

procedure TfrmSVAnalTotal.tvMainListColumnPosChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
 fibdsMainList.FullRefresh
end;

procedure TfrmSVAnalTotal.cxLabel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
 const SC_DRAGMOVE = $F012;
begin
 If (ssLeft in Shift) then
  Begin
   ReleaseCapture;
   pnlPeriod.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0)
  End
end;

procedure TfrmSVAnalTotal.grdMainListResize(Sender: TObject);
begin
 pnlPeriod.Left := (pnlPeriod.Parent.ClientWidth-pnlPeriod.Width) div 2;
 pnlPeriod.Top := (pnlPeriod.Parent.ClientHeight-pnlPeriod.Height) div 2
end;
 
procedure TfrmSVAnalTotal.btnOKClick(Sender: TObject);
begin
 pnlPeriod.Visible := False;
 If (fibdsMainList.Active) then
  fibdsMainList.ReopenLocate('SERVICE_KIND;SERVICE_ID;OPERATOR_ID;SMS_DATE;SMS_HOUR;PHONE_NUMBER')
 else
  fibdsMainList.FullRefresh;
 frmSVAnalTotal.Caption := FName+' [с '+FormatDateTime('dd.mm.yyyy',deStart.Date)+' по '+FormatDateTime('dd.mm.yyyy',deStop.Date)+']'
end;

procedure TfrmSVAnalTotal.sbRefreshClick(Sender: TObject);
begin
 If (MessageDlg('Хотите полностью обновить информацию?',mtConfirmation,mbOKCancel,0)=mrOK) then
  Begin
   OpenAll;
   pnlPeriod.Show
  End 
end;

end.
