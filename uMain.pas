// rossouw nel
unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Math, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.Imaging.pngimage, shellapi, uFlashCards;

type
  TForm4 = class(TForm)
    PageControl1: TPageControl;
    tsLogin: TTabSheet;
    tsRegister: TTabSheet;
    tsOptions: TTabSheet;
    pnlLogin: TPanel;
    pnlHeading1: TPanel;
    lblUsername: TLabel;
    lblLPassword: TLabel;
    btnRegister: TButton;
    pnlRegister: TPanel;
    btnReturn: TButton;
    edtLUsername: TEdit;
    edtLPassword: TEdit;
    cbxSH1: TCheckBox;
    btnLogin: TButton;
    pnlHeading2: TPanel;
    lblRUsername: TLabel;
    lblCPassword: TLabel;
    lblRPassword: TLabel;
    edtRUsername: TEdit;
    edtRPassword: TEdit;
    edtCPassword: TEdit;
    cbxSH2: TCheckBox;
    cbxSHC: TCheckBox;
    pnlOptions: TPanel;
    tsSim1: TTabSheet;
    pnlSim1: TPanel;
    pnlNH: TPanel;
    pnlSim1Menu: TPanel;
    sedN: TSpinEdit;
    sedH1: TSpinEdit;
    sedNH: TSpinEdit;
    lblN: TLabel;
    lblH1: TLabel;
    lblNH: TLabel;
    lblPlus1: TLabel;
    lblArrow1: TLabel;
    btnNext1: TButton;
    tsFlashcards: TTabSheet;
    btnRevealNH: TButton;
    pnlFlashcard1: TPanel;
    lblQuestion: TLabel;
    rgpQuestion: TRadioGroup;
    btnMarkAnswer: TButton;
    pbxH1: TPaintBox;
    pbxNH: TPaintBox;
    btnNextFlashcard: TButton;
    lblAnswer: TLabel;
    lblCreateAccount: TLabel;
    btnRLogin: TButton;
    btnFlashcards: TButton;
    lblHeadingPnl3: TLabel;
    btnSim: TButton;
    tsResultsScreen: TTabSheet;
    lblCorrectPercent: TLabel;
    btnBackToMenuRes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure cbxSH1Click(Sender: TObject);
    procedure cbxSH2Click(Sender: TObject);
    procedure cbxSHCClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnPrevious1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnFlashcardsClick(Sender: TObject);
    procedure btnMarkAnswerClick(Sender: TObject);
    procedure btnNextFlashcardClick(Sender: TObject);
    procedure btnRLoginClick(Sender: TObject);
    procedure pbxH1Paint(Sender: TObject);
    procedure btnBackToMenuResClick(Sender: TObject);
    procedure sedH1Change(Sender: TObject);
    procedure sedNHChange(Sender: TObject);
    procedure pbxNHPaint(Sender: TObject);
    procedure sedNChange(Sender: TObject);
    procedure btnRevealNHClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnReturnToMenuClick(Sender: TObject);

  private
    { Private declaratio
      Edit1: TEdit;ns }
    procedure ShowOnly(ATab: TTabSheet);
    procedure login();
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Username, Password, Progress: string;
  Fields: TstringList;
  LoginSuccesful: Boolean = false;
  Displace1, Displace2, Displace3, Displace: integer;
  Flash: textfile;
  sLine, question, A, B, C, D, Answer, QuestionNum: String;
  qNum: integer;

implementation

{$R *.dfm}


procedure TForm4.login();
var
  Users: textfile;
  sLine, FileUsername, FilePassword: String;
begin
  AssignFile(Users, 'E:\Roussouw IT PAT\PAT-2025\assets\Users.txt');
  reset(Users);
  Fields := TstringList.Create;
  Fields.Delimiter := '|';
  Fields.StrictDelimiter := True;
  LoginSuccesful := false;

  try
    while not EOF(Users) do
    begin
      ReadLn(Users, sLine);
      Fields.DelimitedText := sLine;
      if Fields.Count = 3 then
      begin
        FileUsername := Fields[0];
        FilePassword := Fields[1];
        Progress := Fields[2];

        if (FileUsername = Username) and (FilePassword = Password) then
        begin
          LoginSuccesful := True;
          Break;
        end;

      end;

    end;

    CloseFile(Users);

    if LoginSuccesful = True then
    begin
      ShowOnly(tsOptions);
    end
    else if LoginSuccesful = false then
    begin
      Showmessage('Invalid Username or Password');
    end;

  finally
    Fields.Free;
  end;
