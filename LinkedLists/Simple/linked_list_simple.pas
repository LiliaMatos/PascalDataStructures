program LinkedListSimple;

const
  SIZE = 10;
{*Type definition for a node*}
type
  varInfo = integer;
  NodePointer = ^Node;
  Node = record
    Info: varInfo;
    Next: NodePointer;
  end;
{*Navigation*}
procedure PrintAll(head: NodePointer);
var
  nav: NodePointer;
begin
  nav := head;
  write('Linked list contains: ');
  while (nav^.Next <> nil) do
    begin
      write(nav^.Info,' ,');
      nav := nav^.Next;
    end;
    write(nav^.Info);
    writeln('');
end;

function SizeOfList(head: NodePointer):integer;
var 
  nav: NodePointer;
  count: integer;
begin
  nav := head;
  count := 0;
  while(nav <> nil) do
    begin
      nav := nav^.Next;
      count := count + 1;
    end;
  SizeOfList := count;
end;
{*Creation*}
function Init(value: integer; head: NodePointer):NodePointer;
begin
  head^.Info := value;
  head^.Next := nil;
  Init := head;
end;

function AddToStart(value: integer; head: NodePointer):NodePointer;
var
  aux: NodePointer;
begin
  new(aux);
  aux^.Info := value;
  aux^.Next := head;
  AddToStart := aux;
end;

procedure AddToEnd(value:integer; head: NodePointer);
var
  nav, aux: NodePointer;
begin
  nav := head;
  while (nav^.Next <> nil) do
    begin
      nav := nav^.Next;
    end;
  new(aux);
  aux^.Info := value;
  aux^.Next := nil;
  nav^.Next := aux; 
end;

procedure AddToX(X, value:integer; head: NodePointer);
var
  nav, aux, node: NodePointer;
  count: integer;
begin
  if (X > SizeOfList(head)) then
    begin
      writeln('AddToX: ', X, ' Out of range');
    end
  else if (X = 1) or (X = SizeOfList(head)) then
    begin
      writeln('Use AddToStart to add to head or tail');
    end
  else
    begin 
      nav := head;
      count := 1;
      while (count < X) do
        begin
          aux := nav;
          nav := nav^.Next;
          count := count + 1; 
        end;
      new(node);
      node^.Info := value;
      node^.Next := nav;
      aux^.Next := node; 
    end;
end;

{*Deletion*}
function RemoveStart(head: NodePointer):NodePointer;
begin
  RemoveStart := head^.Next; 
end;

procedure RemoveEnd(head: NodePointer);
var 
  nav, aux: NodePointer; 
begin
  nav := head;
  while(nav^.Next <> nil) do
    begin
      aux := nav;
      nav := nav^.Next;
    end;
  aux^.Next := nil; 
end;

procedure RemoveX(X:integer; head:NodePointer);
var
  nav, aux: NodePointer;
begin
  nav := head;
  while (nav^.Info <> X) do
    begin
      aux := nav;
      nav := nav^.Next;
    end;
  aux^.Next := nav^.Next;
end;


{*Main*}
var
  head: NodePointer;
  index: integer;
begin
  new(head);
  head := Init(1, head);
  write('Init(1, head): '); 
  PrintAll(head);
  writeln('');
  for index := 2 to SIZE do
    AddToEnd(index, head);
  write('AddToEnd(2-10, head): ');
  PrintAll(head);
  writeln('');
  head := AddToStart(0, head); 
  write('AddToStart(0, head): ');
  PrintAll(head);
  writeln('');
  AddToX(5, 100, head);
  write('AddToX(5, 100, head): ');
  PrintAll(head);
  writeln('');
  head := RemoveStart(head);
  write('RemoveStart(head): ');
  PrintAll(head);
  writeln('');
  RemoveEnd(head);
  write('RemoveEnd(head)');
  PrintAll(head);
  writeln('');
  RemoveX(100, head);
  write('RemoveX(100, head)');
  PrintAll(head);
  writeln('');
end.
