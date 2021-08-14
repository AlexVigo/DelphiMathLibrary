unit DAVLib.ComplexVectorTypesHelper;

interface

uses
  DAVLib.ComplexType, DAVLib.Types, System.SysUtils, DAVLib.SimpleTypesHelper,
  DAVLib.VectorTypesHelper;

type
  TDComplexDynArrayHelper = record helper for TDComplexDynArray
  private
    function GetLength: Integer;
    function GetMaxValue: TDComplex;
    function GetMaxIndex: Integer;
    function GetMinValue: TDComplex;
    function GetMinIndex: Integer;
    function GetNorm: TDComplex;
    function GetSize: Integer;
    procedure SetLength(const AValue: Integer);
    function GetItem(const AIndex: Integer): TDComplex;
    procedure SetItem(const AIndex: Integer; const AValue: TDComplex);
    function GetDeviation: TDComplex;
    function GetMean: TDComplex;
    function GetSum: TDComplex;
    function GetVariance: TDComplex;
    function GetPItem(const AIndex: Integer): PDComplex;
  public
    function MaxItem(var AIndex: Integer): TDComplex;
    function MinItem(var AIndex: Integer): TDComplex;
    constructor Create(const ALength: Integer); overload;
    constructor Create(const AVectorStr: string); overload;
    constructor Create(const AStart, AEnd: Integer; const AStep: Integer = 1); overload;
    constructor Ones(const ALength: Integer);
    constructor Create(const AVector: TDComplexDynArray); overload;
    constructor Base(const ALength, ANumber: Integer);
    procedure Assign(const ASource: TDComplexDynArray);
    procedure AssignTo(const ADest: TDComplexDynArray);
    function Low: Integer;
    function High: Integer;
    procedure Zero;
    procedure Fill(const AValue: TDComplex);
    procedure Multiply(const AValue: TDComplex); overload;
    procedure Multiply(const AVector: TDComplexDynArray); overload;
    procedure Add(const AValue: TDComplex); overload;
    procedure Add(const AVector: TDComplexDynArray); overload;
    procedure Divide(const AValue: TDComplex); overload;
    procedure Divide(const AVector: TDComplexDynArray); overload;
    procedure Subtract(const AValue: TDComplex); overload;
    procedure Subtract(const AVector: TDComplexDynArray); overload;
    function ForEach(const AProc: TEleventProc<TDComplex>): TDComplexDynArray;
    procedure Apply(const AProc: TEleventProc<TDComplex>);
    procedure Normalize;
    function Normalized: TDComplexDynArray;
    procedure MakeUnitVector;
    function AsUnitVector: TDComplexDynArray;
    function First(): TDComplex;
    function Last(): TDComplex;
    procedure Resize(const ALength: Integer; const ASaveData: Boolean = true);
    property Item[const AIndex: Integer]: TDComplex read GetItem write SetItem;
    property PItem[const AIndex: Integer]: PDComplex read GetPItem;
    property Length: Integer read GetLength write SetLength;
    property Size: Integer read GetSize;
    property Norm: TDComplex read GetNorm;
    property Sum: TDComplex read GetSum;
    property Mean: TDComplex read GetMean;
    property Variance: TDComplex read GetVariance;
    property Deviation: TDComplex read GetDeviation;
    property MaxValue: TDComplex read GetMaxValue;
    property MinValue: TDComplex read GetMinValue;
    property MaxIndex: Integer read GetMaxIndex;
    property MinIndex: Integer read GetMinIndex;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Inverse: TDComplexDynArray;
    function Prod: TDComplex;
    function ReverseArray: TDComplexDynArray;
    function DeleteIndexes(const AIndexes: TIntegerDynArray): TDComplexDynArray;
    procedure Sort; overload;
    procedure Sort(var AIndexes: TIntegerDynArray); overload;
    procedure SortWithOrder(const AOrderIndexes: TIntegerDynArray);
    function Negative: TDComplexDynArray;
    function Equal(const AVector: TDComplexDynArray): Boolean; overload;
    function NotEqual(const AVector: TDComplexDynArray): Boolean; overload;
    function Equal(const AValue: TDComplex): Boolean; overload;
    function NotEqual(const AValue: TDComplex): Boolean; overload;
    function IsNaNArray: TBooleanDynArray;
    function IsInfinityArray: TBooleanDynArray;
    function IsNegativeInfinityArray: TBooleanDynArray;
    function IsPositiveInfinityArray: TBooleanDynArray;
    function FiniteValues: TDComplexDynArray;
    function DeleteValues(const AStates: TBooleanDynArray): TDComplexDynArray;
    function ToString: string; overload;
    function _ToString(const ASeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    constructor Create(const AVectorRe, AVectorIm: TDoubleDynArray); overload;
    constructor Create(const AVector: TDoubleDynArray); overload;
    function Real: TDoubleDynArray;
    function Imag: TDoubleDynArray;
    procedure ClearReal;
    procedure ClearImag;
    procedure Conjugate();
    procedure i1();
    function SqrAbs: TDoubleDynArray;
    function Magnitude: TDoubleDynArray;
    function Angle: TDoubleDynArray;
    class function Parse(const AVectorStr: string): TDComplexDynArray; static;
  end;

  TSComplexDynArrayHelper = record helper for TSComplexDynArray
  private
    function GetLength: Integer;
    function GetMaxValue: TSComplex;
    function GetMaxIndex: Integer;
    function GetMinValue: TSComplex;
    function GetMinIndex: Integer;
    function GetNorm: TSComplex;
    function GetSize: Integer;
    procedure SetLength(const AValue: Integer);
    function GetItem(const AIndex: Integer): TSComplex;
    procedure SetItem(const AIndex: Integer; const AValue: TSComplex);
    function GetDeviation: TSComplex;
    function GetMean: TSComplex;
    function GetSum: TSComplex;
    function GetVariance: TSComplex;
    function GetPItem(const AIndex: Integer): PSComplex;
  public
    function MaxItem(var AIndex: Integer): TSComplex;
    function MinItem(var AIndex: Integer): TSComplex;
    constructor Create(const ALength: Integer); overload;
    constructor Create(const AStart, AEnd: Integer; const AStep: Integer = 1); overload;
    constructor Create(const AVectorStr: string); overload;
    constructor Ones(const ALength: Integer);
    constructor Create(const AVector: TSComplexDynArray); overload;
    constructor Base(const ALength, ANumber: Integer);
    procedure Assign(const ASource: TSComplexDynArray);
    procedure AssignTo(const ADest: TSComplexDynArray);
    function Low: Integer;
    function High: Integer;
    procedure Zero;
    procedure Fill(const AValue: TSComplex);
    procedure Multiply(const AValue: TSComplex); overload;
    procedure Multiply(const AVector: TSComplexDynArray); overload;
    procedure Add(const AValue: TSComplex); overload;
    procedure Add(const AVector: TSComplexDynArray); overload;
    procedure Divide(const AValue: TSComplex); overload;
    procedure Divide(const AVector: TSComplexDynArray); overload;
    procedure Subtract(const AValue: TSComplex); overload;
    procedure Subtract(const AVector: TSComplexDynArray); overload;
    function ForEach(const AProc: TEleventProc<TSComplex>): TSComplexDynArray;
    procedure Apply(const AProc: TEleventProc<TSComplex>);
    procedure Normalize;
    function Normalized: TSComplexDynArray;
    procedure MakeUnitVector;
    function AsUnitVector: TSComplexDynArray;
    function First(): TSComplex;
    function Last(): TSComplex;
    procedure Resize(const ALength: Integer; const ASaveData: Boolean = true);
    property Item[const AIndex: Integer]: TSComplex read GetItem write SetItem;
    property PItem[const AIndex: Integer]: PSComplex read GetPItem;
    property Length: Integer read GetLength write SetLength;
    property Size: Integer read GetSize;
    property Norm: TSComplex read GetNorm;
    property Sum: TSComplex read GetSum;
    property Mean: TSComplex read GetMean;
    property Variance: TSComplex read GetVariance;
    property Deviation: TSComplex read GetDeviation;
    property MaxValue: TSComplex read GetMaxValue;
    property MinValue: TSComplex read GetMinValue;
    property MaxIndex: Integer read GetMaxIndex;
    property MinIndex: Integer read GetMinIndex;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Inverse: TSComplexDynArray;
    function Prod: TSComplex;
    function ReverseArray: TSComplexDynArray;
    function DeleteIndexes(const AIndexes: TIntegerDynArray): TSComplexDynArray;
    procedure Sort; overload;
    procedure Sort(var AIndexes: TIntegerDynArray); overload;
    procedure SortWithOrder(const AOrderIndexes: TIntegerDynArray);
    function Negative: TSComplexDynArray;
    function Equal(const AVector: TSComplexDynArray): Boolean; overload;
    function NotEqual(const AVector: TSComplexDynArray): Boolean; overload;
    function Equal(const AValue: TSComplex): Boolean; overload;
    function NotEqual(const AValue: TSComplex): Boolean; overload;
    function IsNaNArray: TBooleanDynArray;
    function IsInfinityArray: TBooleanDynArray;
    function IsNegativeInfinityArray: TBooleanDynArray;
    function IsPositiveInfinityArray: TBooleanDynArray;
    function FiniteValues: TSComplexDynArray;
    function DeleteValues(const AStates: TBooleanDynArray): TSComplexDynArray;
    function ToString: string; overload;
    function _ToString(const ASeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    constructor Create(const AVectorRe, AVectorIm: TSingleDynArray); overload;
    constructor Create(const AVector: TSingleDynArray); overload;
    function Real: TSingleDynArray;
    function Imag: TSingleDynArray;
    procedure ClearReal;
    procedure ClearImag;
    procedure Conjugate();
    procedure i1();
    function SqrAbs: TSingleDynArray;
    function Magnitude: TSingleDynArray;
    function Angle: TSingleDynArray;
    class function Parse(const AVectorStr: string): TSComplexDynArray; static;
  end;

  TEComplexDynArrayHelper = record helper for TEComplexDynArray
  private
    function GetLength: Integer;
    function GetMaxValue: TEComplex;
    function GetMaxIndex: Integer;
    function GetMinValue: TEComplex;
    function GetMinIndex: Integer;
    function GetNorm: TEComplex;
    function GetSize: Integer;
    procedure SetLength(const AValue: Integer);
    function GetItem(const AIndex: Integer): TEComplex;
    procedure SetItem(const AIndex: Integer; const AValue: TEComplex);
    function GetDeviation: TEComplex;
    function GetMean: TEComplex;
    function GetSum: TEComplex;
    function GetVariance: TEComplex;
    function GetPItem(const AIndex: Integer): PEComplex;
  public
    function MaxItem(var AIndex: Integer): TEComplex;
    function MinItem(var AIndex: Integer): TEComplex;
    constructor Create(const ALength: Integer); overload;
    constructor Create(const AStart, AEnd: Integer; const AStep: Integer = 1); overload;
    constructor Create(const AVectorStr: string); overload;
    constructor Ones(const ALength: Integer);
    constructor Create(const AVector: TEComplexDynArray); overload;
    constructor Base(const ALength, ANumber: Integer);
    procedure Assign(const ASource: TEComplexDynArray);
    procedure AssignTo(const ADest: TEComplexDynArray);
    function Low: Integer;
    function High: Integer;
    procedure Zero;
    procedure Fill(const AValue: TEComplex);
    procedure Multiply(const AValue: TEComplex); overload;
    procedure Multiply(const AVector: TEComplexDynArray); overload;
    procedure Add(const AValue: TEComplex); overload;
    procedure Add(const AVector: TEComplexDynArray); overload;
    procedure Divide(const AValue: TEComplex); overload;
    procedure Divide(const AVector: TEComplexDynArray); overload;
    procedure Subtract(const AValue: TEComplex); overload;
    procedure Subtract(const AVector: TEComplexDynArray); overload;
    function ForEach(const AProc: TEleventProc<TEComplex>): TEComplexDynArray;
    procedure Apply(const AProc: TEleventProc<TEComplex>);
    procedure Normalize;
    function Normalized: TEComplexDynArray;
    procedure MakeUnitVector;
    function AsUnitVector: TEComplexDynArray;
    function First(): TEComplex;
    function Last(): TEComplex;
    procedure Resize(const ALength: Integer; const ASaveData: Boolean = true);
    property Item[const AIndex: Integer]: TEComplex read GetItem write SetItem;
    property PItem[const AIndex: Integer]: PEComplex read GetPItem;
    property Length: Integer read GetLength write SetLength;
    property Size: Integer read GetSize;
    property Norm: TEComplex read GetNorm;
    property Sum: TEComplex read GetSum;
    property Mean: TEComplex read GetMean;
    property Variance: TEComplex read GetVariance;
    property Deviation: TEComplex read GetDeviation;
    property MaxValue: TEComplex read GetMaxValue;
    property MinValue: TEComplex read GetMinValue;
    property MaxIndex: Integer read GetMaxIndex;
    property MinIndex: Integer read GetMinIndex;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Inverse: TEComplexDynArray;
    function Prod: TEComplex;
    function ReverseArray: TEComplexDynArray;
    function DeleteIndexes(const AIndexes: TIntegerDynArray): TEComplexDynArray;
    procedure Sort; overload;
    procedure Sort(var AIndexes: TIntegerDynArray); overload;
    procedure SortWithOrder(const AOrderIndexes: TIntegerDynArray);
    function Negative: TEComplexDynArray;
    function Equal(const AVector: TEComplexDynArray): Boolean; overload;
    function NotEqual(const AVector: TEComplexDynArray): Boolean; overload;
    function Equal(const AValue: TEComplex): Boolean; overload;
    function NotEqual(const AValue: TEComplex): Boolean; overload;
    function IsNaNArray: TBooleanDynArray;
    function IsInfinityArray: TBooleanDynArray;
    function IsNegativeInfinityArray: TBooleanDynArray;
    function IsPositiveInfinityArray: TBooleanDynArray;
    function FiniteValues: TEComplexDynArray;
    function DeleteValues(const AStates: TBooleanDynArray): TEComplexDynArray;
    function ToString: string; overload;
    function _ToString(const ASeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    constructor Create(const AVectorRe, AVectorIm: TExtendedDynArray); overload;
    constructor Create(const AVector: TExtendedDynArray); overload;
    function Real: TExtendedDynArray;
    function Imag: TExtendedDynArray;
    procedure ClearReal;
    procedure ClearImag;
    procedure Conjugate();
    procedure i1();
    function SqrAbs: TExtendedDynArray;
    function Magnitude: TExtendedDynArray;
    function Angle: TExtendedDynArray;
    class function Parse(const AVectorStr: string): TEComplexDynArray; static;
  end;

implementation

uses
  System.Math, DAVLib.SwapOperation, System.Generics.Collections;

procedure TDComplexDynArrayHelper.Assign(const ASource: TDComplexDynArray);
begin
  NeedSameLength(Length, ASource.Length);
  Move(ASource[0], Self[0], Size);
end;

procedure TDComplexDynArrayHelper.AssignTo(const ADest: TDComplexDynArray);
begin
  NeedSameLength(Length, ADest.Length);
  Move(Self[0], ADest[0], Size);
end;

function TDComplexDynArrayHelper.AsUnitVector: TDComplexDynArray;
begin
  Result := TDComplexDynArray.Create(Self);
  Result.MakeUnitVector;
end;

procedure TDComplexDynArrayHelper.Add(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] + AValue;
end;

procedure TDComplexDynArrayHelper.Add(const AVector: TDComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] + AVector[I];
end;

procedure TDComplexDynArrayHelper.Subtract(const AVector: TDComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] - AVector[I];
end;

procedure TDComplexDynArrayHelper.MakeUnitVector;
var
  D: TDComplex;
  I: Integer;
begin
  D := Norm;
  if D.IsZero or D.IsNaN or D.IsInfinity then
    raise EComplexVectorError.Create('Must have value');
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

procedure TDComplexDynArrayHelper.Multiply(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] * AValue;
end;

procedure TDComplexDynArrayHelper.Multiply(const AVector: TDComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] * AVector[I];
end;

procedure TDComplexDynArrayHelper.Divide(const AValue: TDComplex);
begin
  Multiply(1 / AValue);
end;

procedure TDComplexDynArrayHelper.Divide(const AVector: TDComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] / AVector[I];
end;

procedure TDComplexDynArrayHelper.Subtract(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] - AValue;
end;

function TDComplexDynArrayHelper.Negative: TDComplexDynArray;
var
  I: Integer;
begin
  Result.Length := Self.Length;
  for I := Result.Low to Result.High do
    Result[I] := -Self[I];
end;

function TDComplexDynArrayHelper.Equal(const AVector: TDComplexDynArray): Boolean;
var
  L, I: Integer;
begin
  L := Self.Length;
  Result := L = AVector.Length;
  if not Result then
    Exit;
  I := 1;
  while (I <= L) and (Self[I] = AVector[I]) do
    System.Inc(I);
  Result := I > L;
end;

function TDComplexDynArrayHelper.NotEqual(const AVector: TDComplexDynArray): Boolean;
begin
  Result := not (Self.Equal(AVector));
end;

function TDComplexDynArrayHelper.Equal(const AValue: TDComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Low to High do
    Result := Result or (Self[I] = AValue);
end;

function TDComplexDynArrayHelper.NotEqual(const AValue: TDComplex): Boolean;
begin
  Result := not (Self.Equal(AValue));
end;

constructor TDComplexDynArrayHelper.Base(const ALength, ANumber: Integer);
begin
  if not InRange(ANumber, 0, ALength - 1) then
    raise EComplexVectorError.Create('ANumber must be in range ALength');
  Self.Length := ALength;

  Self[ANumber] := 1;
end;

constructor TDComplexDynArrayHelper.Create(const AVector: TDComplexDynArray);
begin
  Self := Nil;
  Self := Copy(AVector);
end;

constructor TDComplexDynArrayHelper.Create(const AStart, AEnd, AStep: Integer);
var
  I: Integer;
begin
  if (AStep <= 0) or (AStart = AEnd) then
    raise EComplexVectorError.Create('Create error: Check input parameters');

  Self := TDComplexDynArray.Create(((AEnd - AStart) / AStep).Ceil);
  for I := Low to High do
    Self[I] := I * AStep + AStart;
end;

constructor TDComplexDynArrayHelper.Create(const ALength: Integer);
begin
  Self := Nil;
  Self.Length := ALength;
end;

constructor TDComplexDynArrayHelper.Ones(const ALength: Integer);
var
  I: Integer;
begin
  Self := Nil;
  Self := TDComplexDynArray.Create(ALength);
  Self.Fill(1);
end;

procedure TDComplexDynArrayHelper.Fill(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Self.Low to Self.High do
    Self[I] := AValue;
end;

function TDComplexDynArrayHelper.FiniteValues: TDComplexDynArray;
var
  I, LCounter: Integer;
begin
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    System.Inc(LCounter);
  end;
  Result := TDComplexDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TDComplexDynArrayHelper.Apply(const AProc: TEleventProc<TDComplex>);
var
  I: Integer;
begin
  Assert(Assigned(AProc), 'Unassigned procedure');
  for I := Low to High do
    AProc(Self[I]);
end;

function TDComplexDynArrayHelper.ForEach(const AProc: TEleventProc<TDComplex>): TDComplexDynArray;
begin
  Result := TDComplexDynArray.Create(Self);
  Result.Apply(AProc);
end;

function TDComplexDynArrayHelper.GetDeviation: TDComplex;
begin
  Result := Variance.Sqrt;
end;

function TDComplexDynArrayHelper.GetItem(const AIndex: Integer): TDComplex;
begin
  if not InRange(AIndex, Low, High) then
    raise EComplexVectorError.Create('Index not in range of vector bounds');
  Result := Self[AIndex];
end;

function TDComplexDynArrayHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TDComplexDynArrayHelper.GetMaxValue: TDComplex;
var
  I: Integer;
begin
  Result := MaxItem(I);
end;

function TDComplexDynArrayHelper.MaxItem(var AIndex: Integer): TDComplex;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result.NaN;
    Exit
  end;
  AIndex := Low;
  Result := Self[AIndex];
  while (Result.IsNaN or Result.IsInfinity) and (AIndex < Length) do
  begin
    System.Inc(AIndex);
    Result := Self[AIndex];
  end;

  for I := AIndex + 1 to High do
    if (Self[I] > Result) and (not Self[I].IsNaN) and (not Self[I].IsInfinity) then
    begin
      Result := Self[I];
      AIndex := I
    end;
end;

function TDComplexDynArrayHelper.GetMaxIndex: Integer;
begin
  MaxItem(Result);
end;

function TDComplexDynArrayHelper.GetMean: TDComplex;
var
  N: Integer;
begin
  N := Length;
  if Length = 0 then
  begin
    Result := 0;
    Exit
  end;
  Result := Sum / N;
end;

function TDComplexDynArrayHelper.MinItem(var AIndex: Integer): TDComplex;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result.NaN;
    Exit
  end;
  AIndex := Low;
  Result := Self[AIndex];
  while (Result.IsNaN or Result.IsInfinity) and (AIndex < Length) do
  begin
    System.Inc(AIndex);
    Result := Self[AIndex];
  end;
  for I := AIndex + 1 to High do
    if (Self[I] < Result) and (not Self[I].IsNaN) and (not Self[I].IsInfinity) then
    begin
      Result := Self[I];
      AIndex := I
    end;
end;

function TDComplexDynArrayHelper.GetMinValue: TDComplex;
var
  I: Integer;
begin
  Result := MinItem(I);
end;

function TDComplexDynArrayHelper.GetMinIndex: Integer;
begin
  MinItem(Result);
end;

function TDComplexDynArrayHelper.GetNorm: TDComplex;
var
  I: Integer;
begin
  Result := 0;
  for I := Low to High do
    Result := Result + Self[I].Sqr;
  Result := Result.Sqrt;
end;

function TDComplexDynArrayHelper.GetPItem(const AIndex: Integer): PDComplex;
begin
  Result := Self[AIndex].Pointer;
end;

function TDComplexDynArrayHelper.GetSize: Integer;
begin
  Result := Length * SizeOf(TDComplex);
end;

function TDComplexDynArrayHelper.GetSum: TDComplex;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;
  for I := Low to High do
    Result := Result + Self[I];
end;

function TDComplexDynArrayHelper.GetVariance: TDComplex;
var
  M: TDComplex;
  N, I: Integer;
begin
  Result := 0;
  N := Length;
  if N = 0 then
    Exit;
  M := Mean;
  for I := Low to High do
    Result := Result + (Self[I] - M).Sqr;
  Result := Result / N;
end;

function TDComplexDynArrayHelper.Low: Integer;
begin
  Result := System.Low(Self);
end;

function TDComplexDynArrayHelper.High: Integer;
begin
  Result := System.High(Self);
end;

procedure TDComplexDynArrayHelper.i1;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I].i1;
end;

procedure TDComplexDynArrayHelper.Normalize;
var
  D: TDComplex;
  I: Integer;
begin
  D := MaxValue;
  if D.IsNaN or D.IsZero then
    Exit;
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

function TDComplexDynArrayHelper.Normalized: TDComplexDynArray;
begin
  Result := TDComplexDynArray.Create(Self);
  Result.Normalize;
end;

function TDComplexDynArrayHelper.Real: TDoubleDynArray;
var
  I: Integer;
begin
  Result := TDoubleDynArray.Create(Length);
  for I := Low to High do
    Result[I] := Self[I].Re;
end;

procedure TDComplexDynArrayHelper.Resize(const ALength: Integer; const ASaveData: Boolean = true);
begin
  if Length <> ALength then
    System.SetLength(Self, ALength);

  if not ASaveData then
    Zero;
end;

procedure TDComplexDynArrayHelper.SetItem(const AIndex: Integer; const AValue: TDComplex);
begin
  if not InRange(AIndex, Low, High) then
    raise EComplexVectorError.Create('Index not in range of vector bounds');
  Self[AIndex] := AValue;
end;

procedure TDComplexDynArrayHelper.SetLength(const AValue: Integer);
begin
  System.SetLength(Self, AValue);
end;

procedure TDComplexDynArrayHelper.Zero;
begin
  if Length = 0 then
    Exit;
  FillChar(Self[Low], Size, 0);
end;

procedure TDComplexDynArrayHelper.NaN;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NaN;
end;

procedure TDComplexDynArrayHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NegativeInfinity;
end;

class function TDComplexDynArrayHelper.Parse(const AVectorStr: string): TDComplexDynArray;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AVectorStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([VectorItemDelimiter]);
  L := System.Length(LStrArray);
  Result := TDComplexDynArray.Create(L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := TDComplex.Create(LStrArray[I]);
end;

constructor TDComplexDynArrayHelper.Create(const AVectorStr: string);
begin
  Self := TDComplexDynArray.Parse(AVectorStr);
end;

procedure TDComplexDynArrayHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].PositiveInfinity;
end;

function TDComplexDynArrayHelper.IsZero: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsZero;
end;

function TDComplexDynArrayHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNaN;
end;

function TDComplexDynArrayHelper.IsNaNArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNaN;
end;

function TDComplexDynArrayHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsInfinity;
end;

function TDComplexDynArrayHelper.IsInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsInfinity;
end;

function TDComplexDynArrayHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNegativeInfinity;
end;

function TDComplexDynArrayHelper.IsNegativeInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNegativeInfinity;
end;

function TDComplexDynArrayHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsPositiveInfinity;
end;

function TDComplexDynArrayHelper.IsPositiveInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsPositiveInfinity;
end;

function TDComplexDynArrayHelper.First(): TDComplex;
begin
  Result := Self[Low];
end;

function TDComplexDynArrayHelper.Last(): TDComplex;
begin
  Result := Self[High];
end;

function TDComplexDynArrayHelper.Imag: TDoubleDynArray;
var
  I: Integer;
begin
  Result := TDoubleDynArray.Create(Length);
  for I := Low to High do
    Result[I] := Self[I].Im;
end;

function TDComplexDynArrayHelper.Inverse: TDComplexDynArray;
var
  I: Integer;
begin
  Result := TDComplexDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := 1 / Self[I];
end;

function TDComplexDynArrayHelper.Prod: TDComplex;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;

  Result := 1;
  for I := Low to High do
    Result := Result * Self[I]
end;

function TDComplexDynArrayHelper.ReverseArray: TDComplexDynArray;
var
  I, J: Integer;
begin
  Result := TDComplexDynArray.Create(Length);
  J := 0;
  for I := High downto Low do
  begin
    Result[J] := Self[I];
    System.Inc(J);
  end;
end;

function TDComplexDynArrayHelper.DeleteIndexes(const AIndexes: TIntegerDynArray): TDComplexDynArray;
var
  J, L, K: Integer;
begin
  L := Length;
  K := System.Length(AIndexes);
  if L - K <= 0 then
    Exit;

  Result := TDComplexDynArray.Create(L - K);
  L := 0;
  for J := 0 to K - 1 do
  begin
    Result[L] := Self[AIndexes[J]];
    System.Inc(L);
  end;
end;

function TDComplexDynArrayHelper.DeleteValues(const AStates: TBooleanDynArray): TDComplexDynArray;
var
  I, LCounter: Integer;
begin
  NeedSameLength(Self.Length, System.Length(AStates));

  LCounter := 0;
  for I := Low to High do
    if AStates[I] then
      System.Inc(LCounter);
  Result := TDComplexDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if not AStates[I] then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TDComplexDynArrayHelper.Sort;
begin
  TArray.Sort<TDComplex>(Self);
end;

procedure TDComplexDynArrayHelper.Sort(var AIndexes: TIntegerDynArray);
var
  Lo, Hi: Integer;
  Pivot, T: TDComplex;
  I, ti: Integer;

  procedure qSort(var a: TDComplexDynArray; iLo, iHi: Integer; var AIndexes: TIntegerDynArray);
  begin
    Lo := iLo;
    Hi := iHi;
    Pivot := a[(Lo + Hi) div 2];
    repeat
      while a[Lo] < Pivot do
        Lo := Lo + 1;
      while a[Hi] > Pivot do
        Hi := Hi - 1;
      if Lo <= Hi then
      begin
        T := a[Lo];
        a[Lo] := a[Hi];
        a[Hi] := T;
        ti := AIndexes[Lo];
        AIndexes[Lo] := AIndexes[Hi];
        AIndexes[Hi] := ti;
        Lo := Lo + 1;
        Hi := Hi - 1;
      end;
    until Lo > Hi;
    if Hi > iLo then
      qSort(a, iLo, Hi, AIndexes);
    if Lo < iHi then
      qSort(a, Lo, iHi, AIndexes);
  end;

begin
  System.SetLength(AIndexes, Length);
  for I := Low to High do
    AIndexes[I] := I;

  qSort(Self, Low, High, AIndexes);
end;

procedure TDComplexDynArrayHelper.SortWithOrder(const AOrderIndexes: TIntegerDynArray);
var
  I: Integer;
begin
  for I := System.Low(AOrderIndexes) to System.High(AOrderIndexes) do
    TSwapOp<TDComplex>.Swap(Self[AOrderIndexes[I]], Self[I]);
  Resize(System.Length(AOrderIndexes));
end;

function TDComplexDynArrayHelper.SqrAbs: TDoubleDynArray;
var
  I: Integer;
begin
  Result := TDoubleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].SqrAbs;
end;

function TDComplexDynArrayHelper.Magnitude: TDoubleDynArray;
var
  I: Integer;
begin
  Result := TDoubleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].Magnitude;
end;

function TDComplexDynArrayHelper.Angle: TDoubleDynArray;
var
  I: Integer;
begin
  Result := TDoubleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].Angle;
end;

function TDComplexDynArrayHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormatSettings);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TDComplexDynArrayHelper.ToString: string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TDComplexDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TDComplexDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TDComplexDynArrayHelper._ToString(const ASeparator: string): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := '[' + string.Join(ASeparator, R) + ']';
end;

