program LinkedList;
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
{*Edition*}
{*Deletion*}
{*Utils*}
{*Main*}
var
  head: NodePointer;
  index: integer;
begin
  new(head);
  head := Init(1, head);
  for index := 2 to SIZE do
    AddToEnd(index, head);
  head := AddToStart(0, head);

  PrintAll(head);

  

end.
