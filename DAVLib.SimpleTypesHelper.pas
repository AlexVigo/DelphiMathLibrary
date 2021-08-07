unit DAVLib.SimpleTypesHelper;

/// <summary>
/// Helpers for simple data types
/// </summary>

interface

uses
  System.SysUtils;

type
  TSingleHelper = record helper for Single
    procedure Inc;
    procedure Dec;
    function Trunc: Integer;
    function Round: Integer;
    function Floor: Integer;
    function Ceil: Integer;
    procedure Zero;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Sqr: Single;
    function Abs: Single;
    function Exp: Single;
    function Ln: Single;
    function Log(aBase: Single): Single;
    function Log10: Single;
    function Sqrt: Single;
    function Inverse: Single; { inverse : r := 1 / z }
    function Power(ADegree: Single): Single;
    function Cos: Single; // cosine
    function Sin: Single; // sinus
    function Tan: Single; // tangent
    function ArcCos: Single; // inverse cosine
    function ArcSin: Single; // inverse sinus
    function ArcTan: Single; // inverse tangent
    function Cosh: Single; // hyperbolic cosine
    function Sinh: Single; // hyperbolic sinus
    function Tanh: Single; // hyperbolic tangent
    function ArcCosh: Single; // inverse hyperbolic cosine
    function ArcSinh: Single; // inverse hyperbolic sinus
    function ArcTanh: Single; // inverse hyperbolic tangent
    function PowerOfTwo: Single;
    function ToDB(const InPower: Boolean): Single;
    function ToTimes(const InPower: Boolean): Single;
    function ToRad: Single;
    function ToDeg: Single;
    function Pointer: PSingle;
    function ToString: string; overload;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string; overload;
  end;

  TDoubleHelper = record helper for Double
    procedure Inc;
    procedure Dec;
    function Trunc: Integer;
    function Round: Integer;
    function Floor: Integer;
    function Ceil: Integer;
    procedure Zero;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Sqr: Double;
    function Abs: Double;
    function Exp: Double;
    function Ln: Double;
    function Log(aBase: Double): Double;
    function Log10: Double;
    function Sqrt: Double;
    function Inverse: Double; { inverse : r := 1 / z }
    function Power(ADegree: Double): Double;
    function Cos: Double; // cosine
    function Sin: Double; // sinus
    function Tan: Double; // tangent
    function ArcCos: Double; // inverse cosine
    function ArcSin: Double; // inverse sinus
    function ArcTan: Double; // inverse tangent
    function Cosh: Double; // hyperbolic cosine
    function Sinh: Double; // hyperbolic sinus
    function Tanh: Double; // hyperbolic tangent
    function ArcCosh: Double; // inverse hyperbolic cosine
    function ArcSinh: Double; // inverse hyperbolic sinus
    function ArcTanh: Double; // inverse hyperbolic tangent
    function PowerOfTwo: Double;
    function ToDB(const InPower: Boolean): Double;
    function ToTimes(const InPower: Boolean): Double;
    function ToRad: Double;
    function ToDeg: Double;
    function Pointer: PDouble;
    function ToString: string; overload;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string; overload;
  end;

  TExtendedHelper = record helper for Extended
    procedure Inc;
    procedure Dec;
    function Trunc: Integer;
    function Round: Integer;
    function Floor: Integer;
    function Ceil: Integer;
    procedure Zero;
    procedure NaN;
    procedure NegativeInfinity;
    procedure PositiveInfinity;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Sqr: Extended;
    function Abs: Extended;
    function Exp: Extended;
    function Ln: Extended;
    function Log(aBase: Extended): Extended;
    function Log10: Extended;
    function Sqrt: Extended;
    function Inverse: Extended; { inverse : r := 1 / z }
    function Power(ADegree: Extended): Extended;
    function Cos: Extended; // cosine
    function Sin: Extended; // sinus
    function Tan: Extended; // tangent
    function ArcCos: Extended; // inverse cosine
    function ArcSin: Extended; // inverse sinus
    function ArcTan: Extended; // inverse tangent
    function Cosh: Extended; // hyperbolic cosine
    function Sinh: Extended; // hyperbolic sinus
    function Tanh: Extended; // hyperbolic tangent
    function ArcCosh: Extended; // inverse hyperbolic cosine
    function ArcSinh: Extended; // inverse hyperbolic sinus
    function ArcTanh: Extended; // inverse hyperbolic tangent
    function PowerOfTwo: Extended;
    function ToDB(const InPower: Boolean): Extended;
    function ToTimes(const InPower: Boolean): Extended;
    function ToRad: Extended;
    function ToDeg: Extended;
    function Pointer: PExtended;
    function ToString: string; overload;
    function ToString(const AFormatSettings: TFormatSettings): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string; overload;
    function ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string; overload;
  end;

  TIntegerHelper = record helper for Integer
    procedure Inc;
    procedure Dec;
    procedure Zero;
    function IsZero: Boolean;
    function IsNaN: Boolean;
    function IsInfinity: Boolean;
    function IsNegativeInfinity: Boolean;
    function IsPositiveInfinity: Boolean;
    function Sqr: Integer;
    function Abs: Integer;
    function Exp: Extended;
    function Ln: Extended;
    function Log(aBase: Extended): Extended;
    function Log10: Extended;
    function Sqrt: Extended;
    function Inverse: Extended; { inverse : r := 1 / z }
    function Power(ADegree: Extended): Extended;
    function Cos: Extended; // cosine
    function Sin: Extended; // sinus
    function Tan: Extended; // tangent
    function ArcCos: Extended; // inverse cosine
    function ArcSin: Extended; // inverse sinus
    function ArcTan: Extended; // inverse tangent
    function Cosh: Extended; // hyperbolic cosine
    function Sinh: Extended; // hyperbolic sinus
    function Tanh: Extended; // hyperbolic tangent
    function ArcCosh: Extended; // inverse hyperbolic cosine
    function ArcSinh: Extended; // inverse hyperbolic sinus
    function ArcTanh: Extended; // inverse hyperbolic tangent
    function Pointer: PInteger;
    function ToString: string;
  end;

