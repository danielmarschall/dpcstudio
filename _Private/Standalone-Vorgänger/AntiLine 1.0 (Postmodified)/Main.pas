unit Main;

interface

uses
  Windows, SysUtils, Graphics, Forms, Dialogs, Classes, ExtCtrls, StdCtrls,
  Controls;

type
  TMainForm = class(TForm)
    image: TImage;
    scrollbox: TScrollBox;
    pnl_right: TPanel;
    btn_exit: TButton;
    btn_open: TButton;
    dlg_open: TOpenDialog;
    lbl_title: TLabel;
    btn_dir_1: TButton;
    btn_dir_2: TButton;
    btn_dir_3: TButton;
    btn_dir_4: TButton;
    btn_dir_5: TButton;
    btn_dir_6: TButton;
    btn_dir_7: TButton;
    btn_dir_8: TButton;
    spe_search: TShape;
    btn_auto1: TButton;
    btn_save: TButton;
    dlg_save: TSaveDialog;
    dlg_color: TColorDialog;
    procedure Form_Show(Sender: TObject);
    procedure btn_exit_click(Sender: TObject);
    procedure btn_open_click(Sender: TObject);
    procedure Form_Close(Sender: TObject; var Action: TCloseAction);
    procedure Form_KeyPress(Sender: TObject; var Key: Char);
    procedure btn_dir_click(Sender: TObject);
    procedure btn_auto1_click(Sender: TObject);
    procedure btn_save_click(Sender: TObject);
    procedure spe_search_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    stop: boolean;
    procedure Process(lv, tv: integer);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btn_exit_click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.btn_open_click(Sender: TObject);
begin
  if dlg_open.Execute then
  begin
    image.Picture.LoadFromFile(dlg_open.FileName);
  end;
end;

procedure TMainForm.btn_save_click(Sender: TObject);
begin
  if dlg_save.Execute then
  begin
    image.Picture.SaveToFile(dlg_save.FileName);
  end;
end;

procedure TMainForm.btn_auto1_click(Sender: TObject);
var
  l, t: integer;
  gefunden: boolean;
begin
  repeat
    btn_dir_4.click;
    btn_dir_5.click;
    btn_dir_2.click;
    btn_dir_7.click;

    if stop then exit;

    gefunden := false;
    for t := 0 to image.Height do
    begin
      for l := 0 to image.Width do
      begin
        if image.Picture.Bitmap.Canvas.Pixels[l, t] = spe_search.Brush.Color then
        begin
          gefunden := true;
        end;
      end;
    end;

    if not gefunden then break;
  until false;
end;

procedure TMainForm.Process(lv, tv: integer);

  procedure Inner(t, l: integer);
  begin
    if (image.Picture.Bitmap.Canvas.Pixels[l+lv, t+tv] <> spe_search.Brush.Color) and
       (image.Picture.Bitmap.Canvas.Pixels[l, t] = spe_search.Brush.Color) then
    begin
      image.Picture.Bitmap.Canvas.Pixels[l, t] := image.Picture.Bitmap.Canvas.Pixels[l+lv, t+tv];
      application.ProcessMessages;
    end;
  end;

var
  t, l: integer;
begin
  if tv = -1 then
  begin
    for t := image.height downto 0 do
    begin
      if lv = -1 then
      begin
        for l := image.width downto 0 do
        begin
          Inner(t, l);
          if stop then break;
        end;
      end
      else
      begin
        for l := 0 to image.width do
        begin
          Inner(t, l);
          if stop then break;
        end;
      end;
    end;
  end
  else
  begin
    for t := 0 to image.height do
    begin
      if lv = -1 then
      begin
        for l := image.width downto 0 do
        begin
          Inner(t, l);
          if stop then break;
        end;
      end
      else
      begin
        for l := 0 to image.width do
        begin
          Inner(t, l);
          if stop then break;
        end;
      end;
    end;
  end;
end;

function gegenfarbe(inp: tcolor): tcolor;
begin
  result := ColorToRGB(inp) xor $FFFFFF;
end;

procedure TMainForm.spe_search_MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if dlg_color.Execute then
  begin
    TShape(Sender).Brush.Color := dlg_color.Color;
    TShape(Sender).Pen.Color := Gegenfarbe(dlg_color.Color);
  end;
end;

procedure TMainForm.btn_dir_click(Sender: TObject);
begin
  if sender = btn_dir_1 then Process(-1, -1);
  if sender = btn_dir_2 then Process(+0, -1);
  if sender = btn_dir_3 then Process(+1, -1);
  if sender = btn_dir_4 then Process(-1, +0);
  if sender = btn_dir_5 then Process(+1, +0);
  if sender = btn_dir_6 then Process(-1, +1);
  if sender = btn_dir_7 then Process(+0, +1);
  if sender = btn_dir_8 then Process(+1, +1);
end;

procedure TMainForm.Form_Close(Sender: TObject; var Action: TCloseAction);
begin
  stop := true;
end;

procedure TMainForm.Form_KeyPress(Sender: TObject; var Key: Char);
const
  VK_ESC = 27;
begin
  if key = chr(VK_ESC) then close;
end;

procedure TMainForm.Form_Show(Sender: TObject);
begin
  btn_open.SetFocus;
  btn_exit.Top := pnl_right.Height - btn_exit.Height - 8;
  btn_save.Top := btn_exit.Top - btn_save.Height - 8;
  btn_open.Top := btn_save.Top - btn_open.Height - 8;
end;

end.
