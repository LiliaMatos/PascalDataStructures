program LinkedListDouble;

type
  varInfo = integer;
  NodePointer = ^Node;
  Node = record
    Info: varInfo;
    Next: NodePointer;
    Prev: NodePointer;
  end;

function Init(value:integer; node: NodePointer):NodePointer;
begin
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

function AddToStart(value:integer; head:NodePointer):NodePointer;
var 
  nav, aux: NodePointer;
begin
  nav := head;
  new(aux);
  aux := Init(value, aux);
  aux^.Next := nav;
  nav^.Prev := aux;
  AddToStart := aux;
end;

procedure AddToX(X, value: integer; head: NodePointer);
var
  nav, aux, node: NodePointer;
  count: integer;
begin
  nav := head;
  count := 1; 
  while(count < X) do
    begin
      aux := nav;
      nav := nav^.Next;
      count := count + 1;
    end;
  new(node);
  node := Init(value, node);
  aux^.Next := node;
  nav^.Prev := node;
  node^.Next := nav;
  node^.Prev := aux;
end;

function RemoveStart(head: NodePointer):NodePointer;
var 
  nav: NodePointer;
begin
  nav := head;
  nav := nav^.Next;
  nav^.Prev := nil;
  RemoveStart := nav;
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

procedure RemoveX(X: integer; head: NodePointer);
var
  nav, aux: NodePointer;
begin
  nav := head;
  while(nav^.Info <> X) do
    begin
      aux := nav;
      nav := nav^.Next;
    end;
  nav := nav^.Next;
  aux^.Next := nav;
  nav^.Prev := aux; 
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

procedure PrintAllBackWards(head:NodePointer);
var
  nav: NodePointer;
begin
  nav := head;
  while(nav^.Next <> nil) do
    nav := nav^.Next;
  
  write('Reverse List: ');
  while(nav^.Prev <> nil) do
    begin
      write(nav^.Info, ', ' );
      nav := nav^.Prev;
    end;
  writeln(nav^.Info); 
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

  writeln('AddToStart(0, head)');
  head := AddToStart(0, head);
  PrintAllForwards(head);

  writeln('AddToX(5, 1000, head)');
  AddToX(5, 1000, head);
  PrintAllForwards(head);

  writeln('Write reverse list: ');
  PrintAllBackWards(head);

  writeln('RemoveStart(head)');
  head := RemoveStart(head);
  PrintAllForwards(head);

  writeln('RemoveEnd(head)');
  RemoveEnd(head);
  PrintAllForwards(head);

  writeln('RemoveX(1000, head)');
  RemoveX(1000, head);
  PrintAllForwards(head);

  writeln('SizeOfList(head)');
  writeln('Size of head: ', SizeOfList(head));
end.

