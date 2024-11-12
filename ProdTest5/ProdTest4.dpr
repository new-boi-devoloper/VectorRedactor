program ProdTest4;

uses
  Vcl.Forms,
  VectorEditor in 'VectorEditor.pas' {frmVectorEditor},
  VectorEditorShapes in 'VectorEditorShapes.pas',
  VectorEditorCanvasAdapter in 'VectorEditorCanvasAdapter.pas',
  VectorEditorInterface in 'VectorEditorInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVectorEditor, frmVectorEditor);
  Application.Run;
end.
