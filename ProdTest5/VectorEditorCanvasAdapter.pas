unit VectorEditorCanvasAdapter;

interface

uses
  System.Types, System.UITypes, Vcl.Graphics, VectorEditorInterface;

type
  TCanvasAdapter = class(TInterfacedObject, ICanvas)
  private
    FCanvas: TCanvas;
    FCurrentColor: TColor;
    FCurrentLineWidth: double;
    FDrawMode: TDrawMode;
    FPoints: array of T2DPoint;
  public
    constructor Create(Canvas: TCanvas);
    procedure SetCurrentColor(c: TColor);
    procedure SetCurrentLineWidth(const lw: double);
    procedure glBegin(dm: TDrawMode);
    procedure glVertex(x, y: double);
    procedure glEnd;
  end;

implementation

{ TCanvasAdapter }

constructor TCanvasAdapter.Create(Canvas: TCanvas);
begin
  FCanvas := Canvas;
end;

procedure TCanvasAdapter.SetCurrentColor(c: TColor);
begin
  FCurrentColor := c;
end;

procedure TCanvasAdapter.SetCurrentLineWidth(const lw: double);
begin
  FCurrentLineWidth := lw;
end;

procedure TCanvasAdapter.glBegin(dm: TDrawMode);
begin
  FDrawMode := dm;
  SetLength(FPoints, 0);
end;

procedure TCanvasAdapter.glVertex(x, y: double);
begin
  SetLength(FPoints, Length(FPoints) + 1);
  FPoints[High(FPoints)].X := x;
  FPoints[High(FPoints)].Y := y;
end;

procedure TCanvasAdapter.glEnd;
var
  i: Integer;
begin
  FCanvas.Pen.Color := FCurrentColor;
  FCanvas.Pen.Width := Round(FCurrentLineWidth);
  FCanvas.MoveTo(Round(FPoints[0].X), Round(FPoints[0].Y));
  for i := 1 to High(FPoints) do
    FCanvas.LineTo(Round(FPoints[i].X), Round(FPoints[i].Y));
end;

end.
