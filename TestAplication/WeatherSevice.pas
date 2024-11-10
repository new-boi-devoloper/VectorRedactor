unit WeatherSevice;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Net.HttpClient, IWeatherForecast;

type
  TWeatherService = class(TInterfacedObject, IWeatherService)
  private
    FAPIKey: string;
    FHttpClient: THTTPClient;
  public
    constructor Create(const APIKey: string);
    destructor Destroy; override;
    function GetWeatherData(const City: string): TJSONObject;
    function GetWeatherIcon(const IconCode: string): TMemoryStream;
  end;

implementation

constructor TWeatherService.Create(const APIKey: string);
begin
  FAPIKey := APIKey;
  FHttpClient := THTTPClient.Create;
end;

destructor TWeatherService.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

function TWeatherService.GetWeatherData(const City: string): TJSONObject;
var
  URL: string;
  Response: IHTTPResponse;
  JSONValue: TJSONValue;
begin
  URL := Format('https://api.openweathermap.org/data/2.5/weather?q=%s&appid=%s', [City, FAPIKey]);
  Response := FHttpClient.Get(URL);
  JSONValue := TJSONObject.ParseJSONValue(Response.ContentAsString);
  if JSONValue is TJSONObject then
    Result := TJSONObject(JSONValue)
  else
    Result := nil;
end;

function TWeatherService.GetWeatherIcon(const IconCode: string): TMemoryStream;
var
  URL: string;
  Response: IHTTPResponse;
begin
  URL := Format('http://openweathermap.org/img/wn/%s@2x.png', [IconCode]);
  Result := TMemoryStream.Create;
  Response := FHttpClient.Get(URL, Result);
  Result.Position := 0;
end;

end.

