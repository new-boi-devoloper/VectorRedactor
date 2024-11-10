unit CalculatorFile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCalculatorForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MinusButton: TButton;
    PlusButton: TButton;
    MultiplyButton: TButton;
    DivideButton: TButton;
    InputField1: TEdit;
    InputField2: TEdit;
    Result: TLabel;
    CloseCalculator: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OnPlusButtonClick(Sender: TObject);
    procedure OnMinusButtonClick(Sender: TObject);
    procedure OnMultiplyButtonClick(Sender: TObject);
    procedure OnDivideButtonClick(Sender: TObject);
    procedure OnCloseCalculatorButton(Sender: TObject);
  private
    firstNumber, secondNumber, resultNumber: Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalculatorForm: TCalculatorForm;

implementation

{$R *.dfm}

procedure TCalculatorForm.FormCreate(Sender: TObject);
begin
  firstNumber := 0;
  secondNumber := 0;
  resultNumber := 0;
end;

procedure TCalculatorForm.OnPlusButtonClick(Sender: TObject);
begin
  firstNumber := StrToFloat(InputField1.Text);
  secondNumber := StrToFloat(InputField2.Text);
  resultNumber := firstNumber + secondNumber;
  Result.Caption := FloatToStr(resultNumber);
end;

procedure TCalculatorForm.OnMinusButtonClick(Sender: TObject);
begin
  firstNumber := StrToFloat(InputField1.Text);
  secondNumber := StrToFloat(InputField2.Text);
  resultNumber := firstNumber - secondNumber;
  Result.Caption := FloatToStr(resultNumber);
end;

procedure TCalculatorForm.OnMultiplyButtonClick(Sender: TObject);
begin
  firstNumber := StrToFloat(InputField1.Text);
  secondNumber := StrToFloat(InputField2.Text);
  resultNumber := firstNumber * secondNumber;
  Result.Caption := FloatToStr(resultNumber);
end;

procedure TCalculatorForm.OnDivideButtonClick(Sender: TObject);
begin
  firstNumber := StrToFloat(InputField1.Text);
  secondNumber := StrToFloat(InputField2.Text);
  if secondNumber = 0 then
  begin
    resultNumber := 0;
  end
  else
  begin
    resultNumber := firstNumber / secondNumber;
  end;
  Result.Caption := FloatToStr(resultNumber);
end;

procedure TCalculatorForm.OnCloseCalculatorButton(Sender: TObject);
begin
  Self.Close;
end;

end.
