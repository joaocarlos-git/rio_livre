unit UnitLogin;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  UniProvider, MySQLUniProvider, Data.DB, MemDS, DBAccess, Uni;
type
  TFormLogin = class(TForm)
    TabControl: TTabControl;
    TabLogin: TTabItem;
    TabConta1: TTabItem;
    TabConta2: TTabItem;
    Image1: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    editEmailAcessar: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Image2: TImage;
    Layout2: TLayout;
    Label3: TLabel;
    Button2: TButton;
    Label6: TLabel;
    TabConta3: TTabItem;
    StyleBook: TStyleBook;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    editSenhaAcessar: TEdit;
    Rectangle3: TRectangle;
    editSenha: TEdit;
    Rectangle4: TRectangle;
    editNome: TEdit;
    Rectangle5: TRectangle;
    editEmail: TEdit;
    Label4: TLabel;
    Layout3: TLayout;
    Label5: TLabel;
    Button3: TButton;
    Label7: TLabel;
    Layout4: TLayout;
    Button4: TButton;
    Rectangle8: TRectangle;
    editCep: TEdit;
    V: TLayout;
    Rectangle6: TRectangle;
    editCidade: TEdit;
    editUf: TEdit;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Layout6: TLayout;
    Label9: TLabel;
    Button5: TButton;
    Label10: TLabel;
    Rectangle12: TRectangle;
    editTelefone: TEdit;
    Rectangle13: TRectangle;
    editDtnasc: TEdit;
    Rectangle14: TRectangle;
    editCpf: TEdit;
    Image4: TImage;
    Label11: TLabel;
    Image3: TImage;
    Label8: TLabel;
    Rectangle7: TRectangle;
    editBairro: TEdit;
    Layout5: TLayout;
    Rectangle9: TRectangle;
    editEndereco: TEdit;
    Rectangle15: TRectangle;
    editNumero: TEdit;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    MySQLUniProvider1: TMySQLUniProvider;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FormLogin: TFormLogin;
implementation
{$R *.fmx}

uses UnitPrincipal;
procedure TFormLogin.Button1Click(Sender: TObject);
begin
if(editEmailAcessar.Text = ' ') and (editSenhaAcessar.Text = ' ') and (frmPrincipal = nil)then
ShowMessage('Email e Senha devem ser preenchido');
TabControl.TabIndex:= 0;
if
(editEmailAcessar.text = ':EMAIL') and (editSenhaAcessar.Text = ':SENHA') then
     //FrmPrincipal.Show;
     Application.CreateForm(TFrmPrincipal, FrmPrincipal);
     FrmPrincipal.Show;
hide;


TabControl.TabIndex:= 0;
end;

procedure TFormLogin.Button2Click(Sender: TObject);
begin
TabControl.TabIndex:= 2;
end;

procedure TFormLogin.Button3Click(Sender: TObject);
begin
 TabControl.TabIndex:= 3;
end;

procedure TFormLogin.Button5Click(Sender: TObject);
begin

            UniQuery1.close;
            UniQuery1.SQL.Clear;
            UniQuery1.SQL.Add('insert into usuario(EMAIL, NOME, SENHA, CEP, ENDERECO, NUMERO, BAIRRO, CIDADE, UF, CPF, DATANASCIMENTO, TELEFONE)VALUES(:EMAIL, :NOME, :SENHA, :CEP, :ENDERECO, :NUMERO, :BAIRRO, :CIDADE, :UF, :CPF, :DATANASCIMENTO, :TELEFONE)');
            UniQuery1.ParamByName('EMAIL').AsString:=editEmail.Text;
            UniQuery1.ParamByName('NOME').AsString:=editNome.Text;
            UniQuery1.ParamByName('SENHA').AsString:=editSenha.Text;
            UniQuery1.ParamByName('CEP').AsString:=editCep.Text;
            UniQuery1.ParamByName('ENDERECO').AsString:=editEndereco.Text;
            UniQuery1.ParamByName('NUMERO').AsString:=editNumero.Text;
            UniQuery1.ParamByName('BAIRRO').AsString:=editBairro.Text;
            UniQuery1.ParamByName('CIDADE').AsString:=editCidade.Text;
            UniQuery1.ParamByName('UF').AsString:=editUF.Text;
            UniQuery1.ParamByName('CPF').AsString:=editCpf.Text;
            UniQuery1.ParamByName('DATANASCIMENTO').AsString:=editDtnasc.Text;
            UniQuery1.ParamByName('TELEFONE').AsString:=editTelefone.Text;
            UniQuery1.ExecSQL;
            ShowMessage('Dados inseridos com sucesso');
            TabControl.TabIndex:= 0;
end;

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TFormLogin.Label2Click(Sender: TObject);
begin
TabControl.TabIndex:= 0;
end;

procedure TFormLogin.Label8Click(Sender: TObject);
begin
TabControl.TabIndex:= 0;
end;

end.
