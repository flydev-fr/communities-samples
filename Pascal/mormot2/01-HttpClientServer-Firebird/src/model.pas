unit model;

interface

{$I mormot.defines.inc}
uses
  mormot.core.base,
  mormot.orm.base,
  mormot.orm.core;

const
  HttpPort = '8888'
                   ;
type
  TOrmNote = class(TOrm)
  private
    FTitle: RawUTF8;
    FContent: RawUTF8;
    FCreateTime: TCreateTime;
    FModTime: TModTime;
  published
    property Title: RawUTF8 read FTitle write FTitle;
    property Content: RawUTF8 read FContent write FContent;
    property CreatedAt: TCreateTime read FCreateTime write FCreateTime;
    property LastChange: TModTime read FModTime write FModTime;
  end;
  TOrmNoteObjArray = array of TOrmNote;
  POrmNote = ^TOrmNote;

  function CreateSampleModel: TOrmModel;

implementation

function CreateSampleModel: TOrmModel;
begin
  TOrmNote.AddFilterNotVoidText(['Title', 'Content']);
  result := TOrmModel.Create([TOrmNote]);
end;

end.
