unit Like;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, dxBar, cxGridPopupMenu, cxGridTableView, cxGridDBTableView,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxPC, pFIBQuery,
  cxSplitter, cxContainer, cxEdit, cxTextEdit, cxMemo, cxDBEdit, StdCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGrid, ExtCtrls, cxGridCustomPopupMenu;

type
  TfrmLike = class(TForm)
    trMain: TpFIBTransaction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    Panel2: TPanel;
    Panel1: TPanel;
    Label339: TLabel;
    dbmComments: TcxDBMemo;
    cxSplitter1: TcxSplitter;
    fibdsMainList: TpFIBDataSet;
    dxBarManager1: TdxBarManager;
    sbFirst: TdxBarButton;
    sbPrior: TdxBarButton;
    sbNext: TdxBarButton;
    sbLast: TdxBarButton;
    sbAdd: TdxBarButton;
    sbDelete: TdxBarButton;
    sbRefresh: TdxBarButton;
    sbApply: TdxBarButton;
    sbCancel: TdxBarButton;
    sbClose: TdxBarButton;
    sbFilter: TdxBarButton;
    dsMainList: TDataSource;
    Panel3: TPanel;
    grdMainList: TcxGrid;
    tvMainList: TcxGridDBTableView;
    lvMainList: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure OpenAll; virtual;
    procedure sbFirstClick(Sender: TObject);
    procedure sbPriorClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure sbLastClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure tvMainListFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure sbFilterClick(Sender: TObject);
    procedure SetACButtons(Enabled : Boolean);
    procedure dsMainListStateChange(Sender: TObject);
    procedure fibdsMainListAfterDelete(DataSet: TDataSet);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Run; dynamic;
    procedure sbRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExportClick(Sender: TObject);
    procedure NewItemRowSelectorClick(Sender: TObject);
    procedure HeaderAutoHeightClick(Sender: TObject);
    procedure CellAutoHeightClick(Sender: TObject);
    procedure ShowPreView(Sender: TObject);
    procedure TaskBarClick(Sender: TObject);
  public
    { Public declarations }
   FName : String;
  end;

var
  frmLike: TfrmLike;

implementation

uses Main, ExportOptions, DM, Misk, FIBQuery;

{$R *.dfm}

procedure TfrmLike.TaskBarClick(Sender: TObject);
 var F : TForm;
begin
 F := TForm(TComponent(Sender).Tag);
 With F do
  Begin
   BringToFront;
   If (WindowState=wsMinimized) then
    ShowWindow(Handle,SW_RESTORE);
  End
end;

procedure TfrmLike.FormCreate(Sender: TObject);
 var k : Integer;
     FMenuItem: TMenuItem;
     Comp : TComponent;
     MemStream : TMemoryStream;
     tmpBtn : TdxBarButton;
     fibqLocalAux : TpFIBQuery;
