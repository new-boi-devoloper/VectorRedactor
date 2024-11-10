unit MainFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, CalculatorFile, VectorRedactor, WeatherForecastFile;

type
  TMainForm = class(TForm)
    Header: TPanel;
    CalculatorButton: TButton;
    VectorRedactor: TButton;
    Panel1: TPanel;
    WeatherForecastButton: TButton;
    procedure CalculatorButtonClick(Sender: TObject);
    procedure VectorRedactorClick(Sender: TObject);
    procedure WeatherForecastButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure DebugLog(const Msg: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.CalculatorButtonClick(Sender: TObject);
begin
  DebugLog('CalculatorButton clicked');
  var CalculatorForm := TCalculatorForm.Create(Self);
  try
    CalculatorForm.ShowModal;
  finally
    CalculatorForm.Free;
  end;
  DebugLog('CalculatorForm closed');
end;

procedure TMainForm.VectorRedactorClick(Sender: TObject);
begin
  var VectorRedactor := TfrmVectorRedactor.Create(Self);
  try
    VectorRedactor.ShowModal;
  finally
    VectorRedactor.Free;
  end;
end;

procedure TMainForm.WeatherForecastButtonClick(Sender: TObject);
begin
  var WeatherService := TfrmWeatherForecast.Create(Self);
  try
    WeatherService.ShowModal;
  finally
     WeatherService.Free;
  end;
end;

procedure TMainForm.DebugLog(const Msg: string);
begin
  OutputDebugString(PChar(Msg));
end;



end.
