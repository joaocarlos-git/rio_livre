unit Frame_RecipienteLista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Objects;

type
  TFrameRecipienteLista = class(TFrame)
    imgFoto: TImage;
    lblNomeRecipiente: TLabel;
    lblLitro: TLabel;
    Layout1: TLayout;
    lblQtdeUnit: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