function StrToFloatSafe(const AFloatStr: string): Extended;

implementation

uses
  System.Math;

const
  MinValueDB = -1E3;

function StrToFloatSafe(const AFloatStr: string): Extended;
begin
  try
    Result := StrToFloat(AFloatStr);
  except
    on EConvertError do
    begin
      Result := StrToFloat(AFloatStr.Replace(FormatSettings.DecimalSeparator, '.'));
    end;
  end;
end;

  { TSingleHelper }

function TSingleHelper.Abs: Single;
begin
  Result := System.Abs(Self);
end;

function TSingleHelper.ArcCos: Single;
begin
  Result := System.Math.ArcCos(Self);
end;

function TSingleHelper.ArcCosh: Single;
begin
  Result := System.Math.ArcCosh(Self);
end;

function TSingleHelper.ArcSin: Single;
begin
  Result := System.Math.ArcSin(Self);
end;

function TSingleHelper.ArcSinh: Single;
begin
  Result := System.Math.ArcSinh(Self);
end;

function TSingleHelper.ArcTan: Single;
begin
  Result := System.ArcTan(Self);
end;

function TSingleHelper.ArcTanh: Single;
begin
  Result := System.Math.ArcTanh(Self);
end;

function TSingleHelper.Ceil: Integer;
begin
  Result := System.Math.Ceil(Self);
end;

function TSingleHelper.Cos: Single;
begin
  Result := System.Cos(Self);
end;

function TSingleHelper.Cosh: Single;
begin
  Result := System.Math.Cosh(Self);
end;

procedure TSingleHelper.Dec;
begin
  Self := Self - 1;
end;

function TSingleHelper.Exp: Single;
begin
  Result := System.Exp(Self);
end;

function TSingleHelper.Floor: Integer;
begin
  Result := System.Math.Floor(Self);
end;

procedure TSingleHelper.Inc;
begin
  Self := Self + 1;
end;

function TSingleHelper.Inverse: Single;
begin
  Result := 1 / Self;
end;

function TSingleHelper.IsInfinity: Boolean;
begin
  Result := (Self = System.Math.Infinity) or (Self = System.Math.NegInfinity);
end;

function TSingleHelper.IsNegativeInfinity: Boolean;
begin
  Result := Self = System.Math.NegInfinity;
end;

function TSingleHelper.IsPositiveInfinity: Boolean;
begin
  Result := Self = System.Math.Infinity;
end;

function TSingleHelper.IsZero: Boolean;
begin
  Result := System.Math.IsZero(Self);
end;

