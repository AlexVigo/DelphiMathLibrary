unit DAVLib.VectorTypesHelper;

interface

uses
  System.SysUtils, DAVLib.Types;

type
  TDoubleDynArrayHelper = record helper for TDoubleDynArray
  private
    function GetLength: Integer;
    function GetMaxValue: Double;
    function GetMaxIndex: Integer;
    function GetMinValue: Double;
    function GetMinIndex: Integer;
    function GetNorm: Double;
    function GetSize: Integer;
    procedure SetLength(const AValue: Integer);
    function GetItem(const AIndex: Integer): Double;
    procedure SetItem(const AIndex: Integer; const AValue: Double);
    function GetDeviation: Double;
    function GetMean: Double;
    function GetSum: Double;
    function GetVariance: Double;
    function GetPItem(const AIndex: Integer): PDouble;
  public
    function MaxItem(var AIndex: Integer): Double;
    function MinItem(var AIndex: Integer): Double;
    constructor Create(const ALength: Integer); overload;
    constructor Create(const AStart, AEnd: Integer; const AStep: Integer = 1); overload;
    constructor Create(const AVector: TDoubleDynArray); overload;
    constructor Create(const AVectorStr: string); overload;
    constructor Ones(const ALength: Integer);
    constructor Base(const ALength, ANumber: Integer);
    constructor Random(const ALength: Integer);
    // создает вектор с координатами
    procedure Assign(const ASource: TDoubleDynArray);
    procedure AssignTo(const ADest: TDoubleDynArray);
    function Low: Integer;
    function High: Integer;
    procedure Zero; // Заполняет вектор "0"
    procedure Fill(const AValue: Double); // Заполняет вектор значением Value
    procedure Multiply(const AValue: Double); overload;
    function Multiply(const AVector: TDoubleDynArray): TDoubleDynMatrix; overload;
    procedure Add(const AValue: Double = 1); overload;
    procedure Add(const AVector: TDoubleDynArray); overload;
    procedure Divide(const AValue: Double); overload;
    // function Divide(const AVector: TDoubleDynArray): TDoubleDynMatrix; overload;
    procedure Subtract(const AValue: Double = 1); overload;
    procedure Subtract(const AVector: TDoubleDynArray); overload;
    function ForEach(const AProc: TEleventProc<Double>): TDoubleDynArray;
    procedure Apply(const AProc: TEleventProc<Double>);
    procedure Normalize; // Нормирует вектор: Vi = Vi/MaxValue
    function Normalized: TDoubleDynArray; // Возвращает нормированный вектор
    procedure MakeUnitVector; // Делает вектор единичным
    function AsUnitVector: TDoubleDynArray; // Возвращает единичный вектор
    function First(): Double;
    function Last(): Double;
    procedure Resize(const ALength: Integer; const ASaveData: Boolean = true);
    // Изменяет размерность вектора
    property Item[const AIndex: Integer]: Double read GetItem write SetItem;
    property PItem[const AIndex: Integer]: PDouble read GetPItem;
    // координата вектора
    property Length: Integer read GetLength write SetLength;
    // Размерность вектора
    property Size: Integer read GetSize; // Размер вектора в байтах
    property Norm: Double read GetNorm; // Норма вектора
    property Sum: Double read GetSum; // Сумма элементов
    property Mean: Double read GetMean; // Сумма элементов
    property Variance: Double read GetVariance; // Дисперсия
    property Deviation: Double read GetDeviation; // СКО
    property MaxValue: Double read GetMaxValue; // Максимальное значение
    property MinValue: Double read GetMinValue; // Минимальное  значение
    property MaxIndex: Integer read GetMaxIndex;
    // Индекс элнмента с максимальным значением
    property MinIndex: Integer read GetMinIndex;
    // Индекс элнмента с минимальным  значением
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Inverse: TDoubleDynArray; { inverse : r := 1 / z }
    function Prod: Double;
    function ReverseArray: TDoubleDynArray;
    function DeleteIndexes(const AIndexes: TIntegerDynArray): TDoubleDynArray;
    procedure Sort; overload;
    procedure Sort(var AIndexes: TIntegerDynArray); overload;
    procedure SortWithOrder(const AOrderIndexes: TIntegerDynArray);
    // если индекса не будет в массиве, то элемент будет удален
    function Negative: TDoubleDynArray;
    function Equal(const AVector: TDoubleDynArray): Boolean; overload;
    function NotEqual(const AVector: TDoubleDynArray): Boolean; overload;
    function Equal(const AValue: Double): Boolean; overload;
    function NotEqual(const AValue: Double): Boolean; overload;
    function IsNaNArray: TBooleanDynArray;
    function IsInfinityArray: TBooleanDynArray;
    function IsNegativeInfinityArray: TBooleanDynArray;
    function IsPositiveInfinityArray: TBooleanDynArray;
    function FiniteValues: TDoubleDynArray;
    function DeleteValues(const AStates: TBooleanDynArray): TDoubleDynArray;
    function ToString: string; overload;
    function _ToString(const ASeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    class function Parse(const AVectorStr: string): TDoubleDynArray; static;
  end;

  TSingleDynArrayHelper = record helper for TSingleDynArray
  private
    function GetLength: Integer;
    function GetMaxValue: Single;
    function GetMaxIndex: Integer;
    function GetMinValue: Single;
    function GetMinIndex: Integer;
    function GetNorm: Single;
    function GetSize: Integer;
    procedure SetLength(const AValue: Integer);
    function GetItem(const AIndex: Integer): Single;
    procedure SetItem(const AIndex: Integer; const AValue: Single);
    function GetDeviation: Single;
    function GetMean: Single;
    function GetSum: Single;
    function GetVariance: Single;
    function GetPItem(const AIndex: Integer): PSingle;
  public
    function MaxItem(var AIndex: Integer): Single;
    function MinItem(var AIndex: Integer): Single;
    constructor Create(const ALength: Integer); overload;
    constructor Create(const AStart, AEnd: Integer; const AStep: Integer = 1); overload;
    constructor Ones(const ALength: Integer);
    constructor Create(const AVector: TSingleDynArray); overload;
    constructor Create(const AVectorStr: string); overload;
    constructor Base(const ALength, ANumber: Integer);
    constructor Random(const ALength: Integer);
    // создает вектор с координатами
    procedure Assign(const ASource: TSingleDynArray);
    procedure AssignTo(const ADest: TSingleDynArray);
    function Low: Integer;
    function High: Integer;
    procedure Zero; // Заполняет вектор "0"
    procedure Fill(const AValue: Single); // Заполняет вектор значением Value
    procedure Multiply(const AValue: Single); overload;
    function Multiply(const AVector: TSingleDynArray): TSingleDynMatrix; overload;
    procedure Add(const AValue: Single = 1); overload;
    procedure Add(const AVector: TSingleDynArray); overload;
    procedure Divide(const AValue: Single); overload;
    // procedure Divide(const AVector: TSingleDynArray); overload;
    procedure Subtract(const AValue: Single = 1); overload;
    procedure Subtract(const AVector: TSingleDynArray); overload;
    function ForEach(const AProc: TEleventProc<Single>): TSingleDynArray;
    procedure Apply(const AProc: TEleventProc<Single>);
    procedure Normalize; // Нормирует вектор: Vi = Vi/MaxValue
    function Normalized: TSingleDynArray; // Возвращает нормированный вектор
    procedure MakeUnitVector; // Делает вектор единичным
    function AsUnitVector: TSingleDynArray; // Возвращает единичный вектор
    function First(): Single;
    function Last(): Single;
    procedure Resize(const ALength: Integer; const ASaveData: Boolean = true);
    // Изменяет размерность вектора
    property Item[const AIndex: Integer]: Single read GetItem write SetItem;
    property PItem[const AIndex: Integer]: PSingle read GetPItem;
    // координата вектора
    property Length: Integer read GetLength write SetLength;
    // Размерность вектора
    property Size: Integer read GetSize; // Размер вектора в байтах
    property Norm: Single read GetNorm; // Норма вектора
    property Sum: Single read GetSum; // Сумма элементов
    property Mean: Single read GetMean; // Сумма элементов
    property Variance: Single read GetVariance; // Дисперсия
    property Deviation: Single read GetDeviation; // СКО
    property MaxValue: Single read GetMaxValue; // Максимальное значение
    property MinValue: Single read GetMinValue; // Минимальное  значение
    property MaxIndex: Integer read GetMaxIndex;
    // Индекс элнмента с максимальным значением
    property MinIndex: Integer read GetMinIndex;
    // Индекс элнмента с минимальным  значением
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Inverse: TSingleDynArray; { inverse : r := 1 / z }
    function Prod: Single;
    function ReverseArray: TSingleDynArray;
    function DeleteIndexes(const AIndexes: TIntegerDynArray): TSingleDynArray;
    procedure Sort; overload;
    procedure Sort(var AIndexes: TIntegerDynArray); overload;
    procedure SortWithOrder(const AOrderIndexes: TIntegerDynArray);
    // если индекса не будет в массиве, то элемент будет удален
    function Negative: TSingleDynArray;
    function Equal(const AVector: TSingleDynArray): Boolean; overload;
    function NotEqual(const AVector: TSingleDynArray): Boolean; overload;
    function Equal(const AValue: Single): Boolean; overload;
    function NotEqual(const AValue: Single): Boolean; overload;
    function IsNaNArray: TBooleanDynArray;
    function IsInfinityArray: TBooleanDynArray;
    function IsNegativeInfinityArray: TBooleanDynArray;
    function IsPositiveInfinityArray: TBooleanDynArray;
    function FiniteValues: TSingleDynArray;
    function DeleteValues(const AStates: TBooleanDynArray): TSingleDynArray;
    function ToString: string; overload;
    function _ToString(const ASeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    class function Parse(const AVectorStr: string): TSingleDynArray; static;
  end;

  TExtendedDynArrayHelper = record helper for TExtendedDynArray
  private
    function GetLength: Integer;
    function GetMaxValue: Extended;
    function GetMaxIndex: Integer;
    function GetMinValue: Extended;
    function GetMinIndex: Integer;
    function GetNorm: Extended;
    function GetSize: Integer;
    procedure SetLength(const AValue: Integer);
    function GetItem(const AIndex: Integer): Extended;
    procedure SetItem(const AIndex: Integer; const AValue: Extended);
    function GetDeviation: Extended;
    function GetMean: Extended;
    function GetSum: Extended;
    function GetVariance: Extended;
    function GetPItem(const AIndex: Integer): PExtended;
  public
    function MaxItem(var AIndex: Integer): Extended;
    function MinItem(var AIndex: Integer): Extended;
    constructor Create(const ALength: Integer); overload;
    constructor Create(const AStart, AEnd: Integer; const AStep: Integer = 1); overload;
    constructor Ones(const ALength: Integer);
    constructor Create(const AVector: TExtendedDynArray); overload;
    constructor Create(const AVectorStr: string); overload;
    constructor Base(const ALength, ANumber: Integer);
    constructor Random(const ALength: Integer);
    // создает вектор с координатами
    procedure Assign(const ASource: TExtendedDynArray);
    procedure AssignTo(const ADest: TExtendedDynArray);
    function Low: Integer;
    function High: Integer;
    procedure Zero; // Заполняет вектор "0"
    procedure Fill(const AValue: Extended); // Заполняет вектор значением Value
    procedure Multiply(const AValue: Extended); overload;
    function Multiply(const AVector: TExtendedDynArray): TExtendedDynMatrix; overload;
    procedure Add(const AValue: Extended = 1); overload;
    procedure Add(const AVector: TExtendedDynArray); overload;
    procedure Divide(const AValue: Extended); overload;
    // procedure Divide(const AVector: TExtendedDynArray); overload;
    procedure Subtract(const AValue: Extended = 1); overload;
    procedure Subtract(const AVector: TExtendedDynArray); overload;
    function ForEach(const AProc: TEleventProc<Extended>): TExtendedDynArray;
    procedure Apply(const AProc: TEleventProc<Extended>);
    procedure Normalize; // Нормирует вектор: Vi = Vi/MaxValue
    function Normalized: TExtendedDynArray; // Возвращает нормированный вектор
    procedure MakeUnitVector; // Делает вектор единичным
    function AsUnitVector: TExtendedDynArray; // Возвращает единичный вектор
    function First(): Extended;
    function Last(): Extended;
    procedure Resize(const ALength: Integer; const ASaveData: Boolean = true);
    // Изменяет размерность вектора
    property Item[const AIndex: Integer]: Extended read GetItem write SetItem;
    property PItem[const AIndex: Integer]: PExtended read GetPItem;
    // координата вектора
    property Length: Integer read GetLength write SetLength;
    // Размерность вектора
    property Size: Integer read GetSize; // Размер вектора в байтах
    property Norm: Extended read GetNorm; // Норма вектора
    property Sum: Extended read GetSum; // Сумма элементов
    property Mean: Extended read GetMean; // Сумма элементов
    property Variance: Extended read GetVariance; // Дисперсия
    property Deviation: Extended read GetDeviation; // СКО
    property MaxValue: Extended read GetMaxValue; // Максимальное значение
    property MinValue: Extended read GetMinValue; // Минимальное  значение
    property MaxIndex: Integer read GetMaxIndex;
    // Индекс элнмента с максимальным значением
    property MinIndex: Integer read GetMinIndex;
    // Индекс элнмента с минимальным  значением
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Inverse: TExtendedDynArray; { inverse : r := 1 / z }
    function Prod: Extended;
    function ReverseArray: TExtendedDynArray;
    function DeleteIndexes(const AIndexes: TIntegerDynArray): TExtendedDynArray;
    procedure Sort; overload;
    procedure Sort(var AIndexes: TIntegerDynArray); overload;
    procedure SortWithOrder(const AOrderIndexes: TIntegerDynArray);
    // если индекса не будет в массиве, то элемент будет удален
    function Negative: TExtendedDynArray;
    function Equal(const AVector: TExtendedDynArray): Boolean; overload;
    function NotEqual(const AVector: TExtendedDynArray): Boolean; overload;
    function Equal(const AValue: Extended): Boolean; overload;
    function NotEqual(const AValue: Extended): Boolean; overload;
    function IsNaNArray: TBooleanDynArray;
    function IsInfinityArray: TBooleanDynArray;
    function IsNegativeInfinityArray: TBooleanDynArray;
    function IsPositiveInfinityArray: TBooleanDynArray;
    function FiniteValues: TExtendedDynArray;
    function DeleteValues(const AStates: TBooleanDynArray): TExtendedDynArray;
    function ToString: string; overload;
    function _ToString(const ASeparator: string): string;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string; overload;
    function ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    class function Parse(const AVectorStr: string): TExtendedDynArray; static;
  end;

  TIntegerDynArrayHelper = record helper for TIntegerDynArray
  private
    function GetLength: Integer;
    function GetMaxValue: Integer;
    function GetMaxIndex: Integer;
    function GetMinValue: Integer;
    function GetMinIndex: Integer;
    function GetSize: Integer;
    procedure SetLength(const AValue: Integer);
    function GetItem(const AIndex: Integer): Integer;
    procedure SetItem(const AIndex: Integer; const AValue: Integer);
    function GetSum: Integer;
    function GetPItem(const AIndex: Integer): PInteger;
  public
    function MaxItem(var AIndex: Integer): Integer;
    function MinItem(var AIndex: Integer): Integer;
    constructor Create(const ALength: Integer); overload;
    constructor Create(const AStart, AEnd: Integer; const AStep: Integer = 1); overload;
    constructor Ones(const ALength: Integer);
    constructor Create(const AVector: TIntegerDynArray); overload;
    constructor Create(const AVectorStr: string); overload;
    constructor Base(const ALength, ANumber: Integer);
    // создает вектор с координатами
    procedure Assign(const ASource: TIntegerDynArray);
    procedure AssignTo(const ADest: TIntegerDynArray);
    function Low: Integer;
    function High: Integer;
    procedure Zero; // Заполняет вектор "0"
    procedure Fill(const AValue: Integer); // Заполняет вектор значением Value
    procedure Add(const AValue: Integer = 1); overload;
    procedure Add(const AVector: TIntegerDynArray); overload;
    procedure Subtract(const AValue: Integer = 1); overload;
    procedure Subtract(const AVector: TIntegerDynArray); overload;
    function ForEach(const AProc: TEleventProc<Integer>): TIntegerDynArray;
    procedure Apply(const AProc: TEleventProc<Integer>);
    function First(): Integer;
    function Last(): Integer;
    procedure Resize(const ALength: Integer; const ASaveData: Boolean = true);
    // Изменяет размерность вектора
    property Item[const AIndex: Integer]: Integer read GetItem write SetItem;
    property PItem[const AIndex: Integer]: PInteger read GetPItem;
    // координата вектора
    property Length: Integer read GetLength write SetLength;
    // Размерность вектора
    property Size: Integer read GetSize; // Размер вектора в байтах
    property Sum: Integer read GetSum; // Сумма элементов
    property MaxValue: Integer read GetMaxValue; // Максимальное значение
    property MinValue: Integer read GetMinValue; // Минимальное  значение
    property MaxIndex: Integer read GetMaxIndex;
    // Индекс элнмента с максимальным значением
    property MinIndex: Integer read GetMinIndex;
    // Индекс элнмента с минимальным  значением
    function IsZero: Boolean;
    function Prod: Integer;
    function ReverseArray: TIntegerDynArray;
    function DeleteIndexes(const AIndexes: TIntegerDynArray): TIntegerDynArray;
    procedure Sort; overload;
    procedure Sort(var AIndexes: TIntegerDynArray); overload;
    procedure SortWithOrder(const AOrderIndexes: TIntegerDynArray);
    // если индекса не будет в массиве, то элемент будет удален
    function Negative: TIntegerDynArray;
    function Equal(const AVector: TIntegerDynArray): Boolean; overload;
    function NotEqual(const AVector: TIntegerDynArray): Boolean; overload;
    function Equal(const AValue: Integer): Boolean; overload;
    function NotEqual(const AValue: Integer): Boolean; overload;
    function DeleteValues(const AStates: TBooleanDynArray): TIntegerDynArray;
    function ToString: string;
    function _ToString(const ASeparator: string): string;
    class function Parse(const AVectorStr: string): TIntegerDynArray; static;
  end;

implementation

uses
  System.Math, DAVLib.SwapOperation, DAVLib.SimpleTypesHelper,
  System.Generics.Collections;


// class function TDoubleDynArrayHelper.Parse(const S: string): TDoubleDynArray;
// begin
// Result := StringToFloatArray(S);
// end;
//
// class function TDoubleDynArrayHelper.TryParse(const S: string; out A: TDoubleDynArray): boolean;
// begin
// Result := TryStringToArray(S, A);
// end;

procedure TDoubleDynArrayHelper.Assign(const ASource: TDoubleDynArray);
begin
  NeedSameLength(Length, ASource.Length);
  Move(ASource[0], Self[0], Size);
end;

procedure TDoubleDynArrayHelper.AssignTo(const ADest: TDoubleDynArray);
begin
  NeedSameLength(Length, ADest.Length);
  Move(Self[0], ADest[0], Size);
end;

function TDoubleDynArrayHelper.AsUnitVector: TDoubleDynArray;
begin
  Result := TDoubleDynArray.Create(Self);
  Result.MakeUnitVector;
end;

procedure TDoubleDynArrayHelper.Add(const AValue: Double);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] + AValue;
end;

procedure TDoubleDynArrayHelper.Add(const AVector: TDoubleDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] + AVector[I];
end;

procedure TDoubleDynArrayHelper.Subtract(const AVector: TDoubleDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] - AVector[I];
end;

procedure TDoubleDynArrayHelper.MakeUnitVector;
var
  D: Double;
  I: Integer;
begin
  D := Norm;
  if D.IsZero or D.IsNaN or D.IsInfinity then
    raise EVectorError.Create('Must have value');
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

procedure TDoubleDynArrayHelper.Multiply(const AValue: Double);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] * AValue;
end;

