program LinkedListDouble;

type
  varInfo = integer;
  NodePointer = ^Node;
  Node = record
    Info: varInfo;
    Next: NodePointer;
    Prev: NodePointer;
  end;

  {*Init, PrintAllForwards, PrintAllBackWards, AddToStart, AddToEnd, AddToXForward, AddToXBackward, AddBetween, RemoveStart, RemoveEnd, RemoveX*}
function Init(value:integer; node: NodePointer):NodePointer;
begin
  new(node);
  node^.Info := value;
  node^.Prev := nil;
  node^.Next := nil;
  Init := node; 
end;

var
  head: NodePointer;
  index: integer;
begin
  head := Init(1, head);
  writeln(head^.Info);
end.
