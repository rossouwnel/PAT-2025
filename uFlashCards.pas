unit uFlashCards;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.IOUtils, System.Math,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Graphics,
  Winapi.Windows, Winapi.MMSystem;

type
  TShowOnlyProc = procedure(ATab: TTabSheet) of object;

procedure Flashcards_Init(const ALblQuestion: TLabel;
  const ARadioGroup: TRadioGroup; const ABtnMarkAnswer, ABtnNext: TButton;
  const ALblAnswer, ALblCorrectPercent: TLabel;
  const ATsFlashcards, ATsResults: TTabSheet);

procedure Flashcards_SetShowOnly(const AProc: TShowOnlyProc);

procedure Flashcards_Start;

procedure Flashcards_MarkAnswer;

procedure Flashcards_NextQuestion;

function GetQuestionNumber: Integer;
function GetQuestionsCorrect: Integer;

implementation

var
  // UI references
  LblQuestion: TLabel;
  RgpQuestion: TRadioGroup;
  BtnMarkAnswer: TButton;
  BtnNext: TButton;
  LblAnswer: TLabel;
  LblCorrectPercent: TLabel;
  TsFlashcards: TTabSheet;
  TsResults: TTabSheet;

  // Navigation callback
  ShowOnlyProc: TShowOnlyProc = nil;

  // Data
  QuestionsJson: TJSONObject = nil;

  // State
  question_number: Integer = 0;
  questions_correct: Integer = 0;
  CurrentCorrectIndex: Integer = -1;
  RandomSeeded: Boolean = False;

const
  QUESTIONS_FILE = 'C:\Git\IT PAT 2025\assets\questions.json';
  CORRECT_SFX = 'C:\Git\IT PAT 2025\assets\correct.mp3';
  WRONG_SFX = 'C:\Git\IT PAT 2025\assets\wrong.mp3';

procedure PlaySfx(const AFile: string);
var
  cmd: string;
begin
  if (AFile = '') or (not TFile.Exists(AFile)) then
    Exit;

  // Close previous alias if any
  mciSendString('close sfx', nil, 0, 0);

  cmd := Format('open "%s" type mpegvideo alias sfx', [AFile]);
  mciSendString(PChar(cmd), nil, 0, 0);
  mciSendString('play sfx from 0', nil, 0, 0);
end;

procedure EnsureRandomized;
begin
  if not RandomSeeded then
  begin
    System.Randomize;
    RandomSeeded := True;
  end;
end;

procedure LoadQuestionsIfNeeded;
var
  jsonText: string;
begin
  if Assigned(QuestionsJson) then
    Exit;

  if not TFile.Exists(QUESTIONS_FILE) then
    raise Exception.Create('questions.json not found at expected path: ' +
      QUESTIONS_FILE);

  jsonText := TFile.ReadAllText(QUESTIONS_FILE, TEncoding.UTF8);
  QuestionsJson := TJSONObject(TJSONObject.ParseJSONValue(jsonText));
  if not Assigned(QuestionsJson) then
    raise Exception.Create('Failed to parse questions.json');
end;

procedure ResetUIForNewQuestion;
begin
  // Step 0: clear answer, hide next, show submit
  if Assigned(LblAnswer) then
  begin
    LblAnswer.Visible := False;
    LblAnswer.Caption := '';
  end;
  if Assigned(BtnNext) then
    BtnNext.Visible := False;
  if Assigned(BtnMarkAnswer) then
    BtnMarkAnswer.Visible := True;
  if Assigned(RgpQuestion) then
    RgpQuestion.ItemIndex := -1;
end;

procedure ShowResultsAndReset;
var
  percent: Integer;
begin

  if question_number > 0 then
    percent := Round((questions_correct / question_number) * 100)
  else
    percent := 0;

  if Assigned(LblCorrectPercent) then
    LblCorrectPercent.Caption := IntToStr(percent) + '% correct';

  if Assigned(ShowOnlyProc) and Assigned(TsResults) then
    ShowOnlyProc(TsResults);

  // Reset counters for next session
  question_number := 0;
  questions_correct := 0;
end;

procedure ProcessMain;
var
  x: Integer;
  qKey: string;
  qObj, optsObj: TJSONObject;
  equation, correctAnswer, o1, o2, o3: string;
  options: array [0 .. 3] of string;
  i, j, swapIdx: Integer;
  tmp: string;
