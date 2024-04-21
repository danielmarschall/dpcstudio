unit Bild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TPicForm = class(TForm)
    Shape: TShape;
    Image: TImage;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    LabelA: TLabel;
    Timer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  public
    stop: boolean;
  end;

var
  PicForm: TPicForm;

implementation

{$R *.dfm}

{$R WindowsXP.res}

procedure Schlafen(nDelay: Integer);
var 
  nStart: Integer;
begin
  nStart := GetTickCount;
  while int(GetTickCount)-nStart < nDelay do
  begin
    Application.ProcessMessages;
    Sleep(0);
  end;
end;

procedure TPicForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  stop := true;
end;

procedure TPicForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(27) then
  begin
    Schlafen(1000);
    close;
  end;
end;

procedure TPicForm.FormShow(Sender: TObject);
begin
  left := 0;
  top := 0;
  width := screen.width;
  height := screen.height;
  DoubleBuffered := true;
  labela.Left := clientwidth div 2 - labela.Width div 2;
end;

procedure TPicForm.TimerTimer(Sender: TObject);
var
  i, j: integer;
begin
  timer.Enabled := false;

  if opendialog.execute then
  begin
    try
      image.Picture.LoadFromFile(opendialog.FileName);
    except
      messagedlg('Fehler beim Öffnen der Datei!', mtError, [mbOK], 0);
      Schlafen(1000);
      close();
    end;
    if Image.Picture.Bitmap.Monochrome then
    begin
      Image.Picture.Bitmap.Monochrome := false;
    end;
    image.left := clientwidth div 2 - image.width div 2;
    image.top := clientheight div 2 - image.height div 2;
    shape.Width := image.width;
    shape.left := image.left;
    shape.top := image.top;
  end
  else
  begin
    Schlafen(1000);
    close();
  end;

  labela.Visible := false;
  Schlafen(1000);

  shape.Visible := true;

  // Im 3x3 Raster (1x1 Pixelfortschreiten) werden
  // Diagonalen, Sekrechten und Waagerechten
  // auf eine 1 Nichtschwarzpixel-Lücke zwischen 2 Schwarzen durch
  // einen Roten Pixel ersetzt
  for j := 0 to image.Height do
  begin
    shape.top := j - Shape.Height div 2 + image.top;
    for i := 0 to image.Width do
    begin
      if stop then exit;

      // 3x3 Waagerecht
      if  (image.Canvas.Pixels[i+0, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+1, j+0] <> clBlack)
      and (image.Canvas.Pixels[i+2, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack) // Zusatzregel
      and (image.Canvas.Pixels[i+1, j-1] <> clBlack) // Zusatzregel
      then
      begin
        image.Canvas.Pixels[i+1, j+0] := clRed;
      end;

      // 3x3 Senkrecht
      if  (image.Canvas.Pixels[i+0, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+0, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+0, j+2] =  clBlack)
      and (image.Canvas.Pixels[i-1, j+1] <> clBlack) // Zusatzregel
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack) // Zusatzregel
      then
      begin
        image.Canvas.Pixels[i+0, j+1] := clRed;
      end;

      // 3x3 Linksoben nach Rechtsunten
      if  (image.Canvas.Pixels[i+0, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+2, j+2] =  clBlack) then
      begin
        image.Canvas.Pixels[i+1, j+1] := clRed;
      end;

      // 3x3 Rechtsoben nach Linksunten
      if  (image.Canvas.Pixels[i+2, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+0, j+2] =  clBlack) then
      begin
        image.Canvas.Pixels[i+1, j+1] := clRed;
      end;

      // 2x3 (Waagerecht) Linksoben nach Rechtsunten
      if  (image.Canvas.Pixels[i+0, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+1, j+0] <> clBlack)
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+2, j+1] =  clBlack) then
      begin
        image.Canvas.Pixels[i+1, j+0] := clRed;
      end;

      // 2x3 (Waagerecht) Rechtsoben nach Linksunten
      if  (image.Canvas.Pixels[i+0, j+1] =  clBlack)
      and (image.Canvas.Pixels[i+1, j+0] <> clBlack)
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+2, j+0] =  clBlack) then
      begin
        image.Canvas.Pixels[i+1, j+1] := clRed;
      end;

      // 3x2 (Senkrecht) Linksoben nach Rechtsunten
      if  (image.Canvas.Pixels[i+0, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+0, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+1, j+2] =  clBlack) then
      begin
        image.Canvas.Pixels[i+0, j+1] := clRed;
      end;

      // 3x2 (Senkrecht) Linksunten nach Rechtssoben
      if  (image.Canvas.Pixels[i+1, j+0] =  clBlack)
      and (image.Canvas.Pixels[i+0, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+1, j+1] <> clBlack)
      and (image.Canvas.Pixels[i+0, j+2] =  clBlack) then
      begin
        image.Canvas.Pixels[i+1, j+1] := clRed;
      end;

      application.ProcessMessages;
    end;
  end;
  shape.Visible := false;

  if savedialog.Execute then
  begin
    image.Picture.SaveToFile(savedialog.FileName);
  end;

  Schlafen(1000);
  close;
end;

end.