procedure TDComplexDynArrayHelper.ClearImag;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].Im := ZeroValue;
end;

procedure TDComplexDynArrayHelper.ClearReal;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].Im := ZeroValue;
end;

procedure TDComplexDynArrayHelper.Conjugate;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I].Conjugate;
end;

constructor TDComplexDynArrayHelper.Create(const AVector: TDoubleDynArray);
var
  I: Integer;
begin
  Self := TDComplexDynArray.Create(AVector.Length);
  for I := Low to High do
    Self[I].SetValue(AVector[I]);
end;

constructor TDComplexDynArrayHelper.Create(const AVectorRe, AVectorIm: TDoubleDynArray);
var
  I: Integer;
begin
  Self := TDComplexDynArray.Create(AVectorRe.Length);
  for I := Low to High do
    Self[I].SetValue(AVectorRe[I], AVectorIm[I]);
end;

procedure TSComplexDynArrayHelper.Assign(const ASource: TSComplexDynArray);
begin
  NeedSameLength(Length, ASource.Length);
  Move(ASource[0], Self[0], Size);
end;

procedure TSComplexDynArrayHelper.AssignTo(const ADest: TSComplexDynArray);
begin
  NeedSameLength(Length, ADest.Length);
  Move(Self[0], ADest[0], Size);