function TDoubleDynArrayHelper.Multiply(const AVector: TDoubleDynArray): TDoubleDynMatrix;
var
  M, N: Integer;
  I, J: Integer;
begin
  M := Length;
  N := AVector.Length;
  System.SetLength(Result, M, N);
  System.Dec(M);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
      Result[I, J] := Self[I] * AVector[J];
end;

procedure TDoubleDynArrayHelper.Divide(const AValue: Double);
begin
  Multiply(1 / AValue);
end;

//procedure TDoubleDynArrayHelper.Divide(const AVector: TDoubleDynArray);
//var
//  I: Integer;
//begin
//  NeedSameLength(Self.Length, AVector.Length);
//  for I := Low to High do
//    Self[I] := Self[I] / AVector[I];
//end;

procedure TDoubleDynArrayHelper.Subtract(const AValue: Double);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] - AValue;
end;

function TDoubleDynArrayHelper.Negative: TDoubleDynArray;
var
  I: Integer;
begin
  Result.Length := Self.Length;
  for I := Result.Low to Result.High do
    Result[I] := -Self[I];
end;

function TDoubleDynArrayHelper.Equal(const AVector: TDoubleDynArray): Boolean;
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

function TDoubleDynArrayHelper.NotEqual(const AVector: TDoubleDynArray): Boolean;
begin
  Result := not (Self.Equal(AVector));
