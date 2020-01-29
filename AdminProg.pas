unit AdminProg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dxBar, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxGridCustomPopupMenu, cxGridPopupMenu, cxSplitter,
  cxContainer, cxEdit, cxTextEdit, cxMemo, cxDBEdit, StdCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxInplaceContainer,
  cxTL, cxDBTL, cxTLData, cxStyles, cxGraphics, Menus, pFIBQuery, ImgList,
  cxGridDBDataDefinitions, Like;

type
  TfrmAdminProg = class(TfrmLike)
    spProgramGroups: TcxSplitter;
    tlGroups: TcxDBTreeList;
    tlGroupsNAME: TcxDBTreeListColumn;
    tlGroupsID: TcxDBTreeListColumn;
    tlGroupsPARENT_ID: TcxDBTreeListColumn;
    fibdsMainListID: TFIBIntegerField;
    fibdsMainListPARENT_ID: TFIBIntegerField;
    fibdsMainListGROUP_NAME: TFIBStringField;
    fibdsMainListROLE_NAME: TFIBStringField;
    fibdsMainListROLE_COUNT: TFIBIntegerField;
    fibdsMainListCOMMENTS: TFIBStringField;
    fibdsProgramGroups: TpFIBDataSet;
    dsProgramGroups: TDataSource;
    fibdsProgramGroupsID: TFIBIntegerField;
    fibdsProgramGroupsPARENT_ID: TFIBIntegerField;
    fibdsProgramGroupsGROUP_NAME: TFIBStringField;
    tvMainListGROUP_NAME: TcxGridDBColumn;
    tvMainListCOMMENTS: TcxGridDBColumn;
    tvMainListROLE_COUNT: TcxGridDBColumn;
    fibdsProgramGroupsROLE_COUNT: TFIBIntegerField;
    tlGroupsROLE_COUNT: TcxDBTreeListColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    tvMainListPARENT_ID: TcxGridDBColumn;
    tvMainListID: TcxGridDBColumn;
    lvMainRoleRights: TcxGridLevel;
    tvMainRoleRights: TcxGridDBTableView;
    fibdsMainRoleRights: TpFIBDataSet;
    dsMainRoleRights: TDataSource;
    fibdsProgramGroupsROLE_NAME: TFIBStringField;
    fibdsMainRoleRightsRDBRELATION_NAME: TFIBWideStringField;
    fibdsMainRoleRightsRDBDESCRIPTION: TFIBMemoField;
    fibdsMainRoleRightsOBJECT_TYPE: TFIBIntegerField;
    fibdsMainRoleRightsSELECT_RIGHT: TFIBIntegerField;
    fibdsMainRoleRightsINSERT_RIGHT: TFIBIntegerField;
    fibdsMainRoleRightsUPDATE_RIGHT: TFIBIntegerField;
    fibdsMainRoleRightsDELETE_RIGHT: TFIBIntegerField;
    fibdsMainRoleRightsREFERENSE_RIGHT: TFIBIntegerField;
    fibdsMainRoleRightsEXECUTE_RIGHT: TFIBIntegerField;
    tvMainRoleRightsRDBDESCRIPTION: TcxGridDBColumn;
    tvMainRoleRightsOBJECT_TYPE: TcxGridDBColumn;
    tvMainRoleRightsSELECT_RIGHT: TcxGridDBColumn;
    tvMainRoleRightsINSERT_RIGHT: TcxGridDBColumn;
    tvMainRoleRightsUPDATE_RIGHT: TcxGridDBColumn;
    tvMainRoleRightsDELETE_RIGHT: TcxGridDBColumn;
    tvMainRoleRightsREFERENSE_RIGHT: TcxGridDBColumn;
    tvMainRoleRightsEXECUTE_RIGHT: TcxGridDBColumn;
    Image1: TImage;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    objectN6TMenuItem1: TMenuItem;
    N14: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure OpenAll; override;
    procedure Run; override;
    procedure dsProgramGroupsStateChange(Sender: TObject);
    procedure fibdsMainListBeforeOpen(DataSet: TDataSet);
    procedure fibdsMainListNewRecord(DataSet: TDataSet);
    procedure tvMainListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tlGroupsCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure spProgramGroupsAfterClose(Sender: TObject);
    procedure spProgramGroupsAfterOpen(Sender: TObject);
    procedure tlGroupsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvMainListStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure tvMainListEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure fibdsProgramGroupsBeforeScroll(DataSet: TDataSet);
    procedure tlGroupsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure spProgramGroupsBeforeClose(Sender: TObject;
      var AllowClose: Boolean);
    procedure fibdsMainRoleRightsOBJECT_TYPEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure fibdsMainRoleRightsUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
    procedure tvMainRoleRightsCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvMainRoleRightsEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure fibdsMainRoleRightsBeforeEdit(DataSet: TDataSet);
    procedure N9Click(Sender: TObject);
    procedure fibdsMainListUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
    procedure N5Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetEachRecord(Field: TField; Value: Integer);
  public
    { Public declarations }
  end;

