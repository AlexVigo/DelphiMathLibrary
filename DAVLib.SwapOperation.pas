unit DAVLib.SwapOperation;

interface

type
  TSwapOp<T> = class
    class procedure Swap(var AValue1, AValue2: T);
  end;

implementation

{ TSwapOp<T> }

class procedure TSwapOp<T>.Swap(var AValue1, AValue2: T);
 var LTemp:T;
begin
  LTemp := AValue1;
  AValue1 := AValue2;
  AValue2 := LTemp;
end;

end.
