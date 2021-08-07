unit DAVLib.Types;

interface

uses
  System.SysUtils, System.Types, DAVLib.ComplexType;

type
  EDAVLibTypesError = class(Exception);
  EVectorError = class(EDAVLibTypesError);
  EComplexVectorError = class(EVectorError);
  EMatrixError = class(EVectorError);
  EComplexMatrixError = class(EMatrixError);
  TEleventProc<T> = procedure(var Value: T);

  // Vector
  TIntegerDynArray = System.Types.TIntegerDynArray;
  TCardinalDynArray = System.Types.TCardinalDynArray;
  TWordDynArray = System.Types.TWordDynArray;
  TSmallIntDynArray = System.Types.TSmallIntDynArray;
  TByteDynArray = System.Types.TByteDynArray;
  TShortIntDynArray = System.Types.TShortIntDynArray;
  TInt64DynArray = System.Types.TInt64DynArray;
  TLongWordDynArray = System.Types.TLongWordDynArray;
  TSingleDynArray = System.Types.TSingleDynArray;
  TDoubleDynArray = System.Types.TDoubleDynArray;
  TExtendedDynArray = array of Extended;
  TBooleanDynArray = System.Types.TBooleanDynArray;
  TStringDynArray = System.Types.TStringDynArray;
  TWideStringDynArray = System.Types.TWideStringDynArray;
  PDoubleDynArray = TArray<PDouble>;
  PSingleDynArray = TArray<PSingle>;
  PExtendedDynArray = TArray<PExtended>;
  PIntegerDynArray = TArray<PInteger>;
  // Complex vector
  TDComplexDynArray = TArray<TDComplex>;
  PDComplexDynArray = TArray<PDComplex>;
  TSComplexDynArray = TArray<TSComplex>;
  PSComplexDynArray = TArray<PSComplex>;
  TEComplexDynArray = TArray<TEComplex>;
  PEComplexDynArray = TArray<PEComplex>;

  // Matrix
  TIntegerDynMatrix = TArray<TIntegerDynArray>;
  TCardinalDynMatrix = TArray<TCardinalDynArray>;
  TWordDynMatrix = TArray<TWordDynArray>;
  TSmallIntDynMatrix = TArray<TSmallIntDynArray>;
  TByteDynMatrix = TArray<TByteDynArray>;
  TShortIntDynMatrix = TArray<TShortIntDynArray>;
  TInt64DynMatrix = TArray<TInt64DynArray>;
  TLongWordDynMatrix = TArray<TLongWordDynArray>;
  TSingleDynMatrix = TArray<TSingleDynArray>;
  TDoubleDynMatrix = TArray<TDoubleDynArray>;
  TExtendedDynMatrix = TArray<TExtendedDynArray>;
  TBooleanDynMatrix = TArray<TBooleanDynArray>;
  TStringDynMatrix = TArray<TStringDynArray>;
  TWideStringDynMatrix = TArray<TWideStringDynArray>;
  // Complex matrix
  TDComplexDynMatrix = TArray<TDComplexDynArray>;
  PDComplexDynMatrix = TArray<PDComplexDynArray>;
  TSComplexDynMatrix = TArray<TSComplexDynArray>;
  PSComplexDynMatrix = TArray<PSComplexDynArray>;
  TEComplexDynMatrix = TArray<TEComplexDynArray>;
  PEComplexDynMatrix = TArray<PEComplexDynArray>;

  procedure NeedSameLength(const ALength1, ALength2: Integer);
  procedure NeedSameDimension(const ARowCount1, ARowCount2, AColCount1, AColCount2: Integer);
  procedure MustBeInRange(const AValue, AMin, AMax: Integer);

  const
    VectorItemDelimiter = ' ';
    MatrixVectorDelimiter = ';';
    UnexpectedSymbolsInMatrixOrVectors: array of Char = //
      ['(', ')', '[', ']', #10, #13];

implementation

uses
  System.Math;

procedure NeedSameLength(const ALength1, ALength2: Integer);
begin
  if ALength1 = ALength2 then
    Exit;
  raise EVectorError.Create('Array must have same length');
end;

procedure NeedSameDimension(const ARowCount1, ARowCount2, AColCount1, AColCount2: Integer);
begin
  if (ARowCount1 = ARowCount2) and (AColCount1 = AColCount2) then
    Exit;
  raise EMatrixError.Create('Matrix dimention must be agree');
end;

procedure MustBeInRange(const AValue, AMin, AMax: Integer);
begin
   if not InRange(AValue, AMin, AMax) then
    raise EDAVLibTypesError.Create('Index not in range[' + AMin.ToString + '..' + AMax.ToString + ']');
end;

end.
