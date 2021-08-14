unit DAVLib.MatrixTypesHelper;

interface

uses
  System.SysUtils, DAVLib.Types, DAVLib.VectorTypesHelper,
  DAVLib.SimpleTypesHelper;

type
  TDoubleDynMatrixHelper = record helper for TDoubleDynMatrix
  private
    procedure MustBeSquare;
    function GetCofactor(const ARow, ACol: Integer): Double;
    function GetColCount: Integer;
    function GetDeterminant: Double;
    function GetItem(const ARow, ACol: Integer): Double;
    function GetMinor(const ARow, ACol: Integer): Double;
    function GetRowCount: Integer;
    function GetSize: Integer;
    function GetTrace: Double;
    function GetMaxValue: Double;
    function GetMinValue: Double;
    procedure SetItem(const ARow, ACol: Integer; const AValue: Double);
    function GetIsSquare: Boolean;
    function GetCol(const AIndex: Integer): TDoubleDynArray;
    function GetRow(const AIndex: Integer): TDoubleDynArray;
    function GetIsDiagonal: Boolean;
    function GetIsIdentity: Boolean;
    function GetIsSymmetric: Boolean;
    function GetIsZero: Boolean;
    function GetPItem(const ARow, ACol: Integer): PDouble;
    procedure SetCol(const AIndex: Integer; const AValue: TDoubleDynArray);
    procedure SetRow(const AIndex: Integer; const AValue: TDoubleDynArray);
    function GetDeviation: Double;
    function GetMean: Double;
    function GetNorm: Double;
    function GetSum: Double;
    function GetVariance: Double;
  public
    constructor Create(const ARowCount, AColCount: Integer); overload;
    constructor Create(const AMatrix: TDoubleDynMatrix); overload;
    constructor Create(const ADimension: Integer); overload;
    constructor Create(const AVector1, AVector2: TDoubleDynArray); overload;
    constructor Ones(const ARowCount, AColCount: Integer);
    constructor Diag(const AVector: TDoubleDynArray);
    constructor Eye(const ARowCount, AColCount: Integer); overload;
    constructor Eye(const ADimension: Integer); overload;
    constructor Random(const ADimension: Integer); overload;
    constructor Random(const ARowCount, AColCount: Integer); overload;
    procedure Assign(const ASource: TDoubleDynMatrix);
    procedure AssignTo(const ADest: TDoubleDynMatrix);
    procedure Zero;
    procedure Fill(const AValue: Double);
    procedure Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
    function MaxItem(var ARowIndex, AColIndex: Integer): Double;
    function MinItem(var ARowIndex, AColIndex: Integer): Double;
    function ForEach(const AProc: TEleventProc<Double>): TDoubleDynMatrix;
    procedure Apply(const AProc: TEleventProc<Double>);
    procedure Normalize;
    procedure Transpose;
    procedure Exchange;
    procedure Inverse;
    function Normalized: TDoubleDynMatrix;
    function Transposed: TDoubleDynMatrix;
    function Exchanged: TDoubleDynMatrix;
    function Inversed: TDoubleDynMatrix;
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
    property Norm: Double read GetNorm;
    property Sum: Double read GetSum;
    property Mean: Double read GetMean;
    property Variance: Double read GetVariance;
    property Deviation: Double read GetDeviation;
    property MaxValue: Double read GetMaxValue;
    property MinValue: Double read GetMinValue;
    property Trace: Double read GetTrace;
    property Determinant: Double read GetDeterminant;
    property Row[const AIndex: Integer]: TDoubleDynArray read GetRow write SetRow;
    property Col[const AIndex: Integer]: TDoubleDynArray read GetCol write SetCol;
    property Item[const ARow, ACol: Integer]: Double read GetItem write SetItem;
    property PItem[const ARow, ACol: Integer]: PDouble read GetPItem;
    property Minor[const ARow, ACol: Integer]: Double read GetMinor;
    property Cofactor[const ARow, ACol: Integer]: Double read GetCofactor;
    function LowRow: Integer;
    function HighRow: Integer;
    function LowCol: Integer;
    function HighCol: Integer;
    function ToVector: TDoubleDynArray;
    function Negative: TDoubleDynMatrix;
    function Equal(const AMatrix: TDoubleDynMatrix): Boolean; overload;
    function Equal(const AValue: Double): Boolean; overload;
    function NotEqual(const AMatrix: TDoubleDynMatrix): Boolean; overload;
    function NotEqual(const AValue: Double): Boolean; overload;
    function First(): TDoubleDynArray;
    function Last(): TDoubleDynArray;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Prod: Double;
    function ReverseArray: TDoubleDynMatrix;
    procedure Sort;
    class function Parse(const AMatrixStr: string): TDoubleDynMatrix; static;
    function AddDown(const AMatrix: TDoubleDynMatrix): TDoubleDynMatrix; overload;
    function AddDown(const AVector: TDoubleDynArray): TDoubleDynMatrix; overload;
    function AddRight(const AMatrix: TDoubleDynMatrix): TDoubleDynMatrix; overload;
    function AddRight(const AVector: TDoubleDynArray): TDoubleDynMatrix; overload;
    procedure Multiply(const AValue: Double); overload;
    function Multiply(const AMatrix: TDoubleDynMatrix): TDoubleDynMatrix; overload;
    procedure Add(const AValue: Double); overload;
    procedure Add(const AMatrix: TDoubleDynMatrix); overload;
    procedure Divide(const AValue: Double); overload;
    procedure Subtract(const AValue: Double); overload;
    procedure Subtract(const AMatrix: TDoubleDynMatrix); overload;
  end;

  TSingleDynMatrixHelper = record helper for TSingleDynMatrix
  private
    procedure MustBeSquare;
    function GetCofactor(const ARow, ACol: Integer): Single;
    function GetColCount: Integer;
    function GetDeterminant: Single;
    function GetItem(const ARow, ACol: Integer): Single;
    function GetMinor(const ARow, ACol: Integer): Single;
    function GetRowCount: Integer;
    function GetSize: Integer;
    function GetTrace: Single;
    function GetMaxValue: Single;
    function GetMinValue: Single;
    procedure SetItem(const ARow, ACol: Integer; const AValue: Single);
    function GetIsSquare: Boolean;
    function GetCol(const AIndex: Integer): TSingleDynArray;
    function GetRow(const AIndex: Integer): TSingleDynArray;
    function GetIsDiagonal: Boolean;
    function GetIsIdentity: Boolean;
    function GetIsSymmetric: Boolean;
    function GetIsZero: Boolean;
    function GetPItem(const ARow, ACol: Integer): PSingle;
    procedure SetCol(const AIndex: Integer; const AValue: TSingleDynArray);
    procedure SetRow(const AIndex: Integer; const AValue: TSingleDynArray);
    function GetDeviation: Single;
    function GetMean: Single;
    function GetNorm: Single;
    function GetSum: Single;
    function GetVariance: Single;
  public
    constructor Create(const ARowCount, AColCount: Integer); overload;
    constructor Create(const AMatrix: TSingleDynMatrix); overload;
    constructor Create(const ADimension: Integer); overload;
    constructor Create(const AVector1, AVector2: TSingleDynArray); overload;
    constructor Ones(const ARowCount, AColCount: Integer);
    constructor Diag(const AVector: TSingleDynArray);
    constructor Eye(const ARowCount, AColCount: Integer); overload;
    constructor Eye(const ADimension: Integer); overload;
    constructor Random(const ADimension: Integer); overload;
    constructor Random(const ARowCount, AColCount: Integer); overload;
    procedure Assign(const ASource: TSingleDynMatrix);
    procedure AssignTo(const ADest: TSingleDynMatrix);
    procedure Zero;
    procedure Fill(const AValue: Single);
    procedure Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
    function MaxItem(var ARowIndex, AColIndex: Integer): Single;
    function MinItem(var ARowIndex, AColIndex: Integer): Single;
    function ForEach(const AProc: TEleventProc<Single>): TSingleDynMatrix;
    procedure Apply(const AProc: TEleventProc<Single>);
    procedure Normalize;
    procedure Transpose;
    procedure Exchange;
    procedure Inverse;
    function Normalized: TSingleDynMatrix;
    function Transposed: TSingleDynMatrix;
    function Exchanged: TSingleDynMatrix;
    function Inversed: TSingleDynMatrix;
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
    property Norm: Single read GetNorm;
    property Sum: Single read GetSum;
    property Mean: Single read GetMean;
    property Variance: Single read GetVariance;
    property Deviation: Single read GetDeviation;
    property MaxValue: Single read GetMaxValue;
    property MinValue: Single read GetMinValue;
    property Trace: Single read GetTrace;
    property Determinant: Single read GetDeterminant;
    property Row[const AIndex: Integer]: TSingleDynArray read GetRow write SetRow;
    property Col[const AIndex: Integer]: TSingleDynArray read GetCol write SetCol;
    property Item[const ARow, ACol: Integer]: Single read GetItem write SetItem;
    property PItem[const ARow, ACol: Integer]: PSingle read GetPItem;
    property Minor[const ARow, ACol: Integer]: Single read GetMinor;
    property Cofactor[const ARow, ACol: Integer]: Single read GetCofactor;
    function LowRow: Integer;
    function HighRow: Integer;
    function LowCol: Integer;
    function HighCol: Integer;
    function ToVector: TSingleDynArray;
    function Negative: TSingleDynMatrix;
    function Equal(const AMatrix: TSingleDynMatrix): Boolean; overload;
    function Equal(const AValue: Single): Boolean; overload;
    function NotEqual(const AMatrix: TSingleDynMatrix): Boolean; overload;
    function NotEqual(const AValue: Single): Boolean; overload;
    function First(): TSingleDynArray;
    function Last(): TSingleDynArray;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Prod: Single;
    function ReverseArray: TSingleDynMatrix;
    procedure Sort;
    class function Parse(const AMatrixStr: string): TSingleDynMatrix; static;
    function AddDown(const AMatrix: TSingleDynMatrix): TSingleDynMatrix; overload;
    function AddDown(const AVector: TSingleDynArray): TSingleDynMatrix; overload;
    function AddRight(const AMatrix: TSingleDynMatrix): TSingleDynMatrix; overload;
    function AddRight(const AVector: TSingleDynArray): TSingleDynMatrix; overload;
    procedure Multiply(const AValue: Single); overload;
    function Multiply(const AMatrix: TSingleDynMatrix): TSingleDynMatrix; overload;
    procedure Add(const AValue: Single); overload;
    procedure Add(const AMatrix: TSingleDynMatrix); overload;
    procedure Divide(const AValue: Single); overload;
    procedure Subtract(const AValue: Single); overload;
    procedure Subtract(const AMatrix: TSingleDynMatrix); overload;
  end;

  TExtendedDynMatrixHelper = record helper for TExtendedDynMatrix
  private
    procedure MustBeSquare;
    function GetCofactor(const ARow, ACol: Integer): Extended;
    function GetColCount: Integer;
    function GetDeterminant: Extended;
    function GetItem(const ARow, ACol: Integer): Extended;
    function GetMinor(const ARow, ACol: Integer): Extended;
    function GetRowCount: Integer;
    function GetSize: Integer;
    function GetTrace: Extended;
    function GetMaxValue: Extended;
    function GetMinValue: Extended;
    procedure SetItem(const ARow, ACol: Integer; const AValue: Extended);
    function GetIsSquare: Boolean;
    function GetCol(const AIndex: Integer): TExtendedDynArray;
    function GetRow(const AIndex: Integer): TExtendedDynArray;
    function GetIsDiagonal: Boolean;
    function GetIsIdentity: Boolean;
    function GetIsSymmetric: Boolean;
    function GetIsZero: Boolean;
    function GetPItem(const ARow, ACol: Integer): PExtended;
    procedure SetCol(const AIndex: Integer; const AValue: TExtendedDynArray);
    procedure SetRow(const AIndex: Integer; const AValue: TExtendedDynArray);
    function GetDeviation: Extended;
    function GetMean: Extended;
    function GetNorm: Extended;
    function GetSum: Extended;
    function GetVariance: Extended;
  public
    constructor Create(const ARowCount, AColCount: Integer); overload;
    constructor Create(const AMatrix: TExtendedDynMatrix); overload;
    constructor Create(const ADimension: Integer); overload;
    constructor Create(const AVector1, AVector2: TExtendedDynArray); overload;
    constructor Ones(const ARowCount, AColCount: Integer);
    constructor Diag(const AVector: TExtendedDynArray);
    constructor Eye(const ARowCount, AColCount: Integer); overload;
    constructor Eye(const ADimension: Integer); overload;
    constructor Random(const ADimension: Integer); overload;
    constructor Random(const ARowCount, AColCount: Integer); overload;
    procedure Assign(const ASource: TExtendedDynMatrix);
    procedure AssignTo(const ADest: TExtendedDynMatrix);
    procedure Zero;
    procedure Fill(const AValue: Extended);
    procedure Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
    function MaxItem(var ARowIndex, AColIndex: Integer): Extended;
    function MinItem(var ARowIndex, AColIndex: Integer): Extended;
    function ForEach(const AProc: TEleventProc<Extended>): TExtendedDynMatrix;
    procedure Apply(const AProc: TEleventProc<Extended>);
    procedure Normalize;
    procedure Transpose;
    procedure Exchange;
    procedure Inverse;
    function Normalized: TExtendedDynMatrix;
    function Transposed: TExtendedDynMatrix;
    function Exchanged: TExtendedDynMatrix;
    function Inversed: TExtendedDynMatrix;
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
    property Norm: Extended read GetNorm;
    property Sum: Extended read GetSum;
    property Mean: Extended read GetMean;
    property Variance: Extended read GetVariance;
    property Deviation: Extended read GetDeviation;
    property MaxValue: Extended read GetMaxValue;
    property MinValue: Extended read GetMinValue;
    property Trace: Extended read GetTrace;
    property Determinant: Extended read GetDeterminant;
    property Row[const AIndex: Integer]: TExtendedDynArray read GetRow write SetRow;
    property Col[const AIndex: Integer]: TExtendedDynArray read GetCol write SetCol;
    property Item[const ARow, ACol: Integer]: Extended read GetItem write SetItem;
    property PItem[const ARow, ACol: Integer]: PExtended read GetPItem;
    property Minor[const ARow, ACol: Integer]: Extended read GetMinor;
    property Cofactor[const ARow, ACol: Integer]: Extended read GetCofactor;
    function LowRow: Integer;
    function HighRow: Integer;
    function LowCol: Integer;
    function HighCol: Integer;
    function ToVector: TExtendedDynArray;
    function Negative: TExtendedDynMatrix;
    function Equal(const AMatrix: TExtendedDynMatrix): Boolean; overload;
    function Equal(const AValue: Extended): Boolean; overload;
    function NotEqual(const AMatrix: TExtendedDynMatrix): Boolean; overload;
    function NotEqual(const AValue: Extended): Boolean; overload;
    function First(): TExtendedDynArray;
    function Last(): TExtendedDynArray;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Prod: Extended;
    function ReverseArray: TExtendedDynMatrix;
    procedure Sort;
    class function Parse(const AMatrixStr: string): TExtendedDynMatrix; static;
    function AddDown(const AMatrix: TExtendedDynMatrix): TExtendedDynMatrix; overload;
    function AddDown(const AVector: TExtendedDynArray): TExtendedDynMatrix; overload;
    function AddRight(const AMatrix: TExtendedDynMatrix): TExtendedDynMatrix; overload;
    function AddRight(const AVector: TExtendedDynArray): TExtendedDynMatrix; overload;
    procedure Multiply(const AValue: Extended); overload;
    function Multiply(const AMatrix: TExtendedDynMatrix): TExtendedDynMatrix; overload;
    procedure Add(const AValue: Extended); overload;
    procedure Add(const AMatrix: TExtendedDynMatrix); overload;
    procedure Divide(const AValue: Extended); overload;
    procedure Subtract(const AValue: Extended); overload;
    procedure Subtract(const AMatrix: TExtendedDynMatrix); overload;
  end;

  TIntegerDynMatrixHelper = record helper for TIntegerDynMatrix
  private
    procedure MustBeSquare;
    function GetColCount: Integer;
    function GetItem(const ARow, ACol: Integer): Integer;
    function GetRowCount: Integer;
    function GetSize: Integer;
    function GetMaxValue: Integer;
    function GetMinValue: Integer;
    procedure SetItem(const ARow, ACol: Integer; const AValue: Integer);
    function GetIsSquare: Boolean;
    function GetCol(const AIndex: Integer): TIntegerDynArray;
    function GetRow(const AIndex: Integer): TIntegerDynArray;
    function GetIsDiagonal: Boolean;
    function GetIsIdentity: Boolean;
    function GetIsSymmetric: Boolean;
    function GetIsZero: Boolean;
    function GetPItem(const ARow, ACol: Integer): PInteger;
    procedure SetCol(const AIndex: Integer; const AValue: TIntegerDynArray);
    procedure SetRow(const AIndex: Integer; const AValue: TIntegerDynArray);
    function GetSum: Integer;
  public
    constructor Create(const ARowCount, AColCount: Integer); overload;
    constructor Create(const AMatrix: TIntegerDynMatrix); overload;
    constructor Create(const ADimension: Integer); overload;
    constructor Create(const AVector1, AVector2: TIntegerDynArray); overload;
    constructor Ones(const ARowCount, AColCount: Integer);
    constructor Diag(const AVector: TIntegerDynArray);
    constructor Eye(const ARowCount, AColCount: Integer); overload;
    constructor Eye(const ADimension: Integer); overload;
    procedure Assign(const ASource: TIntegerDynMatrix);
    procedure AssignTo(const ADest: TIntegerDynMatrix);
    procedure Zero;
    procedure Fill(const AValue: Integer);
    procedure Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
    function MaxItem(var ARowIndex, AColIndex: Integer): Integer;
    function MinItem(var ARowIndex, AColIndex: Integer): Integer;
    function ForEach(const AProc: TEleventProc<Integer>): TIntegerDynMatrix;
    procedure Apply(const AProc: TEleventProc<Integer>);
    procedure Transpose;
    procedure Exchange;
    function Transposed: TIntegerDynMatrix;
    function Exchanged: TIntegerDynMatrix;
    function ToString: string;
    function _ToString(const AMatrixSeparator, AVectorSeparator: string): string;
    property RowCount: Integer read GetRowCount;
    property ColCount: Integer read GetColCount;
    property IsSquare: Boolean read GetIsSquare;
    property IsSymmetric: Boolean read GetIsSymmetric;
    property IsDiagonal: Boolean read GetIsDiagonal;
    property IsIdentity: Boolean read GetIsIdentity;
    property IsZero: Boolean read GetIsZero;
    property Size: Integer read GetSize;
    property Sum: Integer read GetSum;
    property MaxValue: Integer read GetMaxValue;
    property MinValue: Integer read GetMinValue;
    property Row[const AIndex: Integer]: TIntegerDynArray read GetRow write SetRow;
    property Col[const AIndex: Integer]: TIntegerDynArray read GetCol write SetCol;
    property Item[const ARow, ACol: Integer]: Integer read GetItem write SetItem;
    property PItem[const ARow, ACol: Integer]: PInteger read GetPItem;
    function LowRow: Integer;
    function HighRow: Integer;
    function LowCol: Integer;
    function HighCol: Integer;
    function ToVector: TIntegerDynArray;
    function Negative: TIntegerDynMatrix;
    function Equal(const AMatrix: TIntegerDynMatrix): Boolean; overload;
    function Equal(const AValue: Integer): Boolean; overload;
    function NotEqual(const AMatrix: TIntegerDynMatrix): Boolean; overload;
    function NotEqual(const AValue: Integer): Boolean; overload;
    function First(): TIntegerDynArray;
    function Last(): TIntegerDynArray;
    function Prod: Integer;
    function ReverseArray: TIntegerDynMatrix;
    procedure Sort;
    class function Parse(const AMatrixStr: string): TIntegerDynMatrix; static;
    function AddDown(const AMatrix: TIntegerDynMatrix): TIntegerDynMatrix; overload;
    function AddDown(const AVector: TIntegerDynArray): TIntegerDynMatrix; overload;
    function AddRight(const AMatrix: TIntegerDynMatrix): TIntegerDynMatrix; overload;
    function AddRight(const AVector: TIntegerDynArray): TIntegerDynMatrix; overload;
    procedure Add(const AValue: Integer); overload;
    procedure Add(const AMatrix: TIntegerDynMatrix); overload;
    procedure Subtract(const AValue: Integer); overload;
    procedure Subtract(const AMatrix: TIntegerDynMatrix); overload;
  end;