end;

function TDoubleDynArrayHelper.Equal(const AValue: Double): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Low to High do
    Result := Result or (Self[I] = AValue);
end;

function TDoubleDynArrayHelper.NotEqual(const AValue: Double): Boolean;
begin
  Result := not (Self.Equal(AValue));
end;

constructor TDoubleDynArrayHelper.Base(const ALength, ANumber: Integer);
begin
  if not InRange(ANumber, 0, ALength - 1) then
    raise EVectorError.Create('ANumber must be in range ALength');
  Self.Length := ALength;

  Self[ANumber] := 1;
end;

constructor TDoubleDynArrayHelper.Create(const AVector: TDoubleDynArray);
begin
  Self := Nil;
  Self := Copy(AVector);
//  Self := TDoubleDynArray.Create(AVector.Length);
//  Self.Assign(AVector);
end;

constructor TDoubleDynArrayHelper.Create(const AStart, AEnd, AStep: Integer);
var
  I: Integer;
begin
  if (AStep <= 0) or (AStart = AEnd) then
    raise EVectorError.Create('Create error: Check input parameters');

  Self := TDoubleDynArray.Create(((AEnd - AStart) / AStep).Ceil);
  for I := Low to High do
    Self[I] := I * AStep + AStart;
end;

constructor TDoubleDynArrayHelper.Create(const ALength: Integer);
begin
  Self := Nil;
  System.SetLength(Self, ALength);
end;

constructor TDoubleDynArrayHelper.Random(const ALength: Integer);
var
  I: Integer;
begin
  Self := TDoubleDynArray.Create(ALength);
  for I := Low to High do
    Self[I] := System.Random();
end;

constructor TDoubleDynArrayHelper.Ones(const ALength: Integer);
begin
  Self := TDoubleDynArray.Create(ALength);
  Self.Fill(1);
end;

procedure TDoubleDynArrayHelper.Fill(const AValue: Double);
var
  I: Integer;
begin
  for I := Self.Low to Self.High do
    Self[I] := AValue;
end;

function TDoubleDynArrayHelper.FiniteValues: TDoubleDynArray;
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
  Result := TDoubleDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TDoubleDynArrayHelper.Apply(const AProc: TEleventProc<Double>);
var
  I: Integer;
begin
  Assert(Assigned(AProc), 'Unassigned procedure');
  for I := Low to High do
    AProc(Self[I]); // Check
end;

function TDoubleDynArrayHelper.ForEach(const AProc: TEleventProc<Double>): TDoubleDynArray;
begin
  Result := TDoubleDynArray.Create(Self);
  Result.Apply(AProc);
end;

function TDoubleDynArrayHelper.GetDeviation: Double;
begin
  Result := System.Sqrt(Variance);
end;

function TDoubleDynArrayHelper.GetItem(const AIndex: Integer): Double;
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Result := Self[AIndex];
end;

function TDoubleDynArrayHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TDoubleDynArrayHelper.GetMaxValue: Double;
var
  I: Integer;
begin
  Result := MaxItem(I);
end;

function TDoubleDynArrayHelper.MaxItem(var AIndex: Integer): Double;
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

function TDoubleDynArrayHelper.GetMaxIndex: Integer;
begin
  MaxItem(Result);
end;

function TDoubleDynArrayHelper.GetMean: Double;
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

