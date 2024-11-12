object frmVectorEditor: TfrmVectorEditor
  Left = 0
  Top = 0
  Caption = 'frmVectorEditor'
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
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  TextHeight = 15
  object ShapeChooser: TComboBox
    Left = 24
    Top = 16
    Width = 145
    Height = 23
    TabOrder = 0
    Text = 'ShapeChooser'
  end
  object LineWidth: TTrackBar
    Left = 392
    Top = 16
    Width = 150
    Height = 45
    TabOrder = 1
    OnChange = LineWidthChange
  end
  object ColorChooser: TColorBox
    Left = 208
    Top = 16
    Width = 145
    Height = 22
    TabOrder = 2
    OnChange = ColorChooserChange
  end
end
