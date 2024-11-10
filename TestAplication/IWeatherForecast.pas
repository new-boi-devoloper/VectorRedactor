unit IWeatherForecast;

interface

uses
  System.Classes, System.JSON;

type
  IWeatherService = interface
    function GetWeatherData(const City: string): TJSONObject;
    function GetWeatherIcon(const IconCode: string): TMemoryStream;
  end;

implementation

end.
