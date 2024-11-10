object frmWeatherForecast: TfrmWeatherForecast
  Left = 0
  Top = 0
  Caption = 'Weather'
  ClientHeight = 512
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 57
    Align = alTop
    Caption = ' '
    Color = clDarkgreen
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 624
    object EditCity: TEdit
      Left = 192
      Top = 6
      Width = 129
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'EditCity'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 456
    Width = 512
    Height = 56
    Align = alBottom
    Color = clDarkgreen
    ParentBackground = False
    TabOrder = 1
    object GetWeatherButton: TButton
      Left = 200
      Top = 8
      Width = 121
      Height = 41
      Caption = 'GetWeather'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = GetWeatherButtonClick
    end
  end
  object MemoWeatherInfo: TMemo
    Left = 0
    Top = 63
    Width = 217
    Height = 226
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'MemoWeatherInfo')
    ParentFont = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 8
    Top = 295
    Width = 504
    Height = 163
    Caption = 'Panel3'
    Color = clDarkseagreen
    ParentBackground = False
    TabOrder = 3
    object ImageWeatherIcon: TImage
      Left = 176
      Top = 5
      Width = 150
      Height = 150
    end
  end
end
