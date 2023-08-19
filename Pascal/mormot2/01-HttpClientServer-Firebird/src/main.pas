unit main;

interface

{$I mormot.defines.inc}
uses
  {$I mormot.uses.inc}
  {$ifdef OSWINDOWS}
  Windows,
  {$endif OSWINDOWS}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  mormot.core.base,
  mormot.core.unicode,
  mormot.rest.memserver,
  mormot.orm.core,
  mormot.db.sql.zeos,
  mormot.rest.http.client,
  mormot.core.datetime,
  mormot.core.text,
  //
  model;

type
  TMainForm = class(TForm)
    ButtonAdd: TButton;
    ButtonFind: TButton;
    ButtonQuit: TButton;
    LabelEdit: TLabel;
    TitleEdit: TEdit;
    ContentMemo: TMemo;
    LabelTime: TLabel;
    ButtonDelete: TButton;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonFindClick(Sender: TObject);
    procedure ButtonQuitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
  public
    fHttpClient  : TRestHttpClient;
    fExternalModel: TOrmModel;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{
********************************** TMainForm ***********************************
}
procedure TMainForm.ButtonAddClick(Sender: TObject);
var
  title: RawUtf8;
  Rec: TOrmNote;
begin
  Rec := TOrmNote.Create;
  try
    title := StringToUTF8(TitleEdit.Text);
    fHttpClient.Orm.Retrieve('Title=?', [], [title], Rec);
    Rec.Title := title;
    Rec.Content := StringToUTF8(ContentMemo.Text);
    if fHttpClient.Orm.AddOrUpdate(Rec) = 0 then
      ShowMessage('Error adding data') else
    begin
      TitleEdit.Text := '';
      ContentMemo.Text := '';
      TitleEdit.SetFocus;
    end;
  finally
    Rec.Free;
  end;
end;

procedure TMainForm.ButtonFindClick(Sender: TObject);
var
  Rec: TOrmNote;
  created, changed: RawUtf8;
begin
  Rec := TOrmNote.Create(fHttpClient.Orm, 'Title=?',
    [StringToUTF8(TitleEdit.Text)]);
  try
    if Rec.ID=0 then
    begin
      ContentMemo.Text := 'Not found';
      LabelTime.Caption := '';
      ButtonDelete.Enabled := false;
    end else
    begin
      ButtonDelete.Enabled := true;
      ContentMemo.Text := UTF8ToString(Rec.Content);
      if Rec.LastChange > Rec.CreatedAt  then
        changed := FormatUtf8(', updated: %',
          [DateTimeToStr(TimeLogToDateTime(Rec.LastChange))]);
      LabelTime.Caption := FormatUtf8('Added %%', [
        DateTimeToStr(TimeLogToDateTime(Rec.CreatedAt)), changed]);
    end;
  finally
    Rec.Free;
  end;
end;

procedure TMainForm.ButtonDeleteClick(Sender: TObject);
var
  title: RawUtf8;
begin
  title := StringToUTF8(TitleEdit.Text);
  if title = '' then
    Exit;

  if fHttpClient.Orm.Delete(TOrmNote, 'Title=?', [title]) then
  begin
    ButtonDelete.Enabled := false;
    TitleEdit.Text := '';
    ContentMemo.Lines.Clear;
    LabelTime.Caption := '';
  end;
end;

procedure TMainForm.ButtonQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ButtonDelete.Enabled := false;

  fExternalModel := CreateSampleModel;
  fHttpClient := TRestHttpClient.Create('127.0.0.1', HttpPort, fExternalModel);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  fExternalModel.Free;
  fHttpClient.Free;
end;

end.






