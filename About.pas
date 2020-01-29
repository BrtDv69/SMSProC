unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, Buttons;

type
  TfrmAbout = class(TForm)
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}
procedure TfrmAbout.FormShow(Sender: TObject);
begin
 frmAbout.Top := Trunc(Screen.Height/2-frmAbout.Height/2);
 frmAbout.Left := Trunc(Screen.Width/2-frmAbout.Width/2)
end;

procedure TfrmAbout.Image1Click(Sender: TObject);
begin
 frmAbout.Close;
end;

end.