end;

function TSComplexDynArrayHelper.AsUnitVector: TSComplexDynArray;
begin
  Result := TSComplexDynArray.Create(Self);
  Result.MakeUnitVector;
end;

procedure TSComplexDynArrayHelper.Add(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] + AValue;
end;

procedure TSComplexDynArrayHelper.Add(const AVector: TSComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] + AVector[I];
end;

procedure TSComplexDynArrayHelper.Subtract(const AVector: TSComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] - AVector[I];
end;

procedure TSComplexDynArrayHelper.MakeUnitVector;
var
  D: TSComplex;
  I: Integer;
begin
  D := Norm;
  if D.IsZero or D.IsNaN or D.IsInfinity then
    raise EComplexVectorError.Create('Must have value');
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

procedure TSComplexDynArrayHelper.Multiply(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] * AValue;
end;

procedure TSComplexDynArrayHelper.Multiply(const AVector: TSComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] * AVector[I];
end;

procedure TSComplexDynArrayHelper.Divide(const AValue: TSComplex);
begin
  Multiply(1 / AValue);
end;

procedure TSComplexDynArrayHelper.Divide(const AVector: TSComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] / AVector[I];
end;

procedure TSComplexDynArrayHelper.Subtract(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] - AValue;
end;

function TSComplexDynArrayHelper.Negative: TSComplexDynArray;
var
  I: Integer;
