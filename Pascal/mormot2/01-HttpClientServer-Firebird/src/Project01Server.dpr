{:
Synopse mORMot framework 2

Sample 02 - Http Client Server ORM
purpose of this sample is to show the basic ORM usage of the framework using
external database Firebird.
}
program Project01Server;

{$I mormot.defines.inc}

{$ifdef OSWINDOWS}
  {$apptype console}
  {../../src/$R mormot.win.default.manifest.res}
{$endif OSWINDOWS}

uses
  {$I mormot.uses.inc}
  SysUtils,
  mormot.core.os,
  mormot.core.log,
  mormot.orm.core,
  mormot.orm.base,
  mormot.orm.sql,
  mormot.db.core,
  mormot.db.raw.sqlite3,
  mormot.db.raw.sqlite3.static,
  mormot.db.sql,
  mormot.db.sql.zeos,
  mormot.rest.sqlite3,
  mormot.rest.http.server,
  model in 'model.pas';

var
  ExternalModel: TOrmModel;
  Server: TRestServerDB;
  HttpServer: TRestHttpServer;
  LogFamily: TSynLogFamily;
  Props : TSqlDBZeosConnectionProperties;

const
  // !! download driver from http://www.firebirdsql.org/en/odbc-driver
  FIREBIRDEMBEDDEDDLL = 'C:\Firebird\fbclient.dll';

{$R *.res}

begin
  LogFamily := TSynLog.Family;
  LogFamily.Level := LOG_VERBOSE;
  LogFamily.NoFile := true;
  LogFamily.EchoToConsole := LOG_VERBOSE;

  if not FileExists(FIREBIRDEMBEDDEDDLL) then
  begin
    DisplayFatalError('firebird setup', 'Cannot find `fbclient.dll`');
    Exit;
  end;

  // use Firebird-4 over TCP server via Zeos
  //  Props := TSqlDBZeosConnectionProperties.Create(
  //    'zdbc:firebird://localhost:3050/'+ExtractPath(ParamStr(0))+'\ormpirate.fdb?'+
  //    'username=SYSDBA;'+
  //    'password=masterkey;'+
  //    'LibLocation='+FIREBIRDEMBEDDEDDLL+';'+
  //    'hard_commit=true', '', '', '' );
  // ---
  // use Firebird-4 embedded engine via Zeos/ZDBC

  Props := TSqlDBZeosConnectionProperties.Create(
    TSqlDBZeosConnectionProperties.URI(dFirebird, '',
      FIREBIRDEMBEDDEDDLL, False), 'ormnotes.fdb', '', ''
  );

  // create model
  ExternalModel := CreateSampleModel;
  // map orm tables
  OrmMapExternal(ExternalModel, TOrmNote, Props, 'ormnote');
  // create memory server
  Server := TRestServerDB.Create(ExternalModel, SQLITE_MEMORY_DATABASE_NAME);
  // create SQlite3 virtual tables, no default users
  Server.CreateMissingTables;
  try
    HttpServer := TRestHttpServer.Create(HttpPort, [Server], '+', HTTP_DEFAULT_MODE, 4);
    try
      Writeln('Server started on port ' + HttpPort);
      Readln;
    finally
      HttpServer.Free;
    end;
  finally
    Server.Free;
    ExternalModel.Free;
  end;
end.