implementation

uses
  DAVLib.SwapOperation, System.Math;

constructor TDoubleDynMatrixHelper.Create(const ARowCount, AColCount: Integer);
begin
  System.SetLength(Self, ARowCount, AColCount);
end;

function TDoubleDynMatrixHelper.LowRow: Integer;
begin
  Result := System.Low(Self);
end;

function TDoubleDynMatrixHelper.HighRow: Integer;
begin
  Result := System.High(Self);
end;

function TDoubleDynMatrixHelper.Last: TDoubleDynArray;
begin
  Result := Self[HighRow];
end;

function TDoubleDynMatrixHelper.LowCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.Low(Self[0]);
end;

function TDoubleDynMatrixHelper.HighCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.High(Self[0]);
end;

procedure TDoubleDynMatrixHelper.Zero;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Zero;
end;

function TDoubleDynMatrixHelper.GetRow(const AIndex: Integer): TDoubleDynArray;
begin
  Result := Self[AIndex];
end;

function TDoubleDynMatrixHelper.GetColCount: Integer;
begin
  Result := 0;
  if RowCount > 0 then
    Result := Self[0].Length;
end;

function TDoubleDynMatrixHelper.GetCol(const AIndex: Integer): TDoubleDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Result[I] := Self[I, AIndex];
end;

