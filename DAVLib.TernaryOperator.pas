unit DAVLib.TernaryOperator;

interface

type
  TTernaryOp<T> = class
    class function IfThen(AValue: Boolean; const ATrue, AFalse: T): T;
  end;

implementation

{ TTernaryOp<T> }

class function TTernaryOp<T>.IfThen(AValue: Boolean; const ATrue, AFalse: T): T;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

end.

