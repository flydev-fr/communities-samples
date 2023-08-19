{:
Synopse mORMot framework v2

- This sample show how to use Firebird as External Database.

// Inspired from Martin Doyle sample 02
}
program Project01Client;

{$I mormot.defines.inc}
uses
  {$I mormot.uses.inc}
  {$ifdef FPC}
  Interfaces,
  {$endif FPC}
  Forms,
  main in 'main.pas' {MainForm},
  model in 'model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.