begin
  Result.Length := Self.Length;
  for I := Result.Low to Result.High do
    Result[I] := -Self[I];
end;

function TSComplexDynArrayHelper.Equal(const AVector: TSComplexDynArray): Boolean;
var
  L, I: Integer;
begin
  L := Self.Length;
  Result := L = AVector.Length;
  if not Result then
    Exit;
  I := 1;
  while (I <= L) and (Self[I] = AVector[I]) do
    System.Inc(I);
  Result := I > L;
end;

function TSComplexDynArrayHelper.NotEqual(const AVector: TSComplexDynArray): Boolean;
begin
  Result := not (Self.Equal(AVector));
end;

function TSComplexDynArrayHelper.Equal(const AValue: TSComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Low to High do
    Result := Result or (Self[I] = AValue);
end;

function TSComplexDynArrayHelper.NotEqual(const AValue: TSComplex): Boolean;
begin
  Result := not (Self.Equal(AValue));
end;

constructor TSComplexDynArrayHelper.Base(const ALength, ANumber: Integer);
begin
  if not InRange(ANumber, 0, ALength - 1) then
    raise EComplexVectorError.Create('ANumber must be in range ALength');
  Self.Length := ALength;

  Self[ANumber] := 1;
end;

constructor TSComplexDynArrayHelper.Create(const AVector: TSComplexDynArray);
begin
  Self := Nil;
  Self := Copy(AVector);
end;

constructor TSComplexDynArrayHelper.Create(const AStart, AEnd, AStep: Integer);
var
  I: Integer;
begin
  if (AStep <= 0) or (AStart = AEnd) then
    raise EComplexVectorError.Create('Create error: Check input parameters');

  Self := TSComplexDynArray.Create(((AEnd - AStart) / AStep).Ceil);
  for I := Low to High do
    Self[I] := I * AStep + AStart;
end;

constructor TSComplexDynArrayHelper.Create(const ALength: Integer);
begin
  Self := Nil;
  Self.Length := ALength;
end;

class function TSComplexDynArrayHelper.Parse(const AVectorStr: string): TSComplexDynArray;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AVectorStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([VectorItemDelimiter]);
  L := System.Length(LStrArray);
  Result := TSComplexDynArray.Create(L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := TSComplex.Create(LStrArray[I]);
end;

constructor TSComplexDynArrayHelper.Create(const AVectorStr: string);
begin
  Self := TSComplexDynArray.Parse(AVectorStr);
end;

constructor TSComplexDynArrayHelper.Ones(const ALength: Integer);
var
  I: Integer;
begin
  Self := Nil;
  Self := TSComplexDynArray.Create(ALength);
  Self.Fill(1);
end;

procedure TSComplexDynArrayHelper.Fill(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Self.Low to Self.High do
    Self[I] := AValue;
end;

function TSComplexDynArrayHelper.FiniteValues: TSComplexDynArray;
var
  I, LCounter: Integer;
begin
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    System.Inc(LCounter);
  end;
  Result := TSComplexDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TSComplexDynArrayHelper.Apply(const AProc: TEleventProc<TSComplex>);
var
  I: Integer;
begin
  Assert(Assigned(AProc), 'Unassigned procedure');
  for I := Low to High do
    AProc(Self[I]);
end;

function TSComplexDynArrayHelper.ForEach(const AProc: TEleventProc<TSComplex>): TSComplexDynArray;
begin
  Result := TSComplexDynArray.Create(Self);
  Result.Apply(AProc);
end;

function TSComplexDynArrayHelper.GetDeviation: TSComplex;
begin
  Result := Variance.Sqrt;
end;

function TSComplexDynArrayHelper.GetItem(const AIndex: Integer): TSComplex;
begin
  if not InRange(AIndex, Low, High) then
    raise EComplexVectorError.Create('Index not in range of vector bounds');
  Result := Self[AIndex];
end;

function TSComplexDynArrayHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TSComplexDynArrayHelper.GetMaxValue: TSComplex;
var
  I: Integer;
begin
  Result := MaxItem(I);
end;

function TSComplexDynArrayHelper.MaxItem(var AIndex: Integer): TSComplex;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result.NaN;
    Exit
  end;
  AIndex := Low;
  Result := Self[AIndex];
  while (Result.IsNaN or Result.IsInfinity) and (AIndex < Length) do
  begin
    System.Inc(AIndex);
    Result := Self[AIndex];
  end;

  for I := AIndex + 1 to High do
    if (Self[I] > Result) and (not Self[I].IsNaN) and (not Self[I].IsInfinity) then
    begin
      Result := Self[I];
      AIndex := I
    end;
end;

function TSComplexDynArrayHelper.GetMaxIndex: Integer;
begin
  MaxItem(Result);
end;

function TSComplexDynArrayHelper.GetMean: TSComplex;
var
  N: Integer;
begin
  N := Length;
  if Length = 0 then
  begin
    Result := 0;
    Exit
  end;
  Result := Sum / N;
end;

function TSComplexDynArrayHelper.MinItem(var AIndex: Integer): TSComplex;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result.NaN;
    Exit
  end;
  AIndex := Low;
  Result := Self[AIndex];
  while (Result.IsNaN or Result.IsInfinity) and (AIndex < Length) do
  begin
    System.Inc(AIndex);
    Result := Self[AIndex];
  end;
  for I := AIndex + 1 to High do
    if (Self[I] < Result) and (not Self[I].IsNaN) and (not Self[I].IsInfinity) then
    begin
      Result := Self[I];
      AIndex := I
    end;
end;

function TSComplexDynArrayHelper.GetMinValue: TSComplex;
var
  I: Integer;
begin
  Result := MinItem(I);
end;

function TSComplexDynArrayHelper.GetMinIndex: Integer;
begin
  MinItem(Result);
end;

function TSComplexDynArrayHelper.GetNorm: TSComplex;
var
  I: Integer;
begin
  Result := 0;
  for I := Low to High do
    Result := Result + Self[I].Sqr;
  Result := Result.Sqrt;
end;

function TSComplexDynArrayHelper.GetPItem(const AIndex: Integer): PSComplex;
begin
  Result := Self[AIndex].Pointer;
end;

function TSComplexDynArrayHelper.GetSize: Integer;
begin
  Result := Length * SizeOf(TSComplex);
end;

function TSComplexDynArrayHelper.GetSum: TSComplex;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;
  for I := Low to High do
    Result := Result + Self[I];
end;

function TSComplexDynArrayHelper.GetVariance: TSComplex;
var
  M: TSComplex;
  N, I: Integer;
begin
  Result := 0;
  N := Length;
  if N = 0 then
    Exit;
  M := Mean;
  for I := Low to High do
    Result := Result + (Self[I] - M).Sqr;
  Result := Result / N;
end;

function TSComplexDynArrayHelper.Low: Integer;
begin
  Result := System.Low(Self);
end;

function TSComplexDynArrayHelper.High: Integer;
begin
  Result := System.High(Self);
end;

procedure TSComplexDynArrayHelper.i1;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I].i1;
end;

function TSComplexDynArrayHelper.SqrAbs: TSingleDynArray;
var
  I: Integer;
begin
  Result := TSingleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].SqrAbs;
end;

function TSComplexDynArrayHelper.Magnitude: TSingleDynArray;
var
  I: Integer;
begin
  Result := TSingleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].Magnitude;
