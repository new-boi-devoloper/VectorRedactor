object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Application'
  ClientHeight = 256
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 30
  object Header: TPanel
    Left = 0
    Top = 0
    Width = 256
    Height = 256
    Align = alClient
    Caption = ' '
    TabOrder = 0
    ExplicitWidth = 254
    ExplicitHeight = 248
    object CalculatorButton: TButton
      Left = 32
      Top = 14
      Width = 186
      Height = 39
      Caption = 'Calculator'
      TabOrder = 0
      OnClick = CalculatorButtonClick
    end
    object Panel1: TPanel
      Left = 1
      Top = 200
      Width = 254
      Height = 55
      Align = alBottom
      Caption = 'Panel1'
      Color = clMaroon
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 192
      ExplicitWidth = 252
      object VectorRedactor: TButton
        Left = 31
        Top = 10
        Width = 185
        Height = 39
        Caption = 'VectorRedactor'
        TabOrder = 0
        OnClick = VectorRedactorClick
      end
    end
    object WeatherForecastButton: TButton
      Left = 31
      Top = 59
      Width = 186
      Height = 39
      Caption = 'Weather Forecast'
      TabOrder = 2
      OnClick = WeatherForecastButtonClick
    end
  end
end
