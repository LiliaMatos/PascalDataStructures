program Stack;

const
  SIZE = 10;

{*Stack definition*}
type
  StackPointer = ^Stack_;
  Stack_ = record
    arr: array[1..SIZE] of integer;
    top: integer;
end;

{*Init, IsFull, IsEmpty, Push, Pop, , Top?, IsXIn, SizeOf*}
function Init(stack:StackPointer):StackPointer;
begin
  stack^.top := 0;
  Init := stack;
end;

function IsFull(stack:StackPointer):boolean;
begin
  if(stack^.Top = SIZE) then
    begin
      IsFull := true;
    end
  else
    begin
      IsFull := false;
    end;
end;

function IsEmpty(stack:StackPointer):boolean;
begin
  if(stack^.Top = 0) then
    begin
      IsEmpty := true;
    end
  else
    begin
      IsEmpty := false;
    end;
end;

function SizeOfStack(stack:StackPointer):integer;
begin
  SizeOfStack := stack^.top;
end;

function Top(stack:StackPointer):integer;
begin
  Top :=  stack^.arr[stack^.top];
end;

procedure Push(value:integer; stack:StackPointer);
begin
  if (IsFull(stack)) then
    begin
      writeln('Stack is full!');
    end
  else
    begin
      stack^.top := stack^.top + 1;
      stack^.arr[stack^.top] := value;
    end;
end;

function Pop(stack:StackPointer):integer;
begin
  if (IsEmpty(stack)) then
    begin
      writeln('Stack is empty!');
    end
  else 
    begin
      Pop := stack^.arr[stack^.top];
      stack^.top := stack^.top - 1;
    end;
end;

{*Main*}
var
  S: StackPointer;
  i: integer;
begin
  new(S);
  S := Init(S);
  for i := 1 to 10 do
    begin
      writeln('Push(i, S) ', i, ' to stack');
      Push(i, S);
    end;
  writeln('');
  writeln('Try to Push(11, S) to a Full Stack: ');
  Push(11, S);
  writeln('');
  writeln('The top of the stack has: ', Top(S));
  writeln('');
  writeln('The size of the stack is: ', SizeOfStack(S));
  writeln('');
  for i := 1 to 10 do
    begin
      writeln('Pop(S) ', Pop(S), ' From Stack'); 
      writeln('The size of the stack is: ', SizeOfStack(S));
    end;
  writeln('Try to Pop(S) an Empty Stack: ');
  Pop(S);
end.
