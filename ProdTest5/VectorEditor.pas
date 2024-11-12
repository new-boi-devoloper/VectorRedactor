unit VectorEditor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  VectorEditorInterface, VectorEditorShapes, VectorEditorCanvasAdapter,
  Vcl.StdCtrls, Vcl.ComCtrls, Math;

type
  TfrmVectorEditor = class(TForm)
    ShapeChooser: TComboBox;
    LineWidth: TTrackBar;
    ColorChooser: TColorBox;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ColorChooserChange(Sender: TObject);
    procedure LineWidthChange(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FShapes: TList<AShape>;
    FCanvasAdapter: ICanvas;
    FCurrentShape: AShape;
    FZoomFactor: Double;
    FSelectedShape: AShape;
    procedure AddShape(Shape: AShape);
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmVectorEditor: TfrmVectorEditor;

implementation

{$R *.dfm}

{ TfrmVectorEditor }

constructor TfrmVectorEditor.Create(AOwner: TComponent);
begin
  inherited;
  FShapes := TList<AShape>.Create;
  FCanvasAdapter := TCanvasAdapter.Create(Canvas);
  FZoomFactor := 1.0;
  OnMouseWheel := FormMouseWheel; // Назначаем обработчик события
end;

destructor TfrmVectorEditor.Destroy;
begin
  FShapes.Free;
  inherited;
end;

procedure TfrmVectorEditor.FormCreate(Sender: TObject);
begin
  ShapeChooser.Items.Add('Line');
  ShapeChooser.Items.Add('Circle');
  ShapeChooser.Items.Add('Square');
  ShapeChooser.ItemIndex := 0;
end;

procedure TfrmVectorEditor.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ShapeType: string;
  CorrectedX, CorrectedY: Integer;
  i: Integer;
begin
  // Корректируем координаты мыши с учетом зума
  CorrectedX := Round(X / FZoomFactor);
  CorrectedY := Round(Y / FZoomFactor);

  if Button = TMouseButton.mbRight then
  begin
    // Выбор фигуры
    FSelectedShape := nil;
    for i := FShapes.Count - 1 downto 0 do
    begin
      if FShapes[i].ContainsPoint(CorrectedX, CorrectedY) then
      begin
        FSelectedShape := FShapes[i];
        Break;
      end;
    end;
    if FSelectedShape <> nil then
    begin
      ColorChooser.Selected := FSelectedShape.Color;
      LineWidth.Position := Round(FSelectedShape.LineWidth);
    end;
  end
  else
  begin
    ShapeType := ShapeChooser.Items[ShapeChooser.ItemIndex];

    if ShapeType = 'Line' then
    begin
      FCurrentShape := TLine.Create;
      TLine(FCurrentShape).AddPoint(T2DPoint.Create(CorrectedX, CorrectedY));
    end
    else if ShapeType = 'Circle' then
    begin
      FCurrentShape := TCircle.Create(T2DPoint.Create(CorrectedX, CorrectedY), 0);
    end
    else if ShapeType = 'Square' then
    begin
      FCurrentShape := TSquare.Create(T2DPoint.Create(CorrectedX, CorrectedY), 0);
    end;

    if FCurrentShape <> nil then
    begin
      FCurrentShape.SetColor(ColorChooser.Selected);
      FCurrentShape.SetLineWidth(LineWidth.Position);
    end;
  end;
end;

procedure TfrmVectorEditor.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  CorrectedX, CorrectedY: Integer;
begin
  if FCurrentShape <> nil then
  begin
    // Корректируем координаты мыши с учетом зума
    CorrectedX := Round(X / FZoomFactor);
    CorrectedY := Round(Y / FZoomFactor);

    if FCurrentShape is TLine then
    begin
      TLine(FCurrentShape).AddPoint(T2DPoint.Create(CorrectedX, CorrectedY));
    end
    else if FCurrentShape is TCircle then
    begin
      TCircle(FCurrentShape).Radius := Sqrt(Sqr(CorrectedX - TCircle(FCurrentShape).Center.X) + Sqr(CorrectedY - TCircle(FCurrentShape).Center.Y));
    end
    else if FCurrentShape is TSquare then
    begin
      TSquare(FCurrentShape).Size := Max(Abs(CorrectedX - TSquare(FCurrentShape).Center.X), Abs(CorrectedY - TSquare(FCurrentShape).Center.Y)) * 2;
    end;

    Repaint;
  end;
end;

procedure TfrmVectorEditor.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FCurrentShape <> nil then
  begin
    AddShape(FCurrentShape);
    FCurrentShape := nil;
  end;
end;

procedure TfrmVectorEditor.AddShape(Shape: AShape);
begin
  FShapes.Add(Shape);
  Repaint;
end;

procedure TfrmVectorEditor.Paint;
var
  Shape: AShape;
  TempBitmap: TBitmap;
  ScaleX, ScaleY: Double;
  VirtualWidth, VirtualHeight: Integer;
begin
  inherited; // Вызываем родительский метод Paint

  // Определяем размер виртуального канваса с учетом зума
  VirtualWidth := Round(ClientWidth / FZoomFactor);
  VirtualHeight := Round(ClientHeight / FZoomFactor);

  // Создаем временный битмап
  TempBitmap := TBitmap.Create;
  try
    TempBitmap.SetSize(VirtualWidth, VirtualHeight);
    TempBitmap.Canvas.Brush.Color := clWhite;
    TempBitmap.Canvas.FillRect(Rect(0, 0, VirtualWidth, VirtualHeight));

    // Рисуем фигуры на временном битмапе
    for Shape in FShapes do
      Shape.Draw(TempBitmap.Canvas);

    // Рисуем текущую фигуру
    if FCurrentShape <> nil then
      FCurrentShape.Draw(TempBitmap.Canvas);

    // Масштабируем и рисуем битмап на форме
    ScaleX := FZoomFactor;
    ScaleY := FZoomFactor;
    Canvas.StretchDraw(Rect(0, 0, ClientWidth, ClientHeight), TempBitmap);
  finally
    TempBitmap.Free;
  end;
end;

procedure TfrmVectorEditor.FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta > 0 then
    FZoomFactor := FZoomFactor * 1.1
  else
    FZoomFactor := FZoomFactor / 1.1;

  Repaint;
  Handled := True;
end;

procedure TfrmVectorEditor.ColorChooserChange(Sender: TObject);
begin
  if FSelectedShape <> nil then
  begin
    FSelectedShape.SetColor(ColorChooser.Selected);
    Repaint;
  end;
end;

procedure TfrmVectorEditor.LineWidthChange(Sender: TObject);
begin
  if FSelectedShape <> nil then
  begin
    FSelectedShape.SetLineWidth(LineWidth.Position);
    Repaint;
  end;
end;

end.
