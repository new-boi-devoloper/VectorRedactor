unit VectorEditorInterface;

interface

uses
  System.Types, System.UITypes, Vcl.Graphics;

type
  TDrawMode = (dmLineStrip);

  ICanvas = interface
  ['{68BC3419-E3D9-4704-B6EA-A6B8EB970104}']
    procedure SetCurrentColor(c: TColor);
    procedure SetCurrentLineWidth(const lw: double);
    procedure glBegin(dm: TDrawMode);
    procedure glVertex(x, y: double);
    procedure glEnd;
  end;

  T2DPoint = record
    X, Y: double;
    class operator Initialize(out Dest: T2DPoint);
    class operator Finalize(var Dest: T2DPoint);
    constructor Create(AX, AY: double);
  end;

implementation

{ T2DPoint }

class operator T2DPoint.Initialize(out Dest: T2DPoint);
begin
  Dest.X := 0;
  Dest.Y := 0;
end;

class operator T2DPoint.Finalize(var Dest: T2DPoint);
begin
end;

constructor T2DPoint.Create(AX, AY: double);
begin
  X := AX;
  Y := AY;
end;

end.
