unit DAVLib.ComplexType;

/// <summary>
/// Complex math library
/// </summary>

interface

uses
  System.SysUtils;

type
  PDComplex = ^TDComplex;

  TDComplex = packed record
    Re: Double;
    Im: Double;
    constructor Create(const ARe: Double; const AIm: Double = 0); overload;
    procedure SetValue(const ARe: Double = 0; const AIm: Double = 0);
    class operator Implicit(const A: TDComplex): string;
    class operator Implicit(const A: Double): TDComplex;
    constructor Create(const ACmplStr: string); overload;
    class operator Implicit(const A: string): TDComplex;
    class operator Add(const A, B: TDComplex): TDComplex;
    class operator Multiply(const A, B: TDComplex): TDComplex;
    class operator Multiply(const A: TDComplex; const B: Double): TDComplex;
    class operator Divide(const A, B: TDComplex): TDComplex;
    class operator Divide(const A: TDComplex; const B: Double): TDComplex;
    class operator Divide(const A: Double; const B: TDComplex): TDComplex;
    class operator Equal(const A, B: TDComplex): Boolean;
    class operator NotEqual(const A, B: TDComplex): Boolean;
    class operator Negative(const A: TDComplex): TDComplex;
    class operator Positive(const A: TDComplex): TDComplex;
    class operator Subtract(const A, B: TDComplex): TDComplex;
    class operator GreaterThan(const A, B: TDComplex): Boolean; // GreaterThan
    class operator GreaterThanOrEqual(const A, B: TDComplex): Boolean; // GreaterThanOrEqual
    class operator LessThan(const A, B: TDComplex): Boolean; // LessThan
    class operator LessThanOrEqual(const A, B: TDComplex): Boolean; // LessThanOrEqual
    procedure Inc;
    procedure Dec;
    function Trunc: TDComplex;
    function Round: TDComplex;
    function Floor: TDComplex;
    function Ceil: TDComplex;
    procedure Zero;
    function IsZero: Boolean;
    function IsUnit: Boolean;
    function Conjugate: TDComplex;
    function SqrAbs: Double;
    function Sqr: TDComplex;
    function Magnitude: Double;
    function Angle: Double;
    function Exp: TDComplex;
    function Ln: TDComplex;
    function Sqrt: TDComplex;
    function Inverse: TDComplex; { inverse : r := 1 / z }
    function Power(const ADegree: Double): TDComplex; overload;
    function Power(const ADegree: TDComplex): TDComplex; overload;
    class function Power(const AValue: Double; const ADegree: TDComplex): TDComplex; overload; static;
    function Cos: TDComplex; // cosine
    function Sin: TDComplex; // sinus
    function Tan: TDComplex; // tangent
    function ArcCos: TDComplex; // inverse cosine
    function ArcSin: TDComplex; // inverse sinus
    function ArcTan: TDComplex; // inverse tangent
    function Cosh: TDComplex; // hyperbolic cosine
    function Sinh: TDComplex; // hyperbolic sinus
    function Tanh: TDComplex; // hyperbolic tangent
    function ArcCosh: TDComplex; // inverse hyperbolic cosine
    function ArcSinh: TDComplex; // inverse hyperbolic sinus
    function ArcTanh: TDComplex; // inverse hyperbolic tangent
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function ToString: string; overload;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: string): string; overload;
    function ToString(const AFormat: string; const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    function Assign(const Source: TDComplex): TDComplex;
    procedure ClearReal;
    procedure ClearImag;
    function i1: TDComplex;
    function Pointer: PDComplex;
  end;

  PSComplex = ^TSComplex;

  TSComplex = packed record
    Re: Single;
    Im: Single;
    constructor Create(const ARe: Single; const AIm: Single = 0); overload;
    procedure SetValue(const ARe: Single = 0; const AIm: Single = 0);
    class operator Implicit(const A: TSComplex): string;
    class operator Implicit(const A: Single): TSComplex;
    constructor Create(const ACmplStr: string); overload;
    class operator Implicit(const A: string): TSComplex;
    class operator Add(const A, B: TSComplex): TSComplex;
    class operator Multiply(const A, B: TSComplex): TSComplex;
    class operator Multiply(const A: TSComplex; const B: Single): TSComplex;
    class operator Divide(const A, B: TSComplex): TSComplex;
    class operator Divide(const A: TSComplex; const B: Single): TSComplex;
    class operator Divide(const A: Single; const B: TSComplex): TSComplex;
    class operator Equal(const A, B: TSComplex): Boolean;
    class operator NotEqual(const A, B: TSComplex): Boolean;
    class operator Negative(const A: TSComplex): TSComplex;
    class operator Positive(const A: TSComplex): TSComplex;
    class operator Subtract(const A, B: TSComplex): TSComplex;
    class operator GreaterThan(const A, B: TSComplex): Boolean; // GreaterThan
    class operator GreaterThanOrEqual(const A, B: TSComplex): Boolean;
    // GreaterThanOrEqual
    class operator LessThan(const A, B: TSComplex): Boolean; // LessThan
    class operator LessThanOrEqual(const A, B: TSComplex): Boolean; // LessThanOrEqual
    procedure Inc;
    procedure Dec;
    function Trunc: TSComplex;
    function Round: TSComplex;
    function Floor: TSComplex;
    function Ceil: TSComplex;
    procedure Zero;
    function IsZero: Boolean;
    function IsUnit: Boolean;
    function Conjugate: TSComplex;
    function SqrAbs: Single;
    function Sqr: TSComplex;
    function Magnitude: Single;
    function Angle: Single;
    function Exp: TSComplex;
    function Ln: TSComplex;
    function Sqrt: TSComplex;
    function Inverse: TSComplex; { inverse : r := 1 / z }
    function Power(const ADegree: Single): TSComplex; overload;
    function Power(const ADegree: TSComplex): TSComplex; overload;
    class function Power(const AValue: Single; const ADegree: TSComplex): TSComplex; overload; static;
    function Cos: TSComplex; // cosine
    function Sin: TSComplex; // sinus
    function Tan: TSComplex; // tangent
    function ArcCos: TSComplex; // inverse cosine
    function ArcSin: TSComplex; // inverse sinus
    function ArcTan: TSComplex; // inverse tangent
    function Cosh: TSComplex; // hyperbolic cosine
    function Sinh: TSComplex; // hyperbolic sinus
    function Tanh: TSComplex; // hyperbolic tangent
    function ArcCosh: TSComplex; // inverse hyperbolic cosine
    function ArcSinh: TSComplex; // inverse hyperbolic sinus
    function ArcTanh: TSComplex; // inverse hyperbolic tangent
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function ToString: string; overload;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: string): string; overload;
    function ToString(const AFormat: string; const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    function Assign(const Source: TSComplex): TSComplex;
    procedure ClearReal;
    procedure ClearImag;
    function i1: TSComplex;
    function Pointer: PSComplex;
  end;

  PEComplex = ^TEComplex;

  TEComplex = packed record
    Re: Extended;
    Im: Extended;
    constructor Create(const ARe: Extended; const AIm: Extended = 0); overload;
    procedure SetValue(const ARe: Extended = 0; const AIm: Extended = 0);
    class operator Implicit(const A: TEComplex): string;
    class operator Implicit(const A: Extended): TEComplex;
    constructor Create(const ACmplStr: string); overload;
    class operator Implicit(const A: string): TEComplex;
    class operator Add(const A, B: TEComplex): TEComplex;
    class operator Multiply(const A, B: TEComplex): TEComplex;
    class operator Multiply(const A: TEComplex; const B: Extended): TEComplex;
    class operator Divide(const A, B: TEComplex): TEComplex;
    class operator Divide(const A: TEComplex; const B: Extended): TEComplex;
    class operator Divide(const A: Extended; const B: TEComplex): TEComplex;
    class operator Equal(const A, B: TEComplex): Boolean;
    class operator NotEqual(const A, B: TEComplex): Boolean;
    class operator Negative(const A: TEComplex): TEComplex;
    class operator Positive(const A: TEComplex): TEComplex;
    class operator Subtract(const A, B: TEComplex): TEComplex;
    class operator GreaterThan(const A, B: TEComplex): Boolean; // GreaterThan
    class operator GreaterThanOrEqual(const A, B: TEComplex): Boolean; // GreaterThanOrEqual
    class operator LessThan(const A, B: TEComplex): Boolean; // LessThan
    class operator LessThanOrEqual(const A, B: TEComplex): Boolean; // LessThanOrEqual
    procedure Inc;
    procedure Dec;
    function Trunc: TEComplex;
    function Round: TEComplex;
    function Floor: TEComplex;
    function Ceil: TEComplex;
    procedure Zero;
    function IsZero: Boolean;
    function IsUnit: Boolean;
    function Conjugate: TEComplex;
    function SqrAbs: Extended;
    function Sqr: TEComplex;
    function Magnitude: Extended;
    function Angle: Extended;
    function Exp: TEComplex;
    function Ln: TEComplex;
    function Sqrt: TEComplex;
    function Inverse: TEComplex; { inverse : r := 1 / z }
    function Power(const ADegree: Extended): TEComplex; overload;
    function Power(const ADegree: TEComplex): TEComplex; overload;
    class function Power(const AValue: Extended; const ADegree: TEComplex): TEComplex; overload; static;
    function Cos: TEComplex; // cosine
    function Sin: TEComplex; // sinus
    function Tan: TEComplex; // tangent
    function ArcCos: TEComplex; // inverse cosine
    function ArcSin: TEComplex; // inverse sinus
    function ArcTan: TEComplex; // inverse tangent
    function Cosh: TEComplex; // hyperbolic cosine
    function Sinh: TEComplex; // hyperbolic sinus
    function Tanh: TEComplex; // hyperbolic tangent
    function ArcCosh: TEComplex; // inverse hyperbolic cosine
    function ArcSinh: TEComplex; // inverse hyperbolic sinus
    function ArcTanh: TEComplex; // inverse hyperbolic tangent
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function ToString: string; overload;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const AFormat: string): string; overload;
    function ToString(const AFormat: string; const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string; overload;
    function Assign(const Source: TEComplex): TEComplex;
    procedure ClearReal;
    procedure ClearImag;
    function i1: TEComplex;
    function Pointer: PEComplex;
  end;

const
  ImaginaryUnitDComplex: TDComplex = (
    Re: 0.0;
    Im: 1.0
  );
  ZeroValueDComplex: TDComplex = (
    Re: 0.0;
    Im: 0.0
  );
  ImaginaryUnitSComplex: TSComplex = (
    Re: 0.0;
    Im: 1.0
  );
  ZeroValueSComplex: TSComplex = (
    Re: 0.0;
    Im: 0.0
  );
  ImaginaryUnitEComplex: TEComplex = (
    Re: 0.0;
    Im: 1.0
  );
  ZeroValueEComplex: TEComplex = (
    Re: 0.0;
    Im: 0.0
  );

implementation

uses
  System.Math, DAVLib.SimpleTypesHelper;

const
  ReImDelimiter = '|';
  fmtComplex = '(%g' + ReImDelimiter + '%g)';
  fmtComplexStr = '(%s' + ReImDelimiter + '%s)';

function TDComplex.Magnitude: Double;
begin
  Result := Hypot(Re, Im);
end;

class operator TDComplex.Add(const A, B: TDComplex): TDComplex;
begin
  Result.Re := A.Re + B.Re;
  Result.Im := A.Im + B.Im;
end;

function TDComplex.ArcCos: TDComplex;
begin
  Result := -ImaginaryUnitDComplex * Self.ArcCosh;
end;

function TDComplex.ArcCosh: TDComplex;
var
  Temp: TDComplex;
begin
  Temp := 1 - Self * Self;
  Result := -(Self + ImaginaryUnitDComplex * Temp.Sqrt).Ln;
end;

function TDComplex.ArcSin: TDComplex;
begin
  Result := -ImaginaryUnitDComplex * (ImaginaryUnitDComplex * Self).ArcSinh;
end;

function TDComplex.ArcSinh: TDComplex;
var
  Temp: TDComplex;
begin
  Temp := Self * Self + 1;
  Result := (Self + Temp.Sqrt).Ln;
end;

function TDComplex.ArcTan: TDComplex;
begin
  Result := -ImaginaryUnitDComplex * (ImaginaryUnitDComplex * Self).ArcTanh;
end;

function TDComplex.ArcTanh: TDComplex;
var
  Temp: TDComplex;
begin
  Temp := (Self + 1) / (1 - Self);
  Result := Temp.Ln / 2;
end;

function TDComplex.Angle: Double;
begin
  Result := ArcTan2(Im, Re);
end;

function TDComplex.Conjugate: TDComplex;
begin
  Result.Re := Re;
  Result.Im := -Im;
end;

function TDComplex.Cos: TDComplex;
begin
  Result.Re := System.Cos(Re) * System.Math.Cosh(Im);
  Result.Im := -System.Sin(Re) * System.Math.Sinh(Im);
end;

function TDComplex.Cosh: TDComplex;
begin
  Result.Re := System.Math.Cosh(Re) * System.Cos(Im);
  Result.Im := System.Math.Sinh(Re) * System.Sin(Im);
end;

constructor TDComplex.Create(const ACmplStr: string);
var
  LStrArray: TArray<string>;
  L: Integer;
begin
  LStrArray := ACmplStr.Split([ReImDelimiter]);
  L := Length(LStrArray);
  if L > 0 then
    Re := StrToFloatSafe(LStrArray[0])
  else
    Re := 0;
  if L > 1 then
    Im := StrToFloatSafe(LStrArray[1])
  else
    Im := 0;
end;

class operator TDComplex.Implicit(const A: string): TDComplex;
begin
  Result := TDComplex.Create(A);
end;

constructor TDComplex.Create(const ARe, AIm: Double);
begin
  Re := ARe;
  Im := AIm;
end;

procedure TDComplex.SetValue(const ARe, AIm: Double);
begin
  Re := ARe;
  Im := AIm;
end;

class operator TDComplex.Divide(const A: TDComplex; const B: Double): TDComplex;
begin
  Result.Re := A.Re / B;
  Result.Im := A.Im / B;
end;

class operator TDComplex.Divide(const A, B: TDComplex): TDComplex;
var
  tmp, denom: Double;
begin
  if (System.Abs(B.Re) > System.Abs(B.Im)) then
  begin
    tmp := B.Im / B.Re;
    denom := B.Re + B.Im * tmp;
    Result.Re := (A.Re + A.Im * tmp) / denom;
    Result.Im := (A.Im - A.Re * tmp) / denom;
  end
  else
  begin
    tmp := B.Re / B.Im;
    denom := B.Im + B.Re * tmp;
    Result.Re := (A.Im + A.Re * tmp) / denom;
    Result.Im := (-A.Re + A.Im * tmp) / denom;
  end;
end;

class operator TDComplex.Equal(const A, B: TDComplex): Boolean;
begin
  Result := SameValue(A.Re, B.Re) and SameValue(A.Im, B.Im);
end;

function TDComplex.Exp: TDComplex;
var
  A, S, C: Extended;
begin
  A := System.Exp(Re);
  SinCos(Im, S, C);
  Result.Re := A * C;
  Result.Im := A * S;
end;

class operator TDComplex.Implicit(const A: Double): TDComplex;
begin
  Result.Re := A;
  Result.Im := 0;
end;

function TDComplex.Inverse: TDComplex;
{ inverse : r := 1 / z }
var
  denom: Double;
begin
  denom := System.Sqr(Re) + System.Sqr(Im);
  { generates A fpu exception if denom=0 as for reals }
  Result.Re := Re / denom;
  Result.Im := -Im / denom;
end;

function TDComplex.IsUnit: Boolean;
begin
  Result := SameValue(Re, 1) and System.Math.IsZero(Im);
end;

function TDComplex.IsZero: Boolean;
begin
  Result := System.Math.IsZero(Re) and System.Math.IsZero(Im);
end;

function TDComplex.Ln: TDComplex;
begin
  Result.Re := System.Ln(Magnitude);
  Result.Im := ArcTan2(Self.Im, Self.Re);
end;

class operator TDComplex.Implicit(const A: TDComplex): string;
begin
  Result := Format(fmtComplex, [A.Re, A.Im]);
end;

class operator TDComplex.Multiply(const A: TDComplex; const B: Double): TDComplex;
begin
  Result.Re := A.Re * B;
  Result.Im := A.Im * B;
end;

class operator TDComplex.Multiply(const A, B: TDComplex): TDComplex;
begin
  Result.Re := A.Re * B.Re - A.Im * B.Im;
  Result.Im := A.Re * B.Im + A.Im * B.Re;
end;

class operator TDComplex.Negative(const A: TDComplex): TDComplex;
begin
  Result.Re := -A.Re;
  Result.Im := -A.Im;
end;

class operator TDComplex.NotEqual(const A, B: TDComplex): Boolean;
begin
  Result := not SameValue(A.Re, B.Re) or not SameValue(A.Im, B.Im);
end;

function TDComplex.Pointer: PDComplex;
begin
  Result := @Self;
end;

class operator TDComplex.Positive(const A: TDComplex): TDComplex;
begin
  Result.Assign(A);
end;

function TDComplex.Power(const ADegree: TDComplex): TDComplex;
begin
  Result := (ADegree * Self.Ln).Exp;
end;

class function TDComplex.Power(const AValue: Double; const ADegree: TDComplex): TDComplex;
begin
  Result := (ADegree * System.Ln(AValue)).Exp;
end;

function TDComplex.Power(const ADegree: Double): TDComplex;
begin
  Result := (ADegree * Self.Ln).Exp;
end;

function TDComplex.Sin: TDComplex;
begin
  Result.Re := System.Sin(Re) * System.Math.Cosh(Im);
  Result.Im := System.Cos(Re) * System.Math.Sinh(Im);
end;

function TDComplex.Sinh: TDComplex;
begin
  Result.Re := System.Math.Sinh(Re) * System.Cos(Im);
  Result.Im := System.Math.Cosh(Re) * System.Sin(Im);
end;

function TDComplex.Sqr: TDComplex;
begin
  Result.Re := System.Sqr(Re) - System.Sqr(Im);
  Result.Im := 2 * Re * Im;
end;

function TDComplex.SqrAbs: Double;
begin
  Result := System.Sqr(Re) - System.Sqr(Im);
end;

function TDComplex.Sqrt: TDComplex;
var
  root, q: Double;
begin
  if not System.Math.IsZero(Re) or not System.Math.IsZero(Im) then
  begin
    root := System.Sqrt(0.5 * (System.Abs(Re) + Magnitude));
    q := Self.Im / (2.0 * root);
    if Self.Re >= 0.0 then
    begin
      Result.Re := root;
      Result.Im := q;
    end
    else if Self.Im < 0.0 then
    begin
      Result.Re := -q;
      Result.Im := -root
    end
    else
    begin
      Result.Re := q;
      Result.Im := root
    end
  end
  else
    Result := Self;
end;

class operator TDComplex.Subtract(const A, B: TDComplex): TDComplex;
begin
  Result.Re := A.Re - B.Re;
  Result.Im := A.Im - B.Im;
end;

function TDComplex.ToString: string;
begin
  Result := Format(fmtComplex, [Re, Im]);
end;

function TDComplex.ToString(const AFormatSettings: TFormatSettings): string;
begin
  Result := Format(fmtComplex, [Re, Im], AFormatSettings);
end;

function TDComplex.ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string;
begin
  Result := System.SysUtils.Format(fmtComplexStr, [FloatToStrF(Re, Format, Precision, Digits), FloatToStrF(Im, Format, Precision, Digits)]);
end;

function TDComplex.Tan: TDComplex;
begin
  Result := Self.Sin / Self.Cos;
end;

function TDComplex.Tanh: TDComplex;
{ th(x) = sinh(x) / cosh(x) }
{ cosh(x) > 1 qq x }
begin
  Result := Self.Cosh / Self.Sinh;
end;

function TDComplex.ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string;
begin
  Result := System.SysUtils.Format(fmtComplexStr, [FloatToStrF(Re, Format, Precision, Digits, AFormatSettings), FloatToStrF(Im, Format, Precision, Digits, AFormatSettings)]);
end;

function TDComplex.ToString(const AFormat: string): string;
begin
  Result := Format(AFormat, [Re, Im]);
end;

function TDComplex.ToString(const AFormat: string; const AFormatSettings: TFormatSettings): string;
begin
  Result := Format(AFormat, [Re, Im], AFormatSettings);
end;

procedure TDComplex.Zero;
begin
  Re := 0;
  Im := 0;
end;

class operator TDComplex.Divide(const A: Double; const B: TDComplex): TDComplex;
{ division : z := r / zden }
var
  denom: Double;
begin
  with B do
    denom := System.Sqr(Re) + System.Sqr(Im);
  { generates A fpu exception if denom=0 as for reals }
  Result.Re := (A * B.Re) / denom;
  Result.Im := -(A * B.Im) / denom;
end;

procedure TDComplex.Inc; // Inc
begin
  Self.Re := Self.Re + 1;
end;

procedure TDComplex.Dec; // Dec
begin
  Self.Re := Self.Re - 1;
end;

function TDComplex.Trunc: TDComplex; // Trunc
begin
  Result.Re := System.Trunc(Re);
  Result.Im := System.Trunc(Im);
end;

function TDComplex.Round: TDComplex; // Round
begin
  Result.Re := System.Round(Re);
  Result.Im := System.Round(Im);
end;

function TDComplex.Floor: TDComplex;
begin
  Result.Re := System.Math.Floor(Re);
  Result.Im := System.Math.Floor(Im);
end;

function TDComplex.Ceil: TDComplex;
begin
  Result.Re := System.Math.Ceil(Re);
  Result.Im := System.Math.Ceil(Im);
end;

procedure TDComplex.ClearImag;
begin
  Self.Im := ZeroValue;
end;

procedure TDComplex.ClearReal;
begin
  Self.Re := ZeroValue;
end;

class operator TDComplex.GreaterThan(const A, B: TDComplex): Boolean; // GreaterThan
begin
  Result := A.Re > B.Re;
end;

class operator TDComplex.GreaterThanOrEqual(const A, B: TDComplex): Boolean;
begin
  Result := A.Re >= B.Re;
end;

function TDComplex.i1: TDComplex;
begin
  Result := TDComplex.Create(-Self.Im, Self.Re);
end;

class operator TDComplex.LessThan(const A, B: TDComplex): Boolean; // LessThan
begin
  Result := A.Re < B.Re;
end;

class operator TDComplex.LessThanOrEqual(const A, B: TDComplex): Boolean;
// LessThanOrEqual
begin
  Result := A.Re <= B.Re;
end;

function TDComplex.Assign(const Source: TDComplex): TDComplex;
begin
  Result.Re := Source.Re;
  Result.Im := Source.Im;
end;

procedure TDComplex.NaN;
begin
  Self.Re := System.Math.NaN;
  Self.Im := System.Math.NaN;
end;

procedure TDComplex.NegativeInfinity;
begin
  Self.Re := System.Math.NegInfinity;
  Self.Im := System.Math.NegInfinity;
end;

procedure TDComplex.PositiveInfinity;
begin
  Self.Re := System.Math.Infinity;
  Self.Im := System.Math.Infinity;
end;

function TDComplex.IsNaN: Boolean;
begin
  Result := Self.Re.IsNaN or Self.Im.IsNaN;
end;

function TDComplex.IsInfinity: Boolean;
begin
  Result := Self.Re.IsInfinity or Self.Im.IsInfinity;
end;

function TDComplex.IsNegativeInfinity: Boolean;
begin
  Result := Self.Re.IsNegativeInfinity or Self.Im.IsNegativeInfinity;
end;

function TDComplex.IsPositiveInfinity: Boolean;
begin
  Result := Self.Re.IsPositiveInfinity or Self.Im.IsPositiveInfinity;
end;

// TSComplex
function TSComplex.Magnitude: Single;
begin
  Result := Hypot(Re, Im);
end;

class operator TSComplex.Add(const A, B: TSComplex): TSComplex;
begin
  Result.Re := A.Re + B.Re;
  Result.Im := A.Im + B.Im;
end;

function TSComplex.ArcCos: TSComplex;
begin
  Result := -ImaginaryUnitSComplex * Self.ArcCosh;
end;

function TSComplex.ArcCosh: TSComplex;
var
  Temp: TSComplex;
begin
  Temp := 1 - Self * Self;
  Result := -(Self + ImaginaryUnitSComplex * Temp.Sqrt).Ln;
end;

function TSComplex.ArcSin: TSComplex;
begin
  Result := -ImaginaryUnitSComplex * (ImaginaryUnitSComplex * Self).ArcSinh;
end;

function TSComplex.ArcSinh: TSComplex;
var
  Temp: TSComplex;
begin
  Temp := Self * Self + 1;
  Result := (Self + Temp.Sqrt).Ln;
end;

function TSComplex.ArcTan: TSComplex;
begin
  Result := -ImaginaryUnitSComplex * (ImaginaryUnitSComplex * Self).ArcTanh;
end;

function TSComplex.ArcTanh: TSComplex;
var
  Temp: TSComplex;
begin
  Temp := (Self + 1) / (1 - Self);
  Result := Temp.Ln / 2;
end;

function TSComplex.Angle: Single;
begin
  Result := ArcTan2(Im, Re);
end;

function TSComplex.Conjugate: TSComplex;
begin
  Result.Re := Re;
  Result.Im := -Im;
end;

function TSComplex.Cos: TSComplex;
begin
  Result.Re := System.Cos(Re) * System.Math.Cosh(Im);
  Result.Im := -System.Sin(Re) * System.Math.Sinh(Im);
end;

function TSComplex.Cosh: TSComplex;
begin
  Result.Re := System.Math.Cosh(Re) * System.Cos(Im);
  Result.Im := System.Math.Sinh(Re) * System.Sin(Im);
end;

constructor TSComplex.Create(const ARe, AIm: Single);
begin
  Re := ARe;
  Im := AIm;
end;

constructor TSComplex.Create(const ACmplStr: string);
var
  LStrArray: TArray<string>;
  L: Integer;
begin
  LStrArray := ACmplStr.Split([ReImDelimiter]);
  L := Length(LStrArray);
  if L > 0 then
    Re := StrToFloatSafe(LStrArray[0])
  else
    Re := 0;
  if L > 1 then
    Im := StrToFloatSafe(LStrArray[1])
  else
    Im := 0;
end;

class operator TSComplex.Implicit(const A: string): TSComplex;
begin
  Result := TSComplex.Create(A);
end;

procedure TSComplex.SetValue(const ARe, AIm: Single);
begin
  Re := ARe;
  Im := AIm;
end;

class operator TSComplex.Divide(const A: TSComplex; const B: Single): TSComplex;
begin
  Result.Re := A.Re / B;
  Result.Im := A.Im / B;
end;

class operator TSComplex.Divide(const A, B: TSComplex): TSComplex;
var
  tmp, denom: Single;
begin
  if (System.Abs(B.Re) > System.Abs(B.Im)) then
  begin
    tmp := B.Im / B.Re;
    denom := B.Re + B.Im * tmp;
    Result.Re := (A.Re + A.Im * tmp) / denom;
    Result.Im := (A.Im - A.Re * tmp) / denom;
  end
  else
  begin
    tmp := B.Re / B.Im;
    denom := B.Im + B.Re * tmp;
    Result.Re := (A.Im + A.Re * tmp) / denom;
    Result.Im := (-A.Re + A.Im * tmp) / denom;
  end;
end;

class operator TSComplex.Equal(const A, B: TSComplex): Boolean;
begin
  Result := SameValue(A.Re, B.Re) and SameValue(A.Im, B.Im);
end;

function TSComplex.Exp: TSComplex;
var
  A, S, C: Extended;
begin
  A := System.Exp(Re);
  SinCos(Im, S, C);
  Result.Re := A * C;
  Result.Im := A * S;
end;

class operator TSComplex.Implicit(const A: Single): TSComplex;
begin
  Result.Re := A;
  Result.Im := 0;
end;

function TSComplex.Inverse: TSComplex;
{ inverse : r := 1 / z }
var
  denom: Single;
begin
  denom := System.Sqr(Re) + System.Sqr(Im);
  { generates A fpu exception if denom=0 as for reals }
  Result.Re := Re / denom;
  Result.Im := -Im / denom;
end;

function TSComplex.IsUnit: Boolean;
begin
  Result := SameValue(Re, 1) and System.Math.IsZero(Im);
end;

function TSComplex.IsZero: Boolean;
begin
  Result := System.Math.IsZero(Re) and System.Math.IsZero(Im);
end;

function TSComplex.Ln: TSComplex;
begin
  Result.Re := System.Ln(Magnitude);
  Result.Im := ArcTan2(Self.Im, Self.Re);
end;

class operator TSComplex.Implicit(const A: TSComplex): string;
begin
  Result := Format(fmtComplex, [A.Re, A.Im]);
end;

class operator TSComplex.Multiply(const A: TSComplex; const B: Single): TSComplex;
begin
  Result.Re := A.Re * B;
  Result.Im := A.Im * B;
end;

class operator TSComplex.Multiply(const A, B: TSComplex): TSComplex;
begin
  Result.Re := A.Re * B.Re - A.Im * B.Im;
  Result.Im := A.Re * B.Im + A.Im * B.Re;
end;

class operator TSComplex.Negative(const A: TSComplex): TSComplex;
begin
  Result.Re := -A.Re;
  Result.Im := -A.Im;
end;

class operator TSComplex.NotEqual(const A, B: TSComplex): Boolean;
begin
  Result := not SameValue(A.Re, B.Re) or not SameValue(A.Im, B.Im);
end;

function TSComplex.Pointer: PSComplex;
begin
  Result := @Self;
end;

class operator TSComplex.Positive(const A: TSComplex): TSComplex;
begin
  Result.Assign(A);
end;

function TSComplex.Power(const ADegree: TSComplex): TSComplex;
begin
  Result := (ADegree * Self.Ln).Exp;
end;

class function TSComplex.Power(const AValue: Single; const ADegree: TSComplex): TSComplex;
begin
  Result := (ADegree * System.Ln(AValue)).Exp;
end;

function TSComplex.Power(const ADegree: Single): TSComplex;
begin
  Result := (ADegree * Self.Ln).Exp;
end;

function TSComplex.Sin: TSComplex;
begin
  Result.Re := System.Sin(Re) * System.Math.Cosh(Im);
  Result.Im := System.Cos(Re) * System.Math.Sinh(Im);
end;

function TSComplex.Sinh: TSComplex;
begin
  Result.Re := System.Math.Sinh(Re) * System.Cos(Im);
  Result.Im := System.Math.Cosh(Re) * System.Sin(Im);
end;

function TSComplex.Sqr: TSComplex;
begin
  Result.Re := System.Sqr(Re) - System.Sqr(Im);
  Result.Im := 2 * Re * Im;
end;

function TSComplex.SqrAbs: Single;
begin
  Result := System.Sqr(Re) - System.Sqr(Im);
end;

function TSComplex.Sqrt: TSComplex;
var
  root, q: Single;
begin
  if not System.Math.IsZero(Re) or not System.Math.IsZero(Im) then
  begin
    root := System.Sqrt(0.5 * (System.Abs(Re) + Magnitude));
    q := Self.Im / (2.0 * root);
    if Self.Re >= 0.0 then
    begin
      Result.Re := root;
      Result.Im := q;
    end
    else if Self.Im < 0.0 then
    begin
      Result.Re := -q;
      Result.Im := -root
    end
    else
    begin
      Result.Re := q;
      Result.Im := root
    end
  end
  else
    Result := Self;
end;

class operator TSComplex.Subtract(const A, B: TSComplex): TSComplex;
begin
  Result.Re := A.Re - B.Re;
  Result.Im := A.Im - B.Im;
end;

function TSComplex.ToString: string;
begin
  Result := Format(fmtComplex, [Re, Im]);
end;

function TSComplex.ToString(const AFormatSettings: TFormatSettings): string;
begin
  Result := Format(fmtComplex, [Re, Im], AFormatSettings);
end;

function TSComplex.ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string;
begin
  Result := System.SysUtils.Format(fmtComplexStr, [FloatToStrF(Re, Format, Precision, Digits), FloatToStrF(Im, Format, Precision, Digits)]);
end;

function TSComplex.Tan: TSComplex;
begin
  Result := Self.Sin / Self.Cos;
end;

function TSComplex.Tanh: TSComplex;
{ th(x) = sinh(x) / cosh(x) }
{ cosh(x) > 1 qq x }
begin
  Result := Self.Cosh / Self.Sinh;
end;

function TSComplex.ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string;
begin
  Result := System.SysUtils.Format(fmtComplexStr, [FloatToStrF(Re, Format, Precision, Digits, AFormatSettings), FloatToStrF(Im, Format, Precision, Digits, AFormatSettings)]);
end;

function TSComplex.ToString(const AFormat: string): string;
begin
  Result := Format(AFormat, [Re, Im]);
end;

function TSComplex.ToString(const AFormat: string; const AFormatSettings: TFormatSettings): string;
begin
  Result := Format(AFormat, [Re, Im], AFormatSettings);
end;

procedure TSComplex.Zero;
begin
  Re := 0;
  Im := 0;
end;

class operator TSComplex.Divide(const A: Single; const B: TSComplex): TSComplex;
{ division : z := r / zden }
var
  denom: Single;
begin
  with B do
    denom := System.Sqr(Re) + System.Sqr(Im);
  { generates A fpu exception if denom=0 as for reals }
  Result.Re := (A * B.Re) / denom;
  Result.Im := -(A * B.Im) / denom;
end;

procedure TSComplex.Inc; // Inc
begin
  Self.Re := Self.Re + 1;
end;

procedure TSComplex.Dec; // Dec
begin
  Self.Re := Self.Re - 1;
end;

function TSComplex.Trunc: TSComplex; // Trunc
begin
  Result.Re := System.Trunc(Re);
  Result.Im := System.Trunc(Im);
end;

function TSComplex.Round: TSComplex; // Round
begin
  Result.Re := System.Round(Re);
  Result.Im := System.Round(Im);
end;

function TSComplex.Floor: TSComplex;
begin
  Result.Re := System.Math.Floor(Re);
  Result.Im := System.Math.Floor(Im);
end;

function TSComplex.Ceil: TSComplex;
begin
  Result.Re := System.Math.Ceil(Re);
  Result.Im := System.Math.Ceil(Im);
end;

procedure TSComplex.ClearImag;
begin
  Self.Im := ZeroValue;
end;

procedure TSComplex.ClearReal;
begin
  Self.Re := ZeroValue;
end;

class operator TSComplex.GreaterThan(const A, B: TSComplex): Boolean; // GreaterThan
begin
  Result := A.Re > B.Re;
end;

class operator TSComplex.GreaterThanOrEqual(const A, B: TSComplex): Boolean;
begin
  Result := A.Re >= B.Re;
end;

function TSComplex.i1: TSComplex;
begin
  Result := TSComplex.Create(-Self.Im, Self.Re);
end;

class operator TSComplex.LessThan(const A, B: TSComplex): Boolean; // LessThan
begin
  Result := A.Re < B.Re;
end;

class operator TSComplex.LessThanOrEqual(const A, B: TSComplex): Boolean;
// LessThanOrEqual
begin
  Result := A.Re <= B.Re;
end;

function TSComplex.Assign(const Source: TSComplex): TSComplex;
begin
  Result.Re := Source.Re;
  Result.Im := Source.Im;
end;

procedure TSComplex.NaN;
begin
  Self.Re := System.Math.NaN;
  Self.Im := System.Math.NaN;
end;

procedure TSComplex.NegativeInfinity;
begin
  Self.Re := System.Math.NegInfinity;
  Self.Im := System.Math.NegInfinity;
end;

procedure TSComplex.PositiveInfinity;
begin
  Self.Re := System.Math.Infinity;
  Self.Im := System.Math.Infinity;
end;

function TSComplex.IsNaN: Boolean;
begin
  Result := Self.Re.IsNaN or Self.Im.IsNaN;
end;

function TSComplex.IsInfinity: Boolean;
begin
  Result := Self.Re.IsInfinity or Self.Im.IsInfinity;
end;

function TSComplex.IsNegativeInfinity: Boolean;
begin
  Result := Self.Re.IsNegativeInfinity or Self.Im.IsNegativeInfinity;
end;

function TSComplex.IsPositiveInfinity: Boolean;
begin
  Result := Self.Re.IsPositiveInfinity or Self.Im.IsPositiveInfinity;
end;

// TEComplex
function TEComplex.Magnitude: Extended;
begin
  Result := Hypot(Re, Im);
end;

class operator TEComplex.Add(const A, B: TEComplex): TEComplex;
begin
  Result.Re := A.Re + B.Re;
  Result.Im := A.Im + B.Im;
end;

function TEComplex.ArcCos: TEComplex;
begin
  Result := -ImaginaryUnitEComplex * Self.ArcCosh;
end;

function TEComplex.ArcCosh: TEComplex;
var
  Temp: TEComplex;
begin
  Temp := 1 - Self * Self;
  Result := -(Self + ImaginaryUnitEComplex * Temp.Sqrt).Ln;
end;

function TEComplex.ArcSin: TEComplex;
begin
  Result := -ImaginaryUnitEComplex * (ImaginaryUnitEComplex * Self).ArcSinh;
end;

function TEComplex.ArcSinh: TEComplex;
var
  Temp: TEComplex;
begin
  Temp := Self * Self + 1;
  Result := (Self + Temp.Sqrt).Ln;
end;

function TEComplex.ArcTan: TEComplex;
begin
  Result := -ImaginaryUnitEComplex * (ImaginaryUnitEComplex * Self).ArcTanh;
end;

function TEComplex.ArcTanh: TEComplex;
var
  Temp: TEComplex;
begin
  Temp := (Self + 1) / (1 - Self);
  Result := Temp.Ln / 2;
end;

function TEComplex.Angle: Extended;
begin
  Result := ArcTan2(Im, Re);
end;

function TEComplex.Conjugate: TEComplex;
begin
  Result.Re := Re;
  Result.Im := -Im;
end;

function TEComplex.Cos: TEComplex;
begin
  Result.Re := System.Cos(Re) * System.Math.Cosh(Im);
  Result.Im := -System.Sin(Re) * System.Math.Sinh(Im);
end;

function TEComplex.Cosh: TEComplex;
begin
  Result.Re := System.Math.Cosh(Re) * System.Cos(Im);
  Result.Im := System.Math.Sinh(Re) * System.Sin(Im);
end;

constructor TEComplex.Create(const ARe, AIm: Extended);
begin
  Re := ARe;
  Im := AIm;
end;

constructor TEComplex.Create(const ACmplStr: string);
var
  LStrArray: TArray<string>;
  L: Integer;
begin
  LStrArray := ACmplStr.Split([ReImDelimiter]);
  L := Length(LStrArray);
  if L > 0 then
    Re := StrToFloatSafe(LStrArray[0])
  else
    Re := 0;
  if L > 1 then
    Im := StrToFloatSafe(LStrArray[1])
  else
    Im := 0;
end;

class operator TEComplex.Implicit(const A: string): TEComplex;
begin
  Result := TEComplex.Create(A);
end;

procedure TEComplex.SetValue(const ARe, AIm: Extended);
begin
  Re := ARe;
  Im := AIm;
end;

class operator TEComplex.Divide(const A: TEComplex; const B: Extended): TEComplex;
begin
  Result.Re := A.Re / B;
  Result.Im := A.Im / B;
end;

class operator TEComplex.Divide(const A, B: TEComplex): TEComplex;
var
  tmp, denom: Extended;
begin
  if (System.Abs(B.Re) > System.Abs(B.Im)) then
  begin
    tmp := B.Im / B.Re;
    denom := B.Re + B.Im * tmp;
    Result.Re := (A.Re + A.Im * tmp) / denom;
    Result.Im := (A.Im - A.Re * tmp) / denom;
  end
  else
  begin
    tmp := B.Re / B.Im;
    denom := B.Im + B.Re * tmp;
    Result.Re := (A.Im + A.Re * tmp) / denom;
    Result.Im := (-A.Re + A.Im * tmp) / denom;
  end;
end;

class operator TEComplex.Equal(const A, B: TEComplex): Boolean;
begin
  Result := SameValue(A.Re, B.Re) and SameValue(A.Im, B.Im);
end;

function TEComplex.Exp: TEComplex;
var
  A, S, C: Extended;
begin
  A := System.Exp(Re);
  SinCos(Im, S, C);
  Result.Re := A * C;
  Result.Im := A * S;
end;

class operator TEComplex.Implicit(const A: Extended): TEComplex;
begin
  Result.Re := A;
  Result.Im := 0;
end;

function TEComplex.Inverse: TEComplex;
{ inverse : r := 1 / z }
var
  denom: Extended;
begin
  denom := System.Sqr(Re) + System.Sqr(Im);
  { generates A fpu exception if denom=0 as for reals }
  Result.Re := Re / denom;
  Result.Im := -Im / denom;
end;

function TEComplex.IsUnit: Boolean;
begin
  Result := SameValue(Re, 1) and System.Math.IsZero(Im);
end;

function TEComplex.IsZero: Boolean;
begin
  Result := System.Math.IsZero(Re) and System.Math.IsZero(Im);
end;

function TEComplex.Ln: TEComplex;
begin
  Result.Re := System.Ln(Magnitude);
  Result.Im := ArcTan2(Self.Im, Self.Re);
end;

class operator TEComplex.Implicit(const A: TEComplex): string;
begin
  Result := Format(fmtComplex, [A.Re, A.Im]);
end;

class operator TEComplex.Multiply(const A: TEComplex; const B: Extended): TEComplex;
begin
  Result.Re := A.Re * B;
  Result.Im := A.Im * B;
end;

class operator TEComplex.Multiply(const A, B: TEComplex): TEComplex;
begin
  Result.Re := A.Re * B.Re - A.Im * B.Im;
  Result.Im := A.Re * B.Im + A.Im * B.Re;
end;

class operator TEComplex.Negative(const A: TEComplex): TEComplex;
begin
  Result.Re := -A.Re;
  Result.Im := -A.Im;
end;

class operator TEComplex.NotEqual(const A, B: TEComplex): Boolean;
begin
  Result := not SameValue(A.Re, B.Re) or not SameValue(A.Im, B.Im);
end;

function TEComplex.Pointer: PEComplex;
begin
  Result := @Self;
end;

class operator TEComplex.Positive(const A: TEComplex): TEComplex;
begin
  Result.Assign(A);
end;

function TEComplex.Power(const ADegree: TEComplex): TEComplex;
begin
  Result := (ADegree * Self.Ln).Exp;
end;

class function TEComplex.Power(const AValue: Extended; const ADegree: TEComplex): TEComplex;
begin
  Result := (ADegree * System.Ln(AValue)).Exp;
end;

function TEComplex.Power(const ADegree: Extended): TEComplex;
begin
  Result := (ADegree * Self.Ln).Exp;
end;

function TEComplex.Sin: TEComplex;
begin
  Result.Re := System.Sin(Re) * System.Math.Cosh(Im);
  Result.Im := System.Cos(Re) * System.Math.Sinh(Im);
end;

function TEComplex.Sinh: TEComplex;
begin
  Result.Re := System.Math.Sinh(Re) * System.Cos(Im);
  Result.Im := System.Math.Cosh(Re) * System.Sin(Im);
end;

function TEComplex.Sqr: TEComplex;
begin
  Result.Re := System.Sqr(Re) - System.Sqr(Im);
  Result.Im := 2 * Re * Im;
end;

function TEComplex.SqrAbs: Extended;
begin
  Result := System.Sqr(Re) - System.Sqr(Im);
end;

function TEComplex.Sqrt: TEComplex;
var
  root, q: Extended;
begin
  if not System.Math.IsZero(Re) or not System.Math.IsZero(Im) then
  begin
    root := System.Sqrt(0.5 * (System.Abs(Re) + Magnitude));
    q := Self.Im / (2.0 * root);
    if Self.Re >= 0.0 then
    begin
      Result.Re := root;
      Result.Im := q;
    end
    else if Self.Im < 0.0 then
    begin
      Result.Re := -q;
      Result.Im := -root
    end
    else
    begin
      Result.Re := q;
      Result.Im := root
    end
  end
  else
    Result := Self;
end;

class operator TEComplex.Subtract(const A, B: TEComplex): TEComplex;
begin
  Result.Re := A.Re - B.Re;
  Result.Im := A.Im - B.Im;
end;

function TEComplex.ToString: string;
begin
  Result := Format(fmtComplex, [Re, Im]);
end;

function TEComplex.ToString(const AFormatSettings: TFormatSettings): string;
begin
  Result := Format(fmtComplex, [Re, Im], AFormatSettings);
end;

function TEComplex.ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string;
begin
  Result := System.SysUtils.Format(fmtComplexStr, [FloatToStrF(Re, Format, Precision, Digits), FloatToStrF(Im, Format, Precision, Digits)]);
end;

function TEComplex.Tan: TEComplex;
begin
  Result := Self.Sin / Self.Cos;
end;

function TEComplex.Tanh: TEComplex;
{ th(x) = sinh(x) / cosh(x) }
{ cosh(x) > 1 qq x }
begin
  Result := Self.Cosh / Self.Sinh;
end;

function TEComplex.ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string;
begin
  Result := System.SysUtils.Format(fmtComplexStr, [FloatToStrF(Re, Format, Precision, Digits, AFormatSettings), FloatToStrF(Im, Format, Precision, Digits, AFormatSettings)]);
end;

function TEComplex.ToString(const AFormat: string): string;
begin
  Result := Format(AFormat, [Re, Im]);
end;

function TEComplex.ToString(const AFormat: string; const AFormatSettings: TFormatSettings): string;
begin
  Result := Format(AFormat, [Re, Im], AFormatSettings);
end;

procedure TEComplex.Zero;
begin
  Re := 0;
  Im := 0;
end;

class operator TEComplex.Divide(const A: Extended; const B: TEComplex): TEComplex;
{ division : z := r / zden }
var
  denom: Extended;
begin
  with B do
    denom := System.Sqr(Re) + System.Sqr(Im);
  { generates A fpu exception if denom=0 as for reals }
  Result.Re := (A * B.Re) / denom;
  Result.Im := -(A * B.Im) / denom;
end;

procedure TEComplex.Inc; // Inc
begin
  Self.Re := Self.Re + 1;
end;

procedure TEComplex.Dec; // Dec
begin
  Self.Re := Self.Re - 1;
end;

function TEComplex.Trunc: TEComplex; // Trunc
begin
  Result.Re := System.Trunc(Re);
  Result.Im := System.Trunc(Im);
end;

function TEComplex.Round: TEComplex; // Round
begin
  Result.Re := System.Round(Re);
  Result.Im := System.Round(Im);
end;

function TEComplex.Floor: TEComplex;
begin
  Result.Re := System.Math.Floor(Re);
  Result.Im := System.Math.Floor(Im);
end;

function TEComplex.Ceil: TEComplex;
begin
  Result.Re := System.Math.Ceil(Re);
  Result.Im := System.Math.Ceil(Im);
end;

procedure TEComplex.ClearImag;
begin
  Self.Im := ZeroValue;
end;

procedure TEComplex.ClearReal;
begin
  Self.Re := ZeroValue;
end;

class operator TEComplex.GreaterThan(const A, B: TEComplex): Boolean; // GreaterThan
begin
  Result := A.Re > B.Re;
end;

class operator TEComplex.GreaterThanOrEqual(const A, B: TEComplex): Boolean;
begin
  Result := A.Re >= B.Re;
end;

function TEComplex.i1: TEComplex;
begin
  Result := TEComplex.Create(-Self.Im, Self.Re);
end;

class operator TEComplex.LessThan(const A, B: TEComplex): Boolean; // LessThan
begin
  Result := A.Re < B.Re;
end;

class operator TEComplex.LessThanOrEqual(const A, B: TEComplex): Boolean;
// LessThanOrEqual
begin
  Result := A.Re <= B.Re;
end;

function TEComplex.Assign(const Source: TEComplex): TEComplex;
begin
  Result.Re := Source.Re;
  Result.Im := Source.Im;
end;

procedure TEComplex.NaN;
begin
  Self.Re := System.Math.NaN;
  Self.Im := System.Math.NaN;
end;

procedure TEComplex.NegativeInfinity;
begin
  Self.Re := System.Math.NegInfinity;
  Self.Im := System.Math.NegInfinity;
end;

procedure TEComplex.PositiveInfinity;
begin
  Self.Re := System.Math.Infinity;
  Self.Im := System.Math.Infinity;
end;

function TEComplex.IsNaN: Boolean;
begin
  Result := Self.Re.IsNaN or Self.Im.IsNaN;
end;

function TEComplex.IsInfinity: Boolean;
begin
  Result := Self.Re.IsInfinity or Self.Im.IsInfinity;
end;

function TEComplex.IsNegativeInfinity: Boolean;
begin
  Result := Self.Re.IsNegativeInfinity or Self.Im.IsNegativeInfinity;
end;

function TEComplex.IsPositiveInfinity: Boolean;
begin
  Result := Self.Re.IsPositiveInfinity or Self.Im.IsPositiveInfinity;
end;

end.

