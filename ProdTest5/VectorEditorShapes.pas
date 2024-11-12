unit VectorEditorShapes;

interface

uses
  System.Types, System.UITypes, Vcl.Graphics, VectorEditorInterface, Math;

type
  AShape = class abstract(TInterfacedObject)
  protected
    FColor: TColor;
    FLineWidth: double;
  public
    procedure Draw(Canvas: TCanvas); virtual; abstract;
    procedure SetColor(c: TColor);
    procedure SetLineWidth(lw: double);
    function ContainsPoint(X, Y: Integer): Boolean; virtual; abstract;
    property Color: TColor read FColor;
    property LineWidth: double read FLineWidth;
  end;

  TLine = class(AShape)
  private
    FPoints: array of T2DPoint;
  public
    procedure Draw(Canvas: TCanvas); override;
    procedure AddPoint(p: T2DPoint);
    function ContainsPoint(X, Y: Integer): Boolean; override;
  end;

  TCircle = class(AShape)
  private
    FCenter: T2DPoint;
    FRadius: double;
  public
    procedure Draw(Canvas: TCanvas); override;
    constructor Create(Center: T2DPoint; Radius: double);
    function ContainsPoint(X, Y: Integer): Boolean; override;
    property Center: T2DPoint read FCenter;
    property Radius: double read FRadius write FRadius;
  end;

  TSquare = class(AShape)
  private
    FCenter: T2DPoint;
    FSize: double;
  public
    procedure Draw(Canvas: TCanvas); override;
    constructor Create(Center: T2DPoint; Size: double);
    function ContainsPoint(X, Y: Integer): Boolean; override;
    property Center: T2DPoint read FCenter;
    property Size: double read FSize write FSize;
  end;

implementation

{ AShape }

procedure AShape.SetColor(c: TColor);
begin
  FColor := c;
end;

procedure AShape.SetLineWidth(lw: double);
begin
  FLineWidth := lw;
end;

{ TLine }

procedure TLine.AddPoint(p: T2DPoint);
begin
  SetLength(FPoints, Length(FPoints) + 1);
  FPoints[High(FPoints)] := p;
end;

procedure TLine.Draw(Canvas: TCanvas);
var
  i: Integer;
begin
  Canvas.Pen.Color := FColor;
  Canvas.Pen.Width := Round(FLineWidth);
  Canvas.MoveTo(Round(FPoints[0].X), Round(FPoints[0].Y));
  for i := 1 to High(FPoints) do
    Canvas.LineTo(Round(FPoints[i].X), Round(FPoints[i].Y));
end;

function TLine.ContainsPoint(X, Y: Integer): Boolean;
begin
  // ѕроста€ проверка дл€ линии (например, по координатам начала и конца)
  Result := (X >= FPoints[0].X) and (X <= FPoints[1].X) and (Y >= FPoints[0].Y) and (Y <= FPoints[1].Y);
end;

{ TCircle }

constructor TCircle.Create(Center: T2DPoint; Radius: double);
begin
  FCenter := Center;
  FRadius := Radius;
end;

procedure TCircle.Draw(Canvas: TCanvas);
begin
  Canvas.Pen.Color := FColor;
  Canvas.Pen.Width := Round(FLineWidth);
  Canvas.Ellipse(Round(FCenter.X - FRadius), Round(FCenter.Y - FRadius), Round(FCenter.X + FRadius), Round(FCenter.Y + FRadius));
end;

function TCircle.ContainsPoint(X, Y: Integer): Boolean;
begin
  // ѕроверка, находитс€ ли точка внутри круга
  Result := Sqrt(Sqr(X - FCenter.X) + Sqr(Y - FCenter.Y)) <= FRadius;
end;

{ TSquare }

constructor TSquare.Create(Center: T2DPoint; Size: double);
begin
  FCenter := Center;
  FSize := Size;
end;

procedure TSquare.Draw(Canvas: TCanvas);
begin
  Canvas.Pen.Color := FColor;
  Canvas.Pen.Width := Round(FLineWidth);
  Canvas.Rectangle(Round(FCenter.X - FSize / 2), Round(FCenter.Y - FSize / 2), Round(FCenter.X + FSize / 2), Round(FCenter.Y + FSize / 2));
end;

function TSquare.ContainsPoint(X, Y: Integer): Boolean;
begin
  // ѕроверка, находитс€ ли точка внутри квадрата
  Result := (X >= FCenter.X - FSize / 2) and (X <= FCenter.X + FSize / 2) and
            (Y >= FCenter.Y - FSize / 2) and (Y <= FCenter.Y + FSize / 2);
end;

end.
