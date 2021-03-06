unit UnitAgendamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrmAgendamento = class(TForm)
    LytToolbar: TLayout;
    LblTitle: TLabel;
    ImgBack: TImage;
    lvAgendamentos: TListView;
    imgLocation: TImage;
    procedure FormShow(Sender: TObject);
    procedure lvAgendamentosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure AddAgendamentoLv(id_agendamento, qtd_itens: integer; nome, endereco,
      dt_agend: string; vl_agend: double);
    procedure ListarAgendamentos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAgendamento: TFrmAgendamento;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitAgendamentoDetalhe;

procedure TFrmAgendamento.AddAgendamentoLv( id_agendamento, qtd_itens: integer;
                                           nome, endereco, dt_agend: string;
                                           vl_agend: double);

var
  img: TListItemImage;
  txt: TListItemText;
begin
     // Inserir o item e trabalhar com ele abaixo
     with lvAgendamentos.Items.Add do
     begin
         Height:= 115;
         Tag:= id_agendamento;

         img:= TListItemImage(Objects.FindDrawable('imgLocation'));
         img.Bitmap:= imgLocation.Bitmap;

         txt:= TListItemText(Objects.FindDrawable('txtNome'));
         txt.Text:= nome;

         txt:= TListItemText(Objects.FindDrawable('txtAgendamento'));
         txt.Text:= 'Agendamento ' + id_agendamento.ToString;

         txt:= TListItemText(Objects.FindDrawable('txtEndereco'));
         txt.Text:= endereco;

         txt:= TListItemText(Objects.FindDrawable('txtValor'));
         txt.Text:= FormatFloat('Litros: #,#0.0', vl_agend) + ' - ' + qtd_itens.ToString + ' itens';

         txt:= TListItemText(Objects.FindDrawable('txtData'));
         txt.Text:= dt_agend;
     end;
end;

procedure TFrmAgendamento.ListarAgendamentos;
begin
    AddAgendamentoLv(32457, 5, 'Posto de Coleta do Zez?', 'Rua ABC, 135', '20/03/2022', 30);
    AddAgendamentoLv(69875, 3, 'Posto de Coleta do Zez?', 'Rua ABC, 135', '20/03/2022', 30);
    AddAgendamentoLv(25784, 10, 'Posto de Coleta do Zez?', 'Rua ABC, 135', '20/03/2022', 30);
    AddAgendamentoLv(21245, 2, 'Posto de Coleta do Zez?', 'Rua ABC, 135', '20/03/2022', 30);
end;

procedure TFrmAgendamento.lvAgendamentosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
    if NOT Assigned(FrmAgendamentoDetalhe) then
      Application.CreateForm(TFrmAgendamentoDetalhe, FrmAgendamentoDetalhe);

    FrmAgendamentoDetalhe.Show;

end;

procedure TFrmAgendamento.FormShow(Sender: TObject);
begin
    ListarAgendamentos;
end;

end.