function TDoubleDynArrayHelper.MinItem(var AIndex: Integer): Double;
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

function TDoubleDynArrayHelper.GetMinValue: Double;
var
  I: Integer;
begin
  Result := MinItem(I);
end;

function TDoubleDynArrayHelper.GetMinIndex: Integer;
begin
  MinItem(Result);
end;

function TDoubleDynArrayHelper.GetNorm: Double;
var
  I: Integer;
begin
  Result := 0;
  for I := Low to High do
    Result := Result + Self[I].Sqr;
  Result := Result.Sqrt;
end;

function TDoubleDynArrayHelper.GetPItem(const AIndex: Integer): PDouble;
begin
  Result := @Self[AIndex];
end;

function TDoubleDynArrayHelper.GetSize: Integer;
begin
  Result := Length * SizeOf(Double);
end;

function TDoubleDynArrayHelper.GetSum: Double;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;
  for I := Low to High do
    Result := Result + Self[I];
end;

function TDoubleDynArrayHelper.GetVariance: Double;
var
  M: Double;
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

function TDoubleDynArrayHelper.Low: Integer;
begin
  Result := System.Low(Self);
end;

function TDoubleDynArrayHelper.High: Integer;
begin
  Result := System.High(Self);
end;

procedure TDoubleDynArrayHelper.Normalize;
var
  D: Double;
  I: Integer;
begin
  D := MaxValue;
  if D.IsNaN or D.IsZero then
    Exit;
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

function TDoubleDynArrayHelper.Normalized: TDoubleDynArray;
begin
  Result := TDoubleDynArray.Create(Self);
  Result.Normalize;
end;

procedure TDoubleDynArrayHelper.Resize(const ALength: Integer; const ASaveData: Boolean = true);
begin
  if Length <> ALength then
    System.SetLength(Self, ALength);

  if not ASaveData then
    Zero;
end;

procedure TDoubleDynArrayHelper.SetItem(const AIndex: Integer; const AValue: Double);
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Self[AIndex] := AValue;
end;

procedure TDoubleDynArrayHelper.SetLength(const AValue: Integer);
begin
  System.SetLength(Self, AValue);
end;

procedure TDoubleDynArrayHelper.Zero;
begin
  if Length = 0 then
    Exit;
  FillChar(Self[Low], Size, 0);
end;

procedure TDoubleDynArrayHelper.NaN;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NaN;
end;

procedure TDoubleDynArrayHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NegativeInfinity;
end;

class function TDoubleDynArrayHelper.Parse(const AVectorStr: string): TDoubleDynArray;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AVectorStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([VectorItemDelimiter]);
  L := System.Length(LStrArray);
  Result := TDoubleDynArray.Create(L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := StrToFloatSafe(LStrArray[I]);
end;

constructor TDoubleDynArrayHelper.Create(const AVectorStr: string);
begin
   Self :=  TDoubleDynArray.Parse(AVectorStr);
end;

procedure TDoubleDynArrayHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].PositiveInfinity;
end;

function TDoubleDynArrayHelper.IsZero: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsZero;
end;

function TDoubleDynArrayHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNaN;
end;

function TDoubleDynArrayHelper.IsNaNArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNaN;
end;

function TDoubleDynArrayHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsInfinity;
end;

function TDoubleDynArrayHelper.IsInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsInfinity;
end;

function TDoubleDynArrayHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNegativeInfinity;
end;

function TDoubleDynArrayHelper.IsNegativeInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNegativeInfinity;
end;

function TDoubleDynArrayHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsPositiveInfinity;
end;

function TDoubleDynArrayHelper.IsPositiveInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsPositiveInfinity;
end;

function TDoubleDynArrayHelper.First(): Double;
begin
  Result := Self[Low];
end;

function TDoubleDynArrayHelper.Last(): Double;
begin
  Result := Self[High];
end;

function TDoubleDynArrayHelper.Inverse: TDoubleDynArray;
var
  I: Integer;
begin
  Result := TDoubleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := 1 / Self[I];
end;

function TDoubleDynArrayHelper.Prod: Double;
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

function TDoubleDynArrayHelper.ReverseArray: TDoubleDynArray;
var
  I, J: Integer;
begin
  Result := TDoubleDynArray.Create(Length);
  J := 0;
  for I := High downto Low do
  begin
    Result[J] := Self[I];
    System.Inc(J);
  end;
end;

function TDoubleDynArrayHelper.DeleteIndexes(const AIndexes: TIntegerDynArray): TDoubleDynArray;
var
  J, L, K: Integer;
begin
  L := Length;
  K := System.Length(AIndexes);
  if L - K <= 0 then
    Exit;

  Result := TDoubleDynArray.Create(L - K);
  L := 0;
  for J := 0 to K - 1 do
  begin
    Result[L] := Self[AIndexes[J]];
    System.Inc(L);
  end;
end;

function TDoubleDynArrayHelper.DeleteValues(const AStates: TBooleanDynArray): TDoubleDynArray;
var
  I, LCounter: Integer;
begin
  NeedSameLength(Self.Length, System.Length(AStates));

  LCounter := 0;
  for I := Low to High do
    if AStates[I] then
      System.Inc(LCounter);
  Result := TDoubleDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if not AStates[I] then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TDoubleDynArrayHelper.Sort;
begin
  TArray.Sort<Double>(Self);
end;

procedure TDoubleDynArrayHelper.Sort(var AIndexes: TIntegerDynArray);
var
  Lo, Hi: Integer;
  Pivot, T: Double;
  I, ti: Integer;

  procedure qSort(var a: TDoubleDynArray; iLo, iHi: Integer; var AIndexes: TIntegerDynArray);
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

procedure TDoubleDynArrayHelper.SortWithOrder(const AOrderIndexes: TIntegerDynArray);
var
  I: Integer;
begin
  for I := System.Low(AOrderIndexes) to System.High(AOrderIndexes) do
    TSwapOp<Double>.Swap(Self[AOrderIndexes[I]], Self[I]);
  Resize(System.Length(AOrderIndexes));
end;

function TDoubleDynArrayHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormatSettings);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TDoubleDynArrayHelper.ToString: string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(VectorItemDelimiter, R);
end;

function TDoubleDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TDoubleDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TDoubleDynArrayHelper._ToString(const ASeparator: string): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(ASeparator, R);
end;

///
/// Single
///

procedure TSingleDynArrayHelper.Assign(const ASource: TSingleDynArray);
begin
  NeedSameLength(Length, ASource.Length);
  Move(ASource[0], Self[0], Size);
end;

procedure TSingleDynArrayHelper.AssignTo(const ADest: TSingleDynArray);
begin
  NeedSameLength(Length, ADest.Length);
  Move(Self[0], ADest[0], Size);
end;

function TSingleDynArrayHelper.AsUnitVector: TSingleDynArray;
begin
  Result := TSingleDynArray.Create(Self);
  Result.MakeUnitVector;
end;

procedure TSingleDynArrayHelper.Add(const AValue: Single);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] + AValue;
end;

procedure TSingleDynArrayHelper.Add(const AVector: TSingleDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] + AVector[I];
end;

procedure TSingleDynArrayHelper.Subtract(const AVector: TSingleDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] - AVector[I];
end;

procedure TSingleDynArrayHelper.MakeUnitVector;
var
  D: Single;
  I: Integer;
begin
  D := Norm;
  if D.IsZero or D.IsNaN or D.IsInfinity then
    raise EVectorError.Create('Must have value');
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

procedure TSingleDynArrayHelper.Multiply(const AValue: Single);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] * AValue;
end;

function TSingleDynArrayHelper.Multiply(const AVector: TSingleDynArray): TSingleDynMatrix;
var
  M, N: Integer;
  I, J: Integer;
begin
  M := Length;
  N := AVector.Length;
  System.SetLength(Result, M, N);
  System.Dec(M);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
      Result[I, J] := Self[I] * AVector[J];
end;

procedure TSingleDynArrayHelper.Divide(const AValue: Single);
begin
  Multiply(1 / AValue);
end;

//procedure TSingleDynArrayHelper.Divide(const AVector: TSingleDynArray);
//var
//  I: Integer;
//begin
//  NeedSameLength(Self.Length, AVector.Length);
//  for I := Low to High do
//    Self[I] := Self[I] / AVector[I];
//end;