begin
 frmMain.bliListWindows.Items.AddObject(Caption, Self);
 tmpBtn := TdxBarButton.Create(frmMain);
 With tmpBtn do
  Begin
   Caption := FName;
   Hint := FName;
   ButtonStyle := bsChecked;
   PaintStyle := psCaption;
   Tag := Integer(Sender);  {store form in button's tag }
   OnClick := TaskBarClick;
   GroupIndex := 1;
   AllowAllUp := False;
   Down := True;
   frmMain.dxBarManager.Bars[1].LockUpdate := True;
   frmMain.dxBarManager.Bars[1].ItemLinks.Add.Item := tmpBtn;
   frmMain.dxBarManager.Bars[1].LockUpdate := False
  end;
// Left := (Screen.Width-Width) div 2;
 trMain.Active := True;
 fibqLocalAux := TpFIBQuery.Create(Nil);
 fibqLocalAux.Database := frmDM.dbMain;
 fibqLocalAux.Transaction := trMain;
 fibqLocalAux.SQL.Clear;
 fibqLocalAux.SQL.Add('select UT.TUNING from USERS_TUNINGS UT where (UT.USER_NAME=current_user) and (UT.ITEM_NAME=:ITEM_NAME)');
 For k := 0 to Pred(ComponentCount) do
  Begin
   If (Components[k] is TcxGridPopupMenu) then
    Begin
     FMenuItem := TMenuItem.Create(Components[k]);
     FMenuItem.Caption := '-';
     TPopupMenu((Components[k] as TcxGridPopupMenu).BuiltInPopupMenus[0].PopupMenu).Items.Add(FMenuItem);
     FMenuItem := TMenuItem.Create(Components[k] as TcxGridPopupMenu);
     FMenuItem.Caption := 'Панель ввода новой строки';
     If ((Components[k] as TcxGridPopupMenu).Grid.ActiveView <> Nil) then
      FMenuItem.Checked := ((Components[k] as TcxGridPopupMenu).Grid.ActiveView as TcxGridTableView).OptionsView.NewItemRow;
     FMenuItem.AutoCheck := True;
     FMenuItem.OnClick := NewItemRowSelectorClick;
     TPopupMenu((Components[k] as TcxGridPopupMenu).BuiltInPopupMenus[0].PopupMenu).Items.Add(FMenuItem);
     FMenuItem := TMenuItem.Create(Components[k] as TcxGridPopupMenu);
     FMenuItem.Caption := 'Автоматический подбор высоты заголовков столбцов';
     If ((Components[k] as TcxGridPopupMenu).Grid.ActiveView <> Nil) then
      FMenuItem.Checked := ((Components[k] as TcxGridPopupMenu).Grid.ActiveView as TcxGridTableView).OptionsView.HeaderAutoHeight;
     FMenuItem.AutoCheck := True;
     FMenuItem.OnClick := HeaderAutoHeightClick;
     TPopupMenu((Components[k] as TcxGridPopupMenu).BuiltInPopupMenus[0].PopupMenu).Items.Add(FMenuItem);
     FMenuItem := TMenuItem.Create(Components[k] as TcxGridPopupMenu);
     FMenuItem.Caption := 'Автоматический подбор высоты строк';
     If ((Components[k] as TcxGridPopupMenu).Grid.ActiveView <> Nil) then
      FMenuItem.Checked := ((Components[k] as TcxGridPopupMenu).Grid.ActiveView as TcxGridTableView).OptionsView.CellAutoHeight;
     FMenuItem.AutoCheck := True;
     FMenuItem.OnClick := CellAutoHeightClick;
     TPopupMenu((Components[k] as TcxGridPopupMenu).BuiltInPopupMenus[0].PopupMenu).Items.Add(FMenuItem);
     FMenuItem := TMenuItem.Create(Components[k] as TcxGridPopupMenu);
     FMenuItem.Caption := 'Показывать строку комментариев';
     If ((Components[k] as TcxGridPopupMenu).Grid.ActiveView <> Nil) then
      FMenuItem.Checked := (((Components[k] as TcxGridPopupMenu).Grid.ActiveView as TcxGridTableView).Preview.Column<>Nil) and (((Components[k] as TcxGridPopupMenu).Grid.ActiveView as TcxGridTableView).Preview.Visible);
     FMenuItem.AutoCheck := True;
     FMenuItem.OnClick := ShowPreView;
     TPopupMenu((Components[k] as TcxGridPopupMenu).BuiltInPopupMenus[0].PopupMenu).Items.Add(FMenuItem);
     FMenuItem := TMenuItem.Create(Components[k]);
     FMenuItem.Caption := '-';
     TPopupMenu((Components[k] as TcxGridPopupMenu).BuiltInPopupMenus[0].PopupMenu).Items.Add(FMenuItem);
     FMenuItem := TMenuItem.Create((Components[k] as TcxGridPopupMenu));
     FMenuItem.Caption := 'Экспорт';
     FMenuItem.OnClick := ExportClick;
     TPopupMenu((Components[k] as TcxGridPopupMenu).BuiltInPopupMenus[0].PopupMenu).Items.Add(FMenuItem)
    End;
   If (Components[k] is TcxGridDBTableView) then
    Begin
     (Components[k] as TcxGridDBTableView).OptionsView.NewItemRowInfoText := 'Новая запись вставляется тут!';
     fibqLocalAux.ParamByName('ITEM_NAME').Value := (Components[k] as TcxGridDBTableView).Owner.Name+'\'+(Components[k] as TcxGridDBTableView).Name;
     fibqLocalAux.ExecQuery;
     If (fibqLocalAux.RecordCount>0) then
      Begin
       MemStream := TMemoryStream.Create;
       fibqLocalAux.FieldByName('TUNING').SaveToStream(MemStream);
       MemStream.Position := 0;
       (Components[k] as TcxGridDBTableView).RestoreFromStream(MemStream);
       MemStream.Free
      End;
     fibqLocalAux.Close;
     fibqLocalAux.ParamByName('ITEM_NAME').Value := (Components[k] as TcxGridDBTableView).Owner.Name+'\'+(Components[k] as TcxGridDBTableView).Name+'/Filter';
     fibqLocalAux.ExecQuery;
     If (fibqLocalAux.RecordCount>0) then
      Begin
       MemStream := TMemoryStream.Create;
       fibqLocalAux.FieldByName('TUNING').SaveToStream(MemStream);
       MemStream.Position := 0;
       (Components[k] as TcxGridDBTableView).DataController.Filter.LoadFromStream(MemStream);
       MemStream.Free
      End;
     fibqLocalAux.Close
    End;
   If (Components[k] is TScrollBox) then
    TScrollBox(Components[k]).VertScrollBar.Position := 0;
   If (Components[k] is TcxPageControl) then
    TcxPageControl(Components[k]).ActivePageIndex := 0
  End;
 trMain.Commit;
 fibqLocalAux.Free;
 cxSplitter1.CloseSplitter
end;

procedure TfrmLike.FormActivate(Sender: TObject);
 var i : Integer;
begin
 With frmMain.dxBarManager.Bars[1].ItemLinks do // TaskBar
  For i := Pred(AvailableItemCount) downto 0 do
   With (AvailableItems[i].Item as TdxBarButton) do
    If (TForm(Tag)=Sender) then
     Begin
      Down := True;
      Break
     End
end;

procedure TfrmLike.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree
end;

procedure TfrmLike.FormDestroy(Sender: TObject);
 var k, kg : Integer;
     MemStream : TMemoryStream;
     fibqLocalAux : TpFIBQuery;
begin
 With frmMain.bliListWindows.Items do
  Delete(IndexOfObject(Self));
  If (frmDM.dbMain<>nil) and (TForm(Sender).Name<>'frmSVAnalTotal') then
   Begin
    If Not(trMain.InTransaction) then
     trMain.StartTransaction;
    fibqLocalAux := TpFIBQuery.Create(Nil);
    fibqLocalAux.Database := frmDM.dbMain;
    fibqLocalAux.Transaction := trMain;
    fibqLocalAux.SQL.Clear;
    fibqLocalAux.SQL.Add('execute procedure SET_USER_TUNING(:ITEM_NAME,:TUNING)');
    try
     For k := 0 to Pred(ComponentCount) do
      If (Components[k] is TcxGridDBTableView) and ((Components[k] as TcxGridDBTableView).MasterGridView=Nil) then
       Begin
        MemStream := TMemoryStream.Create;
        (Components[k] as TcxGridDBTableView).StoreToStream(MemStream);
        MemStream.Position := 0;
        fibqLocalAux.ParamByName('ITEM_NAME').AsString := (Components[k] as TcxGridDBTableView).Owner.Name+'\'+(Components[k] as TcxGridDBTableView).Name;
        fibqLocalAux.ParamByName('TUNING').LoadFromStream(MemStream);
        MemStream.Free;
        fibqLocalAux.ExecQuery;
        MemStream := TMemoryStream.Create;
        (Components[k] as TcxGridDBTableView).DataController.Filter.SaveToStream(MemStream);
        MemStream.Position := 0;
        fibqLocalAux.ParamByName('ITEM_NAME').AsString := (Components[k] as TcxGridDBTableView).Owner.Name+'\'+(Components[k] as TcxGridDBTableView).Name+'/Filter';
        fibqLocalAux.ParamByName('TUNING').LoadFromStream(MemStream);
        MemStream.Free;
        fibqLocalAux.ExecQuery
       End;
     trMain.Commit
    except
     trMain.Rollback
    end;
    fibqLocalAux.Free
   End;
 With frmMain.dxBarManager.Bars[1].ItemLinks do // TaskBar
  For k := Pred(AvailableItemCount) downto 0 do
   With (AvailableItems[k].Item as TdxBarButton) do
    If (TForm(Tag)=Sender) then
     Begin
      Free;
      Break
     End
end;

procedure TfrmLike.ExportClick(Sender: TObject);
begin
 frmExportOptions := TfrmExportOptions.Create((Sender as TMenuItem).Owner.Owner);
 frmExportOptions.AGrid := ((Sender as TMenuItem).Owner as TcxGridPopupMenu).Grid;
 frmExportOptions.ShowModal;
 FreeAndNil(frmExportOptions)
end;


procedure TfrmLike.NewItemRowSelectorClick(Sender: TObject);
begin
 With (((Sender as TMenuItem).Owner as TcxGridPopupMenu).Grid.FocusedView as TcxGridTableView) do
  Begin
   If (OptionsData.Appending or OptionsData.Inserting) then
    OptionsView.NewItemRow := (Sender as TMenuItem).Checked
   else
    (Sender as TMenuItem).Checked := False
  End
end;

procedure TfrmLike.HeaderAutoHeightClick(Sender: TObject);
begin
 (((Sender as TMenuItem).Owner as TcxGridPopupMenu).Grid.FocusedView as TcxGridTableView).OptionsView.HeaderAutoHeight := (Sender as TMenuItem).Checked
end;

procedure TfrmLike.CellAutoHeightClick(Sender: TObject);
begin
 (((Sender as TMenuItem).Owner as TcxGridPopupMenu).Grid.FocusedView as TcxGridTableView).OptionsView.CellAutoHeight := (Sender as TMenuItem).Checked
end;

procedure TfrmLike.ShowPreView(Sender: TObject);
begin
 With (((Sender as TMenuItem).Owner as TcxGridPopupMenu).Grid.FocusedView as TcxGridTableView) do
  Begin
   If (Preview.Column<>Nil) then
    Preview.Visible := (Sender as TMenuItem).Checked
   else
    (Sender as TMenuItem).Checked := False
  End
end;

procedure TfrmLike.OpenAll;
begin
 If Not(trMain.InTransaction) then
  trMain.StartTransaction
end;

procedure TfrmLike.sbFirstClick(Sender: TObject);
begin
 grdMainList.ActiveView.DataController.GotoFirst
end;

procedure TfrmLike.sbPriorClick(Sender: TObject);
begin
 grdMainList.ActiveView.DataController.GotoPrev
end;

procedure TfrmLike.sbNextClick(Sender: TObject);
begin
 grdMainList.ActiveView.DataController.GotoNext
end;

procedure TfrmLike.sbLastClick(Sender: TObject);
begin
 grdMainList.ActiveView.DataController.GotoLast
end;

procedure TfrmLike.sbAddClick(Sender: TObject);
begin
 grdMainList.SetFocus;
 grdMainList.ActiveView.DataController.Append
end;

procedure TfrmLike.sbDeleteClick(Sender: TObject);
begin
 If (MessageDlg('Хотите удалить текущую запись?',mtConfirmation,mbOKCancel,0)=mrOK) then
  grdMainList.ActiveView.DataController.DeleteFocused
end;

procedure TfrmLike.sbCloseClick(Sender: TObject);
begin
 Close
end;

procedure TfrmLike.tvMainListFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 sbFirst.Enabled := NOT grdMainList.ActiveView.DataController.IsBOF;
 sbLast.Enabled := NOT grdMainList.ActiveView.DataController.IsEOF;
 sbPrior.Enabled := sbFirst.Enabled;
 sbNext.Enabled := sbLast.Enabled
end;

procedure TfrmLike.sbFilterClick(Sender: TObject);
begin
 (grdMainList.ActiveView as TcxGridDBTableView).Filtering.RunCustomizeDialog(nil)
end;

procedure TfrmLike.SetACButtons(Enabled : Boolean);
begin
 sbApply.Enabled := Enabled;
 sbCancel.Enabled := Enabled
end;

procedure TfrmLike.dsMainListStateChange(Sender: TObject);
begin
 SetACButtons((fibdsMainList.State in [dsEdit,dsInsert]) or (fibdsMainList.UpdatesPending))
end;

procedure TfrmLike.fibdsMainListAfterDelete(DataSet: TDataSet);
begin
 SetACButtons(True)
end;

procedure TfrmLike.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If (Shift=[ssCtrl]) and (Key in [Ord('F'),Ord('f'),Ord('А'),Ord('а')]) then
  sbFilter.Click
end;

procedure TfrmLike.Run;
begin
 OpenAll;
 Show
end;

procedure TfrmLike.sbRefreshClick(Sender: TObject);
begin
 If (MessageDlg('Хотите полностью обновить информацию?',mtConfirmation,mbOKCancel,0)=mrOK) then
  OpenAll
end;

end.
