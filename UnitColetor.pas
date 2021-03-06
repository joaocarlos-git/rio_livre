unit UnitColetor;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.ListBox;
type
  TFrmColetor = class(TForm)
    LytToolbar: TLayout;
    LblTitle: TLabel;
    ImgBack: TImage;
    ImgCart: TImage;
    LytSearch: TLayout;
    RecSearch: TRectangle;
    EdtSearch: TEdit;
    Image3: TImage;
    BtnSearch: TButton;
    LytEndereco: TLayout;
    LblEndereco: TLabel;
    Image4: TImage;
    Image5: TImage;
    LblQtdeMin: TLabel;
    LblHour: TLabel;
    LbCategoria: TListBox;
    ListBoxItem1: TListBoxItem;
    Rectangle1: TRectangle;
    Label1: TLabel;
    ListBoxItem2: TListBoxItem;
    Rectangle2: TRectangle;
    Label2: TLabel;
    ListBoxItem3: TListBoxItem;
    Rectangle3: TRectangle;
    Label3: TLabel;
    LbRecipientes: TListBox;
    procedure FormShow(Sender: TObject);
    procedure LbCategoriaItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure LbRecipientesItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ImgBackClick(Sender: TObject);
  private
    procedure AddRecipiente(id_recipiente: integer; descricao,
      quantidade: string);
    procedure ListarRecipientes;
    procedure ListarCategorias;
    procedure AddCategoria(id_categoria: integer; descricao: string);
    procedure SelecionarCategoria(item: TListBoxItem);
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FrmColetor: TFrmColetor;
implementation
{$R *.fmx}
uses UnitPrincipal, Frame_RecipienteCard, UnitRecipiente;
procedure TFrmColetor.AddRecipiente(id_recipiente: integer;
                                    descricao, quantidade: string);
var
  item: TListBoxItem;
  frame: TFrameRecipienteCard;
begin
    //Instanciando o item da ListBox
    item:= TListBoxItem.Create(LbRecipientes);
    //Para n?o ficar com o fundo cinza quando o usu?rio tocar
    item.Selectable:= false;
    //Texto vazio para ser carregado a partir do frame
    item.Text:= '';
    //Altura do Frame
    item.Height:= 200;
    //Deixar salvo dentro da tag do item o id do recipiente
    item.Tag:= id_recipiente;
    //Instanciando o Frame...
    frame:= TFrameRecipienteCard.Create(item);
    //frame.imgFoto.bitmap:=
    frame.lblNomeRecipiente.Text:= descricao;
    frame.lblQtdeRecipiente.text:= quantidade;
    //Inserindo o Frame dentro do Item...
    item.AddObject(frame);
    //Instanciando o item
    LbRecipientes.AddObject(item);
end;
procedure TFrmColetor.ListarRecipientes;
begin
    //Acessar os dados no backend...
    AddRecipiente(0, 'Garrafa Pet', '2L');
    AddRecipiente(0, 'Garrafa Pet', '2L');
    AddRecipiente(0, 'Garrafa Pet', '2L');
    AddRecipiente(0, 'Garrafa Pet', '2L');
    AddRecipiente(0, 'Garrafa Pet', '2L');
end;
procedure TFrmColetor.SelecionarCategoria(item: TListBoxItem);
var
  i: integer;
  item_loop: TListBoxItem;
  rect: TRectangle;
  lbl: TLabel;
begin
    //Zerar os items
    for i := 0 to LbCategoria.Items.Count -1 do
    begin
        item_loop:= LbCategoria.ItemByIndex(i);
        rect:= TRectangle(item_loop.Components[0]);
        rect.Fill.Color:= $FFE2E2E2;
        lbl:= TLabel(rect.Components[0]);
        lbl.FontColor:= $FF3A3A3A;
    end;
    //Ajustar style somente do item selecionado
    rect:= TRectangle(item.Components[0]);
    rect.Fill.Color:= $FF0066FF;
    lbl:= TLabel(rect.Components[0]);
    lbl.FontColor:= $FFFFFFFF;
    //Salvar a categoria selecionada
    LbCategoria.Tag:= item.Tag;
end;
procedure TFrmColetor.AddCategoria(id_categoria: integer;
                                    descricao: string);
var
  item: TListBoxItem;
  rect: TRectangle;
  lbl: TLabel;
begin
    item:= TListBoxItem.Create(LbCategoria);
    //Para n?o ficar com o fundo cinza quando o usu?rio tocar
    item.Selectable:= false;
    //Texto vazio para ser carregado a partir do DB
    item.Text:= '';
    //Altura do Frame
    item.Width:= 130;
    //Deixar salvo dentro da tag do item o id do recipiente
    item.Tag:= id_categoria;
    //Instanciando o Ret?ngulo
    rect:= TRectangle.Create(item);
    //Setando o tipo de cursor
    rect.Cursor:= crHandPoint;
    //Para o rect n?o pegar o click
    rect.HitTest:= false;
    //Definindo o background do rect
    rect.Fill.Color:= $FFE2E2E2;
    //Definindo o alinhamento do novo rect
    rect.Align:= TAlignLayout.Client;
    //Definindo as margens do novo rect
    rect.Margins.Top:= 8;
    rect.Margins.Left:= 8;
    rect.Margins.Right:= 8;
    rect.Margins.Bottom:= 8;
    //Definindo o arredondamento das bordas do novo rect
    rect.XRadius:= 6;
    rect.YRadius:= 6;
    //Removendo o contorno padr?o do novo rect
    rect.Stroke.Kind:= TBrushKind.None;
    //Instanciando a nova lbl
    lbl:= TLabel.Create(rect);
    //Alinhamento da nova lbl
    lbl.Align:= TAlignLayout.Client;
    //O texto ser? inserido por meio da descri??o no DB
    lbl.Text:= descricao;
    //Definindo o alinhamento do texto
     lbl.TextSettings.HorzAlign:= TTextAlign.Center;
     lbl.TextSettings.VertAlign:= TTextAlign.Center;
     //Remover os styles padr?o de fonte e cor
     lbl.StyledSettings:=  lbl.StyledSettings - [TStyledSetting.Size,
                                                  TStyledSetting.FontColor,
                                                  TStyledSetting.Style,
                                                  TStyledSetting.Other];
      lbl.Font.Size:= 13;
      lbl.FontColor:= $FF3A3A3A;
    rect.AddObject(lbl);
    item.AddObject(rect);
    LbCategoria.AddObject(item);
end;
procedure TFrmColetor.LbCategoriaItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
    SelecionarCategoria(Item);
end;
procedure TFrmColetor.LbRecipientesItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
   if NOT Assigned(FrmRecipiente)then
        Application.CreateForm(TFrmRecipiente, FrmRecipiente);
   FrmRecipiente.Show;
end;
procedure TFrmColetor.ListarCategorias;
begin
    LbCategoria.Items.Clear;
    AddCategoria(0, 'Garrafa Pet');
    AddCategoria(1, 'Gal?o');
    AddCategoria(2, 'Tambor');
    ListarRecipientes;
end;
procedure TFrmColetor.FormShow(Sender: TObject);
begin
    ListarCategorias;
end;
procedure TFrmColetor.ImgBackClick(Sender: TObject);
begin
close;
FrmPrincipal.Show;
end;

end.