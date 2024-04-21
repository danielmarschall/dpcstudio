unit Main;

interface

uses
  Windows, SysUtils, Graphics, Forms, Dialogs, Classes, Controls, StdCtrls,
  ExtCtrls, ShellAPI, GraphUtil;

type
  TMainForm = class(TForm)
    image: TImage;
    scrollbox: TScrollBox;
    pnl_right: TPanel;
    btn_exit: TButton;
    listbox: TListBox;
    btn_open: TButton;
    dlg_open: TOpenDialog;
    shape: TShape;
    lbl_title: TLabel;
    btn_markentf: TButton;
    btn_save: TButton;
    btn_farbtabelle: TButton;
    lbl_farben_name: TLabel;
    dlg_save: TSaveDialog;
    dlg_save_text: TSaveDialog;
    lbl_farben_value: TLabel;
    image_border: TImage;
    shape_hor: TShape;
    shape_ver: TShape;
    tmr_puls: TTimer;
    procedure Form_Show(Sender: TObject);
    procedure btn_exit_click(Sender: TObject);
    procedure btn_open_click(Sender: TObject);
    procedure listbox_drawitem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure image_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure listbox_click(Sender: TObject);
    procedure btn_markentf_click(Sender: TObject);
    procedure Form_Close(Sender: TObject; var Action: TCloseAction);
    procedure btn_farbtabelle_click(Sender: TObject);
    procedure btn_save_click(Sender: TObject);
    procedure Form_KeyPress(Sender: TObject; var Key: Char);
    procedure image_MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure image_MouseLeave(Sender: TObject);
    procedure tmr_puls_timer(Sender: TObject);
    procedure shape_var_click(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    puls: integer;
    pulsrev: boolean;
    stop: boolean;
    farbe: tbitmap;
    procedure highlight(bmp: TBitmap; inp: tcolor; depth: integer);
    function holefarbe(inp: integer): tcolor;
  end;

var
  MainForm: TMainForm;

resourcestring
  farbtab = 'FARBTABELLE FÜR %s';
  erroropen = 'Fehler beim Öffnen der Datei!';
  farbtabelle = 'FARBTABELLE FÜR %s';
  dezfarbe = 'Dezimale Farbwerte';
  bedeutung = 'Bedeutung';

implementation

{$R *.dfm}

function dreinull(inp: integer): string;
begin
  result := inttostr(inp);
  if length(inttostr(inp)) = 1 then result := '00'+inttostr(inp);
  if length(inttostr(inp)) = 2 then result := '0'+inttostr(inp);
end;

function gegenfarbe(inp: tcolor): tcolor;
begin
  result := ColorToRGB(inp) xor $FFFFFF;
end;

function textausgabe(inp: tcolor): string;
begin
  result := 'R='+dreinull(getrvalue(inp))+' G='+dreinull(getgvalue(inp))+' B='+dreinull(getbvalue(inp));
end;

procedure TMainForm.highlight(bmp: TBitmap; inp: tcolor; depth: integer);
var
  color, color2: longint;
  r, g, b, rr, gg: byte;
  h, w: integer;
const
  markcolor = clRed;
  bordermark = clLime;
begin
  shape.Top := 0;
  shape.Visible := true;
  shape.Top := 0 - shape.Height div 2;
  image_border.Picture.Bitmap.Canvas.Rectangle(0, 0, image.Width + 2, image.Height + 2);
  for h := 0 to bmp.height do
  begin
    shape.Top := shape.Top + 1;
    application.ProcessMessages;
    for w := 0 to bmp.width do
    begin
      if stop then exit;
      color := colortorgb(farbe.Canvas.pixels[w, h]);
      if color <> inp then
      begin
        r := getrvalue(color);
        g := getgvalue(color);
        b := getbvalue(color);
        color2 := (r + g + b) div 3;
        bmp.canvas.Pixels[w, h] := RGB(color2, color2, color2);
        color := colortorgb(bmp.Canvas.pixels[w, h]);
        r := getrvalue(color);
        g := getgvalue(color);
        b := getbvalue(color);
        rr := r + (depth * 2);
        gg := g + depth;
        if rr <= ((depth * 2) - 1) then rr := 255;
        if gg <= (depth - 1) then gg := 255;
        bmp.canvas.Pixels[w, h] := RGB(rr, gg, b);
      end
      else
      begin
        bmp.canvas.Pixels[w, h] := markcolor;
        image_border.Picture.Bitmap.canvas.Pixels[0, h + 1] := bordermark;
        image_border.Picture.Bitmap.canvas.Pixels[w + 1, 0] := bordermark;
        image_border.Picture.Bitmap.canvas.Pixels[bmp.Width + 1, h + 1] := bordermark;
        image_border.Picture.Bitmap.canvas.Pixels[w + 1, bmp.Height + 1] := bordermark;
      end;
    end;
  end;
  shape.Visible := false;
end;

function TMainForm.holefarbe(inp: integer): tcolor;
var
  s: string;
begin
  s := listbox.Items.Strings[inp];
  result := rgb(strtoint(copy(s, 3, 3)), strtoint(copy(s, 9, 3)), strtoint(copy(s, 15, 3)));
end;

procedure TMainForm.btn_exit_click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.btn_farbtabelle_click(Sender: TObject);
var
  myFile: TextFile;
  i: integer;
  s: string;
  cap: string;
begin
  if dlg_save_text.Execute then
  begin
    AssignFile(myFile, dlg_save_text.filename);
    ReWrite(myFile);
    cap := Format(farbtab, [uppercase(extractfilename(dlg_open.filename))]);
    WriteLn(myFile, cap);
    s := '';
    for i := 0 to length(cap) - 1 do
      s := s + '=';
    WriteLn(myFile, s);
    WriteLn(myFile);
    WriteLn(myFile, dezfarbe+#9+#9+bedeutung);
    WriteLn(myFile, '----------------------------------------------------------------');

    for i := 0 to listbox.Count - 1 do
    begin
      WriteLn(myFile, listbox.Items.strings[i]+#9+#9);
    end;

    CloseFile(myFile);

    shellexecute(application.handle, 'open', pchar(dlg_save_text.filename), '', '', SW_NORMAL);
  end;
end;

procedure TMainForm.btn_markentf_click(Sender: TObject);
begin
  btn_markentf.enabled := false;
  listbox.ItemIndex := -1;
  image.Picture.Bitmap := farbe;
  image_border.Picture.Bitmap.Canvas.Rectangle(0, 0, image.Width + 2, image.Height + 2);
end;

procedure TMainForm.btn_open_click(Sender: TObject);
var
  i, j: integer;
  c: tcolor;
  t: string;
begin
  if dlg_open.Execute then
  begin
    image.Cursor := crDefault;
    image.OnMouseDown := nil;
    listbox.Enabled := false;
    listbox.Cursor := crDefault;
    listbox.OnClick := nil;
    btn_markentf.Enabled := false;
    btn_open.Enabled := false;
    btn_save.Enabled := false;
    btn_farbtabelle.Enabled := false;
    listbox.Items.Clear;
    farbe := tbitmap.Create;
    try
      farbe.LoadFromFile(dlg_open.FileName);
      if farbe.Monochrome then farbe.Monochrome := false;
      image.Picture.Bitmap := farbe;
      image_border.Left := 0;
      image_border.Top := 0;
      image_border.Picture.Bitmap.SetSize(image.Width + 2, image.height + 2);
      image_border.Picture.Bitmap.Canvas.Rectangle(0, 0, image.Width + 2, image.Height + 2);
      image_border.width := image.Width + 2;
      image_border.height := image.height + 2;
      image_border.Visible := true;
      image_border.BringToFront;
      image.Left := 1;
      image.Top := 1;
      image.Visible := true;
      image.BringToFront;
      application.ProcessMessages;
      shape.Left := 0;
      shape.Top := 1;
      shape.Top := shape.Top - shape.Height div 2;
      shape.Width := image.Width + 2;
      shape.Pen.Color := clOlive;
      shape.Brush.Color := clYellow;
      shape.visible := true;
      shape_hor.BringToFront;
      shape_ver.BringToFront;
      shape.BringToFront;
      for i := 0 to image.height - 1 do
      begin
        shape.top := shape.top + 1;
        application.ProcessMessages;
        for j := 0 to image.width - 1 do
        begin
          if stop then exit;
          c := image.Picture.Bitmap.Canvas.Pixels[j, i];
          t := textausgabe(c);
          if listbox.Items.IndexOf(t) = -1 then
          begin
            listbox.Items.AddObject(t, pointer(c));
            lbl_farben_value.caption := inttostr(listbox.Count);
            application.ProcessMessages;
          end;
        end;
      end;
      shape.visible := false;
      shape.Pen.Color := clMaroon;
      shape.Brush.Color := clRed;
    except
      MessageDlg(erroropen, mtError, [mbOK], 0);
    end;
    image.Cursor := crCross;
    image.OnMouseDown := image_MouseDown;
    listbox.Enabled := true;
    listbox.Cursor := crHandPoint;
    listbox.OnClick := ListBox_Click;
    btn_open.Enabled := true;
    btn_save.Enabled := true;
    btn_farbtabelle.Enabled := true;
  end;
end;

procedure TMainForm.btn_save_click(Sender: TObject);
begin
  if dlg_save.Execute then
  begin
    image.Picture.Bitmap.SaveToFile(dlg_save.FileName);
  end;
end;

procedure TMainForm.Form_Close(Sender: TObject; var Action: TCloseAction);
begin
  stop := true;
  if assigned(farbe) then farbe.free;
end;

procedure TMainForm.Form_KeyPress(Sender: TObject; var Key: Char);
const
  VK_ESC = 27;
begin
  if key = chr(VK_ESC) then close;
end;

procedure TMainForm.Form_Show(Sender: TObject);
begin
  puls := 0;
  DoubleBuffered := true;
  scrollbox.DoubleBuffered := true;
  clientwidth := screen.width;
  clientheight := screen.height;
  top := 0;
  left := 0;
  shape_hor.Width := 1;
  shape_ver.Height := 1;
  image_border.Picture.Bitmap.Canvas.Pen.Color := scrollbox.Color;
  listbox.height := clientheight - 10*8 - lbl_title.Height - btn_markentf.height - btn_open.height - btn_exit.height - btn_save.Height - btn_farbtabelle.Height;
  lbl_farben_name.Top := listbox.top + listbox.Height + 8;
  lbl_farben_value.Top := lbl_farben_name.Top;
  btn_markentf.Top := lbl_farben_value.top + lbl_farben_value.Height + 8;
  btn_farbtabelle.Top := btn_markentf.top + btn_markentf.Height + 8;
  btn_open.Top := btn_farbtabelle.top + btn_farbtabelle.Height + 8;
  btn_save.Top := btn_open.top + btn_open.Height + 8;
  btn_exit.Top := btn_save.top + btn_save.Height + 8;
  btn_open.SetFocus;
end;

procedure TMainForm.image_MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  c: TColor;
begin
  shape_hor.Visible := image.Cursor = crCross;
  shape_ver.Visible := image.Cursor = crCross;
  tmr_puls.enabled := image.Cursor = crCross;

  if image.Cursor = crCross then
  begin
    shape_hor.Left := x;
    shape_hor.Top := image.Top;
    shape_hor.Height := image.Height;
    //shape_hor.Width := image.Width;

    shape_ver.Top := y;
    shape_ver.Left := image.Left;
    //shape_ver.Height := image.Height;
    shape_ver.Width := image.Width;

    c := farbe.Canvas.Pixels[x, y];
    if listbox.items.indexof(textausgabe(c)) <> -1 then
    begin
      listbox.Selected[listbox.items.indexof(textausgabe(c))] := true;
      listbox.SetFocus;
    end;
  end;
end;

procedure TMainForm.image_MouseLeave(Sender: TObject);
begin
  tmr_puls.enabled := false;
  shape_hor.Visible := false;
  shape_ver.Visible := false;
end;

procedure TMainForm.image_MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  c: tcolor;
begin
  image.Cursor := crDefault;
  image.OnMouseDown := nil;
  listbox.Enabled := false;
  listbox.Cursor := crDefault;
  listbox.OnClick := nil;
  btn_markentf.Enabled := false;
  btn_open.Enabled := false;
  btn_save.Enabled := false;
  btn_farbtabelle.Enabled := false;
  c := farbe.Canvas.Pixels[x, y];
  highlight(image.picture.Bitmap, c, 0);
  image.Cursor := crCross;
  image.OnMouseDown := image_MouseDown;
  listbox.Enabled := true;
  if listbox.items.indexof(textausgabe(c)) <> -1 then
  begin
    listbox.Selected[listbox.items.indexof(textausgabe(c))] := true;
    listbox.SetFocus;
  end;
  listbox.Cursor := crHandPoint;
  listbox.OnClick := ListBox_Click;
  btn_markentf.Enabled := true;
  btn_open.Enabled := true;
  btn_save.Enabled := true;
  btn_farbtabelle.Enabled := true;
end;

procedure TMainForm.listbox_click(Sender: TObject);
var
  c: tcolor;
  w: integer;
begin
  if not btn_markentf.Enabled then btn_markentf.Enabled := true;
  image.Cursor := crDefault;
  image.OnMouseDown := nil;
  w := listbox.ItemIndex;
  listbox.Enabled := false;
  listbox.Cursor := crDefault;
  listbox.OnClick := nil;
  btn_markentf.Enabled := false;
  btn_open.Enabled := false;
  btn_save.Enabled := false;
  btn_farbtabelle.Enabled := false;
  c := holefarbe(w);
  highlight(image.picture.Bitmap, c, 0);
  image.Cursor := crCross;
  image.OnMouseDown := image_MouseDown;
  listbox.Enabled := true;
  listbox.Selected[w] := true;
  listbox.SetFocus;
  listbox.OnClick := ListBox_Click;
  listbox.Cursor := crHandPoint;
  btn_markentf.Enabled := true;
  btn_open.Enabled := true;
  btn_save.Enabled := true;
  btn_farbtabelle.Enabled := true;
end;

function Heller(Color: TColor; Wert: Integer): TColor;
begin
  result := ColorAdjustLuma(ColorToRGB(Color), Wert, false);
end;

procedure TMainForm.listbox_drawitem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
const
  abhebung = 50;
begin
  with Control as TListBox do
  begin
    Canvas.Brush.Color := TColor(Items.Objects[Index]);
    Canvas.FillRect(Rect);
    Canvas.Font.Color := Gegenfarbe(TColor(Items.Objects[Index]));
    Canvas.Font.Color := Heller(Canvas.Font.Color, abhebung);
    Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
  end;
end;

procedure TMainForm.shape_var_click(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  image_MouseDown(image, Button, Shift, TControl(Sender).Left + x, TControl(Sender).Top + y);
end;

procedure TMainForm.tmr_puls_timer(Sender: TObject);
begin
  if pulsrev then
  begin
    if puls - 1 = 0 then pulsrev := not pulsrev;
    dec(puls);
  end
  else
  begin
    if puls + 1 = 255 then pulsrev := not pulsrev;
    inc(puls);
  end;

  shape_hor.Pen.Color := rgb(255, puls, 0);
  shape_ver.Pen.Color := rgb(255, puls, 0);
end;

end.
