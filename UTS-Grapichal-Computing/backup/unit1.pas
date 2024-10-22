unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonKiri: TButton;
    ButtonAtas: TButton;
    ButtonBawah: TButton;
    ButtonScaleDown: TButton;
    ButtonKanan: TButton;
    ButtonScaleUp: TButton;
    ButtonTranslasi: TButton;
    ButtonPintu: TButton;
    ButtonJendela: TButton;
    ButtonAtap: TButton;
    ButtonDinding: TButton;
    ButtonHapus: TButton;
    ColorDialog1: TColorDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    procedure ButtonAtapClick(Sender: TObject);
    procedure ButtonAtasClick(Sender: TObject);
    procedure ButtonBawahClick(Sender: TObject);
    procedure ButtonDindingClick(Sender: TObject);
    procedure ButtonEllipse2Click(Sender: TObject);
    procedure ButtonEllipseClick(Sender: TObject);
    procedure ButtonGaris1Click(Sender: TObject);
    procedure ButtonGaris2Click(Sender: TObject);
    procedure ButtonKananClick(Sender: TObject);
    procedure ButtonHapusClick(Sender: TObject);
    procedure ButtonJendelaClick(Sender: TObject);
    procedure ButtonKiriClick(Sender: TObject);
    procedure ButtonKotakClick(Sender: TObject);
    procedure ButtonPintuClick(Sender: TObject);
    procedure ButtonRectangleClick(Sender: TObject);
    procedure ButtonRoundtectClick(Sender: TObject);
    procedure ButtonScaleDownClick(Sender: TObject);
    procedure ButtonScaleUpClick(Sender: TObject);
    procedure ButtonTitikClick(Sender: TObject);
    procedure ButtonTranslasiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Timer1Timer(Sender: TObject);
  private
    OffsetX, OffsetY: Integer;  // Variabel untuk translasi rumah
    WallColor, RoofColor, DoorColor, WindowColor: TColor;  // Variabel warna
    ScaleFactor: Double;

  public
     procedure DrawHouse;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

// Menggambar rumah
procedure TForm1.DrawHouse;
var
  RoofPoints: array[0..2] of TPoint;
begin
  // Menggambar dinding
  Canvas.Brush.Color := WallColor;
  Canvas.Rectangle(OffsetX + Round(100 * ScaleFactor), OffsetY + Round(150 * ScaleFactor), OffsetX + Round(300 * ScaleFactor), OffsetY + Round(300 * ScaleFactor));

  // Menggambar atap
  Canvas.Brush.Color := RoofColor;
  RoofPoints[0] := Point(OffsetX + Round(80 * ScaleFactor), OffsetY + Round(150 * ScaleFactor));
  RoofPoints[1] := Point(OffsetX + Round(200 * ScaleFactor), OffsetY + Round(50 * ScaleFactor));
  RoofPoints[2] := Point(OffsetX + Round(320 * ScaleFactor), OffsetY + Round(150 * ScaleFactor));
  Canvas.Polygon(RoofPoints);

  // Menggambar pintu
  Canvas.Brush.Color := DoorColor;
  Canvas.Rectangle(OffsetX + Round(180 * ScaleFactor), OffsetY + Round(230 * ScaleFactor), OffsetX + Round(220 * ScaleFactor), OffsetY + Round(300 * ScaleFactor));

  // Menggambar jendela
  Canvas.Brush.Color := WindowColor;
  Canvas.Ellipse(OffsetX + Round(120 * ScaleFactor), OffsetY + Round(200 * ScaleFactor), OffsetX + Round(160 * ScaleFactor), OffsetY + Round(240 * ScaleFactor));
  Canvas.Rectangle(OffsetX + Round(240 * ScaleFactor), OffsetY + Round(200 * ScaleFactor), OffsetX + Round(280 * ScaleFactor), OffsetY + Round(240 * ScaleFactor));
end;

procedure TForm1.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var w : TColor;
begin
    Label1.Caption := 'x = ' + IntToStr(x) + ' y = ' +
