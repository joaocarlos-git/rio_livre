unit UnitSplash;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;
type
  TFrmSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmSplash: TFrmSplash;
implementation
{$R *.fmx}

uses UnitLogin;
procedure TFrmSplash.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled:= false;
if formLogin = nil then
  Application.CreateForm(TFormLogin, FormLogin);

FormLogin.Show;
FrmSplash.hide;
end;

end.
