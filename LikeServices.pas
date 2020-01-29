unit LikeServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Like, DB, dxBar, FIBDataSet, pFIBDataSet, cxGridCustomPopupMenu,
  cxGridPopupMenu, FIBDatabase, pFIBDatabase, cxSplitter, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxDBEdit, StdCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, cxLabel;

type
  TfrmLikeServices = class(TfrmLike)
    splServices: TcxSplitter;
    grdMainServices: TcxGrid;
    tvMainServices: TcxGridDBTableView;
    lvMainServices: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLikeServices: TfrmLikeServices;

implementation

uses DM;

{$R *.dfm}

procedure TfrmLikeServices.FormCreate(Sender: TObject);
begin
 inherited;
 grdMainServices.Align := alLeft;
 grdMainServices.Align := alRight;
 splServices.AlignSplitter := salLeft;
 splServices.AlignSplitter := salRight
end;

end.
