unit SVAnalDetailOperatorsDateTimes;

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
  TfrmSVAnalDetailOperatorsDateTimes = class(TfrmLikeAnal)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSVAnalDetailOperatorsDateTimes: TfrmSVAnalDetailOperatorsDateTimes;

implementation

{$R *.dfm}

procedure TfrmSVAnalDetailOperatorsDateTimes.FormCreate(Sender: TObject);
begin
 FName := 'Викторины - операторы и время суток';
 inherited;
end;

end.