var
  frmAdminProg: TfrmAdminProg;

implementation

uses DM, Misk, FIBQuery;

{$R *.dfm}

var DMTagIncreased: Boolean = False;
    BkMrkIDProgramGroups: Integer = 0;
    BkMrkIDMainList: Integer = 0;
    BkMrkRoleRights : String;

procedure TfrmAdminProg.FormCreate(Sender: TObject);
begin
 FName := 'Группы пользователей';
 inherited
end;

procedure TfrmAdminProg.sbApplyClick(Sender: TObject);
begin
 If (MessageDlg('Сохранить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.ApplyUpdates;
   fibdsMainRoleRights.ApplyUpdates;
   BkMrkIDProgramGroups := fibdsProgramGroupsID.Value;
   BkMrkIDMainList := fibdsMainListID.Value;
   BkMrkRoleRights := fibdsMainRoleRights.Bookmark;
   fibdsProgramGroups.DisableScrollEvents;
   trMain.Commit;
   OpenAll;
   fibdsProgramGroups.EnableScrollEvents;
   SetACButtons(False)
  End
end;

procedure TfrmAdminProg.Run;
begin
 OpenAll;
 Show
end;

procedure TfrmAdminProg.OpenAll;
begin
 inherited;
 If Not(frmDM.trMain.InTransaction) then
  frmDM.trMain.StartTransaction;
// fibdsPersons.Open;
 If (spProgramGroups.State=ssOpened) then
  Begin
   If (fibdsProgramGroups.Active) then
    fibdsProgramGroups.ReopenLocate('ID')
   else
    Begin
     fibdsProgramGroups.FullRefresh;
     If (BkMrkIDProgramGroups<>0) then
      fibdsProgramGroups.Locate('ID',BkMrkIDProgramGroups,[])
    End
  End;
 If (fibdsMainList.Active) then
  fibdsMainList.ReopenLocate('ID')
 else
  Begin
   fibdsMainList.FullRefresh;
   If (BkMrkIDMainList<>0) then
    fibdsMainList.Locate('ID',BkMrkIDMainList,[])
  End;
 If (fibdsMainRoleRights.Active) then
  fibdsMainRoleRights.ReopenLocate('RDB$RELATION_NAME')
 else
  Begin
   fibdsMainRoleRights.FullRefresh;
   fibdsMainRoleRights.Bookmark := BkMrkRoleRights;
  End;
 tlGroups.FullExpand
end;

procedure TfrmAdminProg.dsProgramGroupsStateChange(Sender: TObject);
begin
 SetACButtons((fibdsMainList.State in [dsEdit,dsInsert]) or (fibdsMainList.UpdatesPending) or
 (fibdsMainRoleRights.State in [dsEdit,dsInsert]) or (fibdsMainRoleRights.UpdatesPending))
end;

procedure TfrmAdminProg.fibdsMainListBeforeOpen(DataSet: TDataSet);
begin
 If (spProgramGroups.State=ssOpened) then
  fibdsMainList.ParamByName('WHERE').AsString := 'where (PG.PARENT_ID=:ID)'
 else
  fibdsMainList.ParamByName('WHERE').AsString := '';
end;

procedure TfrmAdminProg.fibdsMainListNewRecord(DataSet: TDataSet);
begin
 If (fibdsMainList.FindParam('ID')<>nil) then
  fibdsMainListPARENT_ID.Value := fibdsMainList.FindParam('ID').AsInteger
end;

procedure TfrmAdminProg.tvMainListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 If (AViewInfo.GridRecord.Values[tvMainListROLE_COUNT.Index]=1) then
  ACanvas.Font.Style := [fsBold]
 else
  ACanvas.Font.Style := []
end;

procedure TfrmAdminProg.tlGroupsCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 If (AViewInfo.Node.Values[tlGroupsROLE_COUNT.ItemIndex]=1) then
  ACanvas.Font.Style := [fsBold]
 else
  ACanvas.Font.Style := []
end;

procedure TfrmAdminProg.N1Click(Sender: TObject);
 var fibqLocalAux : TpFIBQuery;
     S, ID : String;
begin
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := fibdsMainList.Database;
 fibqLocalAux.Transaction := fibdsMainList.Transaction;
 fibqLocalAux.SQL.Clear;
 If (tlGroups.IsActive) then
  Begin
   S := fibdsProgramGroupsGROUP_NAME.AsString;
   ID := fibdsProgramGroupsID.AsString
  End
 else
  If (tvMainList.IsControlFocused) then
  Begin
   S := fibdsMainListGROUP_NAME.AsString;
   ID := fibdsMainListID.AsString
  End;
 S := UpperCase(GetName(S,31));
 S := StringReplace(S,'=','E',[rfReplaceAll]);
 fibqLocalAux.SQL.Add('create role "'+S+'"');
 fibqLocalAux.ExecQuery;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.Add('update UA_PROGRAM_GROUPS set ROLE_NAME='''+S+''' where (ID='+ID+')');
 fibqLocalAux.ExecQuery;
 trMain.CommitRetaining;
 fibqLocalAux.Close;
 fibqLocalAux.Free;
 fibdsProgramGroups.FullRefresh;
 fibdsMainList.FullRefresh
end;

procedure TfrmAdminProg.PopupMenu1Popup(Sender: TObject);
begin
 N1.Enabled := ((tlGroups.IsActive) and (fibdsProgramGroupsROLE_COUNT.AsInteger=0) and (fibdsProgramGroups.RecordCount>0)) or
               ((tvMainList.IsControlFocused) and (fibdsMainListROLE_COUNT.AsInteger=0) and (fibdsMainList.RecordCount>0))
end;

procedure TfrmAdminProg.spProgramGroupsAfterClose(Sender: TObject);
begin
 fibdsMainList.ReopenLocate('ID')
end;

procedure TfrmAdminProg.spProgramGroupsAfterOpen(Sender: TObject);
begin
 fibdsProgramGroups.ReopenLocate('ID');
 fibdsMainList.CloseOpen(True)
end;

procedure TfrmAdminProg.tlGroupsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
 var Node : TcxTreeListNode;
begin
 With TcxGridSite(TDragControlObject(Source).Control) do
  Accept := (GridView=tvMainList) and
            (tlGroups.FocusedNode.Values[tlGroupsID.ItemIndex]<>tvMainList.DataController.Values[tvMainList.DataController.FocusedRecordIndex,tvMainListPARENT_ID.Index]) and
            (tlGroups.FocusedNode.Values[tlGroupsID.ItemIndex]<>tvMainList.DataController.Values[tvMainList.DataController.FocusedRecordIndex,tvMainListID.Index]);
 If (Accept) then
  Begin
   Node := tlGroups.FocusedNode;
   While (Node.Parent<>nil) do
    Begin
     If (Node.Parent.Values[tlGroupsID.ItemIndex]=tvMainList.DataController.Values[tvMainList.DataController.FocusedRecordIndex,tvMainListID.Index]) then
      Begin
       Accept := False;
       Break
      End;
     Node := Node.Parent
    End
  End
end;

procedure TfrmAdminProg.tvMainListStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
 If (sbApply.Enabled) then
  Begin
   sbApply.Click;
   Exit
  End;
 fibdsMainList.DisableControls
end;

procedure TfrmAdminProg.tvMainListEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
 fibdsMainList.EnableControls
end;

procedure TfrmAdminProg.fibdsProgramGroupsBeforeScroll(DataSet: TDataSet);
begin
 If (sbApply.Enabled) then
  sbApply.Click
end;

procedure TfrmAdminProg.tlGroupsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var AGridView: TcxCustomGridView;
    fibqLocalAux : TpFIBQuery;

 function GetDragSourceGridView(Source: TObject): TcxCustomGridView;
 begin
  If (TDragControlObject(Source).Control is TcxGridSite) then
   Result := TcxGridSite(TDragControlObject(Source).Control).GridView
  else
   Result := nil
 end;

begin
 AGridView := GetDragSourceGridView(Source);
 If (AGridView = nil) then
  Exit;
 If (MessageDlg('Хотите переместить группу ['+tvMainList.DataController.Values[tvMainList.DataController.FocusedRecordIndex,tvMainListGROUP_NAME.Index]+'] в группу ['+tlGroups.FocusedNode.Values[tlGroupsNAME.ItemIndex]+']',mtConfirmation,mbOKCancel,0)=mrOK) then
  Begin
   fibqLocalAux := TpFIBQuery.Create(Nil);
   fibqLocalAux.Database := fibdsMainList.Database;
   fibqLocalAux.Transaction := fibdsMainList.Transaction;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('update UA_PROGRAM_GROUPS set PARENT_ID='+VarAsType(tlGroups.FocusedNode.Values[tlGroupsID.ItemIndex],varString)+' where (ID='+VarAsType(AGridView.DataController.Values[AGridView.DataController.FocusedRecordIndex,tvMainListID.Index],varString)+')');
   fibqLocalAux.ExecQuery;
   trMain.CommitRetaining;
   fibqLocalAux.Close;
   fibqLocalAux.Free;
   fibdsProgramGroups.DisableControls;
   fibdsProgramGroups.FullRefresh;
   fibdsProgramGroups.EnableControls;
   SetFocus
  End
end;

procedure TfrmAdminProg.spProgramGroupsBeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
 AllowClose := (grdMainList.FocusedView=tvMainList)
end;

procedure TfrmAdminProg.fibdsMainRoleRightsOBJECT_TYPEGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
 Case Sender.AsInteger of    //
  0: Text := 'Таблица';
  1: Text := 'Представление';
  2: Text := 'Процедура';
  else Text := 'Неопределено!';
 End    // case
end;

procedure TfrmAdminProg.fibdsMainRoleRightsUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
 var fibqLocalAux : TpFIBQuery;
begin
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := fibdsMainRoleRights.Database;
 fibqLocalAux.Transaction := fibdsMainRoleRights.Transaction;
 fibqLocalAux.SQL.Clear;
 Case fibdsMainRoleRightsSELECT_RIGHT.AsInteger of
  0: fibqLocalAux.SQL.Add('REVOKE SELECT ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' FROM "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  1: fibqLocalAux.SQL.Add('GRANT SELECT ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  2: fibqLocalAux.SQL.Add('GRANT SELECT ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'" WITH GRANT OPTION')
 end;
 fibqLocalAux.ExecQuery;
 fibqLocalAux.SQL.Clear;
 Case fibdsMainRoleRightsINSERT_RIGHT.AsInteger of
  0: fibqLocalAux.SQL.Add('REVOKE INSERT ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' FROM "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  1: fibqLocalAux.SQL.Add('GRANT INSERT ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  2: fibqLocalAux.SQL.Add('GRANT INSERT ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'" WITH GRANT OPTION')
 end;
 fibqLocalAux.ExecQuery;
 fibqLocalAux.SQL.Clear;
 Case fibdsMainRoleRightsUPDATE_RIGHT.AsInteger of
  0: fibqLocalAux.SQL.Add('REVOKE UPDATE ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' FROM "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  1: fibqLocalAux.SQL.Add('GRANT UPDATE ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  2: fibqLocalAux.SQL.Add('GRANT UPDATE ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'" WITH GRANT OPTION')
 end;
 fibqLocalAux.ExecQuery;
 fibqLocalAux.SQL.Clear;
 Case fibdsMainRoleRightsDELETE_RIGHT.AsInteger of
  0: fibqLocalAux.SQL.Add('REVOKE DELETE ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' FROM "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  1: fibqLocalAux.SQL.Add('GRANT DELETE ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  2: fibqLocalAux.SQL.Add('GRANT DELETE ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'" WITH GRANT OPTION')
 end;
 fibqLocalAux.ExecQuery;
 fibqLocalAux.SQL.Clear;
 Case fibdsMainRoleRightsREFERENSE_RIGHT.AsInteger of
  0: fibqLocalAux.SQL.Add('REVOKE REFERENCES ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' FROM "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  1: fibqLocalAux.SQL.Add('GRANT REFERENCES ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  2: fibqLocalAux.SQL.Add('GRANT REFERENCES ON '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'" WITH GRANT OPTION')
 end;
 fibqLocalAux.ExecQuery;
 fibqLocalAux.SQL.Clear;
 Case fibdsMainRoleRightsEXECUTE_RIGHT.AsInteger of
  0: fibqLocalAux.SQL.Add('REVOKE EXECUTE ON PROCEDURE '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' FROM "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  1: fibqLocalAux.SQL.Add('GRANT EXECUTE ON PROCEDURE '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'"');
  2: fibqLocalAux.SQL.Add('GRANT EXECUTE ON PROCEDURE '+fibdsMainRoleRightsRDBRELATION_NAME.AsString+' TO "'+fibdsMainRoleRights.ParamByName('ROLE_NAME').AsString+'" WITH GRANT OPTION')
 end;
 fibqLocalAux.ExecQuery;
 fibqLocalAux.Free;
 UpdateAction := uaApplied
end;

procedure TfrmAdminProg.tvMainRoleRightsCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 If NOT(Assigned((AViewInfo.Item.DataBinding as TcxGridItemDBDataBinding).Field)) or
    (AViewInfo.Item as TcxGridColumn).IsPreview or (AViewInfo.Selected) then
  Exit;
 If ((AViewInfo.Item.DataBinding as TcxGridItemDBDataBinding).Field.CanModify) and
     (Sender.OptionsData.Editing) and (AViewInfo.Item.Options.Editing)  then
  ACanvas.Brush.Color := clWindow
 else
  ACanvas.Brush.Color := clrReadOnly;
 If (ACanvas.Brush.Color=clWindow) and
    (((AViewInfo.GridRecord.Values[tvMainRoleRightsOBJECT_TYPE.Index]=2) and
       NOT (AViewInfo.Item=tvMainRoleRightsEXECUTE_RIGHT)) or
     (NOT(AViewInfo.GridRecord.Values[tvMainRoleRightsOBJECT_TYPE.Index]=2) and
       (AViewInfo.Item=tvMainRoleRightsEXECUTE_RIGHT))) then
  ACanvas.Brush.Color := clrReadOnly
end;

procedure TfrmAdminProg.tvMainRoleRightsEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
 AAllow := ((AItem.DataBinding as TcxGridItemDBDataBinding).Field.CanModify) and
           (Sender.OptionsData.Editing) and (AItem.Options.Editing) and
           (((AItem.FocusedCellViewInfo.GridRecord.Values[tvMainRoleRightsOBJECT_TYPE.Index]=2) and
             (AItem=tvMainRoleRightsEXECUTE_RIGHT)) or
            (NOT(AItem.FocusedCellViewInfo.GridRecord.Values[tvMainRoleRightsOBJECT_TYPE.Index]=2) and
             Not(AItem=tvMainRoleRightsEXECUTE_RIGHT)))
end;

procedure TfrmAdminProg.fibdsMainRoleRightsBeforeEdit(DataSet: TDataSet);
begin
 If (fibdsMainRoleRights.ParamByName('ROLE_NAME').IsNull) then
  Abort
end;

procedure TfrmAdminProg.N9Click(Sender: TObject);
begin
 SetEachRecord(TcxGridItemDBDataBinding(tvMainRoleRights.Controller.FocusedColumn.DataBinding).Field,TMenuItem(Sender).Tag);
end;

procedure TfrmAdminProg.SetEachRecord(Field: TField; Value: Integer);
var BkMrk: String;
begin
 With fibdsMainRoleRights do
  Begin
   DisableControls;
   BkMrk := BookMark;
   First;
   While Not(EOF) do
    Begin
     Edit;
     If ((fibdsMainRoleRightsOBJECT_TYPE.AsInteger=2) and
         (Field=fibdsMainRoleRightsEXECUTE_RIGHT)) or
        (Not(fibdsMainRoleRightsOBJECT_TYPE.AsInteger=2) and
         Not(Field=fibdsMainRoleRightsEXECUTE_RIGHT)) then
      Field.AsInteger := Value;
     Next
    End;  // while
   BookMark := BkMrk;
   EnableControls;
   SetACButtons(True);
  End;  // with
end;

procedure TfrmAdminProg.fibdsMainListUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
 var fibqLocalAux : TpFIBQuery;
     S, ID : String;
begin
 If (UpdateKind=ukInsert) or ((UpdateKind=ukDelete) and (fibdsMainListROLE_COUNT.AsInteger>0)) then
  Begin
   fibqLocalAux := TpFIBQuery.Create(Nil);
   fibqLocalAux.Database := fibdsMainList.Database;
   fibqLocalAux.Transaction := fibdsMainList.Transaction;
   fibqLocalAux.SQL.Clear;
  End;
 If (UpdateKind=ukInsert) then
  Begin
   S := fibdsMainListGROUP_NAME.AsString;
   ID := fibdsMainListID.AsString;
   S := UpperCase(GetName(S,31));
   S := StringReplace(S,'=','E',[rfReplaceAll]);
   fibqLocalAux.SQL.Add('create role "'+S+'"');
   If not(fibdsMainList.State in [dsInsert,dsEdit]) then
    fibdsMainList.Edit;
   fibdsMainListROLE_NAME.Value := S
  End;
 If (UpdateKind=ukDelete) and (fibdsMainListROLE_COUNT.AsInteger>0) then
  fibqLocalAux.SQL.Add('drop role "'+fibdsProgramGroupsROLE_NAME.AsString+'"');
 If (fibqLocalAux<>nil) then
  Begin
   fibqLocalAux.ExecQuery;
   FreeAndNil(fibqLocalAux)
  End;
 UpdateAction := uaApply
end;

procedure TfrmAdminProg.N5Click(Sender: TObject);
begin
 If not(fibdsMainRoleRights.State in [dsEdit,dsInsert]) then
  fibdsMainRoleRights.Edit;
 If (fibdsMainRoleRightsOBJECT_TYPE.AsInteger=2) then
  fibdsMainRoleRightsEXECUTE_RIGHT.Value := TMenuItem(Sender).Tag
 else
  Begin
   fibdsMainRoleRightsSELECT_RIGHT.Value := TMenuItem(Sender).Tag;
   fibdsMainRoleRightsINSERT_RIGHT.Value := TMenuItem(Sender).Tag;
   fibdsMainRoleRightsUPDATE_RIGHT.Value := TMenuItem(Sender).Tag;
   fibdsMainRoleRightsDELETE_RIGHT.Value := TMenuItem(Sender).Tag;
   fibdsMainRoleRightsREFERENSE_RIGHT.Value := TMenuItem(Sender).Tag
  End;
end;

procedure TfrmAdminProg.N13Click(Sender: TObject);
begin
 SetEachRecord(fibdsMainRoleRightsSELECT_RIGHT,TMenuItem(Sender).Tag);
 SetEachRecord(fibdsMainRoleRightsINSERT_RIGHT,TMenuItem(Sender).Tag);
 SetEachRecord(fibdsMainRoleRightsUPDATE_RIGHT,TMenuItem(Sender).Tag);
 SetEachRecord(fibdsMainRoleRightsDELETE_RIGHT,TMenuItem(Sender).Tag);
 SetEachRecord(fibdsMainRoleRightsREFERENSE_RIGHT,TMenuItem(Sender).Tag);
 SetEachRecord(fibdsMainRoleRightsEXECUTE_RIGHT,TMenuItem(Sender).Tag)
end;

procedure TfrmAdminProg.PopupMenu2Popup(Sender: TObject);
begin
 N2.Enabled := (tlGroups.FocusedNode.Level>0);
 N3.Enabled := (tlGroups.FocusedNode.Count>0)
end;

procedure TfrmAdminProg.N2Click(Sender: TObject);
 var fibqLocalAux : TpFIBQuery;
begin
 If (fibdsProgramGroups.Lookup('ID',fibdsProgramGroupsPARENT_ID.AsInteger,'ROLE_COUNT')=0) then
  Exit;
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := fibdsMainList.Database;
 fibqLocalAux.Transaction := fibdsMainList.Transaction;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.AddStrings(fibdsMainRoleRights.SelectSQL);
 fibqLocalAux.ParamByName('ROLE_NAME').Value := fibdsProgramGroups.Lookup('ID',fibdsProgramGroupsPARENT_ID.AsInteger,'ROLE_NAME');
 fibqLocalAux.ExecQuery;
 While Not (fibqLocalAux.Eof) do
  Begin
   fibdsMainRoleRights.Locate('RDB$RELATION_NAME',Trim(fibqLocalAux.FieldByName('RDB$RELATION_NAME').AsString),[]);
   fibdsMainRoleRights.Edit;
   If (fibdsMainRoleRightsOBJECT_TYPE.AsInteger=2) then
    fibdsMainRoleRightsEXECUTE_RIGHT.Value := fibqLocalAux.FieldByName('EXECUTE_RIGHT').AsInteger
   else
    Begin
     fibdsMainRoleRightsSELECT_RIGHT.Value := fibqLocalAux.FieldByName('SELECT_RIGHT').AsInteger;
     fibdsMainRoleRightsINSERT_RIGHT.Value := fibqLocalAux.FieldByName('INSERT_RIGHT').AsInteger;
     fibdsMainRoleRightsUPDATE_RIGHT.Value := fibqLocalAux.FieldByName('UPDATE_RIGHT').AsInteger;
     fibdsMainRoleRightsDELETE_RIGHT.Value := fibqLocalAux.FieldByName('DELETE_RIGHT').AsInteger;
     fibdsMainRoleRightsREFERENSE_RIGHT.Value := fibqLocalAux.FieldByName('REFERENSE_RIGHT').AsInteger
    End;
   fibqLocalAux.Next
  End;  // while
 fibqLocalAux.Close;
 fibqLocalAux.Free
end;

procedure TfrmAdminProg.N3Click(Sender: TObject);
begin
 If Not(tlGroups.FocusedNode.Count>0) then
  Exit;
end;

procedure TfrmAdminProg.sbCancelClick(Sender: TObject);
begin
 If (MessageDlg('Отменить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.CancelUpdates;
   fibdsMainRoleRights.CancelUpdates;
   SetACButtons(False)
  End
end;

end.