function TSingleHelper.IsNaN: Boolean;
begin
  Result := System.Math.IsNaN(Self);
end;

function TSingleHelper.Ln: Single;
begin
  Result := System.Ln(Self);
end;

function TSingleHelper.Log(aBase: Single): Single;
begin
  Result := System.Math.LogN(aBase, Self);
end;

function TSingleHelper.Log10: Single;
begin
  Result := System.Math.Log10(Self);
end;

procedure TSingleHelper.NaN;
begin
  Self := System.Math.NaN;
end;

procedure TSingleHelper.NegativeInfinity;
begin
  Self := System.Math.NegInfinity;
end;

function TSingleHelper.Pointer: PSingle;
begin
  Result := @Self;
end;

procedure TSingleHelper.PositiveInfinity;
begin
  Self := System.Math.Infinity;
end;

function TSingleHelper.Power(ADegree: Single): Single;
begin
  Result := System.Math.Power(Self, ADegree);
end;

function TSingleHelper.Round: Integer;
begin
  Result := System.Round(Self);
end;

function TSingleHelper.Sin: Single;
begin
  Result := System.Sin(Self);
end;

function TSingleHelper.Sinh: Single;
begin
  Result := System.Math.Sinh(Self);
end;

function TSingleHelper.Sqr: Single;
begin
  Result := System.Sqr(Self);
end;

function TSingleHelper.Sqrt: Single;
begin
  Result := System.Sqrt(Self);
end;

function TSingleHelper.Tan: Single;
begin
  Result := System.Math.Tan(Self);
end;

function TSingleHelper.Tanh: Single;
begin
  Result := System.Math.Tanh(Self);
end;

function TSingleHelper.ToString(const AFormatSettings: TFormatSettings): string;
begin
  Result := FloatToStr(Self, AFormatSettings);
end;

function TSingleHelper.ToString: string;
begin
  Result := FloatToStr(Self);
end;

function TSingleHelper.ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string;
begin
  Result := FloatToStrF(Self, Format, Precision, Digits, AFormatSettings);
end;

function TSingleHelper.ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string;
begin
  Result := FloatToStrF(Self, Format, Precision, Digits);
end;

function TSingleHelper.Trunc: Integer;
begin
  Result := System.Trunc(Self);
end;

procedure TSingleHelper.Zero;
begin
  Self := ZeroValue;
end;

function TSingleHelper.PowerOfTwo: Single;
begin
  Result := System.Math.Log2(Self);
end;

function TSingleHelper.ToDB(const InPower: Boolean): Single;
var
  i: Integer;
begin
  i := IfThen(InPower, 10, 20);
  Result := Max(MinValueDB, i * Self.Log10);
end;

function TSingleHelper.ToTimes(const InPower: Boolean): Single;
var
  i: Integer;
begin
  i := IfThen(InPower, 10, 20);
  Result := System.Math.Power(10, Self / i);
end;

function TSingleHelper.ToRad: Single;
begin
  Result := Self * (PI / 180);
end;

function TSingleHelper.ToDeg: Single;
begin
  Result := Self * (180 / PI);
end;

{ TDoubleHelper }

function TDoubleHelper.PowerOfTwo: Double;
begin
  Result := System.Math.Log2(Self);
end;

function TDoubleHelper.ToDB(const InPower: Boolean): Double;
var
  i: Integer;
begin
  i := IfThen(InPower, 10, 20);
  Result := Max(MinValueDB, i * Self.Log10);
end;

function TDoubleHelper.ToTimes(const InPower: Boolean): Double;
var
  i: Integer;
begin
  i := IfThen(InPower, 10, 20);
  Result := System.Math.Power(10, Self / i);
end;

function TDoubleHelper.ToRad: Double;
begin
  Result := Self * (PI / 180);
end;

function TDoubleHelper.ToDeg: Double;
begin
  Result := Self * (180 / PI);
end;

function TDoubleHelper.Abs: Double;
begin
  Result := System.Abs(Self);
end;

function TDoubleHelper.ArcCos: Double;
begin
  Result := System.Math.ArcCos(Self);
end;

function TDoubleHelper.ArcCosh: Double;
begin
  Result := System.Math.ArcCosh(Self);
end;

function TDoubleHelper.ArcSin: Double;
begin
  Result := System.Math.ArcSin(Self);
end;