end;

function TSComplexDynArrayHelper.Angle: TSingleDynArray;
var
  I: Integer;
begin
  Result := TSingleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].Angle;
end;

procedure TSComplexDynArrayHelper.Normalize;
var
  D: TSComplex;
  I: Integer;
begin
  D := MaxValue;
  if D.IsNaN or D.IsZero then
    Exit;
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

function TSComplexDynArrayHelper.Normalized: TSComplexDynArray;
begin
  Result := TSComplexDynArray.Create(Self);
  Result.Normalize;
end;

function TSComplexDynArrayHelper.Real: TSingleDynArray;
var
  I: Integer;
begin
  Result := TSingleDynArray.Create(Length);
  for I := Low to High do
    Result[I] := Self[I].Re;
end;

procedure TSComplexDynArrayHelper.Resize(const ALength: Integer; const ASaveData: Boolean = true);
begin
  if Length <> ALength then
    System.SetLength(Self, ALength);

  if not ASaveData then
    Zero;
end;

procedure TSComplexDynArrayHelper.SetItem(const AIndex: Integer; const AValue: TSComplex);
begin
  if not InRange(AIndex, Low, High) then
    raise EComplexVectorError.Create('Index not in range of vector bounds');
  Self[AIndex] := AValue;
end;

procedure TSComplexDynArrayHelper.SetLength(const AValue: Integer);
begin
  System.SetLength(Self, AValue);