begin

  if question_number >= 10 then
  begin
    ShowResultsAndReset;
    Exit;
  end;

  ResetUIForNewQuestion;

  EnsureRandomized;
  LoadQuestionsIfNeeded;

  x := Random(100) + 1;
  qKey := 'question_' + IntToStr(x);

  qObj := QuestionsJson.Values[qKey] as TJSONObject;
  if not Assigned(qObj) then
    raise Exception.CreateFmt('Question not found in JSON: %s', [qKey]);

  equation := qObj.GetValue('equation').Value;
  correctAnswer := qObj.GetValue('answer').Value;
  optsObj := qObj.Values['options'] as TJSONObject;
  if not Assigned(optsObj) then
    raise Exception.Create('Malformed question: missing options');
  o1 := optsObj.GetValue('option_1').Value;
  o2 := optsObj.GetValue('option_2').Value;
  o3 := optsObj.GetValue('option_3').Value;

  options[0] := correctAnswer;
  options[1] := o1;
  options[2] := o2;
  options[3] := o3;

  // LEENKODE
  // Unbiased Fisher-Yates shuffle and track correct index
  CurrentCorrectIndex := 0; // correct at index 0 before shuffle
  for i := High(options) downto Low(options) + 1 do
  begin
    swapIdx := Random(i + 1); // 0..i
    if swapIdx <> i then
    begin
      tmp := options[i];
      options[i] := options[swapIdx];
      options[swapIdx] := tmp;
      if CurrentCorrectIndex = i then
        CurrentCorrectIndex := swapIdx
      else if CurrentCorrectIndex = swapIdx then
        CurrentCorrectIndex := i;
    end;
  end;
  // LEENKODE

  if Assigned(LblQuestion) then
    LblQuestion.Caption := 'What is the balanced form of this equation?' +
      sLineBreak + equation;

  if Assigned(RgpQuestion) then
  begin
    RgpQuestion.Items.BeginUpdate;
    try
      RgpQuestion.Items.Clear;
      for j := 0 to 3 do
        RgpQuestion.Items.Add(options[j]);
    finally
      RgpQuestion.Items.EndUpdate;
    end;
  end;
end;

procedure Flashcards_Init(const ALblQuestion: TLabel;
  const ARadioGroup: TRadioGroup; const ABtnMarkAnswer, ABtnNext: TButton;
  const ALblAnswer, ALblCorrectPercent: TLabel;
  const ATsFlashcards, ATsResults: TTabSheet);
begin
  LblQuestion := ALblQuestion;
  RgpQuestion := ARadioGroup;
  BtnMarkAnswer := ABtnMarkAnswer;
  BtnNext := ABtnNext;
  LblAnswer := ALblAnswer;
  LblCorrectPercent := ALblCorrectPercent;
  TsFlashcards := ATsFlashcards;
  TsResults := ATsResults;
end;

procedure Flashcards_SetShowOnly(const AProc: TShowOnlyProc);
begin
  ShowOnlyProc := AProc;
end;

procedure Flashcards_Start;
begin
  // Set counters
  question_number := 0;
  questions_correct := 0;
  ProcessMain;
end;

procedure Flashcards_MarkAnswer;
begin
  if not Assigned(RgpQuestion) then
    Exit;

  if RgpQuestion.ItemIndex = -1 then
  begin
    if Assigned(LblAnswer) then
    begin
      LblAnswer.Font.Size := 16;
      LblAnswer.Font.Color := clRed;
      LblAnswer.Caption := 'Please select an answer.';
      LblAnswer.Visible := True;
    end;
    Exit;
  end;

  if RgpQuestion.ItemIndex = CurrentCorrectIndex then
  begin
    Inc(questions_correct);
    if Assigned(LblAnswer) then
    begin
      LblAnswer.Font.Size := 24;
      LblAnswer.Font.Color := clGreen;
      LblAnswer.Caption := 'Well done! Your answer is correct!';
      LblAnswer.Visible := True;
    end;
    PlaySfx(CORRECT_SFX);
  end
  else
  begin
    if Assigned(LblAnswer) then
    begin
      LblAnswer.Font.Size := 24;
      LblAnswer.Font.Color := clRed;
      // Show the correct option text
      if Assigned(RgpQuestion) and (CurrentCorrectIndex >= 0) and
        (CurrentCorrectIndex < RgpQuestion.Items.Count) then
        LblAnswer.Caption := 'Incorrect! Correct answer: ' + RgpQuestion.Items
          [CurrentCorrectIndex]
      else
        LblAnswer.Caption := 'Incorrect!';
      LblAnswer.Visible := True;
    end;
    PlaySfx(WRONG_SFX);
  end;

  // After marking: hide submit, show next
  if Assigned(BtnMarkAnswer) then
    BtnMarkAnswer.Visible := False;
  if Assigned(BtnNext) then
    BtnNext.Visible := True;
end;

procedure Flashcards_NextQuestion;
begin
  Inc(question_number);
  ProcessMain;
end;

function GetQuestionNumber: Integer;
begin
  Result := question_number;
end;

function GetQuestionsCorrect: Integer;
begin
  Result := questions_correct;
end;

end.
// rossouw nel
