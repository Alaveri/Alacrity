unit Lexer;

interface

const
  MaxCommands = 13;
  TReserved: array[1..MaxCommands] of string =
  (
    'command',
    'function',
    'if',
    'then',
    'else',
    'begin',
    'end',
    'while',
    'repeat',
    'until',
    'type',
    'const',
    'var'
  );

type
  PLexer = ^TLexer;
  TLexer = object(TObject)
    procedure Init; virtual;
    function ProcessStatement(statement: TWideString): string;
  end;

implementation

uses
  Objects,
  Utils,
  WideStr,
  Crt;

function TLexer.ProcessStatement(statement: TWideString): string;
var
  statementPos: integer;
  ch: char;
begin
  statementPos := 0;
  while (statementPos < statement.Len) do
  begin
    ch := statement.GetChar(statementPos);
    Inc(statementPos);
  end;
end;

procedure TLexer.Init;
begin
  TObject.Init;
  TypeName := 'TLexer';
end;

end.