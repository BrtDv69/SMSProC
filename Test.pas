unit Test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, StdCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit,
  cxButtons, pFIBQuery;

type
  TfrmTest = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    trMain: TpFIBTransaction;
    fibdsSockets: TpFIBDataSet;
    dsSockets: TDataSource;
    grdMainList: TcxGrid;
    tvMainList: TcxGridDBTableView;
    lvMainList: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edPhoneNumber: TcxTextEdit;
    edMessage: TcxTextEdit;
    cbSocket: TcxLookupComboBox;
    cxButton1: TcxButton;
    fibdsSocketsID: TFIBIntegerField;
    fibdsSocketsNUMBER: TFIBIntegerField;
    fibdsSocketsOPERATOR_NAME: TFIBStringField;
    fibdsSocketsNUMBER_OPERATOR_NAME: TStringField;
    fibdsInSMSHistory: TpFIBDataSet;
    dsInSMSHistory: TDataSource;
    edServicePhoneNumber: TcxTextEdit;
    Label5: TLabel;
    edServiceShortName: TcxTextEdit;
    fibdsInSMSHistoryID: TFIBIntegerField;
    fibdsInSMSHistorySMS_TIMESTAMP: TFIBDateTimeField;
    fibdsInSMSHistoryPHONE_NUMBER: TFIBStringField;
    fibdsInSMSHistorySERVICE_DESCRIPTION: TFIBStringField;
    fibdsInSMSHistoryMSG: TFIBStringField;
    cxGridDBTableView1SMS_TIMESTAMP: TcxGridDBColumn;
    cxGridDBTableView1PHONE_NUMBER: TcxGridDBColumn;
    cxGridDBTableView1SERVICE_DESCRIPTION: TcxGridDBColumn;
    cxGridDBTableView1MSG: TcxGridDBColumn;
    fibdsOutSMSHistory: TpFIBDataSet;
    dsOutSMSHistory: TDataSource;
    fibdsOutSMSHistorySMS_SENT_TIMESTAMP: TFIBDateTimeField;
    fibdsOutSMSHistoryID: TFIBBCDField;
    fibdsOutSMSHistoryPHONE_NUMBER: TFIBStringField;
    fibdsOutSMSHistorySERVICE_DESCRIPTION: TFIBStringField;
    fibdsOutSMSHistoryMSG: TFIBStringField;
    tvMainListSMS_SENT_TIMESTAMP: TcxGridDBColumn;
    tvMainListPHONE_NUMBER: TcxGridDBColumn;
    tvMainListSERVICE_DESCRIPTION: TcxGridDBColumn;
    tvMainListMSG: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure fibdsSocketsCalcFields(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

uses DM;

{$R *.dfm}

procedure TfrmTest.FormCreate(Sender: TObject);
begin
 trMain.StartTransaction;
 fibdsSockets.FullRefresh;
 fibdsInSMSHistory.FullRefresh;
 fibdsInSMSHistory.Last;
 fibdsOutSMSHistory.FullRefresh;
 fibdsOutSMSHistory.Last;
end;

procedure TfrmTest.fibdsSocketsCalcFields(DataSet: TDataSet);
begin
 fibdsSocketsNUMBER_OPERATOR_NAME.Value := fibdsSocketsNUMBER.AsString+' - '+fibdsSocketsOPERATOR_NAME.AsString
end;

procedure TfrmTest.cxButton1Click(Sender: TObject);
 var fibqLocalAux : TpFIBQuery;
begin
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := trMain.DefaultDatabase;
 fibqLocalAux.Transaction := trMain;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.Add('insert into IN_SMS_HISTORY');
 fibqLocalAux.SQL.Add('(SOCKET_ID,SMS_TIMESTAMP,PHONE_NUMBER,SERVICE_PHONE_NUMBER,SERVICE_NAME,MSG)');
 fibqLocalAux.SQL.Add('values(:SOCKET_ID,:SMS_TIMESTAMP,:PHONE_NUMBER,:SERVICE_PHONE_NUMBER,:SERVICE_NAME,:MSG)');
 fibqLocalAux.ParamByName('SOCKET_ID').Value := fibdsSockets.Lookup('NUMBER_OPERATOR_NAME',cbSocket.Text,'ID');
 fibqLocalAux.ParamByName('SMS_TIMESTAMP').Value := Now;
 fibqLocalAux.ParamByName('PHONE_NUMBER').Value := edPhoneNumber.Text;
 fibqLocalAux.ParamByName('SERVICE_PHONE_NUMBER').Value := edServicePhoneNumber.Text;
 fibqLocalAux.ParamByName('SERVICE_NAME').Value := edServiceShortName.Text;
 fibqLocalAux.ParamByName('MSG').Value := edMessage.Text;
 fibqLocalAux.ExecQuery;
 trMain.CommitRetaining;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.Add('delete from OUT_SMS_POOL');
 fibqLocalAux.ExecQuery;
 trMain.CommitRetaining;
 fibdsInSMSHistory.FullRefresh;
 fibdsInSMSHistory.Last;
 fibdsOutSMSHistory.FullRefresh;
 fibdsOutSMSHistory.Last;
end;

end.