function TDoubleHelper.ArcSinh: Double;
begin
  Result := System.Math.ArcSinh(Self);
end;

function TDoubleHelper.ArcTan: Double;
begin
  Result := System.ArcTan(Self);
end;

function TDoubleHelper.ArcTanh: Double;
begin
  Result := System.Math.ArcTanh(Self);
end;

function TDoubleHelper.Ceil: Integer;
begin
  Result := System.Math.Ceil(Self);
end;

function TDoubleHelper.Cos: Double;
begin
  Result := System.Cos(Self);
end;

function TDoubleHelper.Cosh: Double;
begin
  Result := System.Math.Cosh(Self);
end;

procedure TDoubleHelper.Dec;
begin
  Self := Self - 1;
end;

function TDoubleHelper.Exp: Double;
begin
  Result := System.Exp(Self);
end;

function TDoubleHelper.Floor: Integer;
begin
  Result := System.Math.Floor(Self);
end;

procedure TDoubleHelper.Inc;
begin
  Self := Self + 1;
end;

function TDoubleHelper.Inverse: Double;
begin
  Result := 1 / Self;
end;

function TDoubleHelper.IsInfinity: Boolean;
begin
  Result := (Self = System.Math.Infinity) or (Self = System.Math.NegInfinity);
end;

function TDoubleHelper.IsNegativeInfinity: Boolean;
begin
  Result := Self = System.Math.NegInfinity;
end;

function TDoubleHelper.IsPositiveInfinity: Boolean;
begin
  Result := Self = System.Math.Infinity;
end;

function TDoubleHelper.IsZero: Boolean;
begin
  Result := System.Math.IsZero(Self);
end;

function TDoubleHelper.IsNaN: Boolean;
begin
  Result := System.Math.IsNaN(Self);
end;

function TDoubleHelper.Ln: Double;
begin
  Result := System.Ln(Self);
end;

function TDoubleHelper.Log(aBase: Double): Double;
begin
  Result := System.Math.LogN(aBase, Self);
end;

function TDoubleHelper.Log10: Double;
begin
  Result := System.Math.Log10(Self);
end;

procedure TDoubleHelper.NaN;
begin
  Self := System.Math.NaN;
end;

procedure TDoubleHelper.NegativeInfinity;
begin
  Self := System.Math.NegInfinity;
end;

function TDoubleHelper.Pointer: PDouble;
begin
  Result := @Self;
end;

procedure TDoubleHelper.PositiveInfinity;
begin
  Self := System.Math.Infinity;
end;

function TDoubleHelper.Power(ADegree: Double): Double;
begin
  Result := System.Math.Power(Self, ADegree);
end;

function TDoubleHelper.Round: Integer;
begin
  Result := System.Round(Self);
end;

function TDoubleHelper.Sin: Double;
begin
  Result := System.Sin(Self);
end;

function TDoubleHelper.Sinh: Double;
begin
  Result := System.Math.Sinh(Self);
end;

function TDoubleHelper.Sqr: Double;
begin
  Result := System.Sqr(Self);
end;

function TDoubleHelper.Sqrt: Double;
begin
  Result := System.Sqrt(Self);
end;

function TDoubleHelper.Tan: Double;
begin
  Result := System.Math.Tan(Self);
end;

function TDoubleHelper.Tanh: Double;
begin
  Result := System.Math.Tanh(Self);
end;

function TDoubleHelper.ToString(const AFormatSettings: TFormatSettings): string;
begin
  Result := FloatToStr(Self, AFormatSettings);
end;

function TDoubleHelper.ToString: string;
begin
  Result := FloatToStr(Self);
end;

function TDoubleHelper.ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string;
begin
  Result := FloatToStrF(Self, Format, Precision, Digits, AFormatSettings);
end;

function TDoubleHelper.ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string;
begin
  Result := FloatToStrF(Self, Format, Precision, Digits);
end;

function TDoubleHelper.Trunc: Integer;
begin
  Result := System.Trunc(Self);
end;

procedure TDoubleHelper.Zero;
begin
  Self := ZeroValue;
end;

{ TExtendedHelper }

function TExtendedHelper.PowerOfTwo: Extended;
begin
  Result := System.Math.Log2(Self);
end;

function TExtendedHelper.ToDB(const InPower: Boolean): Extended;
var
  i: Integer;
begin
  i := IfThen(InPower, 10, 20);
  Result := Max(MinValueDB, i * Self.Log10);
