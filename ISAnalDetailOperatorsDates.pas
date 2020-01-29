unit ISAnalDetailOperatorsDates;

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
  TfrmISAnalDetailOperatorsDates = class(TfrmLikeAnal)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmISAnalDetailOperatorsDates: TfrmISAnalDetailOperatorsDates;

implementation

{$R *.dfm}

procedure TfrmISAnalDetailOperatorsDates.FormCreate(Sender: TObject);
begin
 FName := 'ИС - операторы и даты';
 inherited;
end;

end.
