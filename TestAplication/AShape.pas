unit AShape;

interface

uses
  Vcl.Graphics, System.Types;

type
  TShape = class
  protected
    FStartPoint, FEndPoint: TPoint;
    FShapeType: string;
    FColor: TColor;
    FLineWidth: Integer;
  public
    constructor Create(const StartPoint, EndPoint: TPoint; const ShapeType: string; const Color: TColor; const LineWidth: Integer);
    procedure Draw(Canvas: TCanvas); virtual; abstract;
  end;

  TLine = class(TShape)
  public
    procedure Draw(Canvas: TCanvas); override;
  end;

  TCircle = class(TShape)
  public
    procedure Draw(Canvas: TCanvas); override;
  end;

  TSquare = class(TShape)
  public
    procedure Draw(Canvas: TCanvas); override;
  end;

implementation

constructor TShape.Create(const StartPoint, EndPoint: TPoint; const ShapeType: string; const Color: TColor; const LineWidth: Integer);
begin
  FStartPoint := StartPoint;
  FEndPoint := EndPoint;
  FShapeType := ShapeType;
  FColor := Color;
  FLineWidth := LineWidth;
end;

procedure TLine.Draw(Canvas: TCanvas);
begin
  Canvas.Pen.Color := FColor;
  Canvas.Pen.Width := FLineWidth;
  Canvas.MoveTo(FStartPoint.X, FStartPoint.Y);
  Canvas.LineTo(FEndPoint.X, FEndPoint.Y);
end;

procedure TCircle.Draw(Canvas: TCanvas);
begin
  Canvas.Pen.Color := FColor;
  Canvas.Pen.Width := FLineWidth;
  Canvas.Ellipse(FStartPoint.X, FStartPoint.Y, FEndPoint.X, FEndPoint.Y);
end;

procedure TSquare.Draw(Canvas: TCanvas);
begin
  Canvas.Pen.Color := FColor;
  Canvas.Pen.Width := FLineWidth;
  Canvas.Rectangle(FStartPoint.X, FStartPoint.Y, FEndPoint.X, FEndPoint.Y);
end;

end.
