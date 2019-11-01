program BinarySearchTree;

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
      if (value < head^.Info) then
        node^.Left := AddNode(value, node^.Left);
      else
        node^.Right := AddNode(value, node^.Right);
      AddNode := node; 
    end;
end;

function CountNodes(node:BSTPointer):integer;
begin
  if not(node) then
    begin
      CountNodes := 0;
    end
  else if not(node^.Left) and not(node^.Right) then
    begin
      CountNodes := 1;
    end
  else if not(node^.Left) then
    begin
      CountNodes := CountNodes(node^.Right) + 1;
    end
  else if not(node^.Right) then
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
  if not(node) then
    begin
      CountEvenNodes := 0;
    end
  else if not(node^.Left) and not(node^.Right) then
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
  else if not(node^.Left) then
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
  else if not(node^.Right) then
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
  if not(node) then
    begin
      CountOddNodes := 0;
    end
  else if not(node^.Left) and not(node^.Right) then
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
  else if not(node^.Left) then
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
  else if not(node^.Right) then
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

function BinarySearch(value:integer; node: BSTPointer):boolean;