procedure TSingleDynArrayHelper.Subtract(const AValue: Single);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] - AValue;
end;

function TSingleDynArrayHelper.Negative: TSingleDynArray;
var
  I: Integer;
begin
  Result.Length := Self.Length;
  for I := Result.Low to Result.High do
    Result[I] := -Self[I];
end;

function TSingleDynArrayHelper.Equal(const AVector: TSingleDynArray): Boolean;
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

function TSingleDynArrayHelper.NotEqual(const AVector: TSingleDynArray): Boolean;
begin
  Result := not (Self.Equal(AVector));
end;

function TSingleDynArrayHelper.Equal(const AValue: Single): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Low to High do
    Result := Result or (Self[I] = AValue);
end;

function TSingleDynArrayHelper.NotEqual(const AValue: Single): Boolean;
begin
  Result := not (Self.Equal(AValue));
end;

constructor TSingleDynArrayHelper.Base(const ALength, ANumber: Integer);
begin
  if not InRange(ANumber, 0, ALength - 1) then
    raise EVectorError.Create('ANumber must be in range ALength');
  Self.Length := ALength;

  Self[ANumber] := 1;
end;

constructor TSingleDynArrayHelper.Create(const AVector: TSingleDynArray);
begin
  Self := Nil;
  Self := Copy(AVector);
end;

constructor TSingleDynArrayHelper.Create(const AStart, AEnd, AStep: Integer);
var
  I: Integer;
begin
  if (AStep <= 0) or (AStart = AEnd) then
    raise EVectorError.Create('Create error: Check input parameters');

  Self := TSingleDynArray.Create(((AEnd - AStart) / AStep).Ceil);
  for I := Low to High do
    Self[I] := I * AStep + AStart;
end;

constructor TSingleDynArrayHelper.Create(const ALength: Integer);
begin
  Self := Nil;
  Self.Length := ALength;
end;

constructor TSingleDynArrayHelper.Ones(const ALength: Integer);
var
  I: Integer;
begin
  Self := Nil;
  Self := TSingleDynArray.Create(ALength);
  Self.Fill(1);
end;

procedure TSingleDynArrayHelper.Fill(const AValue: Single);
var
  I: Integer;
begin
  for I := Self.Low to Self.High do
    Self[I] := AValue;
end;

function TSingleDynArrayHelper.FiniteValues: TSingleDynArray;
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
  Result := TSingleDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TSingleDynArrayHelper.Apply(const AProc: TEleventProc<Single>);
var
  I: Integer;
begin
  Assert(Assigned(AProc), 'Unassigned procedure');
  for I := Low to High do
    AProc(Self[I]); // Check
end;

function TSingleDynArrayHelper.ForEach(const AProc: TEleventProc<Single>): TSingleDynArray;
begin
  Result := TSingleDynArray.Create(Self);
  Result.Apply(AProc);
end;

function TSingleDynArrayHelper.GetDeviation: Single;
begin
  Result := System.Sqrt(Variance);
end;

function TSingleDynArrayHelper.GetItem(const AIndex: Integer): Single;
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Result := Self[AIndex];
end;

function TSingleDynArrayHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TSingleDynArrayHelper.GetMaxValue: Single;
var
  I: Integer;
begin
  Result := MaxItem(I);
end;

function TSingleDynArrayHelper.MaxItem(var AIndex: Integer): Single;
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

function TSingleDynArrayHelper.GetMaxIndex: Integer;
begin
  MaxItem(Result);
end;

function TSingleDynArrayHelper.GetMean: Single;
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

function TSingleDynArrayHelper.MinItem(var AIndex: Integer): Single;
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

function TSingleDynArrayHelper.GetMinValue: Single;
var
  I: Integer;
begin
  Result := MinItem(I);
end;

function TSingleDynArrayHelper.GetMinIndex: Integer;
begin
  MinItem(Result);
end;

function TSingleDynArrayHelper.GetNorm: Single;
var
  I: Integer;
begin
  Result := 0;
  for I := Low to High do
    Result := Result + Self[I].Sqr;
  Result := Result.Sqrt;
end;

function TSingleDynArrayHelper.GetPItem(const AIndex: Integer): PSingle;
begin
  Result := @Self[AIndex];
end;

function TSingleDynArrayHelper.GetSize: Integer;
begin
  Result := Length * SizeOf(Single);
end;

function TSingleDynArrayHelper.GetSum: Single;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;
  for I := Low to High do
    Result := Result + Self[I];
end;

function TSingleDynArrayHelper.GetVariance: Single;
var
  M: Single;
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

function TSingleDynArrayHelper.Low: Integer;
begin
  Result := System.Low(Self);
end;

function TSingleDynArrayHelper.High: Integer;
begin
  Result := System.High(Self);
end;

procedure TSingleDynArrayHelper.Normalize;
var
  D: Single;
  I: Integer;
begin
  D := MaxValue;
  if D.IsNaN or D.IsZero then
    Exit;
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

function TSingleDynArrayHelper.Normalized: TSingleDynArray;
begin
  Result := TSingleDynArray.Create(Self);
  Result.Normalize;
end;

constructor TSingleDynArrayHelper.Random(const ALength: Integer);
var
  I: Integer;
begin
  Self := TSingleDynArray.Create(ALength);
  for I := Low to High do
    Self[I] := System.Random();
end;

procedure TSingleDynArrayHelper.Resize(const ALength: Integer; const ASaveData: Boolean = true);
begin
  if Length <> ALength then
    System.SetLength(Self, ALength);

  if not ASaveData then
    Zero;
end;

procedure TSingleDynArrayHelper.SetItem(const AIndex: Integer; const AValue: Single);
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Self[AIndex] := AValue;
end;

procedure TSingleDynArrayHelper.SetLength(const AValue: Integer);
begin
  System.SetLength(Self, AValue);
end;

procedure TSingleDynArrayHelper.Zero;
begin
  if Length = 0 then
    Exit;
  FillChar(Self[Low], Size, 0);
end;

procedure TSingleDynArrayHelper.NaN;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NaN;
end;

procedure TSingleDynArrayHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NegativeInfinity;
end;

class function TSingleDynArrayHelper.Parse(
  const AVectorStr: string): TSingleDynArray;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AVectorStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([VectorItemDelimiter]);
  L := System.Length(LStrArray);
  Result := TSingleDynArray.Create(L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := StrToFloatSafe(LStrArray[I]);
end;

constructor TSingleDynArrayHelper.Create(const AVectorStr: string);
begin
   Self :=  TSingleDynArray.Parse(AVectorStr);
end;

procedure TSingleDynArrayHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].PositiveInfinity;
end;

function TSingleDynArrayHelper.IsZero: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsZero;
end;

function TSingleDynArrayHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNaN;
end;

function TSingleDynArrayHelper.IsNaNArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNaN;
end;

function TSingleDynArrayHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsInfinity;
end;

function TSingleDynArrayHelper.IsInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsInfinity;
end;

function TSingleDynArrayHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNegativeInfinity;
end;

function TSingleDynArrayHelper.IsNegativeInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNegativeInfinity;
end;

function TSingleDynArrayHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsPositiveInfinity;
end;

function TSingleDynArrayHelper.IsPositiveInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsPositiveInfinity;
end;

function TSingleDynArrayHelper.First(): Single;
begin
  Result := Self[Low];
end;

function TSingleDynArrayHelper.Last(): Single;
begin
  Result := Self[High];
end;

function TSingleDynArrayHelper.Inverse: TSingleDynArray;
var
  I: Integer;
begin
  Result := TSingleDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := 1 / Self[I];
end;

function TSingleDynArrayHelper.Prod: Single;
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

function TSingleDynArrayHelper.ReverseArray: TSingleDynArray;
var
  I, J: Integer;
begin
  Result := TSingleDynArray.Create(Length);
  J := 0;
  for I := High downto Low do
  begin
    Result[J] := Self[I];
    System.Inc(J);
  end;
end;

function TSingleDynArrayHelper.DeleteIndexes(const AIndexes: TIntegerDynArray): TSingleDynArray;
var
  J, L, K: Integer;
begin
  L := Length;
  K := System.Length(AIndexes);
  if L - K <= 0 then
    Exit;

  Result := TSingleDynArray.Create(L - K);
  L := 0;
  for J := 0 to K - 1 do
  begin
    Result[L] := Self[AIndexes[J]];
    System.Inc(L);
  end;
