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

  
