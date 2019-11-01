program BinarySearchTree;

const 
  SIZE = 100;

{*Type Definition*}
type
  {*Information to be stored*}
  varData = integer;
  {*BST = Binary Search Tree*}
  BSTPointer = ^BST;
  BST = record
    Info: varData;
    Left: BSTPointer;
    Right: BSTPointer;
  end;

function AddNode(value:integer; node:BSTPointer):BSTPointer;
var
  aux: BSTPointer;
begin
  if (node = nil) then
    begin
      new(aux);
      aux^.Info := value;
      aux^.Left := nil;
      aux^.Right := nil;
      AddNode := aux;
    end
  else
    begin
      if (value < node^.Info) then
        begin
          node^.Left := AddNode(value, node^.Left);
        end
      else
        begin
          node^.Right := AddNode(value, node^.Right);
        end;

      AddNode := node; 
    end;
end;

function CountNodes(node:BSTPointer):integer;
begin
  if (node = nil) then
    begin
      CountNodes := 0;
    end
  else if (node^.Left = nil) and (node^.Right = nil) then
    begin
      CountNodes := 1;
    end
  else if (node^.Left = nil) then
    begin
      CountNodes := CountNodes(node^.Right) + 1;
    end
  else if (node^.Right = nil) then
    begin
      CountNodes := CountNodes(node^.Left) + 1; 
    end
  else
    begin
      CountNodes := CountNodes(node^.Left) + CountNodes(node^.Right) + 1; 
    end; 
end;

function CountEvenNodes(node:BSTPointer):integer;
begin
  if (node = nil) then
    begin
      CountEvenNodes := 0;
    end
  else if (node^.Left = nil) and (node^.Right = nil) then
    begin
      if (node^.Info mod 2 = 0) then
        begin
          CountEvenNodes := 1;
        end
      else
        begin
          CountEvenNodes := 0; 
        end;
    end
  else if (node^.Left = nil) then
    begin
      if (node^.Info mod 2 = 0) then
        begin
          CountEvenNodes := CountEvenNodes(node^.Right) + 1;
        end
      else
        begin
          CountEvenNodes := CountEvenNodes(node^.Right); 
        end;
    end
  else if (node^.Right = nil) then
    begin
      if (node^.Info mod 2 = 0) then
        begin
          CountEvenNodes := CountEvenNodes(node^.Left) + 1;
        end
      else
        begin
          CountEvenNodes := CountEvenNodes(node^.Left); 
        end;
    end
  else
    begin
      if (node^.Info mod 2 = 0) then
        begin
          CountEvenNodes := CountEvenNodes(node^.Left) + CountEvenNodes(node^.Right) + 1; 
        end
      else 
        begin
          CountEvenNodes := CountEvenNodes(node^.Left) + CountEvenNodes(node^.Right); 
        end;
    end; 
end;

function CountOddNodes(node:BSTPointer):integer;
begin
  if (node = nil) then
    begin
      CountOddNodes := 0;
    end
  else if (node^.Left = nil) and (node^.Right = nil) then
    begin
      if (node^.Info mod 2 <> 0) then
        begin
          CountOddNodes := 1;
        end
      else
        begin
          CountOddNodes := 0; 
        end;
    end
  else if (node^.Left = nil) then
    begin
      if (node^.Info mod 2 <> 0) then
        begin
          CountOddNodes := CountOddNodes(node^.Right) + 1;
        end
      else
        begin
          CountOddNodes := CountOddNodes(node^.Right); 
        end;
    end
  else if (node^.Right = nil) then
    begin
      if (node^.Info mod 2 <> 0) then
        begin
          CountOddNodes := CountOddNodes(node^.Left) + 1;
        end
      else
        begin
          CountOddNodes := CountOddNodes(node^.Left); 
        end;
    end
  else
    begin
      if (node^.Info mod 2 <> 0) then
        begin
          CountOddNodes := CountOddNodes(node^.Left) + CountOddNodes(node^.Right) + 1; 
        end
      else 
        begin
          CountOddNodes := CountOddNodes(node^.Left) + CountOddNodes(node^.Right); 
        end;
    end; 
end;

function ArrayToBST(vector:array; node:BSTPointer):BSTPointer;
var
  index: integer;
begin

end;

function BinarySearch(value:integer; node: BSTPointer):boolean;
begin
  if (node = nil) then
    begin
      BinarySearch := false;
    end
  else
    begin
      if (node^.Info = value) then
        begin
          BinarySearch := true;
        end
      else if (value < node^.Info) then
        begin
          BinarySearch := BinarySearch(value, node^.Left);
        end
      else
        begin
          BinarySearch := BinarySearch(value, node^.Right);
        end; 
    end;
end;

var
  root: BSTPointer;
  list: array[1..SIZE] of integer;
  index: integer;
begin
  Randomize;
  new(root);
  root := nil;
  {*Creates a random list to transform into a binary tree*}
  for index := 1 to SIZE do
    list[index] := Random(100);

  {*Prints the randomized vector*}
  write('[', list[1]); 
  for index :=2 to SIZE do
    begin
      write(' ,', list[index]);
    end; 
  write(']');



end.
