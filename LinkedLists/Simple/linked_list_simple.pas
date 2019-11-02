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
{*Edition*}
{*Deletion*}
{*Utils*}
{*Main*}
var
  head, next: NodePointer;
  index: integer;
begin
  new(head);
  for index := 1 to SIZE do
    AddToEnd(head);
  PrintAll(head);

  

end.
