unit AdminUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dxBar, FIBDataSet, pFIBDataSet, FIBDatabase, Math,
  pFIBDatabase, cxGridCustomPopupMenu, cxGridPopupMenu, cxSplitter,
  cxContainer, cxEdit, cxTextEdit, cxMemo, cxDBEdit, StdCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxInplaceContainer,
  cxTL, cxDBTL, cxTLData, cxStyles, cxGraphics, Menus, pFIBQuery, ImgList,
  cxGridDBDataDefinitions, Like, cxCustomData, ComCtrls, RzTreeVw, cxLabel,
  cxButtons, IB_Services;

type
  TfrmAdminUsers = class(TfrmLike)
    spProgramGroups: TcxSplitter;
    tlGroups: TcxDBTreeList;
    tlGroupsNAME: TcxDBTreeListColumn;
    tlGroupsID: TcxDBTreeListColumn;
    tlGroupsPARENT_ID: TcxDBTreeListColumn;
    fibdsProgramGroups: TpFIBDataSet;
    dsProgramGroups: TDataSource;
    fibdsProgramGroupsID: TFIBIntegerField;
    fibdsProgramGroupsPARENT_ID: TFIBIntegerField;
    fibdsProgramGroupsGROUP_NAME: TFIBStringField;
    tvMainListPROG_USER_NAME: TcxGridDBColumn;
    tvMainListCOMMENTS: TcxGridDBColumn;
    fibdsProgramGroupsROLE_COUNT: TFIBIntegerField;
    tlGroupsROLE_COUNT: TcxDBTreeListColumn;
    fibdsMainRoleRights: TpFIBDataSet;
    dsMainRoleRights: TDataSource;
    fibdsProgramGroupsROLE_NAME: TFIBStringField;
    Image1: TImage;
    PopupMenu2: TPopupMenu;
    GetRightsFromGroup: TMenuItem;
    tvMainListVALID: TcxGridDBColumn;
    tvMainListPROGRAM_GROUP_ID: TcxGridDBColumn;
    fibdsMainListID: TFIBIntegerField;
    fibdsMainListPROG_USER_NAME: TFIBStringField;
    fibdsMainListPROGRAM_GROUP_ID: TFIBIntegerField;
    fibdsMainListVALID: TFIBIntegerField;
    fibdsMainListCOMMENTS: TFIBStringField;
    fibdsMainRoleRightsPROGRAM_GROUP_ID: TFIBIntegerField;
    fibdsMainRoleRightsVISIBLE_NAME: TFIBStringField;
    tlUI: TRzCheckTree;
    fibdsMainListPSWD: TFIBStringField;
    tvMainListPSWD: TcxGridDBColumn;
    ssUsers: TpFIBSecurityService;
    tvMainListID: TcxGridDBColumn;
    fibdsMainUserRights: TpFIBDataSet;
    dsMainUserRights: TDataSource;
    fibdsMainUserRightsUSER_ID: TFIBIntegerField;
    fibdsMainUserRightsVISIBLE_NAME: TFIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure OpenAll; override;
    procedure Run; override;
    procedure dsProgramGroupsStateChange(Sender: TObject);
    procedure fibdsMainListBeforeOpen(DataSet: TDataSet);
    procedure tlGroupsCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
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
    procedure sbCancelClick(Sender: TObject);
    procedure fibdsMainRoleRightsAfterOpen(DataSet: TDataSet);
    procedure tlUIDeletion(Sender: TObject; Node: TTreeNode);
    procedure tlUIStateChange(Sender: TObject; Node: TTreeNode;
      NewState: TRzCheckState);
    procedure tlGroupsEnter(Sender: TObject);
    procedure grdMainListEnter(Sender: TObject);
    procedure fibdsMainListNewRecord(DataSet: TDataSet);
    procedure fibdsMainListUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
    procedure fibdsMainUserRightsAfterOpen(DataSet: TDataSet);
    procedure fibdsMainListBeforeScroll(DataSet: TDataSet);
    procedure GetRightsFromGroupClick(Sender: TObject);
  private
    { Private declarations }
    procedure Init_tlUI(Node: TTreeNode; ItemLinks: TdxBarItemLinks);
  public
    { Public declarations }
  end;

var
  frmAdminUsers: TfrmAdminUsers;

implementation

uses DM, Misk, FIBQuery, Main;

