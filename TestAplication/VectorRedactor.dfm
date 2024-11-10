object frmVectorRedactor: TfrmVectorRedactor
  Left = 0
  Top = 0
  Caption = 'frmVectorRedactor'
  ClientHeight = 720
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnMouseDown = PaintBoxMouseDown
  OnMouseMove = PaintBoxMouseMove
  OnMouseUp = PaintBoxMouseUp
  TextHeight = 15
  object PaintBox1: TPaintBox
    Left = 8
    Top = 80
    Width = 697
    Height = 632
    OnMouseDown = PaintBoxMouseDown
    OnMouseMove = PaintBoxMouseMove
    OnMouseUp = PaintBoxMouseUp
  end
  object CloseButton: TButton
    Left = 8
    Top = 8
    Width = 49
    Height = 48
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = OnCloseButtonClick
  end
  object Header: TPanel
    Left = 88
    Top = 8
    Width = 617
    Height = 66
    Caption = 'Header'
    TabOrder = 1
    object ColorBox: TColorBox
      Left = 220
      Top = 10
      Width = 153
      Height = 38
      ItemHeight = 32
      TabOrder = 0
    end
    object ShapeChooser: TComboBox
      Left = 8
      Top = 10
      Width = 177
      Height = 38
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'ShapeChooser'
    end
    object LineWidthTrackBar: TTrackBar
      Left = 411
      Top = 10
      Width = 150
      Height = 38
      TabOrder = 2
    end
  end
end