end;

procedure TSComplexDynArrayHelper.Zero;
begin
  if Length = 0 then
    Exit;
  FillChar(Self[Low], Size, 0);
end;

procedure TSComplexDynArrayHelper.NaN;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NaN;
end;

procedure TSComplexDynArrayHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NegativeInfinity;
end;

procedure TSComplexDynArrayHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].PositiveInfinity;
end;

function TSComplexDynArrayHelper.IsZero: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsZero;
end;

function TSComplexDynArrayHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNaN;
end;

function TSComplexDynArrayHelper.IsNaNArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNaN;
end;

function TSComplexDynArrayHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsInfinity;
end;

function TSComplexDynArrayHelper.IsInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsInfinity;
end;

function TSComplexDynArrayHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNegativeInfinity;
end;

function TSComplexDynArrayHelper.IsNegativeInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNegativeInfinity;
end;

function TSComplexDynArrayHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsPositiveInfinity;
end;

function TSComplexDynArrayHelper.IsPositiveInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsPositiveInfinity;
end;

function TSComplexDynArrayHelper.First(): TSComplex;
begin
  Result := Self[Low];
end;

function TSComplexDynArrayHelper.Last(): TSComplex;
begin
  Result := Self[High];
end;

function TSComplexDynArrayHelper.Imag: TSingleDynArray;
var
  I: Integer;
begin
  Result := TSingleDynArray.Create(Length);
  for I := Low to High do
    Result[I] := Self[I].Im;
end;

function TSComplexDynArrayHelper.Inverse: TSComplexDynArray;
var
  I: Integer;
begin
  Result := TSComplexDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := 1 / Self[I];
end;

function TSComplexDynArrayHelper.Prod: TSComplex;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;

  Result := 1;
  for I := Low to High do
    Result := Result * Self[I]
end;

function TSComplexDynArrayHelper.ReverseArray: TSComplexDynArray;
var
  I, J: Integer;
begin
  Result := TSComplexDynArray.Create(Length);
  J := 0;
  for I := High downto Low do
  begin
    Result[J] := Self[I];
    System.Inc(J);
  end;
end;

function TSComplexDynArrayHelper.DeleteIndexes(const AIndexes: TIntegerDynArray): TSComplexDynArray;
var
  J, L, K: Integer;
begin
  L := Length;
  K := System.Length(AIndexes);
  if L - K <= 0 then
    Exit;

  Result := TSComplexDynArray.Create(L - K);
  L := 0;
  for J := 0 to K - 1 do
  begin
    Result[L] := Self[AIndexes[J]];
    System.Inc(L);
  end;
end;

function TSComplexDynArrayHelper.DeleteValues(const AStates: TBooleanDynArray): TSComplexDynArray;
var
  I, LCounter: Integer;
begin
  NeedSameLength(Self.Length, System.Length(AStates));

  LCounter := 0;
  for I := Low to High do
    if AStates[I] then
      System.Inc(LCounter);
  Result := TSComplexDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if not AStates[I] then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TSComplexDynArrayHelper.Sort;
begin
  TArray.Sort<TSComplex>(Self);
end;

procedure TSComplexDynArrayHelper.Sort(var AIndexes: TIntegerDynArray);
var
  Lo, Hi: Integer;
  Pivot, T: TSComplex;
  I, ti: Integer;

  procedure qSort(var a: TSComplexDynArray; iLo, iHi: Integer; var AIndexes: TIntegerDynArray);
  begin
    Lo := iLo;
    Hi := iHi;
    Pivot := a[(Lo + Hi) div 2];
    repeat
      while a[Lo] < Pivot do
        Lo := Lo + 1;
      while a[Hi] > Pivot do
        Hi := Hi - 1;
      if Lo <= Hi then
      begin
        T := a[Lo];
        a[Lo] := a[Hi];
        a[Hi] := T;
        ti := AIndexes[Lo];
        AIndexes[Lo] := AIndexes[Hi];
        AIndexes[Hi] := ti;
        Lo := Lo + 1;
        Hi := Hi - 1;
      end;
    until Lo > Hi;
    if Hi > iLo then
      qSort(a, iLo, Hi, AIndexes);
    if Lo < iHi then
      qSort(a, Lo, iHi, AIndexes);
  end;

begin
  System.SetLength(AIndexes, Length);
  for I := Low to High do
    AIndexes[I] := I;

  qSort(Self, Low, High, AIndexes);
end;

procedure TSComplexDynArrayHelper.SortWithOrder(const AOrderIndexes: TIntegerDynArray);
var
  I: Integer;
begin
  for I := System.Low(AOrderIndexes) to System.High(AOrderIndexes) do
    TSwapOp<TSComplex>.Swap(Self[AOrderIndexes[I]], Self[I]);
  Resize(System.Length(AOrderIndexes));
end;

function TSComplexDynArrayHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormatSettings);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TSComplexDynArrayHelper.ToString: string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TSComplexDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TSComplexDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TSComplexDynArrayHelper._ToString(const ASeparator: string): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := '[' + string.Join(ASeparator, R) + ']';
end;

procedure TSComplexDynArrayHelper.ClearImag;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].Im := ZeroValue;
end;

procedure TSComplexDynArrayHelper.ClearReal;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].Im := ZeroValue;
end;

procedure TSComplexDynArrayHelper.Conjugate;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I].Conjugate;
end;

constructor TSComplexDynArrayHelper.Create(const AVector: TSingleDynArray);
var
  I: Integer;
begin
  Self := TSComplexDynArray.Create(AVector.Length);
  for I := Low to High do
    Self[I].SetValue(AVector[I]);
end;

constructor TSComplexDynArrayHelper.Create(const AVectorRe, AVectorIm: TSingleDynArray);
var
  I: Integer;
begin
  Self := TSComplexDynArray.Create(AVectorRe.Length);
  for I := Low to High do
    Self[I].SetValue(AVectorRe[I], AVectorIm[I]);
end;

procedure TEComplexDynArrayHelper.Assign(const ASource: TEComplexDynArray);
begin
  NeedSameLength(Length, ASource.Length);
  Move(ASource[0], Self[0], Size);
end;

procedure TEComplexDynArrayHelper.AssignTo(const ADest: TEComplexDynArray);
begin
  NeedSameLength(Length, ADest.Length);
  Move(Self[0], ADest[0], Size);
end;