end;

procedure TForm4.ShowOnly(ATab: TTabSheet);
var
  i: integer;
begin
  for i := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := (PageControl1.Pages[i] = ATab);
  PageControl1.ActivePage := ATab;

end;

procedure TForm4.PageControl1Change(Sender: TObject);
begin
  ShowOnly(tsOptions);
end;

procedure TForm4.pbxNHPaint(Sender: TObject);
var
  CentreX, CentreY, CIrcle: integer;
  triangle: Array [0 .. 2] Of Tpoint;
  stripe: Array [0 .. 1] of Tpoint;
  i, j: integer;
begin
  Displace2 := sedNH.Value * -10;
  Displace1 := sedN.Value * 20;
  Displace := Displace1 + Displace2;

  CentreX := pbxNH.Width div 2;
  CentreY := pbxNH.Height div 2;

  triangle[0] := Point(CentreX, CentreY);
  triangle[1] := Point(CentreX - 50, CentreY + 80);
  triangle[2] := Point(CentreX + 50, CentreY + 80);

  stripe[0] := Point(CentreX - 310, CentreY + Displace);
  stripe[1] := Point(CentreX + 310, CentreY - Displace);

  with pbxNH.Canvas do
  begin
    MoveTo(CentreX, CentreY);
    pbxNH.Canvas.Brush.Color := RGB(255, 153, 0);
    pbxNH.Canvas.Pen.Color := clBlack;

    if (Displace = 0) and (sedN.Value <> 0) then
    begin
      Pen.Color := RGB(71, 212, 90);
      Brush.Color := RGB(71, 212, 90);
    end;
    CIrcle := 310;
    for j := 1 to 2 do
      for i := 0 to sedN.Value - 1 do
      begin
        CIrcle := CIrcle - 20;
        ellipse(CentreX - CIrcle, CentreY + Displace, CentreX - CIrcle + 20,
          CentreY - 20 + Displace)
      end;
    CIrcle := 130;

    for i := 0 to sedNH.Value - 1 do
    begin
      CIrcle := CIrcle + 20;
      ellipse(CentreX + CIrcle, CentreY - Displace, CentreX + CIrcle - 20,
        CentreY - 20 - Displace)
    end;
    pbxNH.Canvas.Polygon(stripe);
    pbxNH.Canvas.Polygon(triangle);
  end;
end;

procedure TForm4.pbxH1Paint(Sender: TObject);
var
  CentreX, CentreY, CIrcle: integer;
  triangle: Array [0 .. 2] Of Tpoint;
  stripe: Array [0 .. 1] of Tpoint;
  i, j: integer;
begin
  Displace2 := sedNH.Value * -15;
  Displace1 := sedH1.Value * 10;
  Displace := Displace1 + Displace2;

  CentreX := pbxH1.Width div 2;
  CentreY := pbxH1.Height div 2;

  triangle[0] := Point(CentreX, CentreY);
  triangle[1] := Point(CentreX - 50, CentreY + 80);
  triangle[2] := Point(CentreX + 50, CentreY + 80);

  stripe[0] := Point(CentreX - 310, CentreY + Displace);
  stripe[1] := Point(CentreX + 310, CentreY - Displace);

  with pbxH1.Canvas do
  begin
    MoveTo(CentreX, CentreY);
    pbxH1.Canvas.Brush.Color := RGB(44, 117, 255);
    pbxH1.Canvas.Pen.Color := clBlack;

    if (Displace = 0) and (sedH1.Value <> 0) then
    begin
      Pen.Color := RGB(71, 212, 90);
      Brush.Color := RGB(71, 212, 90);
    end;
    CIrcle := 310;
    for j := 1 to 2 do
      for i := 0 to sedH1.Value - 1 do
      begin
        CIrcle := CIrcle - 20;
        ellipse(CentreX - CIrcle, CentreY + Displace, CentreX - CIrcle + 20,
          CentreY - 20 + Displace)
      end;
    CIrcle := 130;
    for j := 1 to 3 do
      for i := 0 to sedNH.Value - 1 do
      begin
        CIrcle := CIrcle + 20;
        ellipse(CentreX + CIrcle, CentreY - Displace, CentreX + CIrcle - 20,
          CentreY - 20 - Displace)
      end;
    pbxH1.Canvas.Polygon(stripe);
    pbxH1.Canvas.Polygon(triangle);
  end;