IntToStr(y);
    w := 5478;
    Canvas.Pixels[x,y] := Random(w);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OffsetX := 0;
  OffsetY := 0;
  ScaleFactor := 1.0;
  WallColor := clGray;
  RoofColor := clRed;
  DoorColor := clMaroon;
  WindowColor := clBlue;
end;

procedure TForm1.ButtonTitikClick(Sender: TObject);
begin
  Canvas.Pixels[80,100] := clRed;
end;

procedure TForm1.ButtonTranslasiClick(Sender: TObject);
begin
   Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.ButtonGaris1Click(Sender: TObject);
var a,b : integer;
begin
      b:= 0;
      for a := 0 to 100 do
      begin
            Canvas.Pixels[a,b] := clred;
            b:= b+1;
      end;
end;

procedure TForm1.ButtonEllipseClick(Sender: TObject);
begin
  Canvas.Ellipse(145,150,255,268);
end;

procedure TForm1.ButtonEllipse2Click(Sender: TObject);
begin
  Canvas.Ellipse(0,0,Width,Height);
end;

procedure TForm1.ButtonDindingClick(Sender: TObject);
begin
   if ColorDialog1.Execute then
    WallColor := ColorDialog1.Color;
  Invalidate;
end;

procedure TForm1.ButtonAtapClick(Sender: TObject);
begin
     if ColorDialog1.Execute then
        RoofColor := ColorDialog1.Color;

end;

procedure TForm1.ButtonAtasClick(Sender: TObject);
begin
  OffsetY := OffsetY - 10;
  Invalidate;
end;

procedure TForm1.ButtonBawahClick(Sender: TObject);
begin
  OffsetY := OffsetY + 10;
  Invalidate;
end;

procedure TForm1.ButtonGaris2Click(Sender: TObject);
begin
  Canvas.MoveTo(130,120);
  Canvas.LineTo(130,240);
end;

procedure TForm1.ButtonKananClick(Sender: TObject);
begin
  OffsetX := OffsetX + 10;
  Invalidate;
end;

procedure TForm1.ButtonHapusClick(Sender: TObject);
begin
  Invalidate;
end;

procedure TForm1.ButtonJendelaClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    WindowColor := ColorDialog1.Color;
  Invalidate;
end;

procedure TForm1.ButtonKiriClick(Sender: TObject);
begin
   OffsetY := OffsetY - 10;
   Invalidate;
end;

procedure TForm1.ButtonKotakClick(Sender: TObject);
begin
  Canvas.Rectangle(round(Width/3),round(Height/3),+
  round(Width*2/3),round(Height*2/3));
end;

procedure TForm1.ButtonPintuClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    DoorColor := ColorDialog1.Color;
  Invalidate;
end;

procedure TForm1.ButtonRectangleClick(Sender: TObject);
begin
  Canvas.Pen.Color := clMaroon;
  Canvas.pen.Width := 3;
  Canvas.Brush.Color := clYellow;
  Canvas.Brush.Style := bsVertical;
  Canvas.Rectangle(120,150,340,260);
end;

procedure TForm1.ButtonRoundtectClick(Sender: TObject);
begin
  Canvas.RoundRect(120,150,340,260,55,55);
end;

procedure TForm1.ButtonScaleDownClick(Sender: TObject);
begin
  ScaleFactor := ScaleFactor - 0.1;  // Decrease scale by 0.1
  if ScaleFactor < 0.1 then  // Ensure scale factor doesn't go negative
    ScaleFactor := 0.1;
  Invalidate;
end;

procedure TForm1.ButtonScaleUpClick(Sender: TObject);
begin
  ScaleFactor := ScaleFactor + 0.1;  // Increase scale by 0.1
  Invalidate;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var w : TColor;
begin
  Label1.Caption := 'x = ' + IntToStr(x) + ' y = ' +
IntToStr(y);
            w := 5478;
            Canvas.Pixels[x,y] := Random(w);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
   DrawHouse;
end;

end.