function TDoubleDynMatrixHelper.GetRowCount: Integer;
begin
  Result := System.Length(Self);
end;

function TDoubleDynMatrixHelper.GetSize: Integer;
begin
  Result := RowCount * ColCount * SizeOf(Double);
end;

function TDoubleDynMatrixHelper.GetSum: Double;
var
  I: Integer;
begin
  Result := 0;
  if RowCount = 0 then
    Exit;
  for I := LowRow to HighRow do
    Result := Result + Self[I].Sum;
end;

function TDoubleDynMatrixHelper.GetIsSquare: Boolean;
begin
  Result := RowCount = ColCount;
end;

procedure TDoubleDynMatrixHelper.Transpose;

  procedure DoSquare;
  var
    I, J: Integer;
  begin
    for I := LowRow to HighRow do
      for J := 0 to I - 1 do
      begin
        TSwapOp<Double>.Swap(Self[I, J], Self[J, I]);
      end;
  end;

  procedure DoRectangle;
  var
    LMatrix: TDoubleDynMatrix;
    I, J: Integer;
  begin
    LMatrix := TDoubleDynMatrix.Create(Self);
    Self := TDoubleDynMatrix.Create(LMatrix.ColCount, LMatrix.RowCount);
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

function TDoubleDynMatrixHelper.Transposed: TDoubleDynMatrix;
begin
  Result := TDoubleDynMatrix.Create(Self);
  Result.Transpose;
end;

procedure TDoubleDynMatrixHelper.NaN;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NaN;
  end;
end;

function TDoubleDynMatrixHelper.Negative: TDoubleDynMatrix;
var
  I, J: Integer;
begin
  Result := TDoubleDynMatrix.Create(Self);
  for I := Result.LowRow to Result.HighRow do
    Result[I] := Result[I].Negative;
end;

procedure TDoubleDynMatrixHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NegativeInfinity;
  end;
end;

procedure TDoubleDynMatrixHelper.Multiply(const AValue: Double);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Multiply(AValue);
end;

function TDoubleDynMatrixHelper.AddDown(const AVector: TDoubleDynArray): TDoubleDynMatrix;
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
    Result := TDoubleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TDoubleDynMatrix.Create(LengthA + 1, Self.ColCount);
  for J := Self[Self.HighRow].Low to Self[Self.HighRow].High do
    Result[Self.HighRow, J] := AVector[J];
end;

function TDoubleDynMatrixHelper.AddDown(const AMatrix: TDoubleDynMatrix): TDoubleDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TDoubleDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TDoubleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AMatrix.ColCount then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TDoubleDynMatrix.Create(LengthA + AMatrix.RowCount, Self.ColCount);
  K := 0;
  for I := LengthA to Self.HighRow do
  begin
    for J := Self[I].Low to Self[I].High do
      Result[I, J] := AMatrix[K, J];
    System.Inc(K);
  end;
end;

function TDoubleDynMatrixHelper.AddRight(const AVector: TDoubleDynArray): TDoubleDynMatrix;
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
    Result := TDoubleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TDoubleDynMatrix.Create(Self.RowCount, LengthA + 1);
  for I := AVector.Low to AVector.High do
    Result[I, LengthA] := AVector[I];
end;

function TDoubleDynMatrixHelper.AddRight(const AMatrix: TDoubleDynMatrix): TDoubleDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TDoubleDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TDoubleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AMatrix.RowCount then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TDoubleDynMatrix.Create(Self.RowCount, LengthA + AMatrix.ColCount);
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

procedure TDoubleDynMatrixHelper.Divide(const AValue: Double);
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Divide(AValue);
end;

procedure TDoubleDynMatrixHelper.SetRow(const AIndex: Integer; const AValue: TDoubleDynArray);
begin
  Self[AIndex] := TDoubleDynArray.Create(AValue);
end;

procedure TDoubleDynMatrixHelper.SetItem(const ARow, ACol: Integer; const AValue: Double);
begin
  Self[ARow, ACol] := AValue;
end;

procedure TDoubleDynMatrixHelper.SetCol(const AIndex: Integer; const AValue: TDoubleDynArray);
var
  I: Integer;
begin
  NeedSameLength(AValue.Length, Self.RowCount);
  MustBeInRange(AIndex, LowCol, HighCol);

  for I := Self.LowRow to Self.HighRow do
    Self[I, AIndex] := AValue[I];
end;

procedure TDoubleDynMatrixHelper.Sort;
var
  I, J, K: Integer;
  LTemp: TDoubleDynArray;
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

procedure TDoubleDynMatrixHelper.Subtract(const AMatrix: TDoubleDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AMatrix[I]);
end;

procedure TDoubleDynMatrixHelper.Subtract(const AValue: Double);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AValue);
end;

procedure TDoubleDynMatrixHelper.Add(const AValue: Double);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AValue);
end;

procedure TDoubleDynMatrixHelper.Add(const AMatrix: TDoubleDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AMatrix[I]);
end;

procedure TDoubleDynMatrixHelper.MustBeSquare;
begin
  if not IsSquare then
    raise EMatrixError.Create('Matrix must be square');
end;

procedure TDoubleDynMatrixHelper.Assign(const ASource: TDoubleDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ASource.RowCount, Self.ColCount, ASource.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Assign(ASource[I]);
end;

procedure TDoubleDynMatrixHelper.AssignTo(const ADest: TDoubleDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ADest.RowCount, Self.ColCount, ADest.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].AssignTo(ADest[I]);
end;

function TDoubleDynMatrixHelper.Multiply(const AMatrix: TDoubleDynMatrix): TDoubleDynMatrix;
var
  D: Double;
  M, K, N: Integer;
  I, L, J: Integer;
begin
  K := Self.ColCount;
  NeedSameLength(K, AMatrix.RowCount);
  M := Self.RowCount;
  N := AMatrix.ColCount;
  Result := TDoubleDynMatrix.Create(M, N);
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

constructor TDoubleDynMatrixHelper.Create(const AVector1, AVector2: TDoubleDynArray);
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

constructor TDoubleDynMatrixHelper.Create(const ADimension: Integer);
begin
  SetLength(Self, ADimension, ADimension);
end;

constructor TDoubleDynMatrixHelper.Create(const AMatrix: TDoubleDynMatrix);
var
  I: Integer;
begin
  Self := Nil;
  SetLength(Self, AMatrix.RowCount);
  for I := Low(Self) to High(Self) do
  begin
    Self[I] := TDoubleDynArray.Create(AMatrix[I]);
  end;
end;

constructor TDoubleDynMatrixHelper.Diag(const AVector: TDoubleDynArray);
var
  I: Integer;
begin
  Self := TDoubleDynMatrix.Create(AVector.Length);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := AVector[I];
end;

function TDoubleDynMatrixHelper.Equal(const AMatrix: TDoubleDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AMatrix[I]);
  end;
end;

function TDoubleDynMatrixHelper.Equal(const AValue: Double): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AValue);
  end;
end;

procedure TDoubleDynMatrixHelper.Exchange;
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
      TSwapOp<Double>.Swap(Self[i1, J1], Self[I2, J2]);
      System.Inc(i1);
      System.Inc(J1);
      System.Dec(I2);
      System.Dec(J2);
    until i1 >= I2;
  end;
end;

function TDoubleDynMatrixHelper.Exchanged: TDoubleDynMatrix;
begin
  MustBeSquare;
  Result := TDoubleDynMatrix.Create(Self);
  Result.Exchange;
end;

constructor TDoubleDynMatrixHelper.Eye(const ADimension: Integer);
var
  I: Integer;
begin
  Self := TDoubleDynMatrix.Create(ADimension);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := 1;
end;

