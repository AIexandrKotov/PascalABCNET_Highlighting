program HighlightingTest;

{$product 'HighlightingTest'} {$apptype console} {$platformtarget x64}

type
  IHighlighting = interface end;
  
  THighlightingstruct = record(IHighlighting) end;
  
  THighlighting = abstract class(IHighlighting) end;
  
  TA = sealed class(THighlighting)
    internal procedure Void() := exit;
    internal function Func(); virtual := 1;
    public function ToString(): string; override := $'Format string supported = {boolean.TrueString} but not integers like {2 * 2}';
    public event E: Action0;
  end;
  
  TB = auto class
    private field := 1;
    protected property Prop: integer read field write field := value;
    public function ContextWords: object;
    begin
      var value := 1;
      Result := self;
    end;
  end;

{$ifdef DEBUG} {$else} {$endif}
{$region TTT} {$endregion}

procedure Print(self: object); extensionmethod := Write(self);

function CreateSeq<T>(params a: array of T): IEnumerable<T>;
begin
  yield sequence a;
end;

begin
  while false do;
  if true then;
  loop 1 do;
  repeat until true;
  for var i := 0 to -1 do;
  foreach var x in Arr(1, 2, 3) do;
  
  var i := default(integer);
  var j := new TA();
  
  if true and false or true xor false then;
  try
    raise new Exception();
  except on e: Exception do
  end;
  
  var vv := new class(a := 1);
  
  var a := nil as object;
end.