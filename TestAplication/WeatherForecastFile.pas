unit WeatherForecastFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.JSON, IWeatherForecast, WeatherServiceFile;

type
  TfrmWeatherForecast = class(TForm)
    EditCity: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    GetWeatherButton: TButton;
    MemoWeatherInfo: TMemo;
    ImageWeatherIcon: TImage;
    Panel3: TPanel;
    procedure GetWeatherButtonClick(Sender: TObject);
  private
    { Private declarations }
    FWeatherService: IWeatherService;
    procedure DisplayWeatherData(const WeatherData: TJSONObject);
    procedure DisplayWeatherIcon(const IconCode: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmWeatherForecast: TfrmWeatherForecast;

implementation

{$R *.dfm}

constructor TfrmWeatherForecast.Create(AOwner: TComponent);
begin
  inherited;
  FWeatherService := TWeatherService.Create('Your_API_Key'); // Инициализация сервиса погоды
end;

destructor TfrmWeatherForecast.Destroy;
begin
  FWeatherService := nil; // Освобождение интерфейса сервиса погоды
  inherited;
end;

procedure TfrmWeatherForecast.GetWeatherButtonClick(Sender: TObject);
var
  WeatherData: TJSONObject;
begin
  WeatherData := FWeatherService.GetWeatherData(EditCity.Text);
  if Assigned(WeatherData) then
  begin
    DisplayWeatherData(WeatherData); // Вызов метода для отображения данных о погоде
    DisplayWeatherIcon(WeatherData.GetValue<TJSONObject>('weather').GetValue<string>('icon')); // Вызов метода для отображения иконки погоды
  end
  else
    MemoWeatherInfo.Lines.Add('Error: Unable to retrieve weather data.');
end;

procedure TfrmWeatherForecast.DisplayWeatherData(const WeatherData: TJSONObject);
var
  MainData: TJSONObject;
  SysData: TJSONObject;
  TempKelvin, TempCelsius: Double;
begin
  MainData := WeatherData.GetValue<TJSONObject>('main');
  SysData := WeatherData.GetValue<TJSONObject>('sys');

  TempKelvin := MainData.GetValue<Double>('temp');
  TempCelsius := TempKelvin - 273.15;

  MemoWeatherInfo.Lines.Clear;
  MemoWeatherInfo.Lines.Add(Format('City: %s', [WeatherData.GetValue<string>('name')]));
  MemoWeatherInfo.Lines.Add(Format('Country: %s', [SysData.GetValue<string>('country')]));
  MemoWeatherInfo.Lines.Add(Format('Temperature: %.2f °C', [TempCelsius]));
  MemoWeatherInfo.Lines.Add(Format('Humidity: %d %%', [MainData.GetValue<Integer>('humidity')]));
  MemoWeatherInfo.Lines.Add(Format('Pressure: %d hPa', [MainData.GetValue<Integer>('pressure')]));
end;

procedure TfrmWeatherForecast.DisplayWeatherIcon(const IconCode: string);
var
  IconStream: TMemoryStream;
begin
  IconStream := FWeatherService.GetWeatherIcon(IconCode);
  try
    ImageWeatherIcon.Picture.Bitmap.LoadFromStream(IconStream);
  finally
    IconStream.Free;
  end;
end;

end.
