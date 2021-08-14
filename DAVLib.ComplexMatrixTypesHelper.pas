unit DAVLib.ComplexMatrixTypesHelper;

interface

uses
  System.SysUtils, DAVLib.Types, DAVLib.ComplexType,
  DAVLib.ComplexVectorTypesHelper, DAVLib.MatrixTypesHelper;

type
  TDComplexDynMatrixHelper = record helper for TDComplexDynMatrix
  private
    procedure MustBeSquare;
    function GetCofactor(const ARow, ACol: Integer): TDComplex;
    function GetColCount: Integer;
    function GetDeterminant: TDComplex;
    function GetItem(const ARow, ACol: Integer): TDComplex;
    function GetMinor(const ARow, ACol: Integer): TDComplex;
    function GetRowCount: Integer;
    function GetSize: Integer;
    function GetTrace: TDComplex;
    function GetMaxValue: TDComplex;
    function GetMinValue: TDComplex;
    procedure SetItem(const ARow, ACol: Integer; const AValue: TDComplex);
    function GetIsSquare: Boolean;
    function GetCol(const AIndex: Integer): TDComplexDynArray;
    function GetRow(const AIndex: Integer): TDComplexDynArray;
    function GetIsDiagonal: Boolean;
    function GetIsIdentity: Boolean;
    function GetIsSymmetric: Boolean;
    function GetIsZero: Boolean;
    function GetPItem(const ARow, ACol: Integer): PDComplex;
    procedure SetCol(const AIndex: Integer; const AValue: TDComplexDynArray);
    procedure SetRow(const AIndex: Integer; const AValue: TDComplexDynArray);
    function GetDeviation: TDComplex;
    function GetMean: TDComplex;
    function GetNorm: TDComplex;
    function GetSum: TDComplex;
    function GetVariance: TDComplex;
  public
    constructor Create(const ARowCount, AColCount: Integer); overload;
    constructor Create(const AMatrix: TDComplexDynMatrix); overload;
    constructor Create(const AMatrixStr: string); overload;
    constructor Create(const ADimension: Integer); overload;
    constructor Create(const AVector1, AVector2: TDComplexDynArray); overload;
    constructor Ones(const ARowCount, AColCount: Integer);
    constructor Diag(const AVector: TDComplexDynArray);
    constructor Eye(const ARowCount, AColCount: Integer); overload;
    constructor Eye(const ADimension: Integer); overload;
    procedure Assign(const ASource: TDComplexDynMatrix);
    procedure AssignTo(const ADest: TDComplexDynMatrix);
    procedure Zero;
    procedure Fill(const AValue: TDComplex);
    procedure Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
    function MaxItem(var ARowIndex, AColIndex: Integer): TDComplex;
    function MinItem(var ARowIndex, AColIndex: Integer): TDComplex;
    function ForEach(const AProc: TEleventProc<TDComplex>): TDComplexDynMatrix;
    procedure Apply(const AProc: TEleventProc<TDComplex>);
    procedure Normalize;
    procedure Transpose;
    procedure Exchange;
    procedure Inverse;
    function Normalized: TDComplexDynMatrix;
    function Transposed: TDComplexDynMatrix;
    function Exchanged: TDComplexDynMatrix;
    function Inversed: TDComplexDynMatrix;
    function ToString: string; overload;
    function _ToString(const AMatrixSeparator, AVectorSeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    property RowCount: Integer read GetRowCount;
    property ColCount: Integer read GetColCount;
    property IsSquare: Boolean read GetIsSquare;
    property IsSymmetric: Boolean read GetIsSymmetric;
    property IsDiagonal: Boolean read GetIsDiagonal;
    property IsIdentity: Boolean read GetIsIdentity;
    property IsZero: Boolean read GetIsZero;
    property Size: Integer read GetSize;
    property Norm: TDComplex read GetNorm;
    property Sum: TDComplex read GetSum;
    property Mean: TDComplex read GetMean;
    property Variance: TDComplex read GetVariance;
    property Deviation: TDComplex read GetDeviation;
    property MaxValue: TDComplex read GetMaxValue;
    property MinValue: TDComplex read GetMinValue;
    property Trace: TDComplex read GetTrace;
    property Determinant: TDComplex read GetDeterminant;
    property Row[const AIndex: Integer]: TDComplexDynArray read GetRow write SetRow;
    property Col[const AIndex: Integer]: TDComplexDynArray read GetCol write SetCol;
    property Item[const ARow, ACol: Integer]: TDComplex read GetItem write SetItem;
    property PItem[const ARow, ACol: Integer]: PDComplex read GetPItem;
    property Minor[const ARow, ACol: Integer]: TDComplex read GetMinor;
    property Cofactor[const ARow, ACol: Integer]: TDComplex read GetCofactor;
    function LowRow: Integer;
    function HighRow: Integer;
    function LowCol: Integer;
    function HighCol: Integer;
    function ToVector: TDComplexDynArray;
    function Negative: TDComplexDynMatrix;
    function Equal(const AMatrix: TDComplexDynMatrix): Boolean; overload;
    function Equal(const AValue: TDComplex): Boolean; overload;
    function NotEqual(const AMatrix: TDComplexDynMatrix): Boolean; overload;
    function NotEqual(const AValue: TDComplex): Boolean; overload;
    function First(): TDComplexDynArray;
    function Last(): TDComplexDynArray;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Prod: TDComplex;
    function ReverseArray: TDComplexDynMatrix;
    procedure Sort;
    class function Parse(const AMatrixStr: string): TDComplexDynMatrix; static;
    function AddDown(const AMatrix: TDComplexDynMatrix): TDComplexDynMatrix; overload;
    function AddDown(const AVector: TDComplexDynArray): TDComplexDynMatrix; overload;
    function AddRight(const AMatrix: TDComplexDynMatrix): TDComplexDynMatrix; overload;
    function AddRight(const AVector: TDComplexDynArray): TDComplexDynMatrix; overload;
    procedure Multiply(const AValue: TDComplex); overload;
    function Multiply(const AMatrix: TDComplexDynMatrix): TDComplexDynMatrix; overload;
    procedure Add(const AValue: TDComplex); overload;
    procedure Add(const AMatrix: TDComplexDynMatrix); overload;
    procedure Divide(const AValue: TDComplex); overload;
    procedure Subtract(const AValue: TDComplex); overload;
    procedure Subtract(const AMatrix: TDComplexDynMatrix); overload;
    constructor Create(const AMatrixRe, AMatrixIm: TDoubleDynMatrix); overload;
    constructor Create(const AMatrix: TDoubleDynMatrix); overload;
    function Real: TDoubleDynMatrix;
    function Imag: TDoubleDynMatrix;
    procedure ClearReal;
    procedure ClearImag;
    procedure Conjugate();
    procedure i1();
    function SqrAbs: TDoubleDynMatrix;
    function Magnitude: TDoubleDynMatrix;
    function Angle: TDoubleDynMatrix;
  end;

  TSComplexDynMatrixHelper = record helper for TSComplexDynMatrix
  private
    procedure MustBeSquare;
    function GetCofactor(const ARow, ACol: Integer): TSComplex;
    function GetColCount: Integer;
    function GetDeterminant: TSComplex;
    function GetItem(const ARow, ACol: Integer): TSComplex;
    function GetMinor(const ARow, ACol: Integer): TSComplex;
    function GetRowCount: Integer;
    function GetSize: Integer;
    function GetTrace: TSComplex;
    function GetMaxValue: TSComplex;
    function GetMinValue: TSComplex;
    procedure SetItem(const ARow, ACol: Integer; const AValue: TSComplex);
    function GetIsSquare: Boolean;
    function GetCol(const AIndex: Integer): TSComplexDynArray;
    function GetRow(const AIndex: Integer): TSComplexDynArray;
    function GetIsDiagonal: Boolean;
    function GetIsIdentity: Boolean;
    function GetIsSymmetric: Boolean;
    function GetIsZero: Boolean;
    function GetPItem(const ARow, ACol: Integer): PSComplex;
    procedure SetCol(const AIndex: Integer; const AValue: TSComplexDynArray);
    procedure SetRow(const AIndex: Integer; const AValue: TSComplexDynArray);
    function GetDeviation: TSComplex;
    function GetMean: TSComplex;
    function GetNorm: TSComplex;
    function GetSum: TSComplex;
    function GetVariance: TSComplex;
  public
    constructor Create(const ARowCount, AColCount: Integer); overload;
    constructor Create(const AMatrix: TSComplexDynMatrix); overload;
    constructor Create(const ADimension: Integer); overload;
    constructor Create(const AVector1, AVector2: TSComplexDynArray); overload;
    constructor Create(const AMatrixStr: string); overload;
    constructor Ones(const ARowCount, AColCount: Integer);
    constructor Diag(const AVector: TSComplexDynArray);
    constructor Eye(const ARowCount, AColCount: Integer); overload;
    constructor Eye(const ADimension: Integer); overload;
    procedure Assign(const ASource: TSComplexDynMatrix);
    procedure AssignTo(const ADest: TSComplexDynMatrix);
    procedure Zero;
    procedure Fill(const AValue: TSComplex);
    procedure Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
    function MaxItem(var ARowIndex, AColIndex: Integer): TSComplex;
    function MinItem(var ARowIndex, AColIndex: Integer): TSComplex;
    function ForEach(const AProc: TEleventProc<TSComplex>): TSComplexDynMatrix;
    procedure Apply(const AProc: TEleventProc<TSComplex>);
    procedure Normalize;
    procedure Transpose;
    procedure Exchange;
    procedure Inverse;
    function Normalized: TSComplexDynMatrix;
    function Transposed: TSComplexDynMatrix;
    function Exchanged: TSComplexDynMatrix;
    function Inversed: TSComplexDynMatrix;
    function ToString: string; overload;
    function _ToString(const AMatrixSeparator, AVectorSeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    property RowCount: Integer read GetRowCount;
    property ColCount: Integer read GetColCount;
    property IsSquare: Boolean read GetIsSquare;
    property IsSymmetric: Boolean read GetIsSymmetric;
    property IsDiagonal: Boolean read GetIsDiagonal;
    property IsIdentity: Boolean read GetIsIdentity;
    property IsZero: Boolean read GetIsZero;
    property Size: Integer read GetSize;
    property Norm: TSComplex read GetNorm;
    property Sum: TSComplex read GetSum;
    property Mean: TSComplex read GetMean;
    property Variance: TSComplex read GetVariance;
    property Deviation: TSComplex read GetDeviation;
    property MaxValue: TSComplex read GetMaxValue;
    property MinValue: TSComplex read GetMinValue;
    property Trace: TSComplex read GetTrace;
    property Determinant: TSComplex read GetDeterminant;
    property Row[const AIndex: Integer]: TSComplexDynArray read GetRow write SetRow;
    property Col[const AIndex: Integer]: TSComplexDynArray read GetCol write SetCol;
    property Item[const ARow, ACol: Integer]: TSComplex read GetItem write SetItem;
    property PItem[const ARow, ACol: Integer]: PSComplex read GetPItem;
    property Minor[const ARow, ACol: Integer]: TSComplex read GetMinor;
    property Cofactor[const ARow, ACol: Integer]: TSComplex read GetCofactor;
    function LowRow: Integer;
    function HighRow: Integer;
    function LowCol: Integer;
    function HighCol: Integer;
    function ToVector: TSComplexDynArray;
    function Negative: TSComplexDynMatrix;
    function Equal(const AMatrix: TSComplexDynMatrix): Boolean; overload;
    function Equal(const AValue: TSComplex): Boolean; overload;
    function NotEqual(const AMatrix: TSComplexDynMatrix): Boolean; overload;
    function NotEqual(const AValue: TSComplex): Boolean; overload;
    function First(): TSComplexDynArray;
    function Last(): TSComplexDynArray;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Prod: TSComplex;
    function ReverseArray: TSComplexDynMatrix;
    procedure Sort;
    class function Parse(const AMatrixStr: string): TSComplexDynMatrix; static;
    function AddDown(const AMatrix: TSComplexDynMatrix): TSComplexDynMatrix; overload;
    function AddDown(const AVector: TSComplexDynArray): TSComplexDynMatrix; overload;
    function AddRight(const AMatrix: TSComplexDynMatrix): TSComplexDynMatrix; overload;
    function AddRight(const AVector: TSComplexDynArray): TSComplexDynMatrix; overload;
    procedure Multiply(const AValue: TSComplex); overload;
    function Multiply(const AMatrix: TSComplexDynMatrix): TSComplexDynMatrix; overload;
    procedure Add(const AValue: TSComplex); overload;
    procedure Add(const AMatrix: TSComplexDynMatrix); overload;
    procedure Divide(const AValue: TSComplex); overload;
    procedure Subtract(const AValue: TSComplex); overload;
    procedure Subtract(const AMatrix: TSComplexDynMatrix); overload;
    constructor Create(const AMatrixRe, AMatrixIm: TSingleDynMatrix); overload;
    constructor Create(const AMatrix: TSingleDynMatrix); overload;
    function Real: TSingleDynMatrix;
    function Imag: TSingleDynMatrix;
    procedure ClearReal;
    procedure ClearImag;
    procedure Conjugate();
    procedure i1();
    function SqrAbs: TSingleDynMatrix;
    function Magnitude: TSingleDynMatrix;
    function Angle: TSingleDynMatrix;
  end;

  TEComplexDynMatrixHelper = record helper for TEComplexDynMatrix
  private
    procedure MustBeSquare;
    function GetCofactor(const ARow, ACol: Integer): TEComplex;
    function GetColCount: Integer;
    function GetDeterminant: TEComplex;
    function GetItem(const ARow, ACol: Integer): TEComplex;
    function GetMinor(const ARow, ACol: Integer): TEComplex;
    function GetRowCount: Integer;
    function GetSize: Integer;
    function GetTrace: TEComplex;
    function GetMaxValue: TEComplex;
    function GetMinValue: TEComplex;
    procedure SetItem(const ARow, ACol: Integer; const AValue: TEComplex);
    function GetIsSquare: Boolean;
    function GetCol(const AIndex: Integer): TEComplexDynArray;
    function GetRow(const AIndex: Integer): TEComplexDynArray;
    function GetIsDiagonal: Boolean;
    function GetIsIdentity: Boolean;
    function GetIsSymmetric: Boolean;
    function GetIsZero: Boolean;
    function GetPItem(const ARow, ACol: Integer): PEComplex;
    procedure SetCol(const AIndex: Integer; const AValue: TEComplexDynArray);
    procedure SetRow(const AIndex: Integer; const AValue: TEComplexDynArray);
    function GetDeviation: TEComplex;
    function GetMean: TEComplex;
    function GetNorm: TEComplex;
    function GetSum: TEComplex;
    function GetVariance: TEComplex;
  public
    constructor Create(const ARowCount, AColCount: Integer); overload;
    constructor Create(const AMatrix: TEComplexDynMatrix); overload;
    constructor Create(const ADimension: Integer); overload;
    constructor Create(const AVector1, AVector2: TEComplexDynArray); overload;
    constructor Create(const AMatrixStr: string); overload;
    constructor Ones(const ARowCount, AColCount: Integer);
    constructor Diag(const AVector: TEComplexDynArray);
    constructor Eye(const ARowCount, AColCount: Integer); overload;
    constructor Eye(const ADimension: Integer); overload;
    procedure Assign(const ASource: TEComplexDynMatrix);
    procedure AssignTo(const ADest: TEComplexDynMatrix);
    procedure Zero;
    procedure Fill(const AValue: TEComplex);
    procedure Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
    function MaxItem(var ARowIndex, AColIndex: Integer): TEComplex;
    function MinItem(var ARowIndex, AColIndex: Integer): TEComplex;
    function ForEach(const AProc: TEleventProc<TEComplex>): TEComplexDynMatrix;
    procedure Apply(const AProc: TEleventProc<TEComplex>);
    procedure Normalize;
    procedure Transpose;
    procedure Exchange;
    procedure Inverse;
    function Normalized: TEComplexDynMatrix;
    function Transposed: TEComplexDynMatrix;
    function Exchanged: TEComplexDynMatrix;
    function Inversed: TEComplexDynMatrix;
    function ToString: string; overload;
    function _ToString(const AMatrixSeparator, AVectorSeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    property RowCount: Integer read GetRowCount;
    property ColCount: Integer read GetColCount;
    property IsSquare: Boolean read GetIsSquare;
    property IsSymmetric: Boolean read GetIsSymmetric;
    property IsDiagonal: Boolean read GetIsDiagonal;
    property IsIdentity: Boolean read GetIsIdentity;
    property IsZero: Boolean read GetIsZero;
    property Size: Integer read GetSize;
    property Norm: TEComplex read GetNorm;
    property Sum: TEComplex read GetSum;
    property Mean: TEComplex read GetMean;
    property Variance: TEComplex read GetVariance;
    property Deviation: TEComplex read GetDeviation;
    property MaxValue: TEComplex read GetMaxValue;
    property MinValue: TEComplex read GetMinValue;
    property Trace: TEComplex read GetTrace;
    property Determinant: TEComplex read GetDeterminant;
    property Row[const AIndex: Integer]: TEComplexDynArray read GetRow write SetRow;
    property Col[const AIndex: Integer]: TEComplexDynArray read GetCol write SetCol;
    property Item[const ARow, ACol: Integer]: TEComplex read GetItem write SetItem;
    property PItem[const ARow, ACol: Integer]: PEComplex read GetPItem;
    property Minor[const ARow, ACol: Integer]: TEComplex read GetMinor;
    property Cofactor[const ARow, ACol: Integer]: TEComplex read GetCofactor;
    function LowRow: Integer;
    function HighRow: Integer;
    function LowCol: Integer;
    function HighCol: Integer;
    function ToVector: TEComplexDynArray;
    function Negative: TEComplexDynMatrix;
    function Equal(const AMatrix: TEComplexDynMatrix): Boolean; overload;
    function Equal(const AValue: TEComplex): Boolean; overload;
    function NotEqual(const AMatrix: TEComplexDynMatrix): Boolean; overload;
    function NotEqual(const AValue: TEComplex): Boolean; overload;
    function First(): TEComplexDynArray;
    function Last(): TEComplexDynArray;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Prod: TEComplex;
    function ReverseArray: TEComplexDynMatrix;
    procedure Sort;
    class function Parse(const AMatrixStr: string): TEComplexDynMatrix; static;
    function AddDown(const AMatrix: TEComplexDynMatrix): TEComplexDynMatrix; overload;
    function AddDown(const AVector: TEComplexDynArray): TEComplexDynMatrix; overload;
    function AddRight(const AMatrix: TEComplexDynMatrix): TEComplexDynMatrix; overload;
    function AddRight(const AVector: TEComplexDynArray): TEComplexDynMatrix; overload;
    procedure Multiply(const AValue: TEComplex); overload;
    function Multiply(const AMatrix: TEComplexDynMatrix): TEComplexDynMatrix; overload;
    procedure Add(const AValue: TEComplex); overload;
    procedure Add(const AMatrix: TEComplexDynMatrix); overload;
    procedure Divide(const AValue: TEComplex); overload;
    procedure Subtract(const AValue: TEComplex); overload;
    procedure Subtract(const AMatrix: TEComplexDynMatrix); overload;
    constructor Create(const AMatrixRe, AMatrixIm: TExtendedDynMatrix); overload;
    constructor Create(const AMatrix: TExtendedDynMatrix); overload;
    function Real: TExtendedDynMatrix;
    function Imag: TExtendedDynMatrix;
    procedure ClearReal;
    procedure ClearImag;
    procedure Conjugate();
    procedure i1();
    function SqrAbs: TExtendedDynMatrix;
    function Magnitude: TExtendedDynMatrix;
    function Angle: TExtendedDynMatrix;
  end;

implementation

uses
  DAVLib.SwapOperation, System.Math;

constructor TDComplexDynMatrixHelper.Create(const ARowCount, AColCount: Integer);
begin
  System.SetLength(Self, ARowCount, AColCount);
end;

function TDComplexDynMatrixHelper.LowRow: Integer;
begin
  Result := System.Low(Self);
end;

function TDComplexDynMatrixHelper.HighRow: Integer;
begin
  Result := System.High(Self);
end;

procedure TDComplexDynMatrixHelper.i1;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].i1;
end;

function TDComplexDynMatrixHelper.Last: TDComplexDynArray;
begin
  Result := Self[HighRow];
end;

function TDComplexDynMatrixHelper.LowCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.Low(Self[0]);
end;

function TDComplexDynMatrixHelper.HighCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.High(Self[0]);
end;

procedure TDComplexDynMatrixHelper.Zero;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Zero;
end;

function TDComplexDynMatrixHelper.GetRow(const AIndex: Integer): TDComplexDynArray;
begin
  Result := Self[AIndex];
end;

function TDComplexDynMatrixHelper.GetColCount: Integer;
begin
  Result := 0;
  if RowCount > 0 then
    Result := Self[0].Length;
end;

function TDComplexDynMatrixHelper.GetCol(const AIndex: Integer): TDComplexDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Result[I] := Self[I, AIndex];
end;

function TDComplexDynMatrixHelper.GetRowCount: Integer;
begin
  Result := System.Length(Self);
end;

function TDComplexDynMatrixHelper.GetSize: Integer;
begin
  Result := RowCount * ColCount * SizeOf(TDComplex);
end;

function TDComplexDynMatrixHelper.GetSum: TDComplex;
var
  I: Integer;
begin
  Result := 0;
  if RowCount = 0 then
    Exit;
  for I := LowRow to HighRow do
    Result := Result + Self[I].Sum;
end;

function TDComplexDynMatrixHelper.GetIsSquare: Boolean;
begin
  Result := RowCount = ColCount;
end;

procedure TDComplexDynMatrixHelper.Transpose;

  procedure DoSquare;
  var
    I, J: Integer;
  begin
    for I := LowRow to HighRow do
      for J := 0 to I - 1 do
      begin
        TSwapOp<TDComplex>.Swap(Self[I, J], Self[J, I]);
      end;
  end;

  procedure DoRectangle;
  var
    LMatrix: TDComplexDynMatrix;
    I, J: Integer;
  begin
    LMatrix := TDComplexDynMatrix.Create(Self);
    Self := TDComplexDynMatrix.Create(LMatrix.ColCount, LMatrix.RowCount);
    for I := LowRow to HighRow do
      for J := LowCol to HighCol do
        Self[I, J] := LMatrix[J, I];
  end;

begin
  if IsSquare then
    DoSquare
  else
    DoRectangle;
end;

function TDComplexDynMatrixHelper.Transposed: TDComplexDynMatrix;
begin
  Result := TDComplexDynMatrix.Create(Self);
  Result.Transpose;
end;

procedure TDComplexDynMatrixHelper.NaN;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NaN;
  end;
end;

function TDComplexDynMatrixHelper.Negative: TDComplexDynMatrix;
var
  I, J: Integer;
begin
  Result := TDComplexDynMatrix.Create(Self);
  for I := Result.LowRow to Result.HighRow do
    Result[I] := Result[I].Negative;
end;

procedure TDComplexDynMatrixHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NegativeInfinity;
  end;
end;

procedure TDComplexDynMatrixHelper.Multiply(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Multiply(AValue);
end;

function TDComplexDynMatrixHelper.AddDown(const AVector: TDComplexDynArray): TDComplexDynMatrix;
var
  LengthA, J: Integer;
begin
  if not Assigned(Self) then
  begin
    Result := [Copy(AVector)];
    Exit;
  end;

  if not Assigned(AVector) then
  begin
    Result := TDComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AVector.Length then
    raise EComplexMatrixError.Create('Can"t AddDown');

  Result := TDComplexDynMatrix.Create(LengthA + 1, Self.ColCount);
  for J := Self[Self.HighRow].Low to Self[Self.HighRow].High do
    Result[Self.HighRow, J] := AVector[J];
end;

function TDComplexDynMatrixHelper.AddDown(const AMatrix: TDComplexDynMatrix): TDComplexDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TDComplexDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TDComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AMatrix.ColCount then
    raise EComplexMatrixError.Create('Can"t AddDown');

  Result := TDComplexDynMatrix.Create(LengthA + AMatrix.RowCount, Self.ColCount);
  K := 0;
  for I := LengthA to Self.HighRow do
  begin
    for J := Self[I].Low to Self[I].High do
      Result[I, J] := AMatrix[K, J];
    System.Inc(K);
  end;
end;

function TDComplexDynMatrixHelper.AddRight(const AVector: TDComplexDynArray): TDComplexDynMatrix;
var
  LengthA, I: Integer;
begin
  if Self = nil then
  begin
    Result := [copy(AVector)];
    Exit;
  end;

  if AVector = nil then
  begin
    Result := TDComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AVector.Length then
    raise EComplexMatrixError.Create('Can"t AddRight');

  Result := TDComplexDynMatrix.Create(Self.RowCount, LengthA + 1);
  for I := AVector.Low to AVector.High do
    Result[I, LengthA] := AVector[I];
end;

function TDComplexDynMatrixHelper.Angle: TDoubleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Angle;
end;

function TDComplexDynMatrixHelper.AddRight(const AMatrix: TDComplexDynMatrix): TDComplexDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TDComplexDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TDComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AMatrix.RowCount then
    raise EComplexMatrixError.Create('Can"t AddRight');

  Result := TDComplexDynMatrix.Create(Self.RowCount, LengthA + AMatrix.ColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    K := 0;
    for J := LengthA to Self[I].High do
    begin
      Result[I, J] := AMatrix[I, K];
      System.Inc(K);
    end;
  end;
end;

procedure TDComplexDynMatrixHelper.Divide(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Divide(AValue);
end;

procedure TDComplexDynMatrixHelper.SetRow(const AIndex: Integer; const AValue: TDComplexDynArray);
begin
  Self[AIndex] := TDComplexDynArray.Create(AValue);
end;

procedure TDComplexDynMatrixHelper.SetItem(const ARow, ACol: Integer; const AValue: TDComplex);
begin
  Self[ARow, ACol] := AValue;
end;

procedure TDComplexDynMatrixHelper.SetCol(const AIndex: Integer; const AValue: TDComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(AValue.Length, Self.RowCount);
  MustBeInRange(AIndex, LowCol, HighCol);

  for I := Self.LowRow to Self.HighRow do
    Self[I, AIndex] := AValue[I];
end;

procedure TDComplexDynMatrixHelper.Sort;
var
  I, J, K: Integer;
  LTemp: TDComplexDynArray;
begin
  LTemp := Self.ToVector;
  LTemp.Sort;
  K := 0;
  for I := Self.LowRow to Self.HighRow do
  begin
    for J := Self.LowCol to Self.HighCol do
    begin
      Self[I, J] := LTemp[K];
      System.Inc(K);
    end;
  end;
end;

function TDComplexDynMatrixHelper.SqrAbs: TDoubleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].SqrAbs;
end;

procedure TDComplexDynMatrixHelper.Subtract(const AMatrix: TDComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AMatrix[I]);
end;

procedure TDComplexDynMatrixHelper.Subtract(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AValue);
end;

procedure TDComplexDynMatrixHelper.Add(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AValue);
end;

procedure TDComplexDynMatrixHelper.Add(const AMatrix: TDComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AMatrix[I]);
end;

procedure TDComplexDynMatrixHelper.MustBeSquare;
begin
  if not IsSquare then
    raise EComplexMatrixError.Create('Matrix must be square');
end;

procedure TDComplexDynMatrixHelper.Assign(const ASource: TDComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ASource.RowCount, Self.ColCount, ASource.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Assign(ASource[I]);
end;

procedure TDComplexDynMatrixHelper.AssignTo(const ADest: TDComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ADest.RowCount, Self.ColCount, ADest.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].AssignTo(ADest[I]);
end;

function TDComplexDynMatrixHelper.Multiply(const AMatrix: TDComplexDynMatrix): TDComplexDynMatrix;
var
  D: TDComplex;
  M, K, N: Integer;
  I, L, J: Integer;
begin
  K := Self.ColCount;
  NeedSameLength(K, AMatrix.RowCount);
  M := Self.RowCount;
  N := AMatrix.ColCount;
  Result := TDComplexDynMatrix.Create(M, N);
  System.Dec(M);
  System.Dec(K);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
    begin
      D.Zero;
      for L := 0 to K do
        D := D + Self[I, L] * AMatrix[L, J];
      Result[I, J] := D;
    end;
end;

constructor TDComplexDynMatrixHelper.Create(const AVector1, AVector2: TDComplexDynArray);
var
  M, N: Integer;
  I, J: Integer;
begin
  Self := Nil;
  M := AVector1.Length;
  N := AVector2.Length;
  System.SetLength(Self, M, N);
  System.Dec(M);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
      Self[I, J] := AVector1[I] * AVector2[J];
end;

constructor TDComplexDynMatrixHelper.Create(const ADimension: Integer);
begin
  SetLength(Self, ADimension, ADimension);
end;

constructor TDComplexDynMatrixHelper.Create(const AMatrix: TDComplexDynMatrix);
var
  I: Integer;
begin
  Self := Nil;
  SetLength(Self, AMatrix.RowCount);
  for I := Low(Self) to High(Self) do
  begin
    Self[I] := TDComplexDynArray.Create(AMatrix[I]);
  end;
end;

constructor TDComplexDynMatrixHelper.Diag(const AVector: TDComplexDynArray);
var
  I: Integer;
begin
  Self := TDComplexDynMatrix.Create(AVector.Length);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := AVector[I];
end;

function TDComplexDynMatrixHelper.Equal(const AMatrix: TDComplexDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AMatrix[I]);
  end;
end;

function TDComplexDynMatrixHelper.Equal(const AValue: TDComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AValue);
  end;
end;

procedure TDComplexDynMatrixHelper.Exchange;
var
  NM, L, i1, J1, I2, J2: Integer;
begin
  MustBeSquare;
  NM := RowCount - 1;
  for L := 0 to NM - 1 do
  begin
    i1 := L;
    J1 := 0;
    I2 := NM;
    J2 := NM - i1;
    repeat
      TSwapOp<TDComplex>.Swap(Self[i1, J1], Self[I2, J2]);
      System.Inc(i1);
      System.Inc(J1);
      System.Dec(I2);
      System.Dec(J2);
    until i1 >= I2;
  end;
end;

function TDComplexDynMatrixHelper.Exchanged: TDComplexDynMatrix;
begin
  MustBeSquare;
  Result := TDComplexDynMatrix.Create(Self);
  Result.Exchange;
end;

constructor TDComplexDynMatrixHelper.Eye(const ADimension: Integer);
var
  I: Integer;
begin
  Self := TDComplexDynMatrix.Create(ADimension);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := 1;
end;

constructor TDComplexDynMatrixHelper.Eye(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := TDComplexDynMatrix.Create(ARowCount, AColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    if I > Self.HighCol then
      Break;
    Self[I, I] := 1;
  end;
end;

procedure TDComplexDynMatrixHelper.Fill(const AValue: TDComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Fill(AValue);
end;

function TDComplexDynMatrixHelper.First: TDComplexDynArray;
begin
  Result := Self[LowRow];
end;

procedure TDComplexDynMatrixHelper.Apply(const AProc: TEleventProc<TDComplex>);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Apply(AProc);
end;

function TDComplexDynMatrixHelper.ForEach(const AProc: TEleventProc<TDComplex>): TDComplexDynMatrix;
begin
  Result := TDComplexDynMatrix.Create(Self);
  Result.Apply(AProc);
end;

function TDComplexDynMatrixHelper.Magnitude: TDoubleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Magnitude;
end;

function TDComplexDynMatrixHelper.MaxItem(var ARowIndex, AColIndex: Integer): TDComplex;
var
  D: TDComplex;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MaxItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MaxItem(J);
    if (D > Result) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TDComplexDynMatrixHelper.GetMaxValue: TDComplex;
var
  R, C: Integer;
begin
  Result := MaxItem(R, C);
end;

function TDComplexDynMatrixHelper.GetMean: TDComplex;
begin
  Result := Self.Sum / (RowCount * ColCount);
end;

function TDComplexDynMatrixHelper.MinItem(var ARowIndex, AColIndex: Integer): TDComplex;
var
  D: TDComplex;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MinItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MinItem(J);
    if (D < Result) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TDComplexDynMatrixHelper.GetMinor(const ARow, ACol: Integer): TDComplex;
var
  LMatrix: TDComplexDynMatrix;
  N, I, J, K, L: Integer;
begin
  N := System.Math.Max(RowCount, ColCount) - 1;
  if N <= 0 then
  begin
    Result := 1;
    Exit
  end;

  MustBeInRange(ARow, LowRow, HighRow);
  MustBeInRange(ACol, LowCol, HighCol);
  LMatrix := TDComplexDynMatrix.Create(N);
  for I := 0 to N do
    if I <> ARow then
    begin
      K := I;
      if I > ARow then
        System.Dec(K);
      for J := 0 to N do
        if J <> ACol then
        begin
          L := J;
          if J > ACol then
            System.Dec(L);
          LMatrix[K, L] := Self[I, J];
        end;
    end;
  Result := LMatrix.Determinant;
end;

function TDComplexDynMatrixHelper.GetCofactor(const ARow, ACol: Integer): TDComplex;
begin
  Result := GetMinor(ARow, ACol);
  if (ARow + ACol) and 1 <> 0 then
    Result := -Result;
end;

function TDComplexDynMatrixHelper.GetMinValue: TDComplex;
var
  R, C: Integer;
begin
  Result := MinItem(R, C);
end;

function TDComplexDynMatrixHelper.GetNorm: TDComplex;
var
  I, J: Integer;
begin
  Result := 0;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + Self[I, J].Sqr;
  Result := Result.Sqrt;
end;

function TDComplexDynMatrixHelper.GetPItem(const ARow, ACol: Integer): PDComplex;
begin
  Result := @Self[ARow, ACol];
end;

function TDComplexDynMatrixHelper.GetTrace: TDComplex;
var
  I: Integer;
begin
  MustBeSquare;
  Result := 0;
  for I := Low(Self) to High(Self) do
    Result := Result + Self[I, I];
end;

function TDComplexDynMatrixHelper.GetVariance: TDComplex;
var
  M: TDComplex;
  N, I, J: Integer;
begin
  Result := 0;
  N := RowCount * ColCount;
  if N = 0 then
    Exit;
  M := Mean;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + (Self[I, J] - M).Sqr;
  Result := Result / N;
end;

function TDComplexDynMatrixHelper.GetDeterminant: TDComplex;
var
  D: TDComplex;
  LMatrix: TDComplexDynMatrix;
  LVector: TDComplexDynArray;
  R, N, I, J: Integer;
  Sign: Integer;
begin
  MustBeSquare;
  LMatrix := TDComplexDynMatrix.Create(Self);

  N := RowCount - 1;
  if N < 0 then
  begin
    Result := 0;
    Exit
  end;
  R := 0;
  Result := 1;
  Sign := 1;
  repeat
    I := R;
    while (I <= N) and LMatrix[I, R].IsZero do
      System.Inc(I);
    if I > N then
    begin
      Result := 0;
      Exit
    end;
    if I > R then
    begin
      LVector := LMatrix[R];
      LMatrix[R] := LMatrix[I];
      LMatrix[I] := LVector;
      LVector := nil;
      Sign := -Sign
    end;
    D := LMatrix[R, R];
    LMatrix[R, R] := 1;
    if D <> 1 then
    begin
      Result := Result * D;
      for I := R + 1 to N do
        LMatrix[R, I] := LMatrix[R, I] / D;
    end;
    for I := R + 1 to N do
    begin
      D := LMatrix[I, R];
      LMatrix[I, R] := 0;
      for J := R + 1 to N do
        LMatrix[I, J] := LMatrix[I, J] - LMatrix[R, J] * D;
    end;
    System.Inc(R);
  until R >= N;
  Result := Sign * Result * LMatrix[N, N];
end;

function TDComplexDynMatrixHelper.GetDeviation: TDComplex;
begin
  Result := Variance.Sqrt;
end;

function TDComplexDynMatrixHelper.GetIsDiagonal: Boolean;
var
  I, J, N: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  N := High(Self);
  for I := 1 to N do
    for J := 0 to I - 1 do
      if not Self[I, J].IsZero then
        Exit;

  for I := 0 to N - 1 do
    for J := I + 1 to N do
      if not Self[I, J].IsZero then
        Exit;

  Result := true;
end;

function TDComplexDynMatrixHelper.GetIsIdentity: Boolean;
var
  I: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 0 to High(Self) do
    if Self[I, I] <> 1 then
      Exit;
  Result := IsDiagonal;
end;

function TDComplexDynMatrixHelper.GetIsSymmetric: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 1 to High(Self) do
    for J := 0 to I - 1 do
      if Self[I, J] <> Self[J, I] then
        Exit;
  Result := true;
end;

function TDComplexDynMatrixHelper.GetIsZero: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      if not Self[I, J].IsZero then
        Exit;
  Result := true;
end;

function TDComplexDynMatrixHelper.GetItem(const ARow, ACol: Integer): TDComplex;
begin
  Result := Self[ARow, ACol];
end;

function TDComplexDynMatrixHelper.Imag: TDoubleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Imag;
end;

procedure TDComplexDynMatrixHelper.Inverse;
var
  LMatrix: TDComplexDynMatrix;
  D: TDComplex;
  R, I, J, N: Integer;
begin
  MustBeSquare;
  LMatrix := TDComplexDynMatrix.Create(Self);
  N := RowCount;
  System.Dec(N);
  for R := 0 to N do
  begin
    if LMatrix[R, R].IsZero then
      raise EComplexMatrixError.Create('Inverse matrix by zeros in diag not implemented');

    D := 1 / LMatrix[R, R];
    Self[R, R] := D;
    for I := 0 to N do
      if I <> R then
      begin
        Self[I, R] := LMatrix[I, R] * D;
        Self[R, I] := -LMatrix[R, I] * D;
      end;

    for I := 0 to N do
      if I <> R then
        for J := 0 to N do
          if J <> R then
            Self[I, J] := LMatrix[I, J] - LMatrix[R, J] * LMatrix[I, R] * D;

    if R < N then
      LMatrix.Assign(Self);
  end;
end;

function TDComplexDynMatrixHelper.Inversed: TDComplexDynMatrix;
begin
  MustBeSquare;
  Result := TDComplexDynMatrix.Create(Self);
  Result.Inverse;
end;

function TDComplexDynMatrixHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsInfinity;
end;

function TDComplexDynMatrixHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNaN;
end;

function TDComplexDynMatrixHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNegativeInfinity;
end;

function TDComplexDynMatrixHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsPositiveInfinity;
end;

procedure TDComplexDynMatrixHelper.Normalize;
var
  D: TDComplex;
  I, J: Integer;
begin
  D := MaxValue;
  if D.IsZero then
    Exit;
  D := 1 / D;

  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      Self[I, J] := Self[I, J] * D;
end;

function TDComplexDynMatrixHelper.Normalized: TDComplexDynMatrix;
begin
  Result := TDComplexDynMatrix.Create(Self);
  Result.Normalize;
end;

function TDComplexDynMatrixHelper.NotEqual(const AValue: TDComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AValue);
end;

constructor TDComplexDynMatrixHelper.Ones(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := Nil;
  System.SetLength(Self, ARowCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I] := TDComplexDynArray.Ones(AColCount);
  end;
end;

function TDComplexDynMatrixHelper.NotEqual(const AMatrix: TDComplexDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AMatrix[I]);
end;

function TDComplexDynMatrixHelper.Real: TDoubleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Real;
end;

procedure TDComplexDynMatrixHelper.Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
var
  R, I: Integer;
begin
  if ARowCount <= 0 then
  begin
    Self := nil;
    Exit
  end;
  if (RowCount = ARowCount) and (ColCount = AColCount) then
  begin
    if not ASaveData then
      Zero;
    Exit;
  end;

  if RowCount <> ARowCount then
  begin
    R := RowCount;
    if R > ARowCount then
      for I := ARowCount to R - 1 do
        Self[I] := nil;
    SetLength(Self, ARowCount);
  end;

  for I := Low(Self) to High(Self) do
    TDComplexDynArray(Self[I]).Resize(AColCount, ASaveData);
end;

function TDComplexDynMatrixHelper.ReverseArray: TDComplexDynMatrix;
var
  I, J: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  J := 0;
  for I := Self.HighRow downto Self.LowRow do
  begin
    Result[J] := Self[I].ReverseArray;
    System.Inc(J);
  end;
end;

function TDComplexDynMatrixHelper.ToVector: TDComplexDynArray;
var
  I, J, K: Integer;
begin
  Result := TDComplexDynArray.Create(Self.RowCount * Self.ColCount);
  K := 0;
  for I := Self.LowRow to Self.HighRow do
  begin
    for J := Self.LowCol to Self.HighCol do
    begin
      Result[K] := Self[I, J];
      System.Inc(K);
    end;
  end;
end;

function TDComplexDynMatrixHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TDComplexDynMatrixHelper.ToString: string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString;
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TDComplexDynMatrixHelper._ToString(const AMatrixSeparator, AVectorSeparator: string): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I]._ToString(AVectorSeparator);
  Result := '{' + string.Join(AMatrixSeparator, S) + '}';
end;

function TDComplexDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TDComplexDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

constructor TDComplexDynMatrixHelper.Create(const AMatrixStr: string);
begin
  Self := Parse(AMatrixStr);
end;

class function TDComplexDynMatrixHelper.Parse(const AMatrixStr: string): TDComplexDynMatrix;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AMatrixStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([MatrixVectorDelimiter]);
  L := Length(LStrArray);
  System.SetLength(Result, L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := TDComplexDynArray.Parse(LStrArray[I]);
end;

procedure TDComplexDynMatrixHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].PositiveInfinity;
  end;
end;

function TDComplexDynMatrixHelper.Prod: TDComplex;
var
  I: Integer;
begin
  Result := 1;
  for I := Self.LowRow to Self.HighRow do
    Result := Result * Self[I].Prod;
end;

procedure TDComplexDynMatrixHelper.ClearImag;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].ClearImag;
end;

procedure TDComplexDynMatrixHelper.ClearReal;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].ClearReal;
end;

procedure TDComplexDynMatrixHelper.Conjugate;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Conjugate;
end;

constructor TDComplexDynMatrixHelper.Create(const AMatrix: TDoubleDynMatrix);
var
  I: Integer;
begin
  System.SetLength(Self, AMatrix.RowCount);
  for I := AMatrix.LowRow to AMatrix.HighRow do
    Self[I] := TDComplexDynArray.Create(AMatrix[I]);
end;

constructor TDComplexDynMatrixHelper.Create(const AMatrixRe, AMatrixIm: TDoubleDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(AMatrixRe.RowCount, AMatrixIm.RowCount);
  System.SetLength(Self, AMatrixRe.RowCount);
  for I := AMatrixRe.LowRow to AMatrixRe.HighRow do
    Self[I] := TDComplexDynArray.Create(AMatrixRe[I], AMatrixIm[I]);
end;

///
///  SComplex
///

constructor TSComplexDynMatrixHelper.Create(const ARowCount, AColCount: Integer);
begin
  System.SetLength(Self, ARowCount, AColCount);
end;

function TSComplexDynMatrixHelper.LowRow: Integer;
begin
  Result := System.Low(Self);
end;

function TSComplexDynMatrixHelper.HighRow: Integer;
begin
  Result := System.High(Self);
end;

procedure TSComplexDynMatrixHelper.i1;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].i1;
end;

function TSComplexDynMatrixHelper.Last: TSComplexDynArray;
begin
  Result := Self[HighRow];
end;

function TSComplexDynMatrixHelper.LowCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.Low(Self[0]);
end;

function TSComplexDynMatrixHelper.HighCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.High(Self[0]);
end;

procedure TSComplexDynMatrixHelper.Zero;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Zero;
end;

function TSComplexDynMatrixHelper.GetRow(const AIndex: Integer): TSComplexDynArray;
begin
  Result := Self[AIndex];
end;

function TSComplexDynMatrixHelper.GetColCount: Integer;
begin
  Result := 0;
  if RowCount > 0 then
    Result := Self[0].Length;
end;

function TSComplexDynMatrixHelper.GetCol(const AIndex: Integer): TSComplexDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Result[I] := Self[I, AIndex];
end;

function TSComplexDynMatrixHelper.GetRowCount: Integer;
begin
  Result := System.Length(Self);
end;

function TSComplexDynMatrixHelper.GetSize: Integer;
begin
  Result := RowCount * ColCount * SizeOf(TSComplex);
end;

function TSComplexDynMatrixHelper.GetSum: TSComplex;
var
  I: Integer;
begin
  Result := 0;
  if RowCount = 0 then
    Exit;
  for I := LowRow to HighRow do
    Result := Result + Self[I].Sum;
end;

function TSComplexDynMatrixHelper.GetIsSquare: Boolean;
begin
  Result := RowCount = ColCount;
end;

procedure TSComplexDynMatrixHelper.Transpose;

  procedure DoSquare;
  var
    I, J: Integer;
  begin
    for I := LowRow to HighRow do
      for J := 0 to I - 1 do
      begin
        TSwapOp<TSComplex>.Swap(Self[I, J], Self[J, I]);
      end;
  end;

  procedure DoRectangle;
  var
    LMatrix: TSComplexDynMatrix;
    I, J: Integer;
  begin
    LMatrix := TSComplexDynMatrix.Create(Self);
    Self := TSComplexDynMatrix.Create(LMatrix.ColCount, LMatrix.RowCount);
    for I := LowRow to HighRow do
      for J := LowCol to HighCol do
        Self[I, J] := LMatrix[J, I];
  end;

begin
  if IsSquare then
    DoSquare
  else
    DoRectangle;
end;

function TSComplexDynMatrixHelper.Transposed: TSComplexDynMatrix;
begin
  Result := TSComplexDynMatrix.Create(Self);
  Result.Transpose;
end;

procedure TSComplexDynMatrixHelper.NaN;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NaN;
  end;
end;

function TSComplexDynMatrixHelper.Negative: TSComplexDynMatrix;
var
  I, J: Integer;
begin
  Result := TSComplexDynMatrix.Create(Self);
  for I := Result.LowRow to Result.HighRow do
    Result[I] := Result[I].Negative;
end;

procedure TSComplexDynMatrixHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NegativeInfinity;
  end;
end;

procedure TSComplexDynMatrixHelper.Multiply(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Multiply(AValue);
end;

function TSComplexDynMatrixHelper.AddDown(const AVector: TSComplexDynArray): TSComplexDynMatrix;
var
  LengthA, J: Integer;
begin
  if not Assigned(Self) then
  begin
    Result := [Copy(AVector)];
    Exit;
  end;

  if not Assigned(AVector) then
  begin
    Result := TSComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AVector.Length then
    raise EComplexMatrixError.Create('Can"t AddDown');

  Result := TSComplexDynMatrix.Create(LengthA + 1, Self.ColCount);
  for J := Self[Self.HighRow].Low to Self[Self.HighRow].High do
    Result[Self.HighRow, J] := AVector[J];
end;

function TSComplexDynMatrixHelper.AddDown(const AMatrix: TSComplexDynMatrix): TSComplexDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TSComplexDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TSComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AMatrix.ColCount then
    raise EComplexMatrixError.Create('Can"t AddDown');

  Result := TSComplexDynMatrix.Create(LengthA + AMatrix.RowCount, Self.ColCount);
  K := 0;
  for I := LengthA to Self.HighRow do
  begin
    for J := Self[I].Low to Self[I].High do
      Result[I, J] := AMatrix[K, J];
    System.Inc(K);
  end;
end;

function TSComplexDynMatrixHelper.AddRight(const AVector: TSComplexDynArray): TSComplexDynMatrix;
var
  LengthA, I: Integer;
begin
  if Self = nil then
  begin
    Result := [copy(AVector)];
    Exit;
  end;

  if AVector = nil then
  begin
    Result := TSComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AVector.Length then
    raise EComplexMatrixError.Create('Can"t AddRight');

  Result := TSComplexDynMatrix.Create(Self.RowCount, LengthA + 1);
  for I := AVector.Low to AVector.High do
    Result[I, LengthA] := AVector[I];
end;

function TSComplexDynMatrixHelper.Angle: TSingleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Angle;
end;

function TSComplexDynMatrixHelper.AddRight(const AMatrix: TSComplexDynMatrix): TSComplexDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TSComplexDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TSComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AMatrix.RowCount then
    raise EComplexMatrixError.Create('Can"t AddRight');

  Result := TSComplexDynMatrix.Create(Self.RowCount, LengthA + AMatrix.ColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    K := 0;
    for J := LengthA to Self[I].High do
    begin
      Result[I, J] := AMatrix[I, K];
      System.Inc(K);
    end;
  end;
end;

procedure TSComplexDynMatrixHelper.Divide(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Divide(AValue);
end;

procedure TSComplexDynMatrixHelper.SetRow(const AIndex: Integer; const AValue: TSComplexDynArray);
begin
  Self[AIndex] := TSComplexDynArray.Create(AValue);
end;

procedure TSComplexDynMatrixHelper.SetItem(const ARow, ACol: Integer; const AValue: TSComplex);
begin
  Self[ARow, ACol] := AValue;
end;

procedure TSComplexDynMatrixHelper.SetCol(const AIndex: Integer; const AValue: TSComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(AValue.Length, Self.RowCount);
  MustBeInRange(AIndex, LowCol, HighCol);

  for I := Self.LowRow to Self.HighRow do
    Self[I, AIndex] := AValue[I];
end;

procedure TSComplexDynMatrixHelper.Sort;
var
  I, J, K: Integer;
  LTemp: TSComplexDynArray;
begin
  LTemp := Self.ToVector;
  LTemp.Sort;
  K := 0;
  for I := Self.LowRow to Self.HighRow do
  begin
    for J := Self.LowCol to Self.HighCol do
    begin
      Self[I, J] := LTemp[K];
      System.Inc(K);
    end;
  end;
end;

function TSComplexDynMatrixHelper.SqrAbs: TSingleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].SqrAbs;
end;

procedure TSComplexDynMatrixHelper.Subtract(const AMatrix: TSComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AMatrix[I]);
end;

procedure TSComplexDynMatrixHelper.Subtract(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AValue);
end;

procedure TSComplexDynMatrixHelper.Add(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AValue);
end;

procedure TSComplexDynMatrixHelper.Add(const AMatrix: TSComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AMatrix[I]);
end;

procedure TSComplexDynMatrixHelper.MustBeSquare;
begin
  if not IsSquare then
    raise EComplexMatrixError.Create('Matrix must be square');
end;

procedure TSComplexDynMatrixHelper.Assign(const ASource: TSComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ASource.RowCount, Self.ColCount, ASource.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Assign(ASource[I]);
end;

procedure TSComplexDynMatrixHelper.AssignTo(const ADest: TSComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ADest.RowCount, Self.ColCount, ADest.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].AssignTo(ADest[I]);
end;

function TSComplexDynMatrixHelper.Multiply(const AMatrix: TSComplexDynMatrix): TSComplexDynMatrix;
var
  D: TSComplex;
  M, K, N: Integer;
  I, L, J: Integer;
begin
  K := Self.ColCount;
  NeedSameLength(K, AMatrix.RowCount);
  M := Self.RowCount;
  N := AMatrix.ColCount;
  Result := TSComplexDynMatrix.Create(M, N);
  System.Dec(M);
  System.Dec(K);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
    begin
      D.Zero;
      for L := 0 to K do
        D := D + Self[I, L] * AMatrix[L, J];
      Result[I, J] := D;
    end;
end;

constructor TSComplexDynMatrixHelper.Create(const AVector1, AVector2: TSComplexDynArray);
var
  M, N: Integer;
  I, J: Integer;
begin
  Self := Nil;
  M := AVector1.Length;
  N := AVector2.Length;
  System.SetLength(Self, M, N);
  System.Dec(M);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
      Self[I, J] := AVector1[I] * AVector2[J];
end;

constructor TSComplexDynMatrixHelper.Create(const ADimension: Integer);
begin
  SetLength(Self, ADimension, ADimension);
end;

constructor TSComplexDynMatrixHelper.Create(const AMatrix: TSComplexDynMatrix);
var
  I: Integer;
begin
  Self := Nil;
  SetLength(Self, AMatrix.RowCount);
  for I := Low(Self) to High(Self) do
  begin
    Self[I] := TSComplexDynArray.Create(AMatrix[I]);
  end;
end;

constructor TSComplexDynMatrixHelper.Diag(const AVector: TSComplexDynArray);
var
  I: Integer;
begin
  Self := TSComplexDynMatrix.Create(AVector.Length);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := AVector[I];
end;

function TSComplexDynMatrixHelper.Equal(const AMatrix: TSComplexDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AMatrix[I]);
  end;
end;

function TSComplexDynMatrixHelper.Equal(const AValue: TSComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AValue);
  end;
end;

procedure TSComplexDynMatrixHelper.Exchange;
var
  NM, L, i1, J1, I2, J2: Integer;
begin
  MustBeSquare;
  NM := RowCount - 1;
  for L := 0 to NM - 1 do
  begin
    i1 := L;
    J1 := 0;
    I2 := NM;
    J2 := NM - i1;
    repeat
      TSwapOp<TSComplex>.Swap(Self[i1, J1], Self[I2, J2]);
      System.Inc(i1);
      System.Inc(J1);
      System.Dec(I2);
      System.Dec(J2);
    until i1 >= I2;
  end;
end;

function TSComplexDynMatrixHelper.Exchanged: TSComplexDynMatrix;
begin
  MustBeSquare;
  Result := TSComplexDynMatrix.Create(Self);
  Result.Exchange;
end;

constructor TSComplexDynMatrixHelper.Eye(const ADimension: Integer);
var
  I: Integer;
begin
  Self := TSComplexDynMatrix.Create(ADimension);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := 1;
end;

constructor TSComplexDynMatrixHelper.Eye(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := TSComplexDynMatrix.Create(ARowCount, AColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    if I > Self.HighCol then
      Break;
    Self[I, I] := 1;
  end;
end;

procedure TSComplexDynMatrixHelper.Fill(const AValue: TSComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Fill(AValue);
end;

function TSComplexDynMatrixHelper.First: TSComplexDynArray;
begin
  Result := Self[LowRow];
end;

procedure TSComplexDynMatrixHelper.Apply(const AProc: TEleventProc<TSComplex>);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Apply(AProc);
end;

function TSComplexDynMatrixHelper.ForEach(const AProc: TEleventProc<TSComplex>): TSComplexDynMatrix;
begin
  Result := TSComplexDynMatrix.Create(Self);
  Result.Apply(AProc);
end;

function TSComplexDynMatrixHelper.Magnitude: TSingleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Magnitude;
end;

function TSComplexDynMatrixHelper.MaxItem(var ARowIndex, AColIndex: Integer): TSComplex;
var
  D: TSComplex;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MaxItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MaxItem(J);
    if (D > Result) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TSComplexDynMatrixHelper.GetMaxValue: TSComplex;
var
  R, C: Integer;
begin
  Result := MaxItem(R, C);
end;

function TSComplexDynMatrixHelper.GetMean: TSComplex;
begin
  Result := Self.Sum / (RowCount * ColCount);
end;

function TSComplexDynMatrixHelper.MinItem(var ARowIndex, AColIndex: Integer): TSComplex;
var
  D: TSComplex;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MinItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MinItem(J);
    if (D < Result) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TSComplexDynMatrixHelper.GetMinor(const ARow, ACol: Integer): TSComplex;
var
  LMatrix: TSComplexDynMatrix;
  N, I, J, K, L: Integer;
begin
  N := System.Math.Max(RowCount, ColCount) - 1;
  if N <= 0 then
  begin
    Result := 1;
    Exit
  end;

  MustBeInRange(ARow, LowRow, HighRow);
  MustBeInRange(ACol, LowCol, HighCol);
  LMatrix := TSComplexDynMatrix.Create(N);
  for I := 0 to N do
    if I <> ARow then
    begin
      K := I;
      if I > ARow then
        System.Dec(K);
      for J := 0 to N do
        if J <> ACol then
        begin
          L := J;
          if J > ACol then
            System.Dec(L);
          LMatrix[K, L] := Self[I, J];
        end;
    end;
  Result := LMatrix.Determinant;
end;

function TSComplexDynMatrixHelper.GetCofactor(const ARow, ACol: Integer): TSComplex;
begin
  Result := GetMinor(ARow, ACol);
  if (ARow + ACol) and 1 <> 0 then
    Result := -Result;
end;

function TSComplexDynMatrixHelper.GetMinValue: TSComplex;
var
  R, C: Integer;
begin
  Result := MinItem(R, C);
end;

function TSComplexDynMatrixHelper.GetNorm: TSComplex;
var
  I, J: Integer;
begin
  Result := 0;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + Self[I, J].Sqr;
  Result := Result.Sqrt;
end;

function TSComplexDynMatrixHelper.GetPItem(const ARow, ACol: Integer): PSComplex;
begin
  Result := @Self[ARow, ACol];
end;

function TSComplexDynMatrixHelper.GetTrace: TSComplex;
var
  I: Integer;
begin
  MustBeSquare;
  Result := 0;
  for I := Low(Self) to High(Self) do
    Result := Result + Self[I, I];
end;

function TSComplexDynMatrixHelper.GetVariance: TSComplex;
var
  M: TSComplex;
  N, I, J: Integer;
begin
  Result := 0;
  N := RowCount * ColCount;
  if N = 0 then
    Exit;
  M := Mean;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + (Self[I, J] - M).Sqr;
  Result := Result / N;
end;

function TSComplexDynMatrixHelper.GetDeterminant: TSComplex;
var
  D: TSComplex;
  LMatrix: TSComplexDynMatrix;
  LVector: TSComplexDynArray;
  R, N, I, J: Integer;
  Sign: Integer;
begin
  MustBeSquare;
  LMatrix := TSComplexDynMatrix.Create(Self);

  N := RowCount - 1;
  if N < 0 then
  begin
    Result := 0;
    Exit
  end;
  R := 0;
  Result := 1;
  Sign := 1;
  repeat
    I := R;
    while (I <= N) and LMatrix[I, R].IsZero do
      System.Inc(I);
    if I > N then
    begin
      Result := 0;
      Exit
    end;
    if I > R then
    begin
      LVector := LMatrix[R];
      LMatrix[R] := LMatrix[I];
      LMatrix[I] := LVector;
      LVector := nil;
      Sign := -Sign
    end;
    D := LMatrix[R, R];
    LMatrix[R, R] := 1;
    if D <> 1 then
    begin
      Result := Result * D;
      for I := R + 1 to N do
        LMatrix[R, I] := LMatrix[R, I] / D;
    end;
    for I := R + 1 to N do
    begin
      D := LMatrix[I, R];
      LMatrix[I, R] := 0;
      for J := R + 1 to N do
        LMatrix[I, J] := LMatrix[I, J] - LMatrix[R, J] * D;
    end;
    System.Inc(R);
  until R >= N;
  Result := Sign * Result * LMatrix[N, N];
end;

function TSComplexDynMatrixHelper.GetDeviation: TSComplex;
begin
  Result := Variance.Sqrt;
end;

function TSComplexDynMatrixHelper.GetIsDiagonal: Boolean;
var
  I, J, N: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  N := High(Self);
  for I := 1 to N do
    for J := 0 to I - 1 do
      if not Self[I, J].IsZero then
        Exit;

  for I := 0 to N - 1 do
    for J := I + 1 to N do
      if not Self[I, J].IsZero then
        Exit;

  Result := true;
end;

function TSComplexDynMatrixHelper.GetIsIdentity: Boolean;
var
  I: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 0 to High(Self) do
    if Self[I, I] <> 1 then
      Exit;
  Result := IsDiagonal;
end;

function TSComplexDynMatrixHelper.GetIsSymmetric: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 1 to High(Self) do
    for J := 0 to I - 1 do
      if Self[I, J] <> Self[J, I] then
        Exit;
  Result := true;
end;

function TSComplexDynMatrixHelper.GetIsZero: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      if not Self[I, J].IsZero then
        Exit;
  Result := true;
end;

function TSComplexDynMatrixHelper.GetItem(const ARow, ACol: Integer): TSComplex;
begin
  Result := Self[ARow, ACol];
end;

function TSComplexDynMatrixHelper.Imag: TSingleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Imag;
end;

procedure TSComplexDynMatrixHelper.Inverse;
var
  LMatrix: TSComplexDynMatrix;
  D: TSComplex;
  R, I, J, N: Integer;
begin
  MustBeSquare;
  LMatrix := TSComplexDynMatrix.Create(Self);
  N := RowCount;
  System.Dec(N);
  for R := 0 to N do
  begin
    if LMatrix[R, R].IsZero then
      raise EComplexMatrixError.Create('Inverse matrix by zeros in diag not implemented');

    D := 1 / LMatrix[R, R];
    Self[R, R] := D;
    for I := 0 to N do
      if I <> R then
      begin
        Self[I, R] := LMatrix[I, R] * D;
        Self[R, I] := -LMatrix[R, I] * D;
      end;

    for I := 0 to N do
      if I <> R then
        for J := 0 to N do
          if J <> R then
            Self[I, J] := LMatrix[I, J] - LMatrix[R, J] * LMatrix[I, R] * D;

    if R < N then
      LMatrix.Assign(Self);
  end;
end;

function TSComplexDynMatrixHelper.Inversed: TSComplexDynMatrix;
begin
  MustBeSquare;
  Result := TSComplexDynMatrix.Create(Self);
  Result.Inverse;
end;

function TSComplexDynMatrixHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsInfinity;
end;

function TSComplexDynMatrixHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNaN;
end;

function TSComplexDynMatrixHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNegativeInfinity;
end;

function TSComplexDynMatrixHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsPositiveInfinity;
end;

procedure TSComplexDynMatrixHelper.Normalize;
var
  D: TSComplex;
  I, J: Integer;
begin
  D := MaxValue;
  if D.IsZero then
    Exit;
  D := 1 / D;

  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      Self[I, J] := Self[I, J] * D;
end;

function TSComplexDynMatrixHelper.Normalized: TSComplexDynMatrix;
begin
  Result := TSComplexDynMatrix.Create(Self);
  Result.Normalize;
end;

function TSComplexDynMatrixHelper.NotEqual(const AValue: TSComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AValue);
end;

constructor TSComplexDynMatrixHelper.Ones(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := Nil;
  System.SetLength(Self, ARowCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I] := TSComplexDynArray.Ones(AColCount);
  end;
end;

function TSComplexDynMatrixHelper.NotEqual(const AMatrix: TSComplexDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AMatrix[I]);
end;

function TSComplexDynMatrixHelper.Real: TSingleDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Real;
end;

procedure TSComplexDynMatrixHelper.Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
var
  R, I: Integer;
begin
  if ARowCount <= 0 then
  begin
    Self := nil;
    Exit
  end;
  if (RowCount = ARowCount) and (ColCount = AColCount) then
  begin
    if not ASaveData then
      Zero;
    Exit;
  end;

  if RowCount <> ARowCount then
  begin
    R := RowCount;
    if R > ARowCount then
      for I := ARowCount to R - 1 do
        Self[I] := nil;
    SetLength(Self, ARowCount);
  end;

  for I := Low(Self) to High(Self) do
    TSComplexDynArray(Self[I]).Resize(AColCount, ASaveData);
end;

function TSComplexDynMatrixHelper.ReverseArray: TSComplexDynMatrix;
var
  I, J: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  J := 0;
  for I := Self.HighRow downto Self.LowRow do
  begin
    Result[J] := Self[I].ReverseArray;
    System.Inc(J);
  end;
end;

function TSComplexDynMatrixHelper.ToVector: TSComplexDynArray;
var
  I, J, K: Integer;
begin
  Result := TSComplexDynArray.Create(Self.RowCount * Self.ColCount);
  K := 0;
  for I := Self.LowRow to Self.HighRow do
  begin
    for J := Self.LowCol to Self.HighCol do
    begin
      Result[K] := Self[I, J];
      System.Inc(K);
    end;
  end;
end;

function TSComplexDynMatrixHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TSComplexDynMatrixHelper.ToString: string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString;
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TSComplexDynMatrixHelper._ToString(const AMatrixSeparator, AVectorSeparator: string): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I]._ToString(AVectorSeparator);
  Result := '{' + string.Join(AMatrixSeparator, S) + '}';
end;

function TSComplexDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TSComplexDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

class function TSComplexDynMatrixHelper.Parse(const AMatrixStr: string): TSComplexDynMatrix;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AMatrixStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([MatrixVectorDelimiter]);
  L := Length(LStrArray);
  System.SetLength(Result, L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := TSComplexDynArray.Parse(LStrArray[I]);
end;

procedure TSComplexDynMatrixHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].PositiveInfinity;
  end;
end;

function TSComplexDynMatrixHelper.Prod: TSComplex;
var
  I: Integer;
begin
  Result := 1;
  for I := Self.LowRow to Self.HighRow do
    Result := Result * Self[I].Prod;
end;

procedure TSComplexDynMatrixHelper.ClearImag;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].ClearImag;
end;

procedure TSComplexDynMatrixHelper.ClearReal;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].ClearReal;
end;

procedure TSComplexDynMatrixHelper.Conjugate;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Conjugate;
end;

constructor TSComplexDynMatrixHelper.Create(const AMatrix: TSingleDynMatrix);
var
  I: Integer;
begin
  System.SetLength(Self, AMatrix.RowCount);
  for I := AMatrix.LowRow to AMatrix.HighRow do
    Self[I] := TSComplexDynArray.Create(AMatrix[I]);
end;

constructor TSComplexDynMatrixHelper.Create(const AMatrixStr: string);
begin
  Self := Parse(AMatrixStr);
end;

constructor TSComplexDynMatrixHelper.Create(const AMatrixRe, AMatrixIm: TSingleDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(AMatrixRe.RowCount, AMatrixIm.RowCount);
  System.SetLength(Self, AMatrixRe.RowCount);
  for I := AMatrixRe.LowRow to AMatrixRe.HighRow do
    Self[I] := TSComplexDynArray.Create(AMatrixRe[I], AMatrixIm[I]);
end;

///
///  EComplex
///

constructor TEComplexDynMatrixHelper.Create(const ARowCount, AColCount: Integer);
begin
  System.SetLength(Self, ARowCount, AColCount);
end;

function TEComplexDynMatrixHelper.LowRow: Integer;
begin
  Result := System.Low(Self);
end;

function TEComplexDynMatrixHelper.HighRow: Integer;
begin
  Result := System.High(Self);
end;

procedure TEComplexDynMatrixHelper.i1;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].i1;
end;

function TEComplexDynMatrixHelper.Last: TEComplexDynArray;
begin
  Result := Self[HighRow];
end;

function TEComplexDynMatrixHelper.LowCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.Low(Self[0]);
end;

function TEComplexDynMatrixHelper.HighCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.High(Self[0]);
end;

procedure TEComplexDynMatrixHelper.Zero;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Zero;
end;

function TEComplexDynMatrixHelper.GetRow(const AIndex: Integer): TEComplexDynArray;
begin
  Result := Self[AIndex];
end;

function TEComplexDynMatrixHelper.GetColCount: Integer;
begin
  Result := 0;
  if RowCount > 0 then
    Result := Self[0].Length;
end;

function TEComplexDynMatrixHelper.GetCol(const AIndex: Integer): TEComplexDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Result[I] := Self[I, AIndex];
end;

function TEComplexDynMatrixHelper.GetRowCount: Integer;
begin
  Result := System.Length(Self);
end;

function TEComplexDynMatrixHelper.GetSize: Integer;
begin
  Result := RowCount * ColCount * SizeOf(TEComplex);
end;

function TEComplexDynMatrixHelper.GetSum: TEComplex;
var
  I: Integer;
begin
  Result := 0;
  if RowCount = 0 then
    Exit;
  for I := LowRow to HighRow do
    Result := Result + Self[I].Sum;
end;

function TEComplexDynMatrixHelper.GetIsSquare: Boolean;
begin
  Result := RowCount = ColCount;
end;

procedure TEComplexDynMatrixHelper.Transpose;

  procedure DoSquare;
  var
    I, J: Integer;
  begin
    for I := LowRow to HighRow do
      for J := 0 to I - 1 do
      begin
        TSwapOp<TEComplex>.Swap(Self[I, J], Self[J, I]);
      end;
  end;

  procedure DoRectangle;
  var
    LMatrix: TEComplexDynMatrix;
    I, J: Integer;
  begin
    LMatrix := TEComplexDynMatrix.Create(Self);
    Self := TEComplexDynMatrix.Create(LMatrix.ColCount, LMatrix.RowCount);
    for I := LowRow to HighRow do
      for J := LowCol to HighCol do
        Self[I, J] := LMatrix[J, I];
  end;

begin
  if IsSquare then
    DoSquare
  else
    DoRectangle;
end;

function TEComplexDynMatrixHelper.Transposed: TEComplexDynMatrix;
begin
  Result := TEComplexDynMatrix.Create(Self);
  Result.Transpose;
end;

procedure TEComplexDynMatrixHelper.NaN;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NaN;
  end;
end;

function TEComplexDynMatrixHelper.Negative: TEComplexDynMatrix;
var
  I, J: Integer;
begin
  Result := TEComplexDynMatrix.Create(Self);
  for I := Result.LowRow to Result.HighRow do
    Result[I] := Result[I].Negative;
end;

procedure TEComplexDynMatrixHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NegativeInfinity;
  end;
end;

procedure TEComplexDynMatrixHelper.Multiply(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Multiply(AValue);
end;

function TEComplexDynMatrixHelper.AddDown(const AVector: TEComplexDynArray): TEComplexDynMatrix;
var
  LengthA, J: Integer;
begin
  if not Assigned(Self) then
  begin
    Result := [Copy(AVector)];
    Exit;
  end;

  if not Assigned(AVector) then
  begin
    Result := TEComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AVector.Length then
    raise EComplexMatrixError.Create('Can"t AddDown');

  Result := TEComplexDynMatrix.Create(LengthA + 1, Self.ColCount);
  for J := Self[Self.HighRow].Low to Self[Self.HighRow].High do
    Result[Self.HighRow, J] := AVector[J];
end;

function TEComplexDynMatrixHelper.AddDown(const AMatrix: TEComplexDynMatrix): TEComplexDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TEComplexDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TEComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AMatrix.ColCount then
    raise EComplexMatrixError.Create('Can"t AddDown');

  Result := TEComplexDynMatrix.Create(LengthA + AMatrix.RowCount, Self.ColCount);
  K := 0;
  for I := LengthA to Self.HighRow do
  begin
    for J := Self[I].Low to Self[I].High do
      Result[I, J] := AMatrix[K, J];
    System.Inc(K);
  end;
end;

function TEComplexDynMatrixHelper.AddRight(const AVector: TEComplexDynArray): TEComplexDynMatrix;
var
  LengthA, I: Integer;
begin
  if Self = nil then
  begin
    Result := [copy(AVector)];
    Exit;
  end;

  if AVector = nil then
  begin
    Result := TEComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AVector.Length then
    raise EComplexMatrixError.Create('Can"t AddRight');

  Result := TEComplexDynMatrix.Create(Self.RowCount, LengthA + 1);
  for I := AVector.Low to AVector.High do
    Result[I, LengthA] := AVector[I];
end;

function TEComplexDynMatrixHelper.Angle: TExtendedDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Angle;
end;

function TEComplexDynMatrixHelper.AddRight(const AMatrix: TEComplexDynMatrix): TEComplexDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TEComplexDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TEComplexDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AMatrix.RowCount then
    raise EComplexMatrixError.Create('Can"t AddRight');

  Result := TEComplexDynMatrix.Create(Self.RowCount, LengthA + AMatrix.ColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    K := 0;
    for J := LengthA to Self[I].High do
    begin
      Result[I, J] := AMatrix[I, K];
      System.Inc(K);
    end;
  end;
end;

procedure TEComplexDynMatrixHelper.Divide(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Divide(AValue);
end;

procedure TEComplexDynMatrixHelper.SetRow(const AIndex: Integer; const AValue: TEComplexDynArray);
begin
  Self[AIndex] := TEComplexDynArray.Create(AValue);
end;

procedure TEComplexDynMatrixHelper.SetItem(const ARow, ACol: Integer; const AValue: TEComplex);
begin
  Self[ARow, ACol] := AValue;
end;

procedure TEComplexDynMatrixHelper.SetCol(const AIndex: Integer; const AValue: TEComplexDynArray);
var
  I: Integer;
begin
  NeedSameLength(AValue.Length, Self.RowCount);
  MustBeInRange(AIndex, LowCol, HighCol);

  for I := Self.LowRow to Self.HighRow do
    Self[I, AIndex] := AValue[I];
end;

procedure TEComplexDynMatrixHelper.Sort;
var
  I, J, K: Integer;
  LTemp: TEComplexDynArray;
begin
  LTemp := Self.ToVector;
  LTemp.Sort;
  K := 0;
  for I := Self.LowRow to Self.HighRow do
  begin
    for J := Self.LowCol to Self.HighCol do
    begin
      Self[I, J] := LTemp[K];
      System.Inc(K);
    end;
  end;
end;

function TEComplexDynMatrixHelper.SqrAbs: TExtendedDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].SqrAbs;
end;

procedure TEComplexDynMatrixHelper.Subtract(const AMatrix: TEComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AMatrix[I]);
end;

procedure TEComplexDynMatrixHelper.Subtract(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AValue);
end;

procedure TEComplexDynMatrixHelper.Add(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AValue);
end;

procedure TEComplexDynMatrixHelper.Add(const AMatrix: TEComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AMatrix[I]);
end;

procedure TEComplexDynMatrixHelper.MustBeSquare;
begin
  if not IsSquare then
    raise EComplexMatrixError.Create('Matrix must be square');
end;

procedure TEComplexDynMatrixHelper.Assign(const ASource: TEComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ASource.RowCount, Self.ColCount, ASource.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Assign(ASource[I]);
end;

procedure TEComplexDynMatrixHelper.AssignTo(const ADest: TEComplexDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ADest.RowCount, Self.ColCount, ADest.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].AssignTo(ADest[I]);
end;

function TEComplexDynMatrixHelper.Multiply(const AMatrix: TEComplexDynMatrix): TEComplexDynMatrix;
var
  D: TEComplex;
  M, K, N: Integer;
  I, L, J: Integer;
begin
  K := Self.ColCount;
  NeedSameLength(K, AMatrix.RowCount);
  M := Self.RowCount;
  N := AMatrix.ColCount;
  Result := TEComplexDynMatrix.Create(M, N);
  System.Dec(M);
  System.Dec(K);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
    begin
      D.Zero;
      for L := 0 to K do
        D := D + Self[I, L] * AMatrix[L, J];
      Result[I, J] := D;
    end;
end;

constructor TEComplexDynMatrixHelper.Create(const AVector1, AVector2: TEComplexDynArray);
var
  M, N: Integer;
  I, J: Integer;
begin
  Self := Nil;
  M := AVector1.Length;
  N := AVector2.Length;
  System.SetLength(Self, M, N);
  System.Dec(M);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
      Self[I, J] := AVector1[I] * AVector2[J];
end;

constructor TEComplexDynMatrixHelper.Create(const ADimension: Integer);
begin
  SetLength(Self, ADimension, ADimension);
end;

constructor TEComplexDynMatrixHelper.Create(const AMatrix: TEComplexDynMatrix);
var
  I: Integer;
begin
  Self := Nil;
  SetLength(Self, AMatrix.RowCount);
  for I := Low(Self) to High(Self) do
  begin
    Self[I] := TEComplexDynArray.Create(AMatrix[I]);
  end;
end;

constructor TEComplexDynMatrixHelper.Diag(const AVector: TEComplexDynArray);
var
  I: Integer;
begin
  Self := TEComplexDynMatrix.Create(AVector.Length);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := AVector[I];
end;

function TEComplexDynMatrixHelper.Equal(const AMatrix: TEComplexDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AMatrix[I]);
  end;
end;

function TEComplexDynMatrixHelper.Equal(const AValue: TEComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AValue);
  end;
end;

procedure TEComplexDynMatrixHelper.Exchange;
var
  NM, L, i1, J1, I2, J2: Integer;
begin
  MustBeSquare;
  NM := RowCount - 1;
  for L := 0 to NM - 1 do
  begin
    i1 := L;
    J1 := 0;
    I2 := NM;
    J2 := NM - i1;
    repeat
      TSwapOp<TEComplex>.Swap(Self[i1, J1], Self[I2, J2]);
      System.Inc(i1);
      System.Inc(J1);
      System.Dec(I2);
      System.Dec(J2);
    until i1 >= I2;
  end;
end;

function TEComplexDynMatrixHelper.Exchanged: TEComplexDynMatrix;
begin
  MustBeSquare;
  Result := TEComplexDynMatrix.Create(Self);
  Result.Exchange;
end;

constructor TEComplexDynMatrixHelper.Eye(const ADimension: Integer);
var
  I: Integer;
begin
  Self := TEComplexDynMatrix.Create(ADimension);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := 1;
end;

constructor TEComplexDynMatrixHelper.Eye(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := TEComplexDynMatrix.Create(ARowCount, AColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    if I > Self.HighCol then
      Break;
    Self[I, I] := 1;
  end;
end;

procedure TEComplexDynMatrixHelper.Fill(const AValue: TEComplex);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Fill(AValue);
end;

function TEComplexDynMatrixHelper.First: TEComplexDynArray;
begin
  Result := Self[LowRow];
end;

procedure TEComplexDynMatrixHelper.Apply(const AProc: TEleventProc<TEComplex>);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Apply(AProc);
end;

function TEComplexDynMatrixHelper.ForEach(const AProc: TEleventProc<TEComplex>): TEComplexDynMatrix;
begin
  Result := TEComplexDynMatrix.Create(Self);
  Result.Apply(AProc);
end;

function TEComplexDynMatrixHelper.Magnitude: TExtendedDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Magnitude;
end;

function TEComplexDynMatrixHelper.MaxItem(var ARowIndex, AColIndex: Integer): TEComplex;
var
  D: TEComplex;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MaxItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MaxItem(J);
    if (D > Result) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TEComplexDynMatrixHelper.GetMaxValue: TEComplex;
var
  R, C: Integer;
begin
  Result := MaxItem(R, C);
end;

function TEComplexDynMatrixHelper.GetMean: TEComplex;
begin
  Result := Self.Sum / (RowCount * ColCount);
end;

function TEComplexDynMatrixHelper.MinItem(var ARowIndex, AColIndex: Integer): TEComplex;
var
  D: TEComplex;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MinItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MinItem(J);
    if (D < Result) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TEComplexDynMatrixHelper.GetMinor(const ARow, ACol: Integer): TEComplex;
var
  LMatrix: TEComplexDynMatrix;
  N, I, J, K, L: Integer;
begin
  N := System.Math.Max(RowCount, ColCount) - 1;
  if N <= 0 then
  begin
    Result := 1;
    Exit
  end;

  MustBeInRange(ARow, LowRow, HighRow);
  MustBeInRange(ACol, LowCol, HighCol);
  LMatrix := TEComplexDynMatrix.Create(N);
  for I := 0 to N do
    if I <> ARow then
    begin
      K := I;
      if I > ARow then
        System.Dec(K);
      for J := 0 to N do
        if J <> ACol then
        begin
          L := J;
          if J > ACol then
            System.Dec(L);
          LMatrix[K, L] := Self[I, J];
        end;
    end;
  Result := LMatrix.Determinant;
end;

function TEComplexDynMatrixHelper.GetCofactor(const ARow, ACol: Integer): TEComplex;
begin
  Result := GetMinor(ARow, ACol);
  if (ARow + ACol) and 1 <> 0 then
    Result := -Result;
end;

function TEComplexDynMatrixHelper.GetMinValue: TEComplex;
var
  R, C: Integer;
begin
  Result := MinItem(R, C);
end;

function TEComplexDynMatrixHelper.GetNorm: TEComplex;
var
  I, J: Integer;
begin
  Result := 0;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + Self[I, J].Sqr;
  Result := Result.Sqrt;
end;

function TEComplexDynMatrixHelper.GetPItem(const ARow, ACol: Integer): PEComplex;
begin
  Result := @Self[ARow, ACol];
end;

function TEComplexDynMatrixHelper.GetTrace: TEComplex;
var
  I: Integer;
begin
  MustBeSquare;
  Result := 0;
  for I := Low(Self) to High(Self) do
    Result := Result + Self[I, I];
end;

function TEComplexDynMatrixHelper.GetVariance: TEComplex;
var
  M: TEComplex;
  N, I, J: Integer;
begin
  Result := 0;
  N := RowCount * ColCount;
  if N = 0 then
    Exit;
  M := Mean;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + (Self[I, J] - M).Sqr;
  Result := Result / N;
end;

function TEComplexDynMatrixHelper.GetDeterminant: TEComplex;
var
  D: TEComplex;
  LMatrix: TEComplexDynMatrix;
  LVector: TEComplexDynArray;
  R, N, I, J: Integer;
  Sign: Integer;
begin
  MustBeSquare;
  LMatrix := TEComplexDynMatrix.Create(Self);

  N := RowCount - 1;
  if N < 0 then
  begin
    Result := 0;
    Exit
  end;
  R := 0;
  Result := 1;
  Sign := 1;
  repeat
    I := R;
    while (I <= N) and LMatrix[I, R].IsZero do
      System.Inc(I);
    if I > N then
    begin
      Result := 0;
      Exit
    end;
    if I > R then
    begin
      LVector := LMatrix[R];
      LMatrix[R] := LMatrix[I];
      LMatrix[I] := LVector;
      LVector := nil;
      Sign := -Sign
    end;
    D := LMatrix[R, R];
    LMatrix[R, R] := 1;
    if D <> 1 then
    begin
      Result := Result * D;
      for I := R + 1 to N do
        LMatrix[R, I] := LMatrix[R, I] / D;
    end;
    for I := R + 1 to N do
    begin
      D := LMatrix[I, R];
      LMatrix[I, R] := 0;
      for J := R + 1 to N do
        LMatrix[I, J] := LMatrix[I, J] - LMatrix[R, J] * D;
    end;
    System.Inc(R);
  until R >= N;
  Result := Sign * Result * LMatrix[N, N];
end;

function TEComplexDynMatrixHelper.GetDeviation: TEComplex;
begin
  Result := Variance.Sqrt;
end;

function TEComplexDynMatrixHelper.GetIsDiagonal: Boolean;
var
  I, J, N: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  N := High(Self);
  for I := 1 to N do
    for J := 0 to I - 1 do
      if not Self[I, J].IsZero then
        Exit;

  for I := 0 to N - 1 do
    for J := I + 1 to N do
      if not Self[I, J].IsZero then
        Exit;

  Result := true;
end;

function TEComplexDynMatrixHelper.GetIsIdentity: Boolean;
var
  I: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 0 to High(Self) do
    if Self[I, I] <> 1 then
      Exit;
  Result := IsDiagonal;
end;

function TEComplexDynMatrixHelper.GetIsSymmetric: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 1 to High(Self) do
    for J := 0 to I - 1 do
      if Self[I, J] <> Self[J, I] then
        Exit;
  Result := true;
end;

function TEComplexDynMatrixHelper.GetIsZero: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      if not Self[I, J].IsZero then
        Exit;
  Result := true;
end;

function TEComplexDynMatrixHelper.GetItem(const ARow, ACol: Integer): TEComplex;
begin
  Result := Self[ARow, ACol];
end;

function TEComplexDynMatrixHelper.Imag: TExtendedDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Imag;
end;

procedure TEComplexDynMatrixHelper.Inverse;
var
  LMatrix: TEComplexDynMatrix;
  D: TEComplex;
  R, I, J, N: Integer;
begin
  MustBeSquare;
  LMatrix := TEComplexDynMatrix.Create(Self);
  N := RowCount;
  System.Dec(N);
  for R := 0 to N do
  begin
    if LMatrix[R, R].IsZero then
      raise EComplexMatrixError.Create('Inverse matrix by zeros in diag not implemented');

    D := 1 / LMatrix[R, R];
    Self[R, R] := D;
    for I := 0 to N do
      if I <> R then
      begin
        Self[I, R] := LMatrix[I, R] * D;
        Self[R, I] := -LMatrix[R, I] * D;
      end;

    for I := 0 to N do
      if I <> R then
        for J := 0 to N do
          if J <> R then
            Self[I, J] := LMatrix[I, J] - LMatrix[R, J] * LMatrix[I, R] * D;

    if R < N then
      LMatrix.Assign(Self);
  end;
end;

function TEComplexDynMatrixHelper.Inversed: TEComplexDynMatrix;
begin
  MustBeSquare;
  Result := TEComplexDynMatrix.Create(Self);
  Result.Inverse;
end;

function TEComplexDynMatrixHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsInfinity;
end;

function TEComplexDynMatrixHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNaN;
end;

function TEComplexDynMatrixHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNegativeInfinity;
end;

function TEComplexDynMatrixHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsPositiveInfinity;
end;

procedure TEComplexDynMatrixHelper.Normalize;
var
  D: TEComplex;
  I, J: Integer;
begin
  D := MaxValue;
  if D.IsZero then
    Exit;
  D := 1 / D;

  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      Self[I, J] := Self[I, J] * D;
end;

function TEComplexDynMatrixHelper.Normalized: TEComplexDynMatrix;
begin
  Result := TEComplexDynMatrix.Create(Self);
  Result.Normalize;
end;

function TEComplexDynMatrixHelper.NotEqual(const AValue: TEComplex): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AValue);
end;

constructor TEComplexDynMatrixHelper.Ones(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := Nil;
  System.SetLength(Self, ARowCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I] := TEComplexDynArray.Ones(AColCount);
  end;
end;

function TEComplexDynMatrixHelper.NotEqual(const AMatrix: TEComplexDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AMatrix[I]);
end;

function TEComplexDynMatrixHelper.Real: TExtendedDynMatrix;
var
  I: Integer;
begin
  System.SetLength(Result, RowCount);
  for I := LowRow to HighRow do
    Result[I] := Self[I].Real;
end;

procedure TEComplexDynMatrixHelper.Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
var
  R, I: Integer;
begin
  if ARowCount <= 0 then
  begin
    Self := nil;
    Exit
  end;
  if (RowCount = ARowCount) and (ColCount = AColCount) then
  begin
    if not ASaveData then
      Zero;
    Exit;
  end;

  if RowCount <> ARowCount then
  begin
    R := RowCount;
    if R > ARowCount then
      for I := ARowCount to R - 1 do
        Self[I] := nil;
    SetLength(Self, ARowCount);
  end;

  for I := Low(Self) to High(Self) do
    TEComplexDynArray(Self[I]).Resize(AColCount, ASaveData);
end;

function TEComplexDynMatrixHelper.ReverseArray: TEComplexDynMatrix;
var
  I, J: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  J := 0;
  for I := Self.HighRow downto Self.LowRow do
  begin
    Result[J] := Self[I].ReverseArray;
    System.Inc(J);
  end;
end;

function TEComplexDynMatrixHelper.ToVector: TEComplexDynArray;
var
  I, J, K: Integer;
begin
  Result := TEComplexDynArray.Create(Self.RowCount * Self.ColCount);
  K := 0;
  for I := Self.LowRow to Self.HighRow do
  begin
    for J := Self.LowCol to Self.HighCol do
    begin
      Result[K] := Self[I, J];
      System.Inc(K);
    end;
  end;
end;

function TEComplexDynMatrixHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TEComplexDynMatrixHelper.ToString: string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString;
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TEComplexDynMatrixHelper._ToString(const AMatrixSeparator, AVectorSeparator: string): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I]._ToString(AVectorSeparator);
  Result := '{' + string.Join(AMatrixSeparator, S) + '}';
end;

function TEComplexDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TEComplexDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

class function TEComplexDynMatrixHelper.Parse(const AMatrixStr: string): TEComplexDynMatrix;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AMatrixStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([MatrixVectorDelimiter]);
  L := Length(LStrArray);
  System.SetLength(Result, L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := TEComplexDynArray.Parse(LStrArray[I]);
end;

procedure TEComplexDynMatrixHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].PositiveInfinity;
  end;
end;

function TEComplexDynMatrixHelper.Prod: TEComplex;
var
  I: Integer;
begin
  Result := 1;
  for I := Self.LowRow to Self.HighRow do
    Result := Result * Self[I].Prod;
end;

procedure TEComplexDynMatrixHelper.ClearImag;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].ClearImag;
end;

procedure TEComplexDynMatrixHelper.ClearReal;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].ClearReal;
end;

procedure TEComplexDynMatrixHelper.Conjugate;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Conjugate;
end;

constructor TEComplexDynMatrixHelper.Create(const AMatrix: TExtendedDynMatrix);
var
  I: Integer;
begin
  System.SetLength(Self, AMatrix.RowCount);
  for I := AMatrix.LowRow to AMatrix.HighRow do
    Self[I] := TEComplexDynArray.Create(AMatrix[I]);
end;

constructor TEComplexDynMatrixHelper.Create(const AMatrixStr: string);
begin
  Self := Parse(AMatrixStr);
end;

constructor TEComplexDynMatrixHelper.Create(const AMatrixRe, AMatrixIm: TExtendedDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(AMatrixRe.RowCount, AMatrixIm.RowCount);
  System.SetLength(Self, AMatrixRe.RowCount);
  for I := AMatrixRe.LowRow to AMatrixRe.HighRow do
    Self[I] := TEComplexDynArray.Create(AMatrixRe[I], AMatrixIm[I]);
end;

end.

