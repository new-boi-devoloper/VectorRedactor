program ProdTry2;

uses
  Vcl.Forms,
  MainFile in 'MainFile.pas' {MainForm},
  CalculatorFile in 'CalculatorFile.pas' {CalculatorForm},
  VectorRedactor in 'VectorRedactor.pas' {frmVectorRedactor},
  AShape in 'AShape.pas',
  IWeatherForecast in 'IWeatherForecast.pas',
  WeatherSevice in 'WeatherSevice.pas',
  WeatherForecastFile in 'WeatherForecastFile.pas' {frmWeatherForecast};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCalculatorForm, CalculatorForm);
  Application.CreateForm(TfrmVectorRedactor, frmVectorRedactor);
  Application.CreateForm(TfrmWeatherForecast, frmWeatherForecast);
  Application.Run;
end.