end;

procedure TForm4.sedH1Change(Sender: TObject);
begin
  pbxH1.Repaint;
end;

procedure TForm4.sedNChange(Sender: TObject);
begin
  pbxNH.Repaint;
end;

procedure TForm4.sedNHChange(Sender: TObject);
begin
  pbxNH.Repaint;
  pbxH1.Repaint;
end;

procedure TForm4.btnFlashcardsClick(Sender: TObject);
begin
  ShowOnly(tsFlashcards);
  Flashcards_Start;
end;


procedure TForm4.btnLoginClick(Sender: TObject);
begin
  Password := edtLPassword.text;
  Username := edtLUsername.text;

  login;

end;

procedure TForm4.btnMarkAnswerClick(Sender: TObject);
begin
  Flashcards_MarkAnswer;
  Exit;
  if rgpQuestion.ItemIndex = -1 then
  begin
    Showmessage('Please select an answer.');
    Exit;
  end;

  if StrToInt(Answer) = rgpQuestion.ItemIndex + 1 then
    Showmessage('Correct!')
  else
    Showmessage('Wrong ✘');
end;

procedure TForm4.btnNextFlashcardClick(Sender: TObject);
begin
  Flashcards_NextQuestion;
end;

procedure TForm4.btnPrevious1Click(Sender: TObject);
begin
  ShowOnly(tsSim1);
end;

procedure TForm4.btnRegisterClick(Sender: TObject);

begin
  ShowOnly(tsRegister);
end;

procedure TForm4.btnReturnClick(Sender: TObject);
begin
  ShowOnly(tsLogin);
end;

procedure TForm4.btnReturnToMenuClick(Sender: TObject);
begin
  ShowOnly(tsOptions);
end;

procedure TForm4.btnRevealNHClick(Sender: TObject);
begin
  sedN.Value := 1;
  sedH1.Value := 3;
  sedNH.Value := 2;
end;

procedure TForm4.btnRLoginClick(Sender: TObject);
var
  Exists: Boolean;
  sLine: string;
  Fields: TstringList;
  Users: textfile;
begin
  if not(edtRPassword.text = edtCPassword.text) then
  begin
    Showmessage('Passwords don''t match');
    Exit
  end;

  Exists := false;
  AssignFile(Users, 'E:\Roussouw IT PAT\PAT-2025\assets\Users.txt');
  reset(Users);
  Username := edtRUsername.text;
  Password := edtRPassword.text;

  Fields := TstringList.Create;
  Fields.Delimiter := '|';
  Fields.StrictDelimiter := True;

  TRY
    while not EOF(Users) do
    begin
      ReadLn(Users, sLine);
      Fields.DelimitedText := sLine;
      if (Fields.Count >= 1) and (Fields[0] = Username) then
      begin
        Showmessage('Username already exists');
        CloseFile(Users);
        Exists := True;
        Exit
      end;
    end;

    CloseFile(Users);

    AssignFile(Users, 'E:\Roussouw IT PAT\PAT-2025\assets\Users.txt');
    Append(Users);
    WriteLn(Users, Username + '|' + Password + '|' + '0');
    CloseFile(Users);

    if Exists = false then
    begin
      login;
    end;
  FINALLY
    Fields.Free;
  END;

  login
end;

procedure TForm4.btnSimClick(Sender: TObject);
begin
  ShowOnly(tsSim1);
end;

procedure TForm4.btnBackToMenuResClick(Sender: TObject);
begin
    ShowOnly(tsOptions);
    

end;

procedure TForm4.cbxSH1Click(Sender: TObject);
begin
  if cbxSH1.Checked then
    edtLPassword.PasswordChar := #0 // hierdie sal die teks wys wat ingetik word
  else
    edtLPassword.PasswordChar := '*' // steek weg wat mens tik met 'n *