function TEComplexDynArrayHelper.AsUnitVector: TEComplexDynArray;
begin
  Result := TEComplexDynArray.Create(Self);
  Result.MakeUnitVector;
end;

procedure TEComplexDynArrayHelper.Add(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] + AValue;
end;

procedure TEComplexDynArrayHelper.Add(const AVector: TEComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] + AVector[I];
end;

procedure TEComplexDynArrayHelper.Subtract(const AVector: TEComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] - AVector[I];
end;

procedure TEComplexDynArrayHelper.MakeUnitVector;
var
  D: TEComplex;
  I: Integer;
begin
  D := Norm;
  if D.IsZero or D.IsNaN or D.IsInfinity then
    raise EComplexVectorError.Create('Must have value');
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

procedure TEComplexDynArrayHelper.Multiply(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] * AValue;
end;

procedure TEComplexDynArrayHelper.Multiply(const AVector: TEComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] * AVector[I];
end;

procedure TEComplexDynArrayHelper.Divide(const AValue: TEComplex);
begin
  Multiply(1 / AValue);
end;

procedure TEComplexDynArrayHelper.Divide(const AVector: TEComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] / AVector[I];
end;

procedure TEComplexDynArrayHelper.Subtract(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] - AValue;
end;

function TEComplexDynArrayHelper.Negative: TEComplexDynArray;
var
  I: Integer;
begin
  Result.Length := Self.Length;
  for I := Result.Low to Result.High do
    Result[I] := -Self[I];
end;

function TEComplexDynArrayHelper.Equal(const AVector: TEComplexDynArray): Boolean;
var
  L, I: Integer;
begin
  L := Self.Length;
  Result := L = AVector.Length;
  if not Result then
    Exit;
  I := 1;
  while (I <= L) and (Self[I] = AVector[I]) do
    System.Inc(I);
  Result := I > L;
end;

function TEComplexDynArrayHelper.NotEqual(const AVector: TEComplexDynArray): Boolean;
begin
  Result := not (Self.Equal(AVector));
end;

function TEComplexDynArrayHelper.Equal(const AValue: TEComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Low to High do
    Result := Result or (Self[I] = AValue);
end;

function TEComplexDynArrayHelper.NotEqual(const AValue: TEComplex): Boolean;
begin
  Result := not (Self.Equal(AValue));
end;

constructor TEComplexDynArrayHelper.Base(const ALength, ANumber: Integer);
begin
  if not InRange(ANumber, 0, ALength - 1) then
    raise EComplexVectorError.Create('ANumber must be in range ALength');
  Self.Length := ALength;

  Self[ANumber] := 1;
end;

constructor TEComplexDynArrayHelper.Create(const AVector: TEComplexDynArray);
begin
  Self := Nil;
  Self := Copy(AVector);
end;

constructor TEComplexDynArrayHelper.Create(const AStart, AEnd, AStep: Integer);
var
  I: Integer;
begin
  if (AStep <= 0) or (AStart = AEnd) then
    raise EComplexVectorError.Create('Create error: Check input parameters');

  Self := TEComplexDynArray.Create(((AEnd - AStart) / AStep).Ceil);
  for I := Low to High do
    Self[I] := I * AStep + AStart;
end;

constructor TEComplexDynArrayHelper.Create(const ALength: Integer);
begin
  Self := Nil;
  Self.Length := ALength;
end;

class function TEComplexDynArrayHelper.Parse(const AVectorStr: string): TEComplexDynArray;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AVectorStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([VectorItemDelimiter]);
  L := System.Length(LStrArray);
  Result := TEComplexDynArray.Create(L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := TEComplex.Create(LStrArray[I]);
end;

constructor TEComplexDynArrayHelper.Create(const AVectorStr: string);
begin
  Self := TEComplexDynArray.Parse(AVectorStr);
end;

constructor TEComplexDynArrayHelper.Ones(const ALength: Integer);
var
  I: Integer;
begin
  Self := Nil;
  Self := TEComplexDynArray.Create(ALength);
  Self.Fill(1);
end;

procedure TEComplexDynArrayHelper.Fill(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Self.Low to Self.High do
    Self[I] := AValue;
end;

function TEComplexDynArrayHelper.FiniteValues: TEComplexDynArray;
var
  I, LCounter: Integer;
begin
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    System.Inc(LCounter);
  end;
  Result := TEComplexDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TEComplexDynArrayHelper.Apply(const AProc: TEleventProc<TEComplex>);
var
  I: Integer;
begin
  Assert(Assigned(AProc), 'Unassigned procedure');
  for I := Low to High do
    AProc(Self[I]);
end;

function TEComplexDynArrayHelper.ForEach(const AProc: TEleventProc<TEComplex>): TEComplexDynArray;
begin
  Result := TEComplexDynArray.Create(Self);
  Result.Apply(AProc);
end;

function TEComplexDynArrayHelper.GetDeviation: TEComplex;
begin
  Result := Variance.Sqrt;
end;

function TEComplexDynArrayHelper.GetItem(const AIndex: Integer): TEComplex;
begin
  if not InRange(AIndex, Low, High) then
    raise EComplexVectorError.Create('Index not in range of vector bounds');
  Result := Self[AIndex];
end;

function TEComplexDynArrayHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TEComplexDynArrayHelper.GetMaxValue: TEComplex;
var
  I: Integer;
begin
  Result := MaxItem(I);
end;

function TEComplexDynArrayHelper.MaxItem(var AIndex: Integer): TEComplex;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result.NaN;
    Exit
  end;
  AIndex := Low;
  Result := Self[AIndex];
  while (Result.IsNaN or Result.IsInfinity) and (AIndex < Length) do
  begin
    System.Inc(AIndex);
    Result := Self[AIndex];
  end;

  for I := AIndex + 1 to High do
    if (Self[I] > Result) and (not Self[I].IsNaN) and (not Self[I].IsInfinity) then
    begin
      Result := Self[I];
      AIndex := I
    end;
end;

function TEComplexDynArrayHelper.GetMaxIndex: Integer;
begin
  MaxItem(Result);
end;

function TEComplexDynArrayHelper.GetMean: TEComplex;
var
  N: Integer;
begin
  N := Length;
  if Length = 0 then
  begin
    Result := 0;
    Exit
  end;
  Result := Sum / N;
end;

function TEComplexDynArrayHelper.MinItem(var AIndex: Integer): TEComplex;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result.NaN;
    Exit
  end;
  AIndex := Low;
  Result := Self[AIndex];
  while (Result.IsNaN or Result.IsInfinity) and (AIndex < Length) do
  begin
    System.Inc(AIndex);
    Result := Self[AIndex];
  end;
  for I := AIndex + 1 to High do
    if (Self[I] < Result) and (not Self[I].IsNaN) and (not Self[I].IsInfinity) then
    begin
      Result := Self[I];
      AIndex := I
    end;
end;

function TEComplexDynArrayHelper.GetMinValue: TEComplex;
var
  I: Integer;
begin
  Result := MinItem(I);
end;

function TEComplexDynArrayHelper.GetMinIndex: Integer;
begin
  MinItem(Result);
end;

function TEComplexDynArrayHelper.GetNorm: TEComplex;
var
  I: Integer;
begin
  Result := 0;
  for I := Low to High do
    Result := Result + Self[I].Sqr;
  Result := Result.Sqrt;
end;

function TEComplexDynArrayHelper.GetPItem(const AIndex: Integer): PEComplex;
begin
  Result := Self[AIndex].Pointer;
end;

function TEComplexDynArrayHelper.GetSize: Integer;
begin
  Result := Length * SizeOf(TEComplex);
end;

function TEComplexDynArrayHelper.GetSum: TEComplex;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;
  for I := Low to High do
    Result := Result + Self[I];
end;

function TEComplexDynArrayHelper.GetVariance: TEComplex;
var
  M: TEComplex;
  N, I: Integer;
begin
  Result := 0;
  N := Length;
  if N = 0 then
    Exit;
  M := Mean;
  for I := Low to High do
    Result := Result + (Self[I] - M).Sqr;
  Result := Result / N;
end;

function TEComplexDynArrayHelper.Low: Integer;
begin
  Result := System.Low(Self);
end;

function TEComplexDynArrayHelper.High: Integer;
begin
  Result := System.High(Self);
end;

procedure TEComplexDynArrayHelper.i1;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I].i1;
end;

function TEComplexDynArrayHelper.SqrAbs: TExtendedDynArray;
var
  I: Integer;
begin
  Result := TExtendedDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].SqrAbs;
end;

function TEComplexDynArrayHelper.Magnitude: TExtendedDynArray;
var
  I: Integer;
begin
  Result := TExtendedDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].Magnitude;
