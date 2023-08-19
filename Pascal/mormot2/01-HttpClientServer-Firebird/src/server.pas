unit server;

interface

{$I mormot.defines.inc}
uses
  mormot.core.base,
  mormot.orm.core,
  mormot.rest.memserver,
  mormot.db.raw.sqlite3.static;

type
  TSampleServer = class(TRestServerFullMemory)
  end;

implementation


end.
