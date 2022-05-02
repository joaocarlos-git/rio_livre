unit UnitCarrinho;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox;

type
  TFrmCarrinho = class(TForm)
    LytToolbar: TLayout;
    LblTitle: TLabel;
    ImgFecharMenu: TImage;
    LytEndereco: TLayout;
    LblEndereco: TLabel;
    Label1: TLabel;
    BtnSearch: TButton;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbRecipiente: TListBox;
    procedure FormShow(Sender: TObject);
  private
    procedure AddRecipiente(id_recipiente: integer; descricao: string; qtd_unit,
      quantidade: double; foto: TStream);
    procedure CarregarCarrinho;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCarrinho: TFrmCarrinho;

implementation

{$R *.fmx}

uses UnitPrincipal, Frame_RecipienteLista;

procedure TFrmCarrinho.AddRecipiente(id_recipiente: integer;
                                    descricao: string;
                                    qtd_unit, quantidade: double;
                                    foto: TStream);
var
  item: TListBoxItem;
  frame: TFrameRecipienteLista;
begin
    //Instanciando o item da ListBox
    item:= TListBoxItem.Create(lbRecipiente);
    //Para não ficar com o fundo cinza quando o usuário tocar
    item.Selectable:= false;
    //Texto vazio para ser carregado a partir do frame
    item.Text:= '';
    //Altura do Frame
    item.Height:= 82;
    //Deixar salvo dentro da tag do item o id do recipiente
    item.Tag:= id_recipiente;

    //Instanciando o Frame...
    frame:= TFrameRecipienteLista.Create(item);
    //frame.imgFoto.bitmap:=
    frame.lblNomeRecipiente.Text:= descricao;
    frame.lblQtdeUnit.Text:= qtd_unit.ToString + ' x ' + FormatFloat('Litros: #,#0.0',quantidade);
    frame.lblLitro.Text:= FormatFloat('Litros: #,#0.0', quantidade * qtd_unit);

    //Inserindo o Frame dentro do Item...
    item.AddObject(frame);

    //Instanciando o item
    lbRecipiente.AddObject(item);
end;

procedure TFrmCarrinho.CarregarCarrinho;
begin
  AddRecipiente(0, 'Garrafa Pet', 2, 2, nil);
  AddRecipiente(1, 'Garrafa Pet', 5, 3.5, nil);
  AddRecipiente(2, 'Garrafa Pet', 1, 1.5, nil);
  AddRecipiente(3, 'Garrafa Pet', 3, 2.5, nil);
end;

procedure TFrmCarrinho.FormShow(Sender: TObject);
begin
    CarregarCarrinho;
end;

end.