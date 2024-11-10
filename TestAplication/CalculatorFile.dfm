object CalculatorForm: TCalculatorForm
  Left = 0
  Top = 0
  Caption = 'CalculatorForm'
  ClientHeight = 360
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 15
    Top = 49
    Width = 320
    Height = 80
    TabOrder = 0
    object Result: TLabel
      Left = 230
      Top = 17
      Width = 56
      Height = 38
      Alignment = taCenter
      BiDiMode = bdLeftToRight
      Caption = 'Result'
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
    end
    object InputField1: TEdit
      Left = 15
      Top = 17
      Width = 90
      Height = 38
      Alignment = taCenter
      BiDiMode = bdRightToLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      Text = 'InputField1'
    end
    object InputField2: TEdit
      Left = 111
      Top = 17
      Width = 81
      Height = 38
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'InputField2'
    end
  end
  object Panel2: TPanel
    Left = 15
    Top = 135
    Width = 320
    Height = 217
    Caption = ' '
    TabOrder = 1
    object PlusButton: TButton
      Left = 15
      Top = 12
      Width = 138
      Height = 90
      Caption = 'PlusButton'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = OnPlusButtonClick
    end
    object MinusButton: TButton
      Left = 15
      Top = 108
      Width = 138
      Height = 90
      Caption = 'MinusButton'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = OnMinusButtonClick
    end
    object MultiplyButton: TButton
      Left = 167
      Top = 12
      Width = 138
      Height = 90
      Caption = 'MultiplyButton'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = OnMultiplyButtonClick
    end
    object DivideButton: TButton
      Left = 167
      Top = 108
      Width = 138
      Height = 90
      Caption = 'DivideButton'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = OnDivideButtonClick
    end
  end
  object CloseCalculator: TButton
    Left = 8
    Top = 8
    Width = 41
    Height = 35
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = OnCloseCalculatorButton
  end
end
