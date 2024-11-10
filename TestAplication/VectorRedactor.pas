unit VectorRedactor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ComCtrls, System.Types, AShape;

type
  TfrmVectorRedactor = class(TForm)
    PaintBox1: TPaintBox;
    CloseButton: TButton;
    ShapeChooser: TComboBox;
    ColorBox: TColorBox;
    LineWidthTrackBar: TTrackBar;
    Header: TPanel;
    procedure OnCloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FDrawing: Boolean;
    FStartPoint: TPoint;
    FCurrentShape: TShape;
    FShapes: TList;
    procedure DrawShape(const StartPoint, EndPoint: TPoint);
    procedure AddShape(Shape: TShape);
    procedure RedrawShapes;
  public
    { Public declarations }
  end;

var
  frmVectorRedactor: TfrmVectorRedactor;

implementation

{$R *.dfm}

procedure TfrmVectorRedactor.FormCreate(Sender: TObject);
begin
  FDrawing := False;
  FShapes := TList.Create;
  ShapeChooser.Items.Add('Line');
  ShapeChooser.Items.Add('Circle');
  ShapeChooser.Items.Add('Square');
  ShapeChooser.ItemIndex := 0;
  ColorBox.Selected := clBlack;
  LineWidthTrackBar.Position := 1;
end;

procedure TfrmVectorRedactor.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FDrawing := True;
    FStartPoint := Point(X, Y);
  end;
end;

procedure TfrmVectorRedactor.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FDrawing then
  begin
    PaintBox1.Canvas.Pen.Mode := pmNotXor;
    if Assigned(FCurrentShape) then
      FCurrentShape.Draw(PaintBox1.Canvas);

    if ShapeChooser.Text = 'Line' then
      FCurrentShape := TLine.Create(FStartPoint, Point(X, Y), 'Line', ColorBox.Selected, LineWidthTrackBar.Position)
    else if ShapeChooser.Text = 'Circle' then
      FCurrentShape := TCircle.Create(FStartPoint, Point(X, Y), 'Circle', ColorBox.Selected, LineWidthTrackBar.Position)
    else if ShapeChooser.Text = 'Square' then
      FCurrentShape := TSquare.Create(FStartPoint, Point(X, Y), 'Square', ColorBox.Selected, LineWidthTrackBar.Position);

    if Assigned(FCurrentShape) then
      FCurrentShape.Draw(PaintBox1.Canvas);
  end;
end;

procedure TfrmVectorRedactor.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FDrawing then
  begin
    FDrawing := False;
    DrawShape(FStartPoint, Point(X, Y));
    FreeAndNil(FCurrentShape);
    RedrawShapes;
  end;
end;

procedure TfrmVectorRedactor.DrawShape(const StartPoint, EndPoint: TPoint);
var
  Shape: TShape;
begin
  if ShapeChooser.Text = 'Line' then
    Shape := TLine.Create(StartPoint, EndPoint, 'Line', ColorBox.Selected, LineWidthTrackBar.Position)
  else if ShapeChooser.Text = 'Circle' then
    Shape := TCircle.Create(StartPoint, EndPoint, 'Circle', ColorBox.Selected, LineWidthTrackBar.Position)
  else if ShapeChooser.Text = 'Square' then
    Shape := TSquare.Create(StartPoint, EndPoint, 'Square', ColorBox.Selected, LineWidthTrackBar.Position)
  else
    Exit;

  AddShape(Shape);
end;

procedure TfrmVectorRedactor.AddShape(Shape: TShape);
begin
  FShapes.Add(Shape);
end;

procedure TfrmVectorRedactor.RedrawShapes;
var
  Shape: TShape;
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(PaintBox1.ClientRect);
  for Shape in FShapes do
    Shape.Draw(PaintBox1.Canvas);
end;

procedure TfrmVectorRedactor.OnCloseButtonClick(Sender: TObject);
begin
  Self.Close;
end;

end.
