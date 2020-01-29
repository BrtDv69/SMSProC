unit Operators;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Like, DB, dxBar, FIBDataSet, pFIBDataSet, cxGridCustomPopupMenu,
  cxGridPopupMenu, FIBDatabase, pFIBDatabase, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxDBEdit, StdCtrls, ExtCtrls;

type
  TfrmOperators = class(TfrmLike)
    fibdsMainListID: TFIBIntegerField;
    fibdsMainListNAME: TFIBStringField;
    tvMainListNAME: TcxGridDBColumn;
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
  frmOperators: TfrmOperators;

implementation

uses DM;

{$R *.dfm}

var BkMrkIDMainList: Integer = 0;

procedure TfrmOperators.FormCreate(Sender: TObject);
begin
 FName := 'Справочник операторов';
 inherited;
end;

procedure TfrmOperators.Run;
begin
 OpenAll;
 Show
end;

procedure TfrmOperators.OpenAll;
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
end;

procedure TfrmOperators.sbApplyClick(Sender: TObject);
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

procedure TfrmOperators.sbCancelClick(Sender: TObject);
begin
 If (MessageDlg('Отменить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.CancelUpdates;
   SetACButtons(False)
  End
end;

end.
