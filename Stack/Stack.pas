program Stack;

const
  SIZE = 10;

{*Stack definition*}
type
  StackPointer = ^Stack;
  Stack = record
    arr: array[1..SIZE] of integer;
    top: integer;
  end;

{*Init, IsFull, IsEmpty, Push, Pop, IsXIn*}





var
  S: StackPointer;
begin

end.
