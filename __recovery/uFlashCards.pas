unit uFlashCards;

interface

implementation



procedure TForm4.btnMarkAnswerClick(Sender: TObject);
begin
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

end.