end;

function TSingleDynArrayHelper.DeleteValues(const AStates: TBooleanDynArray): TSingleDynArray;
var
  I, LCounter: Integer;
begin
  NeedSameLength(Self.Length, System.Length(AStates));

  LCounter := 0;
  for I := Low to High do
    if AStates[I] then
      System.Inc(LCounter);
  Result := TSingleDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if not AStates[I] then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TSingleDynArrayHelper.Sort;
begin
  TArray.Sort<Single>(Self);
end;

procedure TSingleDynArrayHelper.Sort(var AIndexes: TIntegerDynArray);
var
  Lo, Hi: Integer;
  Pivot, T: Single;
  I, ti: Integer;

  procedure qSort(var a: TSingleDynArray; iLo, iHi: Integer; var AIndexes: TIntegerDynArray);
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

procedure TSingleDynArrayHelper.SortWithOrder(const AOrderIndexes: TIntegerDynArray);
var
  I: Integer;
begin
  for I := System.Low(AOrderIndexes) to System.High(AOrderIndexes) do
    TSwapOp<Single>.Swap(Self[AOrderIndexes[I]], Self[I]);
  Resize(System.Length(AOrderIndexes));
end;

function TSingleDynArrayHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormatSettings);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TSingleDynArrayHelper.ToString: string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(VectorItemDelimiter, R);
end;

function TSingleDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TSingleDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TSingleDynArrayHelper._ToString(const ASeparator: string): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(ASeparator, R);
end;

///
/// Extended
///

procedure TExtendedDynArrayHelper.Assign(const ASource: TExtendedDynArray);
begin
  NeedSameLength(Length, ASource.Length);
  Move(ASource[0], Self[0], Size);
end;

procedure TExtendedDynArrayHelper.AssignTo(const ADest: TExtendedDynArray);
begin
  NeedSameLength(Length, ADest.Length);
  Move(Self[0], ADest[0], Size);
end;

function TExtendedDynArrayHelper.AsUnitVector: TExtendedDynArray;
begin
  Result := TExtendedDynArray.Create(Self);
  Result.MakeUnitVector;
end;

procedure TExtendedDynArrayHelper.Add(const AValue: Extended);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] + AValue;
end;

procedure TExtendedDynArrayHelper.Add(const AVector: TExtendedDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] + AVector[I];
end;

procedure TExtendedDynArrayHelper.Subtract(const AVector: TExtendedDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] - AVector[I];
end;

procedure TExtendedDynArrayHelper.MakeUnitVector;
var
  D: Extended;
  I: Integer;
begin
  D := Norm;
  if D.IsZero or D.IsNaN or D.IsInfinity then
    raise EVectorError.Create('Must have value');
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

procedure TExtendedDynArrayHelper.Multiply(const AValue: Extended);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] * AValue;
end;

function TExtendedDynArrayHelper.Multiply(const AVector: TExtendedDynArray): TExtendedDynMatrix;
var
  M, N: Integer;
  I, J: Integer;
begin
  M := Length;
  N := AVector.Length;
  System.SetLength(Result, M, N);
  System.Dec(M);
  System.Dec(N);
  for I := 0 to M do
    for J := 0 to N do
      Result[I, J] := Self[I] * AVector[J];
end;

procedure TExtendedDynArrayHelper.Divide(const AValue: Extended);
begin
  Multiply(1 / AValue);
end;

//procedure TExtendedDynArrayHelper.Divide(const AVector: TExtendedDynArray);
//var
//  I: Integer;
//begin
//  NeedSameLength(Self.Length, AVector.Length);
//  for I := Low to High do
//    Self[I] := Self[I] / AVector[I];
//end;

procedure TExtendedDynArrayHelper.Subtract(const AValue: Extended);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] - AValue;
end;

function TExtendedDynArrayHelper.Negative: TExtendedDynArray;
var
  I: Integer;
begin
  Result.Length := Self.Length;
  for I := Result.Low to Result.High do
    Result[I] := -Self[I];
end;

function TExtendedDynArrayHelper.Equal(const AVector: TExtendedDynArray): Boolean;
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

function TExtendedDynArrayHelper.NotEqual(const AVector: TExtendedDynArray): Boolean;
begin
  Result := not (Self.Equal(AVector));
end;

function TExtendedDynArrayHelper.Equal(const AValue: Extended): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Low to High do
    Result := Result or (Self[I] = AValue);
end;

function TExtendedDynArrayHelper.NotEqual(const AValue: Extended): Boolean;
begin
  Result := not (Self.Equal(AValue));
end;

constructor TExtendedDynArrayHelper.Base(const ALength, ANumber: Integer);
begin
  if not InRange(ANumber, 0, ALength - 1) then
    raise EVectorError.Create('ANumber must be in range ALength');
  Self.Length := ALength;

  Self[ANumber] := 1;
end;

constructor TExtendedDynArrayHelper.Create(const AVector: TExtendedDynArray);
begin
  Self := Nil;
  Self := Copy(AVector);
end;

constructor TExtendedDynArrayHelper.Create(const AStart, AEnd, AStep: Integer);
var
  I: Integer;
begin
  if (AStep <= 0) or (AStart = AEnd) then
    raise EVectorError.Create('Create error: Check input parameters');

  Self := TExtendedDynArray.Create(((AEnd - AStart) / AStep).Ceil);
  for I := Low to High do
    Self[I] := I * AStep + AStart;
end;

constructor TExtendedDynArrayHelper.Create(const ALength: Integer);
begin
  Self := Nil;
  Self.Length := ALength;
end;

constructor TExtendedDynArrayHelper.Ones(const ALength: Integer);
var
  I: Integer;
begin
  Self := Nil;
  Self := TExtendedDynArray.Create(ALength);
  Self.Fill(1);
end;

procedure TExtendedDynArrayHelper.Fill(const AValue: Extended);
var
  I: Integer;
begin
  for I := Self.Low to Self.High do
    Self[I] := AValue;
end;

function TExtendedDynArrayHelper.FiniteValues: TExtendedDynArray;
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
  Result := TExtendedDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if Self[I].IsNaN or Self[I].IsInfinity then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TExtendedDynArrayHelper.Apply(const AProc: TEleventProc<Extended>);
var
  I: Integer;
begin
  Assert(Assigned(AProc), 'Unassigned procedure');
  for I := Low to High do
    AProc(Self[I]); // Check
end;

function TExtendedDynArrayHelper.ForEach(const AProc: TEleventProc<Extended>): TExtendedDynArray;
begin
  Result := TExtendedDynArray.Create(Self);
  Result.Apply(AProc);
end;

function TExtendedDynArrayHelper.GetDeviation: Extended;
begin
  Result := System.Sqrt(Variance);
end;

function TExtendedDynArrayHelper.GetItem(const AIndex: Integer): Extended;
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Result := Self[AIndex];
end;

function TExtendedDynArrayHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TExtendedDynArrayHelper.GetMaxValue: Extended;
var
  I: Integer;
begin
  Result := MaxItem(I);
end;

function TExtendedDynArrayHelper.MaxItem(var AIndex: Integer): Extended;
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

function TExtendedDynArrayHelper.GetMaxIndex: Integer;
begin
  MaxItem(Result);
end;

function TExtendedDynArrayHelper.GetMean: Extended;
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

function TExtendedDynArrayHelper.MinItem(var AIndex: Integer): Extended;
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

function TExtendedDynArrayHelper.GetMinValue: Extended;
var
  I: Integer;
begin
  Result := MinItem(I);
end;

function TExtendedDynArrayHelper.GetMinIndex: Integer;
begin
  MinItem(Result);
end;

function TExtendedDynArrayHelper.GetNorm: Extended;
var
  I: Integer;
begin
  Result := 0;
  for I := Low to High do
    Result := Result + Self[I].Sqr;
  Result := Result.Sqrt;
end;

function TExtendedDynArrayHelper.GetPItem(const AIndex: Integer): PExtended;
begin
  Result := @Self[AIndex];
end;

function TExtendedDynArrayHelper.GetSize: Integer;
begin
  Result := Length * SizeOf(Extended);
end;