end;

function TExtendedHelper.ToTimes(const InPower: Boolean): Extended;
var
  i: Integer;
begin
  i := IfThen(InPower, 10, 20);
  Result := System.Math.Power(10, Self / i);
end;

function TExtendedHelper.ToRad: Extended;
begin
  Result := Self * (PI / 180);
end;

function TExtendedHelper.ToDeg: Extended;
begin
  Result := Self * (180 / PI);
end;

function TExtendedHelper.Abs: Extended;
begin
  Result := System.Abs(Self);
end;

function TExtendedHelper.ArcCos: Extended;
begin
  Result := System.Math.ArcCos(Self);
end;

function TExtendedHelper.ArcCosh: Extended;
begin
  Result := System.Math.ArcCosh(Self);
end;

function TExtendedHelper.ArcSin: Extended;
begin
  Result := System.Math.ArcSin(Self);
end;

function TExtendedHelper.ArcSinh: Extended;
begin
  Result := System.Math.ArcSinh(Self);
end;

function TExtendedHelper.ArcTan: Extended;
begin
  Result := System.ArcTan(Self);
end;

function TExtendedHelper.ArcTanh: Extended;
begin
  Result := System.Math.ArcTanh(Self);
end;

function TExtendedHelper.Ceil: Integer;
begin
  Result := System.Math.Ceil(Self);
end;

function TExtendedHelper.Cos: Extended;
begin
  Result := System.Cos(Self);
end;

function TExtendedHelper.Cosh: Extended;
begin
  Result := System.Math.Cosh(Self);
end;

procedure TExtendedHelper.Dec;
begin
  Self := Self - 1;
end;

function TExtendedHelper.Exp: Extended;
begin
  Result := System.Exp(Self);
end;

function TExtendedHelper.Floor: Integer;
begin
  Result := System.Math.Floor(Self);
end;

procedure TExtendedHelper.Inc;
begin
  Self := Self + 1;
end;

function TExtendedHelper.Inverse: Extended;
begin
  Result := 1 / Self;
end;

function TExtendedHelper.IsInfinity: Boolean;
begin
  Result := (Self = System.Math.Infinity) or (Self = System.Math.NegInfinity);
end;

function TExtendedHelper.IsNegativeInfinity: Boolean;
begin
  Result := Self = System.Math.NegInfinity;
end;

function TExtendedHelper.IsPositiveInfinity: Boolean;
begin
  Result := Self = System.Math.Infinity;
end;

function TExtendedHelper.IsZero: Boolean;
begin
  Result := System.Math.IsZero(Self);
end;

function TExtendedHelper.IsNaN: Boolean;
begin
  Result := System.Math.IsNaN(Self);
end;

function TExtendedHelper.Ln: Extended;
begin
  Result := System.Ln(Self);
end;

function TExtendedHelper.Log(aBase: Extended): Extended;
begin
  Result := System.Math.LogN(aBase, Self);
end;

function TExtendedHelper.Log10: Extended;
begin
  Result := System.Math.Log10(Self);
end;

procedure TExtendedHelper.NaN;
begin
  Self := System.Math.NaN;
end;

procedure TExtendedHelper.NegativeInfinity;
begin
  Self := System.Math.NegInfinity;
end;

function TExtendedHelper.Pointer: PExtended;
begin
  Result := @Self;
end;

procedure TExtendedHelper.PositiveInfinity;
begin
  Self := System.Math.Infinity;
end;

function TExtendedHelper.Power(ADegree: Extended): Extended;
begin
  Result := System.Math.Power(Self, ADegree);
end;

function TExtendedHelper.Round: Integer;
begin
  Result := System.Round(Self);
end;

function TExtendedHelper.Sin: Extended;
begin
  Result := System.Sin(Self);
end;

function TExtendedHelper.Sinh: Extended;
begin
  Result := System.Math.Sinh(Self);
end;

function TExtendedHelper.Sqr: Extended;
begin
  Result := System.Sqr(Self);
end;

function TExtendedHelper.Sqrt: Extended;
begin
  Result := System.Sqrt(Self);
end;

function TExtendedHelper.Tan: Extended;
begin
  Result := System.Math.Tan(Self);
end;

function TExtendedHelper.Tanh: Extended;
begin
  Result := System.Math.Tanh(Self);
end;

