unit Simulation1_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.Imaging.pngimage;

type
  TfrmSim1 = class(TForm)
    pnlSim1: TPanel;
    shpSkaal1: TShape;
    shpSirkel1: TShape;
    shpSkaal2: TShape;
    shpSirkel2: TShape;
    imgN1: TImage;
    imgN6: TImage;
    imgH1: TImage;
    imgH6: TImage;
    imgN3: TImage;
    imgN2: TImage;
    imgN5: TImage;
    imgN4: TImage;
    imgH3: TImage;
    imgH2: TImage;
    imgH4: TImage;
    imgH5: TImage;
    lblReaktanteN: TLabel;
    lblReaktanteH: TLabel;
    lblProducts1: TLabel;
    lblPlus1: TLabel;
    lblArrow1: TLabel;
    sedN: TSpinEdit;
    bmbRetry1: TBitBtn;
    sedH: TSpinEdit;
    sedNH: TSpinEdit;
    Panel2: TPanel;
    lblMenu: TLabel;
    btnSim1: TButton;
    btnSim2: TButton;
    btnFc: TButton;
    btnTest: TButton;
    tmrNH: TTimer;
    Panel1: TPanel;
    lblTimer: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSim1: TfrmSim1;

implementation

{$R *.dfm}

end.