function TExtendedDynArrayHelper.GetSum: Extended;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;
  for I := Low to High do
    Result := Result + Self[I];
end;

function TExtendedDynArrayHelper.GetVariance: Extended;
var
  M: Extended;
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

function TExtendedDynArrayHelper.Low: Integer;
begin
  Result := System.Low(Self);
end;

function TExtendedDynArrayHelper.High: Integer;
begin
  Result := System.High(Self);
end;

procedure TExtendedDynArrayHelper.Normalize;
var
  D: Extended;
  I: Integer;
begin
  D := MaxValue;
  if D.IsNaN or D.IsZero then
    Exit;
  D := 1 / D;
  for I := Low to High do
    Self[I] := Self[I] * D;
end;

function TExtendedDynArrayHelper.Normalized: TExtendedDynArray;
begin
  Result := TExtendedDynArray.Create(Self);
  Result.Normalize;
end;

constructor TExtendedDynArrayHelper.Random(const ALength: Integer);
var
  I: Integer;
begin
  Self := TExtendedDynArray.Create(ALength);
  for I := Low to High do
    Self[I] := System.Random();
end;

procedure TExtendedDynArrayHelper.Resize(const ALength: Integer; const ASaveData: Boolean = true);
begin
  if Length <> ALength then
    System.SetLength(Self, ALength);

  if not ASaveData then
    Zero;
end;

procedure TExtendedDynArrayHelper.SetItem(const AIndex: Integer; const AValue: Extended);
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Self[AIndex] := AValue;
end;

procedure TExtendedDynArrayHelper.SetLength(const AValue: Integer);
begin
  System.SetLength(Self, AValue);
end;

procedure TExtendedDynArrayHelper.Zero;
begin
  if Length = 0 then
    Exit;
  FillChar(Self[Low], Size, 0);
end;

procedure TExtendedDynArrayHelper.NaN;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NaN;
end;

procedure TExtendedDynArrayHelper.NegativeInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].NegativeInfinity;
end;

class function TExtendedDynArrayHelper.Parse(
  const AVectorStr: string): TExtendedDynArray;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AVectorStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([VectorItemDelimiter]);
  L := System.Length(LStrArray);
  Result := TExtendedDynArray.Create(L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := StrToFloatSafe(LStrArray[I]);
end;

constructor TExtendedDynArrayHelper.Create(const AVectorStr: string);
begin
   Self :=  TExtendedDynArray.Parse(AVectorStr);
end;

procedure TExtendedDynArrayHelper.PositiveInfinity;
var
  I: Integer;
begin
  for I := Low to High do
    Self[I].PositiveInfinity;
end;

function TExtendedDynArrayHelper.IsZero: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsZero;
end;

function TExtendedDynArrayHelper.IsNaN: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNaN;
end;

function TExtendedDynArrayHelper.IsNaNArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNaN;
end;

function TExtendedDynArrayHelper.IsInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsInfinity;
end;

function TExtendedDynArrayHelper.IsInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsInfinity;
end;

function TExtendedDynArrayHelper.IsNegativeInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsNegativeInfinity;
end;

function TExtendedDynArrayHelper.IsNegativeInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsNegativeInfinity;
end;

function TExtendedDynArrayHelper.IsPositiveInfinity: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsPositiveInfinity;
end;

function TExtendedDynArrayHelper.IsPositiveInfinityArray: TBooleanDynArray;
var
  I: Integer;
begin
  System.SetLength(Result, Self.Length);
  for I := Low to High do
    Result[I] := Self[I].IsPositiveInfinity;
end;

function TExtendedDynArrayHelper.First(): Extended;
begin
  Result := Self[Low];
end;

function TExtendedDynArrayHelper.Last(): Extended;
begin
  Result := Self[High];
end;

function TExtendedDynArrayHelper.Inverse: TExtendedDynArray;
var
  I: Integer;
begin
  Result := TExtendedDynArray.Create(Self.Length);
  for I := Low to High do
    Result[I] := 1 / Self[I];
end;

function TExtendedDynArrayHelper.Prod: Extended;
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

function TExtendedDynArrayHelper.ReverseArray: TExtendedDynArray;
var
  I, J: Integer;
begin
  Result := TExtendedDynArray.Create(Length);
  J := 0;
  for I := High downto Low do
  begin
    Result[J] := Self[I];
    System.Inc(J);
  end;
end;

function TExtendedDynArrayHelper.DeleteIndexes(const AIndexes: TIntegerDynArray): TExtendedDynArray;
var
  J, L, K: Integer;
begin
  L := Length;
  K := System.Length(AIndexes);
  if L - K <= 0 then
    Exit;

  Result := TExtendedDynArray.Create(L - K);
  L := 0;
  for J := 0 to K - 1 do
  begin
    Result[L] := Self[AIndexes[J]];
    System.Inc(L);
  end;
end;

function TExtendedDynArrayHelper.DeleteValues(const AStates: TBooleanDynArray): TExtendedDynArray;
var
  I, LCounter: Integer;
begin
  NeedSameLength(Self.Length, System.Length(AStates));

  LCounter := 0;
  for I := Low to High do
    if AStates[I] then
      System.Inc(LCounter);
  Result := TExtendedDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if not AStates[I] then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TExtendedDynArrayHelper.Sort;
begin
  TArray.Sort<Extended>(Self);
end;

procedure TExtendedDynArrayHelper.Sort(var AIndexes: TIntegerDynArray);
var
  Lo, Hi: Integer;
  Pivot, T: Extended;
  I, ti: Integer;

  procedure qSort(var a: TExtendedDynArray; iLo, iHi: Integer; var AIndexes: TIntegerDynArray);
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

procedure TExtendedDynArrayHelper.SortWithOrder(const AOrderIndexes: TIntegerDynArray);
var
  I: Integer;
begin
  for I := System.Low(AOrderIndexes) to System.High(AOrderIndexes) do
    TSwapOp<Extended>.Swap(Self[AOrderIndexes[I]], Self[I]);
  Resize(System.Length(AOrderIndexes));
end;

function TExtendedDynArrayHelper.ToString(const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormatSettings);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TExtendedDynArrayHelper.ToString: string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(VectorItemDelimiter, R);
end;

function TExtendedDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer; const AFormatSettings: TFormatSettings): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits, AFormatSettings);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TExtendedDynArrayHelper.ToString(const AFormat: TFloatFormat; const APrecision, ADigits: Integer): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString(AFormat, APrecision, ADigits);
  Result := string.Join(VectorItemDelimiter, R);
end;

function TExtendedDynArrayHelper._ToString(const ASeparator: string): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(ASeparator, R);
end;

///
/// Integer
///

procedure TIntegerDynArrayHelper.Assign(const ASource: TIntegerDynArray);
begin
  NeedSameLength(Length, ASource.Length);
  Move(ASource[0], Self[0], Size);
end;

procedure TIntegerDynArrayHelper.AssignTo(const ADest: TIntegerDynArray);
begin
  NeedSameLength(Length, ADest.Length);
  Move(Self[0], ADest[0], Size);
end;

procedure TIntegerDynArrayHelper.Add(const AValue: Integer);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] + AValue;
end;

procedure TIntegerDynArrayHelper.Add(const AVector: TIntegerDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] + AVector[I];
end;

procedure TIntegerDynArrayHelper.Subtract(const AVector: TIntegerDynArray);
var
  I: Integer;
begin
  NeedSameLength(Self.Length, AVector.Length);
  for I := Low to High do
    Self[I] := Self[I] - AVector[I];
end;

procedure TIntegerDynArrayHelper.Subtract(const AValue: Integer);
var
  I: Integer;
begin
  for I := Low to High do
    Self[I] := Self[I] - AValue;
end;

function TIntegerDynArrayHelper.Negative: TIntegerDynArray;
var
  I: Integer;
begin
  Result.Length := Self.Length;
  for I := Result.Low to Result.High do
    Result[I] := -Self[I];
end;

function TIntegerDynArrayHelper.Equal(const AVector: TIntegerDynArray): Boolean;
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

function TIntegerDynArrayHelper.NotEqual(const AVector: TIntegerDynArray): Boolean;
begin
  Result := not (Self.Equal(AVector));
end;

function TIntegerDynArrayHelper.Equal(const AValue: Integer): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := Low to High do
    Result := Result or (Self[I] = AValue);