end;

function TEComplexDynArrayHelper.Angle: TExtendedDynArray;
var
  I: Integer;
begin
  Result := TExtendedDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := Self[I].Angle;
end;

procedure TEComplexDynArrayHelper.Normalize;
var
  D: TEComplex;
  I: Integer;
begin
  D := MaxValue;
  if D.IsNaN or D.IsZero then
    Exit;
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

function TEComplexDynArrayHelper.Normalized: TEComplexDynArray;
begin
  Result := TEComplexDynArray.Create(Self);
  Result.Normalize;
end;

function TEComplexDynArrayHelper.Real: TExtendedDynArray;
var
  I: Integer;
begin
  Result := TExtendedDynArray.Create(Length);
  for I := Low to High do
    Result[I] := Self[I].Re;
end;

procedure TEComplexDynArrayHelper.Resize(const ALength: Integer; const ASaveData: Boolean = true);
begin
  if Length <> ALength then
    System.SetLength(Self, ALength);

  if not ASaveData then
    Zero;
end;

procedure TEComplexDynArrayHelper.SetItem(const AIndex: Integer; const AValue: TEComplex);
begin
  if not InRange(AIndex, Low, High) then
    raise EComplexVectorError.Create('Index not in range of vector bounds');
  Self[AIndex] := AValue;
end;

procedure TEComplexDynArrayHelper.SetLength(const AValue: Integer);
begin
  System.SetLength(Self, AValue);
end;

procedure TEComplexDynArrayHelper.Zero;
begin
  if Length = 0 then
    Exit;
  FillChar(Self[Low], Size, 0);
end;

procedure TEComplexDynArrayHelper.NaN;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NaN;
end;

procedure TEComplexDynArrayHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NegativeInfinity;
end;

procedure TEComplexDynArrayHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].PositiveInfinity;
end;

function TEComplexDynArrayHelper.IsZero: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsZero;
end;

function TEComplexDynArrayHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNaN;
end;

function TEComplexDynArrayHelper.IsNaNArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNaN;
end;

function TEComplexDynArrayHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsInfinity;
end;

function TEComplexDynArrayHelper.IsInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsInfinity;
end;

function TEComplexDynArrayHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNegativeInfinity;
end;

function TEComplexDynArrayHelper.IsNegativeInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNegativeInfinity;
end;

function TEComplexDynArrayHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsPositiveInfinity;
end;

function TEComplexDynArrayHelper.IsPositiveInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsPositiveInfinity;
end;

function TEComplexDynArrayHelper.First(): TEComplex;
begin
  Result := Self[Low];
end;

function TEComplexDynArrayHelper.Last(): TEComplex;
begin
  Result := Self[High];
end;

function TEComplexDynArrayHelper.Imag: TExtendedDynArray;
var
  I: Integer;
begin
  Result := TExtendedDynArray.Create(Length);
  for I := Low to High do
    Result[I] := Self[I].Im;
end;

function TEComplexDynArrayHelper.Inverse: TEComplexDynArray;
var
  I: Integer;
begin
  Result := TEComplexDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := 1 / Self[I];
end;

function TEComplexDynArrayHelper.Prod: TEComplex;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;

  Result := 1;
  for I := Low to High do
    Result := Result * Self[I]
end;

function TEComplexDynArrayHelper.ReverseArray: TEComplexDynArray;
var
  I, J: Integer;
begin
  Result := TEComplexDynArray.Create(Length);
  J := 0;
  for I := High downto Low do
  begin
    Result[J] := Self[I];
    System.Inc(J);
  end;
end;

function TEComplexDynArrayHelper.DeleteIndexes(const AIndexes: TIntegerDynArray): TEComplexDynArray;
var
  J, L, K: Integer;
begin
  L := Length;
  K := System.Length(AIndexes);
  if L - K <= 0 then
    Exit;

  Result := TEComplexDynArray.Create(L - K);
  L := 0;
  for J := 0 to K - 1 do
  begin
    Result[L] := Self[AIndexes[J]];
    System.Inc(L);
  end;
end;

function TEComplexDynArrayHelper.DeleteValues(const AStates: TBooleanDynArray): TEComplexDynArray;
var
  I, LCounter: Integer;
begin
  NeedSameLength(Self.Length, System.Length(AStates));

  LCounter := 0;
  for I := Low to High do
    if AStates[I] then
      System.Inc(LCounter);
  Result := TEComplexDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if not AStates[I] then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TEComplexDynArrayHelper.Sort;
begin
  TArray.Sort<TEComplex>(Self);
end;

procedure TEComplexDynArrayHelper.Sort(var AIndexes: TIntegerDynArray);
var
  Lo, Hi: Integer;
  Pivot, T: TEComplex;
  I, ti: Integer;

  procedure qSort(var a: TEComplexDynArray; iLo, iHi: Integer; var AIndexes: TIntegerDynArray);
  begin
    Lo := iLo;
    Hi := iHi;
    Pivot := a[(Lo + Hi) div 2];
    repeat
      while a[Lo] < Pivot do
        Lo := Lo + 1;
      while a[Hi] > Pivot do
        Hi := Hi - 1;
      if Lo <= Hi then
      begin
        T := a[Lo];
        a[Lo] := a[Hi];
        a[Hi] := T;
        ti := AIndexes[Lo];
        AIndexes[Lo] := AIndexes[Hi];
        AIndexes[Hi] := ti;
        Lo := Lo + 1;
        Hi := Hi - 1;
      end;
    until Lo > Hi;
    if Hi > iLo then
      qSort(a, iLo, Hi, AIndexes);
    if Lo < iHi then
      qSort(a, Lo, iHi, AIndexes);
  end;

begin
  System.SetLength(AIndexes, Length);
  for I := Low to High do
    AIndexes[I] := I;

  qSort(Self, Low, High, AIndexes);
end;

procedure TEComplexDynArrayHelper.SortWithOrder(const AOrderIndexes: TIntegerDynArray);
var
  I: Integer;
begin
  for I := System.Low(AOrderIndexes) to System.High(AOrderIndexes) do
    TSwapOp<TEComplex>.Swap(Self[AOrderIndexes[I]], Self[I]);
  Resize(System.Length(AOrderIndexes));
end;

function TEComplexDynArrayHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormatSettings);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TEComplexDynArrayHelper.ToString: string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TEComplexDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TEComplexDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '[' + string.Join(VectorItemDelimiter, R) + ']';
end;

function TEComplexDynArrayHelper._ToString(const ASeparator: string): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := '[' + string.Join(ASeparator, R) + ']';
end;

procedure TEComplexDynArrayHelper.ClearImag;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].Im := ZeroValue;
end;

procedure TEComplexDynArrayHelper.ClearReal;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].Im := ZeroValue;
end;

procedure TEComplexDynArrayHelper.Conjugate;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I].Conjugate;
end;

constructor TEComplexDynArrayHelper.Create(const AVector: TExtendedDynArray);
var
  I: Integer;
begin
  Self := TEComplexDynArray.Create(AVector.Length);
  for I := Low to High do
    Self[I].SetValue(AVector[I]);
end;

constructor TEComplexDynArrayHelper.Create(const AVectorRe, AVectorIm: TExtendedDynArray);
var
  I: Integer;
begin
  Self := TEComplexDynArray.Create(AVectorRe.Length);
  for I := Low to High do
    Self[I].SetValue(AVectorRe[I], AVectorIm[I]);
end;

end.

