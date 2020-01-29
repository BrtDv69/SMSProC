unit Main;

interface

uses
  Forms, Classes, ActnList, ImgList, Controls, AppEvnts, cxLookAndFeels,
  dxBar, dxBarExtItems, dxStatusBar, cxControls, ExtCtrls, SysUtils;

type
  TfrmMain = class(TForm)
    dxStatusBar1: TdxStatusBar;
    dxBarManager: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    cxLookAndFeelController1: TcxLookAndFeelController;
    ApplicationEvents1: TApplicationEvents;
    ilToolButtons: TImageList;
    ActionList1: TActionList;
    dxBarButton11: TdxBarButton;
    dxBarButton13: TdxBarButton;
    bliListWindows: TdxBarListItem;
    dxBarButton17: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton28: TdxBarButton;
    dxBarButton29: TdxBarButton;
    Timer1: TTimer;
    dxBarSubItem8: TdxBarSubItem;
    aServises: TAction;
    dxBarSubItem9: TdxBarSubItem;
    dxBarSubItem10: TdxBarSubItem;
    aSVSettingsQuestions: TAction;
    dxBarButton44: TdxBarButton;
    aSVSettingsTemplates: TAction;
    dxBarButton45: TdxBarButton;
    aSVSettingsPrizes: TAction;
    aISSettingsReplies: TAction;
    dxBarButton46: TdxBarButton;
    dxBarSubItem11: TdxBarSubItem;
    dxBarSubItem12: TdxBarSubItem;
    aSVAnalTotal: TAction;
    dxBarButton48: TdxBarButton;
    aSVAnalDetailOperatorsCompetitors: TAction;
    dxBarButton49: TdxBarButton;
    aSVAnalDetailOperatorsDates: TAction;
    aSVAnalDetailOperatorsDateTimes: TAction;
    dxBarButton50: TdxBarButton;
    dxBarButton51: TdxBarButton;
    aISAnalTotal: TAction;
    aISAnalDetailOperatorsUsers: TAction;
    aISAnalDetailOperatorsDates: TAction;
    aISAnalDetailOperatorsDateTimes: TAction;
    dxBarButton52: TdxBarButton;
    dxBarButton53: TdxBarButton;
    dxBarButton54: TdxBarButton;
    dxBarButton55: TdxBarButton;
    dxBarButton56: TdxBarButton;
    dxBarButton57: TdxBarButton;
    dxBarButton58: TdxBarButton;
    aSVCompetitors: TAction;
    aISUsers: TAction;
    aSendedSMS: TAction;
    dxBarButton59: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure bliListWindowsClick(Sender: TObject);
    procedure bliListWindowsGetData(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
    procedure dxBarButton18Click(Sender: TObject);
    procedure dxBarButton19Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxBarButton35Click(Sender: TObject);
    procedure aServisesExecute(Sender: TObject);
    procedure aSVSettingsQuestionsExecute(Sender: TObject);
    procedure aSVSettingsTemplatesExecute(Sender: TObject);
    procedure aSVSettingsPrizesExecute(Sender: TObject);
    procedure aISSettingsRepliesExecute(Sender: TObject);
    procedure aSVAnalTotalExecute(Sender: TObject);
    procedure aISAnalTotalExecute(Sender: TObject);
    procedure aSVAnalDetailOperatorsCompetitorsExecute(Sender: TObject);
    procedure aISAnalDetailOperatorsUsersExecute(Sender: TObject);
    procedure aISAnalDetailOperatorsDatesExecute(Sender: TObject);
    procedure aSVAnalDetailOperatorsDatesExecute(Sender: TObject);
    procedure aSVAnalDetailOperatorsDateTimesExecute(Sender: TObject);
    procedure aISAnalDetailOperatorsDateTimesExecute(Sender: TObject);
    procedure aSVCompetitorsExecute(Sender: TObject);
    procedure aISUsersExecute(Sender: TObject);
    procedure aSendedSMSExecute(Sender: TObject);
    procedure dxBarButton28Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton29Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  
implementation

uses Like, About, DM, ExportOptions, devex_loc, AdminProg, Services,
  Questions, Templates, Prizes, Mssges,
  LikeServices, SVAnalTotal, SVCompetitors, ISUsers, SendedSMS,
  AdminUsers, Operators, Sockets, Test, PswdChange;

{$R *.dfm}

var BkMrkIDMainList: Integer = 0;

procedure TfrmMain.ApplicationEvents1Hint(Sender: TObject);
begin
 dxStatusBar1.Panels[1].Text := Application.Hint
end;

procedure TfrmMain.dxBarButton11Click(Sender: TObject);
begin
 TileMode := tbVertical;
 Tile
end;

procedure TfrmMain.dxBarButton13Click(Sender: TObject);
begin
 Cascade
end;

procedure TfrmMain.bliListWindowsClick(Sender: TObject);
begin
 With bliListWindows do
  TfrmLike(Items.Objects[ItemIndex]).Show;
end;

procedure TfrmMain.bliListWindowsGetData(Sender: TObject);
begin
 With bliListWindows do
  ItemIndex := Items.IndexOfObject(ActiveMDIChild);
end;

procedure TfrmMain.dxBarButton17Click(Sender: TObject);
begin
 Close
end;

procedure TfrmMain.dxBarButton18Click(Sender: TObject);
begin
 Application.CreateForm(TfrmAbout,frmAbout);
 frmAbout.ClientWidth := frmAbout.Image1.Picture.Width;
 frmAbout.ClientHeight := frmAbout.Image1.Picture.Height;
 frmAbout.AlphaBlend := False;
 frmAbout.ShowModal;
 frmAbout.Free
end;

procedure TfrmMain.dxBarButton19Click(Sender: TObject);
begin
 TileMode := tbHorizontal;
 Tile
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
 localize_cx
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
 dxStatusBar1.Panels[2].Text := FormatDateTime('hh:nn dd.mm.yyyy',Now)
end;

procedure TfrmMain.dxBarButton35Click(Sender: TObject);
begin
 If (frmMain.FindComponent('frmAdminProg')=nil) then
  frmAdminProg := TfrmAdminProg.Create(frmMain);
 frmAdminProg.Run
end;

procedure TfrmMain.aServisesExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmServices')=nil) then
  frmServices := TfrmServices.Create(frmMain);
 frmServices.Run
end;

procedure TfrmMain.aSVSettingsQuestionsExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmQuestions')=nil) then
  frmQuestions := TfrmQuestions.Create(frmMain);
 frmQuestions.Run
end;

procedure TfrmMain.aSVSettingsTemplatesExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmTemplates')=nil) then
  frmTemplates := TfrmTemplates.Create(frmMain);
 frmTemplates.Run
end;

procedure TfrmMain.aSVSettingsPrizesExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmPrizes')=nil) then
  frmPrizes := TfrmPrizes.Create(frmMain);
 frmPrizes.Run
end;

procedure TfrmMain.aISSettingsRepliesExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmMessages')=nil) then
  frmMessages := TfrmMessages.Create(frmMain);
 frmMessages.Run
end;

procedure TfrmMain.aSVAnalTotalExecute(Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='Викторины - операторы') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(2,TComponent(Sender).Tag);
end;

procedure TfrmMain.aISAnalTotalExecute(Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='ИС - операторы') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(1,TComponent(Sender).Tag);
end;

procedure TfrmMain.aSVAnalDetailOperatorsCompetitorsExecute(
  Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='Викторины - операторы и номера') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(2,TComponent(Sender).Tag);
end;

procedure TfrmMain.aISAnalDetailOperatorsUsersExecute(Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='ИС - операторы и номера') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(1,TComponent(Sender).Tag);
end;

procedure TfrmMain.aISAnalDetailOperatorsDatesExecute(Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='ИС - операторы и даты') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(1,TComponent(Sender).Tag);
end;

procedure TfrmMain.aSVAnalDetailOperatorsDatesExecute(Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='Викторины - операторы и даты') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(2,TComponent(Sender).Tag);
end;

procedure TfrmMain.aSVAnalDetailOperatorsDateTimesExecute(Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='Викторины - операторы и время суток') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(2,TComponent(Sender).Tag);
end;

procedure TfrmMain.aISAnalDetailOperatorsDateTimesExecute(Sender: TObject);
 var I: Integer;
     Found: Boolean;
begin
 Found := False;
 For I := 0 to Pred(frmMain.ComponentCount) do  // Iterate
  If (frmMain.Components[I] is TfrmSVAnalTotal) then
   If (TfrmSVAnalTotal(frmMain.Components[I]).FName='ИС - операторы и время суток') then
    Begin
     Found := True;
     frmSVAnalTotal := TfrmSVAnalTotal(frmMain.Components[I]);
     Break
    End;  // for
 If Not(Found) then
  frmSVAnalTotal := TfrmSVAnalTotal.Create(frmMain);
 frmSVAnalTotal.RunAnal(1,TComponent(Sender).Tag);
end;

procedure TfrmMain.aSVCompetitorsExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmSVCompetitors')=nil) then
  frmSVCompetitors := TfrmSVCompetitors.Create(frmMain);
 frmSVCompetitors.Run
end;

procedure TfrmMain.aISUsersExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmISUsers')=nil) then
  frmISUsers := TfrmISUsers.Create(frmMain);
 frmISUsers.Run
end;

procedure TfrmMain.aSendedSMSExecute(Sender: TObject);
begin
 If (frmMain.FindComponent('frmSendedSMS')=nil) then
  frmSendedSMS := TfrmSendedSMS.Create(frmMain);
 frmSendedSMS.Run
end;

procedure TfrmMain.dxBarButton28Click(Sender: TObject);
begin
 If (frmMain.FindComponent('frmAdminUsers')=nil) then
  frmAdminUsers := TfrmAdminUsers.Create(frmMain);
 frmAdminUsers.Run
end;

procedure TfrmMain.dxBarButton3Click(Sender: TObject);
begin
 If (frmMain.FindComponent('frmOperators')=nil) then
  frmOperators := TfrmOperators.Create(frmMain);
 frmOperators.Run
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var I: Integer;
begin
 For I := Pred(frmMain.MDIChildCount) downto 0  do    // Iterate
  frmMain.MDIChildren[I].Close;
end;

procedure TfrmMain.dxBarButton4Click(Sender: TObject);
begin
 If (frmMain.FindComponent('frmSockets')=nil) then
  frmSockets := TfrmSockets.Create(frmMain);
 frmSockets.Run
end;

procedure TfrmMain.dxBarButton5Click(Sender: TObject);
begin
 If (frmMain.FindComponent('frmTest')=nil) then
  frmTest := TfrmTest.Create(frmMain);
 frmTest.Show
end;

procedure TfrmMain.dxBarButton6Click(Sender: TObject);
 var I: Integer;
begin
 For I := Pred(frmMain.MDIChildCount) downto 0  do    // Iterate
  frmMain.MDIChildren[I].Close;
end;

procedure TfrmMain.dxBarButton29Click(Sender: TObject);
begin
 frmPswdChange := TfrmPswdChange.Create(frmMain);
 frmPswdChange.ShowModal;
 frmPswdChange.Free
end;

end.