end;

function TIntegerDynArrayHelper.NotEqual(const AValue: Integer): Boolean;
begin
  Result := not (Self.Equal(AValue));
end;

constructor TIntegerDynArrayHelper.Base(const ALength, ANumber: Integer);
begin
  if not InRange(ANumber, 0, ALength - 1) then
    raise EVectorError.Create('ANumber must be in range ALength');
  Self.Length := ALength;

  Self[ANumber] := 1;
end;

constructor TIntegerDynArrayHelper.Create(const AVector: TIntegerDynArray);
begin
  Self := Nil;
  Self := Copy(AVector);
end;

constructor TIntegerDynArrayHelper.Create(const AStart, AEnd, AStep: Integer);
var
  I: Integer;
begin
  if (AStep <= 0) or (AStart = AEnd) then
    raise EVectorError.Create('Create error: Check input parameters');

  Self := TIntegerDynArray.Create(((AEnd - AStart) / AStep).Ceil);
  for I := Low to High do
    Self[I] := I * AStep + AStart;
end;

constructor TIntegerDynArrayHelper.Create(const ALength: Integer);
begin
  Self := Nil;
  Self.Length := ALength;
end;

constructor TIntegerDynArrayHelper.Ones(const ALength: Integer);
var
  I: Integer;
begin
  Self := Nil;
  Self := TIntegerDynArray.Create(ALength);
  Self.Fill(1);
end;

procedure TIntegerDynArrayHelper.Fill(const AValue: Integer);
var
  I: Integer;
begin
  for I := Self.Low to Self.High do
    Self[I] := AValue;
end;

procedure TIntegerDynArrayHelper.Apply(const AProc: TEleventProc<Integer>);
var
  I: Integer;
begin
  Assert(Assigned(AProc), 'Unassigned procedure');
  for I := Low to High do
    AProc(Self[I]); // Check
end;

function TIntegerDynArrayHelper.ForEach(const AProc: TEleventProc<Integer>): TIntegerDynArray;
begin
  Result := TIntegerDynArray.Create(Self);
  Result.Apply(AProc);
end;

function TIntegerDynArrayHelper.GetItem(const AIndex: Integer): Integer;
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Result := Self[AIndex];
end;

function TIntegerDynArrayHelper.GetLength: Integer;
begin
  Result := System.Length(Self);
end;

function TIntegerDynArrayHelper.GetMaxValue: Integer;
var
  I: Integer;
begin
  Result := MaxItem(I);
end;

function TIntegerDynArrayHelper.MaxItem(var AIndex: Integer): Integer;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result := -1;
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

function TIntegerDynArrayHelper.GetMaxIndex: Integer;
begin
  MaxItem(Result);
end;

function TIntegerDynArrayHelper.MinItem(var AIndex: Integer): Integer;
var
  I: Integer;
begin
  if Length = 0 then
  begin
    AIndex := -1;
    Result := -1;
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

function TIntegerDynArrayHelper.GetMinValue: Integer;
var
  I: Integer;
begin
  Result := MinItem(I);
end;

function TIntegerDynArrayHelper.GetMinIndex: Integer;
begin
  MinItem(Result);
end;

function TIntegerDynArrayHelper.GetPItem(const AIndex: Integer): PInteger;
begin
  Result := @Self[AIndex];
end;

function TIntegerDynArrayHelper.GetSize: Integer;
begin
  Result := Length * SizeOf(Integer);
end;

function TIntegerDynArrayHelper.GetSum: Integer;
var
  I: Integer;
begin
  Result := 0;
  if Length = 0 then
    Exit;
  for I := Low to High do
    Result := Result + Self[I];
end;

function TIntegerDynArrayHelper.Low: Integer;
begin
  Result := System.Low(Self);
end;

function TIntegerDynArrayHelper.High: Integer;
begin
  Result := System.High(Self);
end;

procedure TIntegerDynArrayHelper.Resize(const ALength: Integer; const ASaveData: Boolean = true);
begin
  if Length <> ALength then
    System.SetLength(Self, ALength);

  if not ASaveData then
    Zero;
end;

procedure TIntegerDynArrayHelper.SetItem(const AIndex: Integer; const AValue: Integer);
begin
  if not InRange(AIndex, Low, High) then
    raise EVectorError.Create('Index not in range of vector bounds');
  Self[AIndex] := AValue;
end;

procedure TIntegerDynArrayHelper.SetLength(const AValue: Integer);
begin
  System.SetLength(Self, AValue);
end;

procedure TIntegerDynArrayHelper.Zero;
begin
  if Length = 0 then
    Exit;
  FillChar(Self[Low], Size, 0);
end;

function TIntegerDynArrayHelper.IsZero: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := Low to High do
    Result := Result and Self[I].IsZero;
end;

function TIntegerDynArrayHelper.First(): Integer;
begin
  Result := Self[Low];
end;

function TIntegerDynArrayHelper.Last(): Integer;
begin
  Result := Self[High];
end;

class function TIntegerDynArrayHelper.Parse(
  const AVectorStr: string): TIntegerDynArray;
var
  LStrArray: TStringDynArray;
  L: Integer;
  I: Integer;
begin
  LStrArray := AVectorStr.Trim(UnexpectedSymbolsInMatrixOrVectors).Split([VectorItemDelimiter]);
  L := System.Length(LStrArray);
  Result := TIntegerDynArray.Create(L);
  System.Dec(L);
  for I := 0 to L do
    Result[I] := StrToInt(LStrArray[I]);
end;

constructor TIntegerDynArrayHelper.Create(const AVectorStr: string);
begin
   Self :=  TIntegerDynArray.Parse(AVectorStr);
end;

function TIntegerDynArrayHelper.Prod: Integer;
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

function TIntegerDynArrayHelper.ReverseArray: TIntegerDynArray;
var
  I, J: Integer;
begin
  Result := TIntegerDynArray.Create(Length);
  J := 0;
  for I := High downto Low do
  begin
    Result[J] := Self[I];
    System.Inc(J);
  end;
end;

function TIntegerDynArrayHelper.DeleteIndexes(const AIndexes: TIntegerDynArray): TIntegerDynArray;
var
  J, L, K: Integer;
begin
  L := Length;
  K := System.Length(AIndexes);
  if L - K <= 0 then
    Exit;

  Result := TIntegerDynArray.Create(L - K);
  L := 0;
  for J := 0 to K - 1 do
  begin
    Result[L] := Self[AIndexes[J]];
    System.Inc(L);
  end;
end;

function TIntegerDynArrayHelper.DeleteValues(const AStates: TBooleanDynArray): TIntegerDynArray;
var
  I, LCounter: Integer;
begin
  NeedSameLength(Self.Length, System.Length(AStates));

  LCounter := 0;
  for I := Low to High do
    if AStates[I] then
      System.Inc(LCounter);
  Result := TIntegerDynArray.Create(LCounter);
  LCounter := 0;
  for I := Low to High do
  begin
    if not AStates[I] then
      continue;
    Result[LCounter] := Self[I];
    System.Inc(LCounter);
  end;
end;

procedure TIntegerDynArrayHelper.Sort;
begin
  TArray.Sort<Integer>(Self);
end;

procedure TIntegerDynArrayHelper.Sort(var AIndexes: TIntegerDynArray);
var
  Lo, Hi: Integer;
  Pivot, T: Integer;
  I, ti: Integer;

  procedure qSort(var a: TIntegerDynArray; iLo, iHi: Integer; var AIndexes: TIntegerDynArray);
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

procedure TIntegerDynArrayHelper.SortWithOrder(const AOrderIndexes: TIntegerDynArray);
var
  I: Integer;
begin
  for I := System.Low(AOrderIndexes) to System.High(AOrderIndexes) do
    TSwapOp<Integer>.Swap(Self[AOrderIndexes[I]], Self[I]);
  Resize(System.Length(AOrderIndexes));
end;

function TIntegerDynArrayHelper.ToString: string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(VectorItemDelimiter, R);
end;

function TIntegerDynArrayHelper._ToString(const ASeparator: string): string;
var
  R: TStringDynArray;
  I: Integer;
begin
  System.SetLength(R, Self.Length);
  for I := System.Low(R) to System.High(R) do
    R[I] := Self[I].ToString;
  Result := string.Join(ASeparator, R);
end;



end.