constructor TDoubleDynMatrixHelper.Eye(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := TDoubleDynMatrix.Create(ARowCount, AColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    if I > Self.HighCol then
      Break;
    Self[I, I] := 1;
  end;
end;

procedure TDoubleDynMatrixHelper.Fill(const AValue: Double);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Fill(AValue);
end;

function TDoubleDynMatrixHelper.First: TDoubleDynArray;
begin
  Result := Self[LowRow];
end;

procedure TDoubleDynMatrixHelper.Apply(const AProc: TEleventProc<Double>);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Apply(AProc);
end;

function TDoubleDynMatrixHelper.ForEach(const AProc: TEleventProc<Double>): TDoubleDynMatrix;
begin
  Result := TDoubleDynMatrix.Create(Self);
  Result.Apply(AProc);
end;

function TDoubleDynMatrixHelper.MaxItem(var ARowIndex, AColIndex: Integer): Double;
var
  D: Double;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MaxItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MaxItem(J);
    if (CompareValue(D, Result) > 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TDoubleDynMatrixHelper.GetMaxValue: Double;
var
  R, C: Integer;
begin
  Result := MaxItem(R, C);
end;

function TDoubleDynMatrixHelper.GetMean: Double;
begin
  Result := Self.Sum / (RowCount * ColCount);
end;

function TDoubleDynMatrixHelper.MinItem(var ARowIndex, AColIndex: Integer): Double;
var
  D: Double;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MinItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MinItem(J);
    if (CompareValue(D, Result) < 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TDoubleDynMatrixHelper.GetMinor(const ARow, ACol: Integer): Double;
var
  LMatrix: TDoubleDynMatrix;
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
  LMatrix := TDoubleDynMatrix.Create(N);
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

function TDoubleDynMatrixHelper.GetCofactor(const ARow, ACol: Integer): Double;
begin
  Result := GetMinor(ARow, ACol);
  if (ARow + ACol) and 1 <> 0 then
    Result := -Result;
end;

function TDoubleDynMatrixHelper.GetMinValue: Double;
var
  R, C: Integer;
begin
  Result := MinItem(R, C);
end;

function TDoubleDynMatrixHelper.GetNorm: Double;
var
  I, J: Integer;
begin
  Result := 0;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + Self[I, J].Sqr;
  Result := Result.Sqrt;
end;

function TDoubleDynMatrixHelper.GetPItem(const ARow, ACol: Integer): PDouble;
begin
  Result := @Self[ARow, ACol];
end;

function TDoubleDynMatrixHelper.GetTrace: Double;
var
  I: Integer;
begin
  MustBeSquare;
  Result := 0;
  for I := Low(Self) to High(Self) do
    Result := Result + Self[I, I];
end;

function TDoubleDynMatrixHelper.GetVariance: Double;
var
  M: Double;
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

function TDoubleDynMatrixHelper.GetDeterminant: Double;
var
  D: Double;
  LMatrix: TDoubleDynMatrix;
  LVector: TDoubleDynArray;
  R, N, I, J: Integer;
  Sign: Integer;
begin
  MustBeSquare;
  LMatrix := TDoubleDynMatrix.Create(Self);

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
    while (I <= N) and System.Math.IsZero(LMatrix[I, R]) do
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
    if not SameValue(D, 1) then
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

function TDoubleDynMatrixHelper.GetDeviation: Double;
begin
  Result := System.Sqrt(Variance);
end;

function TDoubleDynMatrixHelper.GetIsDiagonal: Boolean;
var
  I, J, N: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  N := High(Self);
  for I := 1 to N do
    for J := 0 to I - 1 do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  for I := 0 to N - 1 do
    for J := I + 1 to N do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  Result := true;
end;

function TDoubleDynMatrixHelper.GetIsIdentity: Boolean;
var
  I: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 0 to High(Self) do
    if CompareValue(Self[I, I], 1) <> 0 then
      Exit;
  Result := IsDiagonal;
end;

function TDoubleDynMatrixHelper.GetIsSymmetric: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 1 to High(Self) do
    for J := 0 to I - 1 do
      if CompareValue(Self[I, J], Self[J, I]) <> 0 then
        Exit;
  Result := true;
end;

function TDoubleDynMatrixHelper.GetIsZero: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;
  Result := true;
end;

function TDoubleDynMatrixHelper.GetItem(const ARow, ACol: Integer): Double;
begin
  Result := Self[ARow, ACol];
end;

procedure TDoubleDynMatrixHelper.Inverse;
var
  LMatrix: TDoubleDynMatrix;
  D: Double;
  R, I, J, N: Integer;
begin
  MustBeSquare;
  LMatrix := TDoubleDynMatrix.Create(Self);
  N := RowCount;
  System.Dec(N);
  for R := 0 to N do
  begin
    if System.Math.IsZero(LMatrix[R, R]) then
      raise EMatrixError.Create('Inverse matrix by zeros in diag not implemented');

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

function TDoubleDynMatrixHelper.Inversed: TDoubleDynMatrix;
begin
  MustBeSquare;
  Result := TDoubleDynMatrix.Create(Self);
  Result.Inverse;
end;

function TDoubleDynMatrixHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsInfinity;
end;

function TDoubleDynMatrixHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNaN;
end;

function TDoubleDynMatrixHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNegativeInfinity;
end;

function TDoubleDynMatrixHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsPositiveInfinity;
end;

procedure TDoubleDynMatrixHelper.Normalize;
var
  D: Double;
  I, J: Integer;
begin
  D := MaxValue;
  if System.Math.IsZero(D) then
    Exit;
  D := 1 / D;

  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      Self[I, J] := Self[I, J] * D;
end;

function TDoubleDynMatrixHelper.Normalized: TDoubleDynMatrix;
begin
  Result := TDoubleDynMatrix.Create(Self);
  Result.Normalize;
end;

function TDoubleDynMatrixHelper.NotEqual(const AValue: Double): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AValue);
end;

constructor TDoubleDynMatrixHelper.Ones(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := Nil;
  System.SetLength(Self, ARowCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I] := TDoubleDynArray.Ones(AColCount);
  end;
end;

function TDoubleDynMatrixHelper.NotEqual(const AMatrix: TDoubleDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AMatrix[I]);
end;

constructor TDoubleDynMatrixHelper.Random(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  System.SetLength(Self, ARowCount);
  for I := LowRow to HighRow do
    Self[I] := TDoubleDynArray.Random(AColCount);
end;

constructor TDoubleDynMatrixHelper.Random(const ADimension: Integer);
var
  I: Integer;
begin
  System.SetLength(Self, ADimension);
  for I := LowRow to HighRow do
    Self[I] := TDoubleDynArray.Random(ADimension);
end;

procedure TDoubleDynMatrixHelper.Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
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
    TDoubleDynArray(Self[I]).Resize(AColCount, ASaveData);
end;

function TDoubleDynMatrixHelper.ReverseArray: TDoubleDynMatrix;
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

function TDoubleDynMatrixHelper.ToVector: TDoubleDynArray;
var
  I, J, K: Integer;
begin
  Result := TDoubleDynArray.Create(Self.RowCount * Self.ColCount);
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

function TDoubleDynMatrixHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TDoubleDynMatrixHelper.ToString: string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString;
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TDoubleDynMatrixHelper._ToString(const AMatrixSeparator, AVectorSeparator: string): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I]._ToString(AVectorSeparator);
  Result := '{' + string.Join(AMatrixSeparator, S) + '}';
end;

function TDoubleDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TDoubleDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

class function TDoubleDynMatrixHelper.Parse(const AMatrixStr: string): TDoubleDynMatrix;
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
    Result[I] := TDoubleDynArray.Parse(LStrArray[I]);
end;

procedure TDoubleDynMatrixHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].PositiveInfinity;
  end;
end;

function TDoubleDynMatrixHelper.Prod: Double;
var
  I: Integer;
begin
  Result := 1;
  for I := Self.LowRow to Self.HighRow do
    Result := Result * Self[I].Prod;
end;

constructor TSingleDynMatrixHelper.Create(const ARowCount, AColCount: Integer);
begin
  System.SetLength(Self, ARowCount, AColCount);
end;

function TSingleDynMatrixHelper.LowRow: Integer;
begin
  Result := System.Low(Self);
end;

function TSingleDynMatrixHelper.HighRow: Integer;
begin
  Result := System.High(Self);
end;

function TSingleDynMatrixHelper.Last: TSingleDynArray;
begin
  Result := Self[HighRow];
end;

function TSingleDynMatrixHelper.LowCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.Low(Self[0]);
end;

function TSingleDynMatrixHelper.HighCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.High(Self[0]);
end;

procedure TSingleDynMatrixHelper.Zero;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Zero;
end;

function TSingleDynMatrixHelper.GetRow(const AIndex: Integer): TSingleDynArray;
begin
  Result := Self[AIndex];
end;

function TSingleDynMatrixHelper.GetColCount: Integer;
begin
  Result := 0;
  if RowCount > 0 then
    Result := Self[0].Length;
end;

function TSingleDynMatrixHelper.GetCol(const AIndex: Integer): TSingleDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Result[I] := Self[I, AIndex];
end;

function TSingleDynMatrixHelper.GetRowCount: Integer;
begin
  Result := System.Length(Self);
end;

function TSingleDynMatrixHelper.GetSize: Integer;
begin
  Result := RowCount * ColCount * SizeOf(Single);
end;

function TSingleDynMatrixHelper.GetSum: Single;
var
  I: Integer;
begin
  Result := 0;
  if RowCount = 0 then
    Exit;
  for I := LowRow to HighRow do
    Result := Result + Self[I].Sum;
end;

function TSingleDynMatrixHelper.GetIsSquare: Boolean;
begin
  Result := RowCount = ColCount;
end;

procedure TSingleDynMatrixHelper.Transpose;

  procedure DoSquare;
  var
    I, J: Integer;
  begin
    for I := LowRow to HighRow do
      for J := 0 to I - 1 do
      begin
        TSwapOp<Single>.Swap(Self[I, J], Self[J, I]);
      end;
  end;

  procedure DoRectangle;
  var
    LMatrix: TSingleDynMatrix;
    I, J: Integer;
  begin
    LMatrix := TSingleDynMatrix.Create(Self);
    Self := TSingleDynMatrix.Create(LMatrix.ColCount, LMatrix.RowCount);
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

function TSingleDynMatrixHelper.Transposed: TSingleDynMatrix;
begin
  Result := TSingleDynMatrix.Create(Self);
  Result.Transpose;
end;

procedure TSingleDynMatrixHelper.NaN;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NaN;
  end;
end;

function TSingleDynMatrixHelper.Negative: TSingleDynMatrix;
var
  I, J: Integer;
begin
  Result := TSingleDynMatrix.Create(Self);
  for I := Result.LowRow to Result.HighRow do
    Result[I] := Result[I].Negative;
end;

procedure TSingleDynMatrixHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NegativeInfinity;
  end;
end;

procedure TSingleDynMatrixHelper.Multiply(const AValue: Single);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Multiply(AValue);
end;

function TSingleDynMatrixHelper.AddDown(const AVector: TSingleDynArray): TSingleDynMatrix;
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
    Result := TSingleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TSingleDynMatrix.Create(LengthA + 1, Self.ColCount);
  for J := Self[Self.HighRow].Low to Self[Self.HighRow].High do
    Result[Self.HighRow, J] := AVector[J];
end;

function TSingleDynMatrixHelper.AddDown(const AMatrix: TSingleDynMatrix): TSingleDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TSingleDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TSingleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AMatrix.ColCount then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TSingleDynMatrix.Create(LengthA + AMatrix.RowCount, Self.ColCount);
  K := 0;
  for I := LengthA to Self.HighRow do
  begin
    for J := Self[I].Low to Self[I].High do
      Result[I, J] := AMatrix[K, J];
    System.Inc(K);
  end;
end;

function TSingleDynMatrixHelper.AddRight(const AVector: TSingleDynArray): TSingleDynMatrix;
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
    Result := TSingleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TSingleDynMatrix.Create(Self.RowCount, LengthA + 1);
  for I := AVector.Low to AVector.High do
    Result[I, LengthA] := AVector[I];
end;

function TSingleDynMatrixHelper.AddRight(const AMatrix: TSingleDynMatrix): TSingleDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TSingleDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TSingleDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AMatrix.RowCount then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TSingleDynMatrix.Create(Self.RowCount, LengthA + AMatrix.ColCount);
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

procedure TSingleDynMatrixHelper.Divide(const AValue: Single);
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Divide(AValue);
end;

procedure TSingleDynMatrixHelper.SetRow(const AIndex: Integer; const AValue: TSingleDynArray);
begin
  Self[AIndex] := TSingleDynArray.Create(AValue);
end;

procedure TSingleDynMatrixHelper.SetItem(const ARow, ACol: Integer; const AValue: Single);
begin
  Self[ARow, ACol] := AValue;
end;

procedure TSingleDynMatrixHelper.SetCol(const AIndex: Integer; const AValue: TSingleDynArray);
var
  I: Integer;
begin
  NeedSameLength(AValue.Length, Self.RowCount);
  MustBeInRange(AIndex, LowCol, HighCol);

  for I := Self.LowRow to Self.HighRow do
    Self[I, AIndex] := AValue[I];
end;

procedure TSingleDynMatrixHelper.Sort;
var
  I, J, K: Integer;
  LTemp: TSingleDynArray;
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

procedure TSingleDynMatrixHelper.Subtract(const AMatrix: TSingleDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AMatrix[I]);
end;

procedure TSingleDynMatrixHelper.Subtract(const AValue: Single);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AValue);
end;

procedure TSingleDynMatrixHelper.Add(const AValue: Single);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AValue);
end;

procedure TSingleDynMatrixHelper.Add(const AMatrix: TSingleDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AMatrix[I]);
end;

procedure TSingleDynMatrixHelper.MustBeSquare;
begin
  if not IsSquare then
    raise EMatrixError.Create('Matrix must be square');
end;

procedure TSingleDynMatrixHelper.Assign(const ASource: TSingleDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ASource.RowCount, Self.ColCount, ASource.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Assign(ASource[I]);
end;

procedure TSingleDynMatrixHelper.AssignTo(const ADest: TSingleDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ADest.RowCount, Self.ColCount, ADest.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].AssignTo(ADest[I]);
end;

function TSingleDynMatrixHelper.Multiply(const AMatrix: TSingleDynMatrix): TSingleDynMatrix;
var
  D: Single;
  M, K, N: Integer;
  I, L, J: Integer;
begin
  K := Self.ColCount;
  NeedSameLength(K, AMatrix.RowCount);
  M := Self.RowCount;
  N := AMatrix.ColCount;
  Result := TSingleDynMatrix.Create(M, N);
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

constructor TSingleDynMatrixHelper.Create(const AVector1, AVector2: TSingleDynArray);
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

constructor TSingleDynMatrixHelper.Create(const ADimension: Integer);
begin
  SetLength(Self, ADimension, ADimension);
end;

constructor TSingleDynMatrixHelper.Create(const AMatrix: TSingleDynMatrix);
var
  I: Integer;
begin
  Self := Nil;
  SetLength(Self, AMatrix.RowCount);
  for I := Low(Self) to High(Self) do
  begin
    Self[I] := TSingleDynArray.Create(AMatrix[I]);
  end;
end;

constructor TSingleDynMatrixHelper.Diag(const AVector: TSingleDynArray);
var
  I: Integer;
begin
  Self := TSingleDynMatrix.Create(AVector.Length);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := AVector[I];
end;

function TSingleDynMatrixHelper.Equal(const AMatrix: TSingleDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AMatrix[I]);
  end;
end;

function TSingleDynMatrixHelper.Equal(const AValue: Single): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AValue);
  end;
end;

procedure TSingleDynMatrixHelper.Exchange;
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
      TSwapOp<Single>.Swap(Self[i1, J1], Self[I2, J2]);
      System.Inc(i1);
      System.Inc(J1);
      System.Dec(I2);
      System.Dec(J2);
    until i1 >= I2;
  end;
end;

function TSingleDynMatrixHelper.Exchanged: TSingleDynMatrix;
begin
  MustBeSquare;
  Result := TSingleDynMatrix.Create(Self);
  Result.Exchange;
end;

constructor TSingleDynMatrixHelper.Eye(const ADimension: Integer);
var
  I: Integer;
begin
  Self := TSingleDynMatrix.Create(ADimension);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := 1;
end;

constructor TSingleDynMatrixHelper.Eye(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := TSingleDynMatrix.Create(ARowCount, AColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    if I > Self.HighCol then
      Break;
    Self[I, I] := 1;
  end;
end;

procedure TSingleDynMatrixHelper.Fill(const AValue: Single);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Fill(AValue);
end;

function TSingleDynMatrixHelper.First: TSingleDynArray;
begin
  Result := Self[LowRow];
end;

procedure TSingleDynMatrixHelper.Apply(const AProc: TEleventProc<Single>);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Apply(AProc);
end;

function TSingleDynMatrixHelper.ForEach(const AProc: TEleventProc<Single>): TSingleDynMatrix;
begin
  Result := TSingleDynMatrix.Create(Self);
  Result.Apply(AProc);
end;

function TSingleDynMatrixHelper.MaxItem(var ARowIndex, AColIndex: Integer): Single;
var
  D: Single;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MaxItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MaxItem(J);
    if (CompareValue(D, Result) > 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TSingleDynMatrixHelper.GetMaxValue: Single;
var
  R, C: Integer;
begin
  Result := MaxItem(R, C);
end;

function TSingleDynMatrixHelper.GetMean: Single;
begin
  Result := Self.Sum / (RowCount * ColCount);
end;

function TSingleDynMatrixHelper.MinItem(var ARowIndex, AColIndex: Integer): Single;
var
  D: Single;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MinItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MinItem(J);
    if (CompareValue(D, Result) < 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TSingleDynMatrixHelper.GetMinor(const ARow, ACol: Integer): Single;
var
  LMatrix: TSingleDynMatrix;
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
  LMatrix := TSingleDynMatrix.Create(N);
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

function TSingleDynMatrixHelper.GetCofactor(const ARow, ACol: Integer): Single;
begin
  Result := GetMinor(ARow, ACol);
  if (ARow + ACol) and 1 <> 0 then
    Result := -Result;
end;

function TSingleDynMatrixHelper.GetMinValue: Single;
var
  R, C: Integer;
begin
  Result := MinItem(R, C);
end;

function TSingleDynMatrixHelper.GetNorm: Single;
var
  I, J: Integer;
begin
  Result := 0;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + Self[I, J].Sqr;
  Result := Result.Sqrt;
end;

function TSingleDynMatrixHelper.GetPItem(const ARow, ACol: Integer): PSingle;
begin
  Result := @Self[ARow, ACol];
end;

function TSingleDynMatrixHelper.GetTrace: Single;
var
  I: Integer;
begin
  MustBeSquare;
  Result := 0;
  for I := Low(Self) to High(Self) do
    Result := Result + Self[I, I];
end;

function TSingleDynMatrixHelper.GetVariance: Single;
var
  M: Single;
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

function TSingleDynMatrixHelper.GetDeterminant: Single;
var
  D: Single;
  LMatrix: TSingleDynMatrix;
  LVector: TSingleDynArray;
  R, N, I, J: Integer;
  Sign: Integer;
begin
  MustBeSquare;
  LMatrix := TSingleDynMatrix.Create(Self);

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
    while (I <= N) and System.Math.IsZero(LMatrix[I, R]) do
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
    if not SameValue(D, 1) then
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

function TSingleDynMatrixHelper.GetDeviation: Single;
begin
  Result := System.Sqrt(Variance);
end;

function TSingleDynMatrixHelper.GetIsDiagonal: Boolean;
var
  I, J, N: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  N := High(Self);
  for I := 1 to N do
    for J := 0 to I - 1 do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  for I := 0 to N - 1 do
    for J := I + 1 to N do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  Result := true;
end;

function TSingleDynMatrixHelper.GetIsIdentity: Boolean;
var
  I: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 0 to High(Self) do
    if CompareValue(Self[I, I], 1) <> 0 then
      Exit;
  Result := IsDiagonal;
end;

function TSingleDynMatrixHelper.GetIsSymmetric: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 1 to High(Self) do
    for J := 0 to I - 1 do
      if CompareValue(Self[I, J], Self[J, I]) <> 0 then
        Exit;
  Result := true;
end;

function TSingleDynMatrixHelper.GetIsZero: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;
  Result := true;
end;

function TSingleDynMatrixHelper.GetItem(const ARow, ACol: Integer): Single;
begin
  Result := Self[ARow, ACol];
end;

procedure TSingleDynMatrixHelper.Inverse;
var
  LMatrix: TSingleDynMatrix;
  D: Single;
  R, I, J, N: Integer;
begin
  MustBeSquare;
  LMatrix := TSingleDynMatrix.Create(Self);
  N := RowCount;
  System.Dec(N);
  for R := 0 to N do
  begin
    if System.Math.IsZero(LMatrix[R, R]) then
      raise EMatrixError.Create('Inverse matrix by zeros in diag not implemented');

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

function TSingleDynMatrixHelper.Inversed: TSingleDynMatrix;
begin
  MustBeSquare;
  Result := TSingleDynMatrix.Create(Self);
  Result.Inverse;
end;

function TSingleDynMatrixHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsInfinity;
end;

function TSingleDynMatrixHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNaN;
end;

function TSingleDynMatrixHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNegativeInfinity;
end;

function TSingleDynMatrixHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsPositiveInfinity;
end;

procedure TSingleDynMatrixHelper.Normalize;
var
  D: Single;
  I, J: Integer;
begin
  D := MaxValue;
  if System.Math.IsZero(D) then
    Exit;
  D := 1 / D;

  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      Self[I, J] := Self[I, J] * D;
end;

function TSingleDynMatrixHelper.Normalized: TSingleDynMatrix;
begin
  Result := TSingleDynMatrix.Create(Self);
  Result.Normalize;
end;

function TSingleDynMatrixHelper.NotEqual(const AValue: Single): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AValue);
end;

constructor TSingleDynMatrixHelper.Ones(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := Nil;
  System.SetLength(Self, ARowCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I] := TSingleDynArray.Ones(AColCount);
  end;
end;

function TSingleDynMatrixHelper.NotEqual(const AMatrix: TSingleDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AMatrix[I]);
end;

constructor TSingleDynMatrixHelper.Random(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  System.SetLength(Self, ARowCount);
  for I := LowRow to HighRow do
    Self[I] := TSingleDynArray.Random(AColCount);
end;

constructor TSingleDynMatrixHelper.Random(const ADimension: Integer);
var
  I: Integer;
begin
  System.SetLength(Self, ADimension);
  for I := LowRow to HighRow do
    Self[I] := TSingleDynArray.Random(ADimension);
end;

procedure TSingleDynMatrixHelper.Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
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
    TSingleDynArray(Self[I]).Resize(AColCount, ASaveData);
end;

function TSingleDynMatrixHelper.ReverseArray: TSingleDynMatrix;
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

function TSingleDynMatrixHelper.ToVector: TSingleDynArray;
var
  I, J, K: Integer;
begin
  Result := TSingleDynArray.Create(Self.RowCount * Self.ColCount);
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

function TSingleDynMatrixHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TSingleDynMatrixHelper.ToString: string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString;
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TSingleDynMatrixHelper._ToString(const AMatrixSeparator, AVectorSeparator: string): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I]._ToString(AVectorSeparator);
  Result := '{' + string.Join(AMatrixSeparator, S) + '}';
end;

function TSingleDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TSingleDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

class function TSingleDynMatrixHelper.Parse(const AMatrixStr: string): TSingleDynMatrix;
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
    Result[I] := TSingleDynArray.Parse(LStrArray[I]);
end;

procedure TSingleDynMatrixHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].PositiveInfinity;
  end;
end;

function TSingleDynMatrixHelper.Prod: Single;
var
  I: Integer;
begin
  Result := 1;
  for I := Self.LowRow to Self.HighRow do
    Result := Result * Self[I].Prod;
end;

constructor TExtendedDynMatrixHelper.Create(const ARowCount, AColCount: Integer);
begin
  System.SetLength(Self, ARowCount, AColCount);
end;

function TExtendedDynMatrixHelper.LowRow: Integer;
begin
  Result := System.Low(Self);
end;

function TExtendedDynMatrixHelper.HighRow: Integer;
begin
  Result := System.High(Self);
end;

function TExtendedDynMatrixHelper.Last: TExtendedDynArray;
begin
  Result := Self[HighRow];
end;

function TExtendedDynMatrixHelper.LowCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.Low(Self[0]);
end;

function TExtendedDynMatrixHelper.HighCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.High(Self[0]);
end;

procedure TExtendedDynMatrixHelper.Zero;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Zero;
end;

function TExtendedDynMatrixHelper.GetRow(const AIndex: Integer): TExtendedDynArray;
begin
  Result := Self[AIndex];
end;

function TExtendedDynMatrixHelper.GetColCount: Integer;
begin
  Result := 0;
  if RowCount > 0 then
    Result := Self[0].Length;
end;

function TExtendedDynMatrixHelper.GetCol(const AIndex: Integer): TExtendedDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Result[I] := Self[I, AIndex];
end;

function TExtendedDynMatrixHelper.GetRowCount: Integer;
begin
  Result := System.Length(Self);
end;

function TExtendedDynMatrixHelper.GetSize: Integer;
begin
  Result := RowCount * ColCount * SizeOf(Extended);
end;

function TExtendedDynMatrixHelper.GetSum: Extended;
var
  I: Integer;
begin
  Result := 0;
  if RowCount = 0 then
    Exit;
  for I := LowRow to HighRow do
    Result := Result + Self[I].Sum;
end;

function TExtendedDynMatrixHelper.GetIsSquare: Boolean;
begin
  Result := RowCount = ColCount;
end;

procedure TExtendedDynMatrixHelper.Transpose;

  procedure DoSquare;
  var
    I, J: Integer;
  begin
    for I := LowRow to HighRow do
      for J := 0 to I - 1 do
      begin
        TSwapOp<Extended>.Swap(Self[I, J], Self[J, I]);
      end;
  end;

  procedure DoRectangle;
  var
    LMatrix: TExtendedDynMatrix;
    I, J: Integer;
  begin
    LMatrix := TExtendedDynMatrix.Create(Self);
    Self := TExtendedDynMatrix.Create(LMatrix.ColCount, LMatrix.RowCount);
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

function TExtendedDynMatrixHelper.Transposed: TExtendedDynMatrix;
begin
  Result := TExtendedDynMatrix.Create(Self);
  Result.Transpose;
end;

procedure TExtendedDynMatrixHelper.NaN;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NaN;
  end;
end;

function TExtendedDynMatrixHelper.Negative: TExtendedDynMatrix;
var
  I, J: Integer;
begin
  Result := TExtendedDynMatrix.Create(Self);
  for I := Result.LowRow to Result.HighRow do
    Result[I] := Result[I].Negative;
end;

procedure TExtendedDynMatrixHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].NegativeInfinity;
  end;
end;

procedure TExtendedDynMatrixHelper.Multiply(const AValue: Extended);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Multiply(AValue);
end;

function TExtendedDynMatrixHelper.AddDown(const AVector: TExtendedDynArray): TExtendedDynMatrix;
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
    Result := TExtendedDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TExtendedDynMatrix.Create(LengthA + 1, Self.ColCount);
  for J := Self[Self.HighRow].Low to Self[Self.HighRow].High do
    Result[Self.HighRow, J] := AVector[J];
end;

function TExtendedDynMatrixHelper.AddDown(const AMatrix: TExtendedDynMatrix): TExtendedDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TExtendedDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TExtendedDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AMatrix.ColCount then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TExtendedDynMatrix.Create(LengthA + AMatrix.RowCount, Self.ColCount);
  K := 0;
  for I := LengthA to Self.HighRow do
  begin
    for J := Self[I].Low to Self[I].High do
      Result[I, J] := AMatrix[K, J];
    System.Inc(K);
  end;
end;

function TExtendedDynMatrixHelper.AddRight(const AVector: TExtendedDynArray): TExtendedDynMatrix;
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
    Result := TExtendedDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TExtendedDynMatrix.Create(Self.RowCount, LengthA + 1);
  for I := AVector.Low to AVector.High do
    Result[I, LengthA] := AVector[I];
end;

function TExtendedDynMatrixHelper.AddRight(const AMatrix: TExtendedDynMatrix): TExtendedDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TExtendedDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TExtendedDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AMatrix.RowCount then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TExtendedDynMatrix.Create(Self.RowCount, LengthA + AMatrix.ColCount);
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

procedure TExtendedDynMatrixHelper.Divide(const AValue: Extended);
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Divide(AValue);
end;

procedure TExtendedDynMatrixHelper.SetRow(const AIndex: Integer; const AValue: TExtendedDynArray);
begin
  Self[AIndex] := TExtendedDynArray.Create(AValue);
end;

procedure TExtendedDynMatrixHelper.SetItem(const ARow, ACol: Integer; const AValue: Extended);
begin
  Self[ARow, ACol] := AValue;
end;

procedure TExtendedDynMatrixHelper.SetCol(const AIndex: Integer; const AValue: TExtendedDynArray);
var
  I: Integer;
begin
  NeedSameLength(AValue.Length, Self.RowCount);
  MustBeInRange(AIndex, LowCol, HighCol);

  for I := Self.LowRow to Self.HighRow do
    Self[I, AIndex] := AValue[I];
end;

procedure TExtendedDynMatrixHelper.Sort;
var
  I, J, K: Integer;
  LTemp: TExtendedDynArray;
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

procedure TExtendedDynMatrixHelper.Subtract(const AMatrix: TExtendedDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AMatrix[I]);
end;

procedure TExtendedDynMatrixHelper.Subtract(const AValue: Extended);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AValue);
end;

procedure TExtendedDynMatrixHelper.Add(const AValue: Extended);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AValue);
end;

procedure TExtendedDynMatrixHelper.Add(const AMatrix: TExtendedDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AMatrix[I]);
end;

procedure TExtendedDynMatrixHelper.MustBeSquare;
begin
  if not IsSquare then
    raise EMatrixError.Create('Matrix must be square');
end;

procedure TExtendedDynMatrixHelper.Assign(const ASource: TExtendedDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ASource.RowCount, Self.ColCount, ASource.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Assign(ASource[I]);
end;

procedure TExtendedDynMatrixHelper.AssignTo(const ADest: TExtendedDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ADest.RowCount, Self.ColCount, ADest.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].AssignTo(ADest[I]);
end;

function TExtendedDynMatrixHelper.Multiply(const AMatrix: TExtendedDynMatrix): TExtendedDynMatrix;
var
  D: Extended;
  M, K, N: Integer;
  I, L, J: Integer;
begin
  K := Self.ColCount;
  NeedSameLength(K, AMatrix.RowCount);
  M := Self.RowCount;
  N := AMatrix.ColCount;
  Result := TExtendedDynMatrix.Create(M, N);
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

constructor TExtendedDynMatrixHelper.Create(const AVector1, AVector2: TExtendedDynArray);
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

constructor TExtendedDynMatrixHelper.Create(const ADimension: Integer);
begin
  SetLength(Self, ADimension, ADimension);
end;

constructor TExtendedDynMatrixHelper.Create(const AMatrix: TExtendedDynMatrix);
var
  I: Integer;
begin
  Self := Nil;
  SetLength(Self, AMatrix.RowCount);
  for I := Low(Self) to High(Self) do
  begin
    Self[I] := TExtendedDynArray.Create(AMatrix[I]);
  end;
end;

constructor TExtendedDynMatrixHelper.Diag(const AVector: TExtendedDynArray);
var
  I: Integer;
begin
  Self := TExtendedDynMatrix.Create(AVector.Length);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := AVector[I];
end;

function TExtendedDynMatrixHelper.Equal(const AMatrix: TExtendedDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AMatrix[I]);
  end;
end;

function TExtendedDynMatrixHelper.Equal(const AValue: Extended): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AValue);
  end;
end;

procedure TExtendedDynMatrixHelper.Exchange;
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
      TSwapOp<Extended>.Swap(Self[i1, J1], Self[I2, J2]);
      System.Inc(i1);
      System.Inc(J1);
      System.Dec(I2);
      System.Dec(J2);
    until i1 >= I2;
  end;
end;

function TExtendedDynMatrixHelper.Exchanged: TExtendedDynMatrix;
begin
  MustBeSquare;
  Result := TExtendedDynMatrix.Create(Self);
  Result.Exchange;
end;

constructor TExtendedDynMatrixHelper.Eye(const ADimension: Integer);
var
  I: Integer;
begin
  Self := TExtendedDynMatrix.Create(ADimension);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := 1;
end;

constructor TExtendedDynMatrixHelper.Eye(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := TExtendedDynMatrix.Create(ARowCount, AColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    if I > Self.HighCol then
      Break;
    Self[I, I] := 1;
  end;
end;

procedure TExtendedDynMatrixHelper.Fill(const AValue: Extended);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Fill(AValue);
end;

function TExtendedDynMatrixHelper.First: TExtendedDynArray;
begin
  Result := Self[LowRow];
end;

procedure TExtendedDynMatrixHelper.Apply(const AProc: TEleventProc<Extended>);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Apply(AProc);
end;

function TExtendedDynMatrixHelper.ForEach(const AProc: TEleventProc<Extended>): TExtendedDynMatrix;
begin
  Result := TExtendedDynMatrix.Create(Self);
  Result.Apply(AProc);
end;

function TExtendedDynMatrixHelper.MaxItem(var ARowIndex, AColIndex: Integer): Extended;
var
  D: Extended;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MaxItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MaxItem(J);
    if (CompareValue(D, Result) > 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TExtendedDynMatrixHelper.GetMaxValue: Extended;
var
  R, C: Integer;
begin
  Result := MaxItem(R, C);
end;

function TExtendedDynMatrixHelper.GetMean: Extended;
begin
  Result := Self.Sum / (RowCount * ColCount);
end;

function TExtendedDynMatrixHelper.MinItem(var ARowIndex, AColIndex: Integer): Extended;
var
  D: Extended;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MinItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MinItem(J);
    if (CompareValue(D, Result) < 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TExtendedDynMatrixHelper.GetMinor(const ARow, ACol: Integer): Extended;
var
  LMatrix: TExtendedDynMatrix;
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
  LMatrix := TExtendedDynMatrix.Create(N);
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

function TExtendedDynMatrixHelper.GetCofactor(const ARow, ACol: Integer): Extended;
begin
  Result := GetMinor(ARow, ACol);
  if (ARow + ACol) and 1 <> 0 then
    Result := -Result;
end;

function TExtendedDynMatrixHelper.GetMinValue: Extended;
var
  R, C: Integer;
begin
  Result := MinItem(R, C);
end;

function TExtendedDynMatrixHelper.GetNorm: Extended;
var
  I, J: Integer;
begin
  Result := 0;
  for I := LowRow to HighRow do
    for J := LowCol to HighCol do
      Result := Result + Self[I, J].Sqr;
  Result := Result.Sqrt;
end;

function TExtendedDynMatrixHelper.GetPItem(const ARow, ACol: Integer): PExtended;
begin
  Result := @Self[ARow, ACol];
end;

function TExtendedDynMatrixHelper.GetTrace: Extended;
var
  I: Integer;
begin
  MustBeSquare;
  Result := 0;
  for I := Low(Self) to High(Self) do
    Result := Result + Self[I, I];
end;

function TExtendedDynMatrixHelper.GetVariance: Extended;
var
  M: Extended;
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

function TExtendedDynMatrixHelper.GetDeterminant: Extended;
var
  D: Extended;
  LMatrix: TExtendedDynMatrix;
  LVector: TExtendedDynArray;
  R, N, I, J: Integer;
  Sign: Integer;
begin
  MustBeSquare;
  LMatrix := TExtendedDynMatrix.Create(Self);

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
    while (I <= N) and System.Math.IsZero(LMatrix[I, R]) do
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
    if not SameValue(D, 1) then
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

function TExtendedDynMatrixHelper.GetDeviation: Extended;
begin
  Result := System.Sqrt(Variance);
end;

function TExtendedDynMatrixHelper.GetIsDiagonal: Boolean;
var
  I, J, N: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  N := High(Self);
  for I := 1 to N do
    for J := 0 to I - 1 do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  for I := 0 to N - 1 do
    for J := I + 1 to N do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  Result := true;
end;

function TExtendedDynMatrixHelper.GetIsIdentity: Boolean;
var
  I: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 0 to High(Self) do
    if CompareValue(Self[I, I], 1) <> 0 then
      Exit;
  Result := IsDiagonal;
end;

function TExtendedDynMatrixHelper.GetIsSymmetric: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 1 to High(Self) do
    for J := 0 to I - 1 do
      if CompareValue(Self[I, J], Self[J, I]) <> 0 then
        Exit;
  Result := true;
end;

function TExtendedDynMatrixHelper.GetIsZero: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;
  Result := true;
end;

function TExtendedDynMatrixHelper.GetItem(const ARow, ACol: Integer): Extended;
begin
  Result := Self[ARow, ACol];
end;

procedure TExtendedDynMatrixHelper.Inverse;
var
  LMatrix: TExtendedDynMatrix;
  D: Extended;
  R, I, J, N: Integer;
begin
  MustBeSquare;
  LMatrix := TExtendedDynMatrix.Create(Self);
  N := RowCount;
  System.Dec(N);
  for R := 0 to N do
  begin
    if System.Math.IsZero(LMatrix[R, R]) then
      raise EMatrixError.Create('Inverse matrix by zeros in diag not implemented');

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

function TExtendedDynMatrixHelper.Inversed: TExtendedDynMatrix;
begin
  MustBeSquare;
  Result := TExtendedDynMatrix.Create(Self);
  Result.Inverse;
end;

function TExtendedDynMatrixHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsInfinity;
end;

function TExtendedDynMatrixHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNaN;
end;

function TExtendedDynMatrixHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsNegativeInfinity;
end;

function TExtendedDynMatrixHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].IsPositiveInfinity;
end;

procedure TExtendedDynMatrixHelper.Normalize;
var
  D: Extended;
  I, J: Integer;
begin
  D := MaxValue;
  if System.Math.IsZero(D) then
    Exit;
  D := 1 / D;

  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      Self[I, J] := Self[I, J] * D;
end;

function TExtendedDynMatrixHelper.Normalized: TExtendedDynMatrix;
begin
  Result := TExtendedDynMatrix.Create(Self);
  Result.Normalize;
end;

function TExtendedDynMatrixHelper.NotEqual(const AValue: Extended): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AValue);
end;

constructor TExtendedDynMatrixHelper.Ones(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := Nil;
  System.SetLength(Self, ARowCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I] := TExtendedDynArray.Ones(AColCount);
  end;
end;

function TExtendedDynMatrixHelper.NotEqual(const AMatrix: TExtendedDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AMatrix[I]);
end;

constructor TExtendedDynMatrixHelper.Random(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  System.SetLength(Self, ARowCount);
  for I := LowRow to HighRow do
    Self[I] := TExtendedDynArray.Random(AColCount);
end;

constructor TExtendedDynMatrixHelper.Random(const ADimension: Integer);
var
  I: Integer;
begin
  System.SetLength(Self, ADimension);
  for I := LowRow to HighRow do
    Self[I] := TExtendedDynArray.Random(ADimension);
end;

procedure TExtendedDynMatrixHelper.Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
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
    TExtendedDynArray(Self[I]).Resize(AColCount, ASaveData);
end;

function TExtendedDynMatrixHelper.ReverseArray: TExtendedDynMatrix;
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

function TExtendedDynMatrixHelper.ToVector: TExtendedDynArray;
var
  I, J, K: Integer;
begin
  Result := TExtendedDynArray.Create(Self.RowCount * Self.ColCount);
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

function TExtendedDynMatrixHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TExtendedDynMatrixHelper.ToString: string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString;
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TExtendedDynMatrixHelper._ToString(const AMatrixSeparator, AVectorSeparator: string): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I]._ToString(AVectorSeparator);
  Result := '{' + string.Join(AMatrixSeparator, S) + '}';
end;

function TExtendedDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TExtendedDynMatrixHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

class function TExtendedDynMatrixHelper.Parse(const AMatrixStr: string): TExtendedDynMatrix;
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
    Result[I] := TExtendedDynArray.Parse(LStrArray[I]);
end;

procedure TExtendedDynMatrixHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I].PositiveInfinity;
  end;
end;

function TExtendedDynMatrixHelper.Prod: Extended;
var
  I: Integer;
begin
  Result := 1;
  for I := Self.LowRow to Self.HighRow do
    Result := Result * Self[I].Prod;
end;

constructor TIntegerDynMatrixHelper.Create(const ARowCount, AColCount: Integer);
begin
  System.SetLength(Self, ARowCount, AColCount);
end;

function TIntegerDynMatrixHelper.LowRow: Integer;
begin
  Result := System.Low(Self);
end;

function TIntegerDynMatrixHelper.HighRow: Integer;
begin
  Result := System.High(Self);
end;

function TIntegerDynMatrixHelper.Last: TIntegerDynArray;
begin
  Result := Self[HighRow];
end;

function TIntegerDynMatrixHelper.LowCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.Low(Self[0]);
end;

function TIntegerDynMatrixHelper.HighCol: Integer;
begin
  Result := -1;
  if RowCount > 0 then
    Result := System.High(Self[0]);
end;

procedure TIntegerDynMatrixHelper.Zero;
var
  I: Integer;
begin
  for I := LowRow to HighRow do
    Self[I].Zero;
end;

function TIntegerDynMatrixHelper.GetRow(const AIndex: Integer): TIntegerDynArray;
begin
  Result := Self[AIndex];
end;

function TIntegerDynMatrixHelper.GetColCount: Integer;
begin
  Result := 0;
  if RowCount > 0 then
    Result := Self[0].Length;
end;

function TIntegerDynMatrixHelper.GetCol(const AIndex: Integer): TIntegerDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Result[I] := Self[I, AIndex];
end;

function TIntegerDynMatrixHelper.GetRowCount: Integer;
begin
  Result := System.Length(Self);
end;

function TIntegerDynMatrixHelper.GetSize: Integer;
begin
  Result := RowCount * ColCount * SizeOf(Integer);
end;

function TIntegerDynMatrixHelper.GetSum: Integer;
var
  I: Integer;
begin
  Result := 0;
  if RowCount = 0 then
    Exit;
  for I := LowRow to HighRow do
    Result := Result + Self[I].Sum;
end;

function TIntegerDynMatrixHelper.GetIsSquare: Boolean;
begin
  Result := RowCount = ColCount;
end;

procedure TIntegerDynMatrixHelper.Transpose;

  procedure DoSquare;
  var
    I, J: Integer;
  begin
    for I := LowRow to HighRow do
      for J := 0 to I - 1 do
      begin
        TSwapOp<Integer>.Swap(Self[I, J], Self[J, I]);
      end;
  end;

  procedure DoRectangle;
  var
    LMatrix: TIntegerDynMatrix;
    I, J: Integer;
  begin
    LMatrix := TIntegerDynMatrix.Create(Self);
    Self := TIntegerDynMatrix.Create(LMatrix.ColCount, LMatrix.RowCount);
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

function TIntegerDynMatrixHelper.Transposed: TIntegerDynMatrix;
begin
  Result := TIntegerDynMatrix.Create(Self);
  Result.Transpose;
end;

function TIntegerDynMatrixHelper.Negative: TIntegerDynMatrix;
var
  I, J: Integer;
begin
  Result := TIntegerDynMatrix.Create(Self);
  for I := Result.LowRow to Result.HighRow do
    Result[I] := Result[I].Negative;
end;

function TIntegerDynMatrixHelper.AddDown(const AVector: TIntegerDynArray): TIntegerDynMatrix;
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
    Result := TIntegerDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TIntegerDynMatrix.Create(LengthA + 1, Self.ColCount);
  for J := Self[Self.HighRow].Low to Self[Self.HighRow].High do
    Result[Self.HighRow, J] := AVector[J];
end;

function TIntegerDynMatrixHelper.AddDown(const AMatrix: TIntegerDynMatrix): TIntegerDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TIntegerDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TIntegerDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.RowCount;
  if Self.ColCount <> AMatrix.ColCount then
    raise EMatrixError.Create('Can"t AddDown');

  Result := TIntegerDynMatrix.Create(LengthA + AMatrix.RowCount, Self.ColCount);
  K := 0;
  for I := LengthA to Self.HighRow do
  begin
    for J := Self[I].Low to Self[I].High do
      Result[I, J] := AMatrix[K, J];
    System.Inc(K);
  end;
end;

function TIntegerDynMatrixHelper.AddRight(const AVector: TIntegerDynArray): TIntegerDynMatrix;
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
    Result := TIntegerDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AVector.Length then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TIntegerDynMatrix.Create(Self.RowCount, LengthA + 1);
  for I := AVector.Low to AVector.High do
    Result[I, LengthA] := AVector[I];
end;

function TIntegerDynMatrixHelper.AddRight(const AMatrix: TIntegerDynMatrix): TIntegerDynMatrix;
var
  LengthA, I, J, K: Integer;
begin
  if Self = nil then
  begin
    Result := TIntegerDynMatrix.Create(AMatrix);
    Exit;
  end;

  if AMatrix = nil then
  begin
    Result := TIntegerDynMatrix.Create(Self);
    Exit;
  end;

  LengthA := Self.ColCount;
  if Self.RowCount <> AMatrix.RowCount then
    raise EMatrixError.Create('Can"t AddRight');

  Result := TIntegerDynMatrix.Create(Self.RowCount, LengthA + AMatrix.ColCount);
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

procedure TIntegerDynMatrixHelper.SetRow(const AIndex: Integer; const AValue: TIntegerDynArray);
begin
  Self[AIndex] := TIntegerDynArray.Create(AValue);
end;

procedure TIntegerDynMatrixHelper.SetItem(const ARow, ACol: Integer; const AValue: Integer);
begin
  Self[ARow, ACol] := AValue;
end;

procedure TIntegerDynMatrixHelper.SetCol(const AIndex: Integer; const AValue: TIntegerDynArray);
var
  I: Integer;
begin
  NeedSameLength(AValue.Length, Self.RowCount);
  MustBeInRange(AIndex, LowCol, HighCol);

  for I := Self.LowRow to Self.HighRow do
    Self[I, AIndex] := AValue[I];
end;

procedure TIntegerDynMatrixHelper.Sort;
var
  I, J, K: Integer;
  LTemp: TIntegerDynArray;
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

procedure TIntegerDynMatrixHelper.Subtract(const AMatrix: TIntegerDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AMatrix[I]);
end;

procedure TIntegerDynMatrixHelper.Subtract(const AValue: Integer);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Subtract(AValue);
end;

procedure TIntegerDynMatrixHelper.Add(const AValue: Integer);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AValue);
end;

procedure TIntegerDynMatrixHelper.Add(const AMatrix: TIntegerDynMatrix);
var
  I: Integer;
begin
  NeedSameLength(Self.RowCount, AMatrix.RowCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Add(AMatrix[I]);
end;

procedure TIntegerDynMatrixHelper.MustBeSquare;
begin
  if not IsSquare then
    raise EMatrixError.Create('Matrix must be square');
end;

procedure TIntegerDynMatrixHelper.Assign(const ASource: TIntegerDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ASource.RowCount, Self.ColCount, ASource.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].Assign(ASource[I]);
end;

procedure TIntegerDynMatrixHelper.AssignTo(const ADest: TIntegerDynMatrix);
var
  I: Integer;
begin
  NeedSameDimension(Self.RowCount, ADest.RowCount, Self.ColCount, ADest.ColCount);
  for I := Self.LowRow to Self.HighRow do
    Self[I].AssignTo(ADest[I]);
end;

constructor TIntegerDynMatrixHelper.Create(const AVector1, AVector2: TIntegerDynArray);
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

constructor TIntegerDynMatrixHelper.Create(const ADimension: Integer);
begin
  SetLength(Self, ADimension, ADimension);
end;

constructor TIntegerDynMatrixHelper.Create(const AMatrix: TIntegerDynMatrix);
var
  I: Integer;
begin
  Self := Nil;
  SetLength(Self, AMatrix.RowCount);
  for I := Low(Self) to High(Self) do
  begin
    Self[I] := TIntegerDynArray.Create(AMatrix[I]);
  end;
end;

constructor TIntegerDynMatrixHelper.Diag(const AVector: TIntegerDynArray);
var
  I: Integer;
begin
  Self := TIntegerDynMatrix.Create(AVector.Length);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := AVector[I];
end;

function TIntegerDynMatrixHelper.Equal(const AMatrix: TIntegerDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AMatrix[I]);
  end;
end;

function TIntegerDynMatrixHelper.Equal(const AValue: Integer): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
  begin
    Result := Result or Self[I].Equal(AValue);
  end;
end;

procedure TIntegerDynMatrixHelper.Exchange;
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
      TSwapOp<Integer>.Swap(Self[i1, J1], Self[I2, J2]);
      System.Inc(i1);
      System.Inc(J1);
      System.Dec(I2);
      System.Dec(J2);
    until i1 >= I2;
  end;
end;

function TIntegerDynMatrixHelper.Exchanged: TIntegerDynMatrix;
begin
  MustBeSquare;
  Result := TIntegerDynMatrix.Create(Self);
  Result.Exchange;
end;

constructor TIntegerDynMatrixHelper.Eye(const ADimension: Integer);
var
  I: Integer;
begin
  Self := TIntegerDynMatrix.Create(ADimension);
  for I := Self.LowRow to Self.HighRow do
    Self[I, I] := 1;
end;

constructor TIntegerDynMatrixHelper.Eye(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := TIntegerDynMatrix.Create(ARowCount, AColCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    if I > Self.HighCol then
      Break;
    Self[I, I] := 1;
  end;
end;

procedure TIntegerDynMatrixHelper.Fill(const AValue: Integer);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Fill(AValue);
end;

function TIntegerDynMatrixHelper.First: TIntegerDynArray;
begin
  Result := Self[LowRow];
end;

procedure TIntegerDynMatrixHelper.Apply(const AProc: TEleventProc<Integer>);
var
  I: Integer;
begin
  for I := Self.LowRow to Self.HighRow do
    Self[I].Apply(AProc);
end;

function TIntegerDynMatrixHelper.ForEach(const AProc: TEleventProc<Integer>): TIntegerDynMatrix;
begin
  Result := TIntegerDynMatrix.Create(Self);
  Result.Apply(AProc);
end;

function TIntegerDynMatrixHelper.MaxItem(var ARowIndex, AColIndex: Integer): Integer;
var
  D: Integer;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MaxItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MaxItem(J);
    if (CompareValue(D, Result) > 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TIntegerDynMatrixHelper.GetMaxValue: Integer;
var
  R, C: Integer;
begin
  Result := MaxItem(R, C);
end;

function TIntegerDynMatrixHelper.MinItem(var ARowIndex, AColIndex: Integer): Integer;
var
  D: Integer;
  I, J: Integer;
begin
  ARowIndex := LowRow;
  Result := Self[ARowIndex].MinItem(AColIndex);
  for I := LowRow + 1 to HighRow do
  begin
    D := Self[I].MinItem(J);
    if (CompareValue(D, Result) < 0) and (not D.IsNaN) and (not D.IsInfinity) then
    begin
      Result := D;
      ARowIndex := I;
      AColIndex := J;
    end;
  end;
end;

function TIntegerDynMatrixHelper.GetMinValue: Integer;
var
  R, C: Integer;
begin
  Result := MinItem(R, C);
end;

function TIntegerDynMatrixHelper.GetPItem(const ARow, ACol: Integer): PInteger;
begin
  Result := @Self[ARow, ACol];
end;

function TIntegerDynMatrixHelper.GetIsDiagonal: Boolean;
var
  I, J, N: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  N := High(Self);
  for I := 1 to N do
    for J := 0 to I - 1 do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  for I := 0 to N - 1 do
    for J := I + 1 to N do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;

  Result := true;
end;

function TIntegerDynMatrixHelper.GetIsIdentity: Boolean;
var
  I: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 0 to High(Self) do
    if CompareValue(Self[I, I], 1) <> 0 then
      Exit;
  Result := IsDiagonal;
end;

function TIntegerDynMatrixHelper.GetIsSymmetric: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  if not IsSquare then
    Exit;
  for I := 1 to High(Self) do
    for J := 0 to I - 1 do
      if CompareValue(Self[I, J], Self[J, I]) <> 0 then
        Exit;
  Result := true;
end;

function TIntegerDynMatrixHelper.GetIsZero: Boolean;
var
  I, J: Integer;
begin
  Result := false;
  for I := Low(Self) to High(Self) do
    for J := Low(Self[I]) to High(Self[I]) do
      if not System.Math.IsZero(Self[I, J]) then
        Exit;
  Result := true;
end;

function TIntegerDynMatrixHelper.GetItem(const ARow, ACol: Integer): Integer;
begin
  Result := Self[ARow, ACol];
end;

function TIntegerDynMatrixHelper.NotEqual(const AValue: Integer): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AValue);
end;

constructor TIntegerDynMatrixHelper.Ones(const ARowCount, AColCount: Integer);
var
  I: Integer;
begin
  Self := Nil;
  System.SetLength(Self, ARowCount);
  for I := Self.LowRow to Self.HighRow do
  begin
    Self[I] := TIntegerDynArray.Ones(AColCount);
  end;
end;

function TIntegerDynMatrixHelper.NotEqual(const AMatrix: TIntegerDynMatrix): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Self.LowRow to Self.HighRow do
    Result := Result or Self[I].NotEqual(AMatrix[I]);
end;

procedure TIntegerDynMatrixHelper.Resize(const ARowCount, AColCount: Integer; const ASaveData: Boolean = true);
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
    TIntegerDynArray(Self[I]).Resize(AColCount, ASaveData);
end;

function TIntegerDynMatrixHelper.ReverseArray: TIntegerDynMatrix;
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

function TIntegerDynMatrixHelper.ToVector: TIntegerDynArray;
var
  I, J, K: Integer;
begin
  Result := TIntegerDynArray.Create(Self.RowCount * Self.ColCount);
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

function TIntegerDynMatrixHelper.ToString: string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I].ToString;
  Result := '{' + string.Join(MatrixVectorDelimiter, S) + '}';
end;

function TIntegerDynMatrixHelper._ToString(const AMatrixSeparator, AVectorSeparator: string): string;
var
  S: TStringDynArray;
  I: Integer;
begin
  System.SetLength(S, Self.RowCount);
  for I := low(S) to High(S) do
    S[I] := Self[I]._ToString(AVectorSeparator);
  Result := '{' + string.Join(AMatrixSeparator, S) + '}';
end;

class function TIntegerDynMatrixHelper.Parse(const AMatrixStr: string): TIntegerDynMatrix;
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
    Result[I] := TIntegerDynArray.Parse(LStrArray[I]);
end;

function TIntegerDynMatrixHelper.Prod: Integer;
var
  I: Integer;
begin
  Result := 1;
  for I := Self.LowRow to Self.HighRow do
    Result := Result * Self[I].Prod;
end;

end.

