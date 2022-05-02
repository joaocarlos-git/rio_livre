program RioLivre;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {FormLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitColetor in 'UnitColetor.pas' {FrmColetor},
  Frame_RecipienteCard in 'Frames\Frame_RecipienteCard.pas' {FrameRecipienteCard: TFrame},
  UnitSplash in 'UnitSplash.pas' {FrmSplash},
  UnitRecipiente in 'UnitRecipiente.pas' {FrmRecipiente},
  UnitCarrinho in 'UnitCarrinho.pas' {FrmCarrinho},
  Frame_RecipienteLista in 'Frames\Frame_RecipienteLista.pas' {FrameRecipienteLista: TFrame},
  UnitAgendamento in 'UnitAgendamento.pas' {FrmAgendamento},
  UnitAgendamentoDetalhe in 'UnitAgendamentoDetalhe.pas' {FrmAgendamentoDetalhe};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmColetor, FrmColetor);
  Application.CreateForm(TFrmRecipiente, FrmRecipiente);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmCarrinho, FrmCarrinho);
  Application.CreateForm(TFrmAgendamento, FrmAgendamento);
  Application.CreateForm(TFrmAgendamentoDetalhe, FrmAgendamentoDetalhe);
  Application.Run;
end.
