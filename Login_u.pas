unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    pnlHeading: TPanel;
    btnRegister: TButton;
    btnLogin: TButton;
    edtUsername: TEdit;
    lblUsername: TLabel;
    Label2: TLabel;
    edtPassword: TEdit;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure pnlHeadingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
frmLogin.brush.color := clWhite ;
end;

procedure TfrmLogin.pnlHeadingClick(Sender: TObject);
begin
pnlHeading.font.size := 15 ;
end;

end.
