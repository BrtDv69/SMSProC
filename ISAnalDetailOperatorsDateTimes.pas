unit ISAnalDetailOperatorsDateTimes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LikeAnal, DB, dxBar, FIBDataSet, pFIBDataSet,
  cxGridCustomPopupMenu, cxGridPopupMenu, FIBDatabase, pFIBDatabase,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, cxContainer, cxEdit, cxTextEdit, cxMemo, cxDBEdit, StdCtrls,
  ExtCtrls;

type
  TfrmISAnalDetailOperatorsDateTimes = class(TfrmLikeAnal)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmISAnalDetailOperatorsDateTimes: TfrmISAnalDetailOperatorsDateTimes;

implementation

{$R *.dfm}

procedure TfrmISAnalDetailOperatorsDateTimes.FormCreate(Sender: TObject);
begin
 FName := 'ИС - операторы и время суток';
 inherited;
end;

end.