function TExtendedHelper.ToString(const AFormatSettings: TFormatSettings): string;
begin
  Result := FloatToStr(Self, AFormatSettings);
end;

function TExtendedHelper.ToString: string;
begin
  Result := FloatToStr(Self);
end;

function TExtendedHelper.ToString(const Format: TFloatFormat; const Precision, Digits: Integer; const AFormatSettings: TFormatSettings): string;
begin
  Result := FloatToStrF(Self, Format, Precision, Digits, AFormatSettings);
end;

function TExtendedHelper.ToString(const Format: TFloatFormat; const Precision, Digits: Integer): string;
begin
  Result := FloatToStrF(Self, Format, Precision, Digits);
end;

function TExtendedHelper.Trunc: Integer;
begin
  Result := System.Trunc(Self);
end;

procedure TExtendedHelper.Zero;
begin
  Self := ZeroValue;
end;

{ TIntegerHelper }

function TIntegerHelper.Abs: Integer;
begin
  Result := System.Abs(Self);
end;

function TIntegerHelper.ArcCos: Extended;
begin
  Result := System.Math.ArcCos(Self);
end;

function TIntegerHelper.ArcCosh: Extended;
begin
  Result := System.Math.ArcCosh(Self);
end;

function TIntegerHelper.ArcSin: Extended;
begin
  Result := System.Math.ArcSin(Self);
end;

function TIntegerHelper.ArcSinh: Extended;
begin
  Result := System.Math.ArcSinh(Self);
end;

function TIntegerHelper.ArcTan: Extended;
begin
  Result := System.ArcTan(Self);
end;

function TIntegerHelper.ArcTanh: Extended;
begin
  Result := System.Math.ArcTanh(Self);
end;

function TIntegerHelper.Cos: Extended;
begin
  Result := System.Cos(Self);
end;

function TIntegerHelper.Cosh: Extended;
begin
  Result := System.Math.Cosh(Self);
end;

procedure TIntegerHelper.Dec;
begin
  System.Dec(Self);
end;

function TIntegerHelper.Exp: Extended;
begin
  Result := System.Exp(Self);
end;

procedure TIntegerHelper.Inc;
begin
  System.Inc(Self);
end;

function TIntegerHelper.Inverse: Extended;
begin
  Result := 1 / Self;
end;

function TIntegerHelper.IsInfinity: Boolean;
begin
  Result := (Self = System.Math.Infinity) or (Self = System.Math.NegInfinity);
end;

function TIntegerHelper.IsNegativeInfinity: Boolean;
begin
  Result := Self = System.Math.NegInfinity;
end;

function TIntegerHelper.IsPositiveInfinity: Boolean;
begin
  Result := Self = System.Math.Infinity;
end;

function TIntegerHelper.IsZero: Boolean;
begin
  Result := System.Math.IsZero(Self);
end;

function TIntegerHelper.IsNaN: Boolean;
begin
  Result := System.Math.IsNaN(Self);
end;

function TIntegerHelper.Ln: Extended;
begin
  Result := System.Ln(Self);
end;

function TIntegerHelper.Log(aBase: Extended): Extended;
begin
  Result := System.Math.LogN(aBase, Self);
end;

function TIntegerHelper.Log10: Extended;
begin
  Result := System.Math.Log10(Self);
end;

function TIntegerHelper.Pointer: PInteger;
begin
  Result := @Self;
end;

function TIntegerHelper.Power(ADegree: Extended): Extended;
begin
  Result := System.Math.Power(Self, ADegree);
end;

function TIntegerHelper.Sin: Extended;
begin
  Result := System.Sin(Self);
end;

function TIntegerHelper.Sinh: Extended;
begin
  Result := System.Math.Sinh(Self);
end;

function TIntegerHelper.Sqr: Integer;
begin
  Result := System.Sqr(Self);
end;

function TIntegerHelper.Sqrt: Extended;
begin
  Result := System.Sqrt(Self);
end;

function TIntegerHelper.Tan: Extended;
begin
  Result := System.Math.Tan(Self);
end;

function TIntegerHelper.Tanh: Extended;
begin
  Result := System.Math.Tanh(Self);
end;

function TIntegerHelper.ToString: string;
begin
  Result := IntToStr(Self);
end;

procedure TIntegerHelper.Zero;
begin
  Self := ZeroValue;
end;

end.