end;

procedure TForm4.cbxSH2Click(Sender: TObject);
begin
  if cbxSH2.Checked then
    edtRPassword.PasswordChar := #0 // hierdie sal die teks wys wat ingetik word
  else
    edtRPassword.PasswordChar := '*' // steek weg wat mens tik met 'n *
end;

procedure TForm4.cbxSHCClick(Sender: TObject);
begin
  if cbxSHC.Checked then
    edtCPassword.PasswordChar := #0 // hierdie sal die teks wys wat ingetik word
  else
    edtCPassword.PasswordChar := '*' // steek weg wat mens tik met 'n *
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  ShowOnly(tsLogin);
  tsLogin.Caption := 'Login';
  tsRegister.Caption := 'Register';
  tsOptions.Caption := 'Options';
  tsSim1.Caption := 'Simulation 1';
  // tsLogin
  pnlLogin.Caption := '';
  pnlHeading1.Caption := 'Login';
  pnlHeading1.Font.size := 15;
  lblUsername.Font.size := 10;
  lblLPassword.Font.size := 10;
  lblCreateAccount.Font.size := 10;

  lblUsername.Caption := 'Username';
  lblLPassword.Caption := 'Password';

  edtLUsername.text := '';
  edtLPassword.text := '';
  edtLPassword.PasswordChar := '*';

  cbxSH1.Caption := 'show/hide';

  btnRegister.Caption := 'Sign up';
  btnLogin.Caption := 'Login';
  // tsRegister
  pnlRegister.Caption := '';
  pnlHeading2.Caption := 'Sign Up';
  pnlHeading2.Font.size := 15;
  lblRUsername.Font.size := 10;
  lblRPassword.Font.size := 10;
  lblCPassword.Font.size := 10;

  lblRUsername.Caption := 'Username';
  lblRPassword.Caption := 'Password';
  lblCPassword.Caption := 'Confirm Password';

  edtRUsername.text := '';
  edtRPassword.text := '';
  edtCPassword.text := '';
  edtRPassword.PasswordChar := '*';
  edtCPassword.PasswordChar := '*';
  // tsOptions
  pnlOptions.Caption := '';

  // Simulation 1
  pnlSim1.Caption := '';
  pnlNH.Caption := '';
  pnlSim1Menu.Caption := '';
  pnlNH.Brush.Color := clSkyBlue;
  pnlSim1Menu.Brush.Color := clMenuHighlight;

  sedN.Font.size := 30;
  sedH1.Font.size := 30;
  sedNH.Font.size := 30;
  sedN.MaxValue := 3;
  sedH1.MaxValue := 3;
  sedNH.MaxValue := 3;

  lblN.Caption := 'N₂-Molekules';
  lblH1.Caption := 'H₂-Molekules';
  lblNH.Caption := 'NH₃-Molekules';
  lblPlus1.Caption := '+';
  lblArrow1.Caption := '→';
  lblN.Font.size := 14;
  lblH1.Font.size := 14;
  lblNH.Font.size := 14;
  lblPlus1.Font.size := 25;
  lblArrow1.Font.size := 25;

  btnRevealNH.Caption := 'Reveal';
  btnNext1.Caption := 'Next';

  // Simulation 2

  // Flashcards
  rgpQuestion.Font.size := 14;
  btnNextFlashcard.Caption := 'Next';
  lblAnswer.Visible := false;

  // Wire Next button and initialize flashcards module
  btnNextFlashcard.OnClick := btnNextFlashcardClick;
  Flashcards_Init(lblQuestion, rgpQuestion, btnMarkAnswer, btnNextFlashcard,
                  lblAnswer, lblCorrectPercent, tsFlashcards, tsResultsScreen);
  Flashcards_SetShowOnly(ShowOnly);

  qNum := 1;


  rgpQuestion.Items.Clear;
  rgpQuestion.Items.Add('A. H₂ + O₂ → H₂O');
  rgpQuestion.Items.Add('B. 2H₂ + O₂ → 2H₂O'); // regte antwoord
  rgpQuestion.Items.Add('C. H₂ + 2O₂ → 2H₂O');
  rgpQuestion.Items.Add('D. 2H₂ + 2O₂ → H₂O');


end;

end.
