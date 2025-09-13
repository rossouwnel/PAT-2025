program PAT_p;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form4},
  uFlashCards in 'uFlashCards.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