{$R *.dfm}

type
  PItemTag = ^String;

var DMTagIncreased: Boolean = False;
    BkMrkIDProgramGroups: Integer = 0;
    BkMrkIDMainList: Integer = 0;
    BkMrkRoleRights : String;
    Scroll : Boolean = False;
    CurrentDataSet : TpFIBDataSet;

procedure TfrmAdminUsers.FormCreate(Sender: TObject);
begin
 FName := 'Пользователи программы и Интерфейс';
 inherited
end;

procedure TfrmAdminUsers.sbApplyClick(Sender: TObject);
 var ServerName: String;
     Protocol  : TProtocol;
 procedure GetServer(Path : String; var ServerName : String; var Protocol : TProtocol);
 begin
  If (Copy(frmDM.dbMain.DatabaseName,1,2)='\\') then
   Begin
    ServerName := Copy(frmDM.dbMain.DatabaseName,3,Pred(Pos(':',Path)));
    Protocol := NamedPipe
   End
  else
   If (Copy(frmDM.dbMain.DatabaseName,2,2)=':\') then
    Begin
     ServerName := '';
     Protocol := Local
    End
   else
    Begin
     ServerName := Copy(frmDM.dbMain.DatabaseName,1,Pred(Pos(':',Path)));
     Protocol := TCP
    End
 end;

begin
 If (MessageDlg('Сохранить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   GetServer(trMain.DefaultDatabase.DatabaseName,ServerName,Protocol);
   ssUsers.ServerName := ServerName;
   ssUsers.Protocol := Protocol;
   try
    ssUsers.Active := True;
   except
    MessageDlg('Неверный пароль администратора баз данных! Изменения сохранены не будут!',mtError,[mbOK],0);
    ssUsers.Active := False;
    Exit
   end;
   ssUsers.Active := False;
   fibdsMainList.ApplyUpdates;
   fibdsMainRoleRights.ApplyUpdates;
   fibdsMainUserRights.ApplyUpdates;
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

procedure TfrmAdminUsers.Run;
begin
 If (tlUI.Items.Count=0) then
  Init_tlUI(nil,frmMain.dxBarManager.Bars[0].ItemLinks);
 OpenAll;
 Show
end;

procedure TfrmAdminUsers.OpenAll;
begin
 inherited;
 If Not(frmDM.trMain.InTransaction) then
  frmDM.trMain.StartTransaction;
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
 fibdsMainUserRights.FullRefresh;
 fibdsMainRoleRights.FullRefresh;
 tlGroups.FullExpand
end;

procedure TfrmAdminUsers.dsProgramGroupsStateChange(Sender: TObject);
begin
 SetACButtons((fibdsMainList.State in [dsEdit,dsInsert]) or (fibdsMainList.UpdatesPending) or
              (fibdsMainRoleRights.State in [dsEdit,dsInsert]) or (fibdsMainRoleRights.UpdatesPending) or
              (fibdsMainUserRights.State in [dsEdit,dsInsert]) or (fibdsMainUserRights.UpdatesPending))
end;

procedure TfrmAdminUsers.fibdsMainListBeforeOpen(DataSet: TDataSet);
begin
 If (spProgramGroups.State=ssOpened) then
  fibdsMainList.ParamByName('WHERE').AsString := 'where (U.PROGRAM_GROUP_ID=:ID)'
 else
  fibdsMainList.ParamByName('WHERE').AsString := '';
end;

procedure TfrmAdminUsers.tlGroupsCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 If (AViewInfo.Node.Values[tlGroupsROLE_COUNT.ItemIndex]=1) then
  ACanvas.Font.Style := [fsBold]
 else
  ACanvas.Font.Style := []
end;

procedure TfrmAdminUsers.spProgramGroupsAfterClose(Sender: TObject);
begin
 fibdsMainList.ReopenLocate('ID')
end;

procedure TfrmAdminUsers.spProgramGroupsAfterOpen(Sender: TObject);
begin
 fibdsProgramGroups.ReopenLocate('ID');
 fibdsMainList.CloseOpen(True)
end;

procedure TfrmAdminUsers.tlGroupsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
 var Node : TcxTreeListNode;
begin
 With TcxGridSite(TDragControlObject(Source).Control) do
  Accept := (GridView=tvMainList) and
            (tlGroups.FocusedNode.Values[tlGroupsID.ItemIndex]<>tvMainList.DataController.Values[tvMainList.DataController.FocusedRecordIndex,tvMainListPROGRAM_GROUP_ID.Index])
end;

procedure TfrmAdminUsers.tvMainListStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
 If (sbApply.Enabled) then
  Begin
   sbApply.Click;
   Exit
  End;
 fibdsMainList.DisableControls
end;

procedure TfrmAdminUsers.tvMainListEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
 fibdsMainList.EnableControls
end;

procedure TfrmAdminUsers.fibdsProgramGroupsBeforeScroll(DataSet: TDataSet);
begin
 If (sbApply.Enabled) then
  sbApply.Click
end;

procedure TfrmAdminUsers.tlGroupsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var AGridView: TcxCustomGridView;
    fibqLocalAux : TpFIBQuery;
    UserName, RoleName : String;
    
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
 If (MessageDlg('Хотите переместить пользователя ['+tvMainList.DataController.Values[tvMainList.DataController.FocusedRecordIndex,tvMainListPROG_USER_NAME.Index]+'] в группу ['+tlGroups.FocusedNode.Values[tlGroupsNAME.ItemIndex]+']',mtConfirmation,mbOKCancel,0)=mrOK) then
  Begin
   fibqLocalAux := TpFIBQuery.Create(Nil);
   fibqLocalAux.Database := fibdsMainList.Database;
   fibqLocalAux.Transaction := fibdsMainList.Transaction;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('select PG.ROLE_NAME, U.DB_USER_NAME');
   fibqLocalAux.SQL.Add('from USERS U, UA_PROGRAM_GROUPS PG');
   fibqLocalAux.SQL.Add('where (PG.ID=U.PROGRAM_GROUP_ID) and (U.ID='+VarAsType(AGridView.DataController.Values[AGridView.DataController.FocusedRecordIndex,tvMainListID.Index],varString)+')');
   fibqLocalAux.ExecQuery;
   RoleName := fibqLocalAux.Fields[0].AsString;
   UserName := fibqLocalAux.Fields[1].AsString;
   fibqLocalAux.Close;
   fibqLocalAux.Database := frmDM.dbOwner;
   fibqLocalAux.Transaction := frmDM.trLock;
   frmDM.dbOwner.DatabaseName := frmDM.dbMain.DatabaseName;
   frmDM.dbOwner.Open;
   frmDM.trLock.StartTransaction;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('revoke "'+RoleName+'" FROM "'+UserName+'"');
   fibqLocalAux.ExecQuery;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('GRANT "'+fibdsProgramGroups.Lookup('ID',tlGroups.FocusedNode.Values[tlGroupsID.ItemIndex],'ROLE_NAME')+'" TO "'+UserName+'" WITH ADMIN OPTION');
   fibqLocalAux.ExecQuery;
   frmDM.trLock.Commit;
   frmDM.dbOwner.Close;
   fibqLocalAux.Database := fibdsMainList.Database;
   fibqLocalAux.Transaction := fibdsMainList.Transaction;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('update USERS set PROGRAM_GROUP_ID='+VarAsType(tlGroups.FocusedNode.Values[tlGroupsID.ItemIndex],varString)+' where (ID='+VarAsType(AGridView.DataController.Values[AGridView.DataController.FocusedRecordIndex,tvMainListID.Index],varString)+')');
   fibqLocalAux.ExecQuery;
   trMain.CommitRetaining;
   fibqLocalAux.Free;
   fibdsProgramGroups.DisableControls;
   fibdsProgramGroups.FullRefresh;
   fibdsProgramGroups.EnableControls;
   SetFocus
  End
end;

procedure TfrmAdminUsers.spProgramGroupsBeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
 AllowClose := (grdMainList.FocusedView=tvMainList)
end;

procedure TfrmAdminUsers.Init_tlUI(Node: TTreeNode; ItemLinks: TdxBarItemLinks);
 var I : Integer;
     R : PItemTag;
     NewNode : TTreeNode;
begin
 For I := 0 to Pred(ItemLinks.Count) do  // Iterate
  If (Pos(ItemLinks.Items[I].Caption,'ОкнаПомощьВыход')=0) and (ItemLinks.Items[I].Item.Name<>'') then
   Begin
    NewNode := tlUI.Items.AddChild(Node, ItemLinks.Items[I].Caption);
    New(R);
    NewNode.Data := R;
    R^ := ItemLinks.BarManager.MainForm.Name+'.'+ItemLinks.Items[I].Item.Name;
    If (ItemLinks[I].Item is TdxBarSubItem) then
     Init_tlUI(NewNode,TdxBarSubItem(ItemLinks[I].Item).ItemLinks)
   End;  // for
end;

procedure TfrmAdminUsers.sbCancelClick(Sender: TObject);
begin
 If (MessageDlg('Отменить все сделанные изменения?',mtInformation,[mbCancel,mbOK],0)=mrOK) then
  Begin
   fibdsMainList.CancelUpdates;
   fibdsMainRoleRights.CancelUpdates;
   fibdsMainUserRights.CancelUpdates;
   SetACButtons(False)
  End
end;

procedure TfrmAdminUsers.fibdsMainRoleRightsAfterOpen(DataSet: TDataSet);
var I: Integer;
begin
 If (CurrentDataSet<>fibdsMainRoleRights) then
  Exit;
 Scroll := True;
 With tlUI do
  Begin
   For I := 0 to Pred(Items.Count) do
    If fibdsMainRoleRights.Locate('VISIBLE_NAME',PItemTag(Items[I].Data)^,[]) and
       NOT(tlUI.Items[I].HasChildren) then
     ItemState[I] := csChecked
    else
     ItemState[I] := csUnchecked
  End;
 Scroll := False
end;

procedure TfrmAdminUsers.tlUIDeletion(Sender: TObject; Node: TTreeNode);
begin
 Dispose(PItemTag(Node.Data))
end;

procedure TfrmAdminUsers.tlUIStateChange(Sender: TObject; Node: TTreeNode;
  NewState: TRzCheckState);
begin
 If Not Scroll and Not Node.HasChildren then
  If (NewState=csChecked) then
   Begin
    If NOT CurrentDataSet.Locate('VISIBLE_NAME',PItemTag(Node.Data)^,[]) then
     Begin
      CurrentDataSet.Insert;
      CurrentDataSet.FieldByName('VISIBLE_NAME').Value := PItemTag(Node.Data)^;
      CurrentDataSet.Post
     End
   End
  else
   If CurrentDataSet.Locate('VISIBLE_NAME',PItemTag(Node.Data)^,[]) then
    CurrentDataSet.Delete
end;

procedure TfrmAdminUsers.tlGroupsEnter(Sender: TObject);
begin
 CurrentDataSet := fibdsMainRoleRights;
 fibdsMainRoleRightsAfterOpen(fibdsMainRoleRights)
end;

procedure TfrmAdminUsers.grdMainListEnter(Sender: TObject);
begin
 CurrentDataSet := fibdsMainUserRights;
 fibdsMainUserRightsAfterOpen(fibdsMainUserRights)
end;

procedure TfrmAdminUsers.fibdsMainListNewRecord(DataSet: TDataSet);
begin
 If (fibdsMainList.FindParam('ID')<>nil) then
  fibdsMainListPROGRAM_GROUP_ID.Value := fibdsMainList.FindParam('ID').AsInteger
end;

procedure TfrmAdminUsers.fibdsMainListUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TFIBUpdateAction);
 var fibqLocalAux : TpFIBQuery;
     RoleName,UserName : String;
begin
 UpdateAction := uaApply;
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := fibdsMainList.Database;
 fibqLocalAux.Transaction := fibdsMainList.Transaction;
 fibqLocalAux.SQL.Clear;
 If (UpdateKind=ukInsert) then
  Begin
   fibqLocalAux.SQL.Add('INSERT INTO USERS (ID,PROG_USER_NAME,PROG_USER_PASSWORD,');
   fibqLocalAux.SQL.Add('DB_USER_NAME,DB_USER_PASSWORD,PROGRAM_GROUP_ID,COMMENTS)');
   fibqLocalAux.SQL.Add('VALUES (:ID,:PROG_USER_NAME,:PROG_USER_PASSWORD,:DB_USER_NAME,');
   fibqLocalAux.SQL.Add(':DB_USER_PASSWORD,:PROGRAM_GROUP_ID,:COMMENTS)');
   fibqLocalAux.ParamByName('ID').AsInteger := fibdsMainListID.Value;
   fibqLocalAux.ParamByName('PROG_USER_NAME').AsString := fibdsMainListPROG_USER_NAME.AsString;
   fibqLocalAux.ParamByName('PROG_USER_PASSWORD').AsString := GetName(fibdsMainListPSWD.AsString,20);
   fibqLocalAux.ParamByName('DB_USER_NAME').AsString := GetName(fibdsMainListPROG_USER_NAME.AsString,31);
   fibqLocalAux.ParamByName('DB_USER_PASSWORD').AsString := GetName(fibqLocalAux.ParamByName('PROG_USER_PASSWORD').AsString,8);
   fibqLocalAux.ParamByName('PROGRAM_GROUP_ID').AsInteger := fibdsMainListPROGRAM_GROUP_ID.Value;
   If Not(fibdsMainListCOMMENTS.IsNull) then
    fibqLocalAux.ParamByName('COMMENTS').AsString := fibdsMainListCOMMENTS.AsString;
   ssUsers.SecurityAction := ActionAddUser;
   ssUsers.UserName := fibqLocalAux.ParamByName('DB_USER_NAME').AsString;
   ssUsers.Password := fibqLocalAux.ParamByName('DB_USER_PASSWORD').AsString;
   ssUsers.Active := True;
   ssUsers.AddUser;
   ssUsers.Active := False;
   fibqLocalAux.ExecQuery;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('select ROLE_NAME from UA_PROGRAM_GROUPS where ID='+fibdsMainListPROGRAM_GROUP_ID.AsString);
   fibqLocalAux.ExecQuery;
   RoleName := fibqLocalAux.Fields[0].AsString;
   fibqLocalAux.Close;
   frmDM.dbOwner.DatabaseName := frmDM.dbMain.DatabaseName;
   frmDM.dbOwner.Open;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('GRANT "'+RoleName+'" TO "'+ssUsers.UserName+'" WITH ADMIN OPTION');
   fibqLocalAux.ExecQuery;
   UpdateAction := uaApplied
  End;
 If (UpdateKind=ukDelete) then
  Begin
   fibqLocalAux.SQL.Add('select PG.ROLE_NAME, U.DB_USER_NAME');
   fibqLocalAux.SQL.Add('from USERS U, UA_PROGRAM_GROUPS PG');
   fibqLocalAux.SQL.Add('where (PG.ID=U.PROGRAM_GROUP_ID) and (U.ID='+VarToStr(fibdsMainListID.OldValue)+')');
   fibqLocalAux.ExecQuery;
   RoleName := fibqLocalAux.Fields[0].AsString;
   UserName := fibqLocalAux.Fields[1].AsString;
   fibqLocalAux.Close;
   fibqLocalAux.SQL.Clear;
   fibqLocalAux.SQL.Add('revoke "'+RoleName+'" FROM "'+UserName+'"');
   fibqLocalAux.ExecQuery;
   ssUsers.SecurityAction := ActionDeleteUser;
   ssUsers.UserName := UserName;
   ssUsers.Active := True;
   ssUsers.DeleteUser;
   ssUsers.Active := False
  End;
 fibqLocalAux.Free
end;

procedure TfrmAdminUsers.fibdsMainUserRightsAfterOpen(DataSet: TDataSet);
var I: Integer;
begin
 If (CurrentDataSet<>fibdsMainUserRights) then
  Exit;
 Scroll := True;
 With tlUI do
  Begin
   For I := 0 to Pred(Items.Count) do
    If fibdsMainUserRights.Locate('VISIBLE_NAME',PItemTag(Items[I].Data)^,[]) and
       NOT(tlUI.Items[I].HasChildren) then
     ItemState[I] := csChecked
    else
     ItemState[I] := csUnchecked
  End;
 Scroll := False
end;

procedure TfrmAdminUsers.fibdsMainListBeforeScroll(DataSet: TDataSet);
begin
 If (fibdsMainUserRights.UpdatesPending) then
  sbApply.Click
end;

procedure TfrmAdminUsers.GetRightsFromGroupClick(Sender: TObject);
 var I : Integer;
begin
 With tlUI do
  Begin
   For I := 0 to Pred(Items.Count) do
    Begin
     If fibdsMainRoleRights.Locate('VISIBLE_NAME',PItemTag(Items[I].Data)^,[]) and
        NOT(tlUI.Items[I].HasChildren) then
      ItemState[I] := csChecked
     else
      ItemState[I] := csUnchecked
    End;
  End;
end;

end.
