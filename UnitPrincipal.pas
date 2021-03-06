unit UnitPrincipal;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Ani;
type
  TFrmPrincipal = class(TForm)
    LytToolbar: TLayout;
    imgMenu: TImage;
    imgCarrinho: TImage;
    Label1: TLabel;
    LytSearch: TLayout;
    StyleBook: TStyleBook;
    RecSearch: TRectangle;
    Edit1: TEdit;
    Image3: TImage;
    Button1: TButton;
    lytOptions: TLayout;
    RectBase: TRectangle;
    RectOptions: TRectangle;
    lblCasa: TLabel;
    lblPosto: TLabel;
    LVRioLivre: TListView;
    imgLocation: TImage;
    imgOil: TImage;
    imgHour: TImage;
    AnimationFiltro: TFloatAnimation;
    rectMenu: TRectangle;
    Image2: TImage;
    ImgFecharMenu: TImage;
    Label2: TLabel;
    Label3: TLabel;
    rectMenuAgend: TRectangle;
    Label4: TLabel;
    Rectangle2: TRectangle;
    Label5: TLabel;
    Rectangle3: TRectangle;
    Label6: TLabel;
    rectRodape: TRectangle;
    Layout2: TLayout;
    Label7: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure LVRioLivreItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lblCasaClick(Sender: TObject);
    procedure imgCarrinhoClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure ImgFecharMenuClick(Sender: TObject);
    procedure rectMenuAgendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AddPontoColetaLv(id_postocoleta: integer; nome, endereco,
                             hr_func: string; qtd_oil: string);
    procedure ListarPontoColeta;
    procedure SelecionarColeta(lbl: TLabel);
    procedure OpenMenu(ind: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmPrincipal: TFrmPrincipal;
implementation
{$R *.fmx}
uses UnitColetor, UnitCarrinho, UnitAgendamento;
//C?digo para Alimenta??o da List View com dados dos Postos de Coleta
procedure TFrmPrincipal.AddPontoColetaLv( id_postocoleta: integer;
                                           nome, endereco, hr_func: string;
                                           qtd_oil: string);
var
  img: TListItemImage;
  txt: TListItemText;
begin
     // Inserir o item e trabalhar com ele abaixo
     with LVRioLivre.Items.Add do
     begin
         Height:= 115;
         Tag:= id_postocoleta;
         img:= TListItemImage(Objects.FindDrawable('imgLocation'));
         img.Bitmap:= imgLocation.Bitmap;
         img:= TListItemImage(Objects.FindDrawable('imgOil'));
         img.Bitmap:= imgOil.Bitmap;
         img:= TListItemImage(Objects.FindDrawable('imgHour'));
         img.Bitmap:= imgHour.Bitmap;
         txt:= TListItemText(Objects.FindDrawable('txtNome'));
         txt.Text:= nome;
         txt:= TListItemText(Objects.FindDrawable('txtAdress'));
         txt.Text:= endereco;
         txt:= TListItemText(Objects.FindDrawable('txtQtde'));
         txt.Text:= 'Quantidade m?nima: ' + qtd_oil + ' Litros';
         txt:= TListItemText(Objects.FindDrawable('txtHour'));
         txt.Text:= hr_func;
     end;
end;
procedure TFrmPrincipal.ListarPontoColeta;
begin
      AddPontoColetaLv(1, 'Supermercado Dois Irm?os', 'Rua ABC, 1200','Seg a Sex', '2');
      AddPontoColetaLv(1, 'Supermercado Dois Irm?os', 'Rua ABC, 1200','Seg a Sex', '2');
      AddPontoColetaLv(1, 'Supermercado Dois Irm?os', 'Rua ABC, 1200','Seg a Sex', '2');
      AddPontoColetaLv(1, 'Supermercado Dois Irm?os', 'Rua ABC, 1200','Seg a Sex', '2');
end;
procedure TFrmPrincipal.LVRioLivreItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    if NOT Assigned(FrmColetor) then
        Application.CreateForm(TFrmColetor, FrmColetor);
    FrmColetor.Show;
    FrmPrincipal.Hide;
end;
procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
      ListarPontoColeta;
end;
      procedure TFrmPrincipal.imgCarrinhoClick(Sender: TObject);
begin
     if NOT Assigned(FrmCarrinho) then
          Application.CreateForm(TFrmCarrinho, FrmCarrinho);
     FrmCarrinho.Show;
end;
procedure TFrmPrincipal.ImgFecharMenuClick(Sender: TObject);
begin
  OpenMenu(false);
end;
procedure TFrmPrincipal.OpenMenu(ind: boolean);
begin
  rectMenu.Visible:= ind;
end;
procedure TFrmPrincipal.rectMenuAgendClick(Sender: TObject);
begin
   if NOT Assigned(FrmAgendamento) then
   application.CreateForm(TFrmAgendamento, FrmAgendamento);
   OpenMenu(false);
   FrmAgendamento.Show;
end;
procedure TFrmPrincipal.imgMenuClick(Sender: TObject);
begin
    OpenMenu(true);
end;
//Receber a Label clicada como parametro
procedure TFrmPrincipal.SelecionarColeta(lbl: TLabel);
begin
    lblCasa.FontColor:= $FF8F8F8F;
    lblPosto.FontColor:= $FF8F8F8F;
    lbl.FontColor:= $FFFFFFFF;
    //Aqui definimos o eixo x como o final da anima??o
    AnimationFiltro.StopValue:= lbl.Position.x;
    AnimationFiltro.Start;
end;
procedure TFrmPrincipal.lblCasaClick(Sender: TObject);
begin
    SelecionarColeta(TLabel(Sender));
end;
end.
