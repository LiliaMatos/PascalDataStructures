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

procedure AddToEnd(value:integer; head:NodePointer);
var
  nav, aux: NodePointer;
begin
  nav := head;
  while(nav^.Next <> nil) do
    begin
      nav := nav^.Next;
    end;
  new(aux);
  aux := Init(value, aux);
  aux^.Prev := nav;
  nav^.Next := aux;
end;

procedure PrintAllForwards(head:NodePointer);
var
  nav: NodePointer;
begin
  nav := head;
  write('List: ');
  while(nav^.Next <> nil) do
    begin
      write(nav^.Info, ', ' );
      nav := nav^.Next;
    end;
  writeln(nav^.Info);

end;

var
  head: NodePointer;
  index: integer;
begin
  writeln('Init(1, head): ');
  new(head);
  head := Init(1, head);
  writeln('Info: ', head^.Info);

  writeln('AddToEnd(2-10, head)');
  for index := 2 to 10 do 
    AddToEnd(index, head); 
  PrintAllForwards(head);
end.

