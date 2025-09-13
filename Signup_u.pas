unit Signup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSignup = class(TForm)
    pnlLogin: TPanel;
    lblUsername: TLabel;
    pnlHeading: TPanel;
    btnRegister: TButton;
    btnLogin: TButton;
    edtUsername: TEdit;
    edtPassword: TEdit;
    cbxSH1: TCheckBox;
    edtCPassword: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    procedure pnlHeadingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;

implementation

{$R *.dfm}

procedure TfrmSignup.pnlHeadingClick(Sender: TObject);
begin
pnlHeading.font.size := 15 ;
end;

end.
