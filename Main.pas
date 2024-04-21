unit Main;

{

** ZUKUNFT TODO **

- ShowMessage -> MessageBox
- (Bug?) Mauszeiger bleibt manchmal nach dem CA verschwunden.
- Updateprozedur von ViaThinkSoft einführen
- Color Analyzer: Beim Hover anstelle des ListBox.Select[]
  die Einträge deutlicher markieren (Fette Schriftart)?
  Die farbe mit den vollständigen Farbinfos in ein Panel?
- Weitere Farbangaben wie z.B. HTML-Codes etc.
- Farbselektorboxen direkt vom Bild (oder der ColorAnalyzer-Palette) entnehmen können
- AntiLine mit Shape-balken, die in verschiedene Richtungen laufen
- (2.0) PaintShop Ersatz: Dithering-Verfahren
- (2.0) Paint Ersatz...?

}

{$WARNINGS OFF}

interface

uses
  Windows, SysUtils, Graphics, Forms, Dialogs, Classes, Controls, StdCtrls,
  ExtCtrls, ShellAPI, GR32, GR32_Image, GR32_Layers, Menus, Spin, Registry,
  HandCursor, JPEG, ExtDlgs;

type
  TMainForm = class(TForm)
    image_scrollbox: TScrollBox;
    pnl_right: TPanel;
    listbox: TListBox;
    dlg_save_text: TSaveDialog;
    PulsTimer: TTimer;
    PopupMenu: TPopupMenu;
    Markcolor1: TMenuItem;
    Namengeben1: TMenuItem;
    Farbinformationen1: TMenuItem;
    pnl_antiline: TPanel;
    RightDownBtn: TButton;
    DownBtn: TButton;
    LeftDownBtn: TButton;
    RightBtn: TButton;
    LeftBtn: TButton;
    RightTopBtn: TButton;
    UpBtn: TButton;
    LeftUpBtn: TButton;
    AutoBtnA: TButton;
    pnl_control: TPanel;
    btn_exit: TButton;
    btn_save: TButton;
    btn_open: TButton;
    pnl_color_bottom: TPanel;
    btn_markentf: TButton;
    btn_farbtabelle: TButton;
    pnl_coloranalyzer: TPanel;
    lbl_farben_name: TLabel;
    lbl_farben_value: TLabel;
    pnl_multi: TPanel;
    pnl_tools: TPanel;
    BtnToolCA: TButton;
    BtnToolCC: TButton;
    BtnToolAL: TButton;
    BtnToolAE: TButton;
    pnl_antiescape: TPanel;
    ImgAntiEscapeMatrix: TImage;
    BtnAntiEscapeStart: TButton;
    BtnToolMisc: TButton;
    pnl_misc: TPanel;
    TitleMisc: TLabel;
    BtnUpdate: TButton;
    BtnTutorial: TButton;
    LblVersion: TLabel;
    pnl_colorchanger: TPanel;
    TitleColorChanger: TLabel;
    TitleColorAnalyzer: TLabel;
    TitleAntiLine: TLabel;
    TitleAntiEscape: TLabel;
    BtnColorReplace: TButton;
    BtnColorSwap: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    Namenzurcksetzen1: TMenuItem;
    pnl_left: TPanel;
    LblLinienfarbe: TLabel;
    LblEscapeFarbe: TLabel;
    ColorEscapeLinie: TPanel;
    ColorEscapeColor: TPanel;
    ColorChangerSource: TPanel;
    ColorChangerDest: TPanel;
    ColorAntiLine: TPanel;
    ColorMarkSelect: TPanel;
    ColorBorderSelect: TPanel;
    Grp_Config: TGroupBox;
    ActRate: TSpinEdit;
    LblActRate: TLabel;
    LblCrossPuls: TLabel;
    CrossPuls: TSpinEdit;
    LblQuellfarbe: TLabel;
    LblZielfarbe: TLabel;
    LblAutoDescA: TLabel;
    AutoBtnB: TButton;
    LblAutoDescB: TLabel;
    ProgressPanel: TCheckBox;
    BtnToolSW: TButton;
    pnl_blackwhite: TPanel;
    TitleBlackWhite: TLabel;
    MakeSW: TButton;
    SWGrenze: TSpinEdit;
    LblWeissgrenze: TLabel;
    LblWarnDithering: TLabel;
    dlg_open: TOpenPictureDialog;
    dlg_save: TSavePictureDialog;
    BtnToolMultiply: TButton;
    pnl_multiply: TPanel;
    TitleMultiply: TLabel;
    dlg_open2: TOpenPictureDialog;
    BtnLetMultiply: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn_exit_click(Sender: TObject);
    procedure btn_open_click(Sender: TObject);
    procedure listbox_drawitem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure btn_markentf_click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_farbtabelle_click(Sender: TObject);
    procedure btn_save_click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure ImageMouseLeave(Sender: TObject);
    procedure tmr_puls_timer(Sender: TObject);
    procedure indicator_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure ImageMouseEnter(Sender: TObject);
    procedure indicator_verMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure indicator_horMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Namengeben1Click(Sender: TObject);
    procedure listboxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Markcolor1Click(Sender: TObject);
    procedure Farbinformationen1Click(Sender: TObject);
    procedure ToolsClick(Sender: TObject);
    procedure AutoBtnAClick(Sender: TObject);
    procedure AntiLinesClicks(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure BtnAntiEscapeStartClick(Sender: TObject);
    procedure BtnTutorialClick(Sender: TObject);
    procedure BtnColorReplaceClick(Sender: TObject);
    procedure BtnColorSwapClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure Namenzurcksetzen1Click(Sender: TObject);
    procedure ColorSelect(Sender: TObject);
    procedure AutoBtnBClick(Sender: TObject);
    procedure ProgressPanelClick(Sender: TObject);
    procedure MakeSWClick(Sender: TObject);
    procedure BtnLetMultiplyClick(Sender: TObject);
  private
    shape: TShape;
    image: TImage32;
    border: TImage32;
    indicator_hor: TPanel;
    indicator_ver: TPanel;
    OneFileLoaded: boolean;
    puls: integer;
    pulsrev: boolean;
    BackupFarbe: TBitmap32;
    ColorReanalyzingNecessary: boolean;
    procedure highlight(inp: tcolor);
    procedure AntiLineProcess(lv, tv: integer);
    procedure ControlAct(state: boolean);
    procedure AntiEscape;
    function HasLinePixels: boolean;
    function CountLinePixels: Integer;
    procedure AntiLineHaken(Haken: boolean);
    procedure SaveConfiguration;
    procedure LoadConfiguration;
  public
    procedure AnalyzeColors;
  end;

var
  MainForm: TMainForm;

resourcestring
  lng_name_cap = 'Namen geben';
  lng_name_txt = 'Bitte geben Sie einen Bezeichner für diese Farbe ein.';
  lng_tut_not_found = 'Tutorial (%s) nicht gefunden.';
  lng_erroropen = 'Fehler beim Öffnen der Datei!';
  lng_farbtabelle = 'FARBTABELLE FÜR %s';
  lng_dezfarbe = 'Dezimale Farbwerte';
  lng_bedeutung = 'Bedeutung';
  lng_anti_escape_hint = 'Linienfarbe zum Entfernen';
  lng_anti_escape_finished = ' (Keine weiteren Vorkommnisse)';
  lng_ae_warnung = 'Achtung! Das automatische Antiescaping ist relativ '+
                   'uneffektiv und daher sollte stattdessen das verbesserte '+
                   'konventielle Escaping mit einfachen Linien mittels radikaler '+
                   '(Linienüberschreibender) Technik angewandt werden werden.';
  lng_sw_warnung = 'Achtung! Die einfache SW-Matrizzenerstellung verfügt über '+
                   'keinerlei Dithering-Möglichkeit. Beim konventionellem '+
                   'Kolorieren und besonders beim AntiLine-Koloieren sollten '+
                   'Sie ein professionelles Bildbearbeitungsprogramm mit '+
                   'Dithering-Funktion vorziehen (z.B. PhotoShop Pro).';

const
  tut_url = 'http://www.daniel-marschall.de/files/';
  vts_url = 'http://www.viathinksoft.de/';
  MarkerBorderWidth = 2;
  ckey = 'Software\ViaThinkSoft\DPC-Studio\Settings\';

implementation

uses Color;

{$R *.dfm}

function dreinull(inp: integer): string;
begin
  result := inttostr(inp);
  if length(inttostr(inp)) = 1 then result := '00'+inttostr(inp);
  if length(inttostr(inp)) = 2 then result := '0'+inttostr(inp);
end;

(* function gegenfarbe(inp: tcolor): tcolor;
begin
  result := colortorgb(inp) xor $FFFFFF;
end; *)

function TextContrastColor(BackgroundColor: TColor): TColor;
var
  r, g, b, i: byte;
begin
  r := GetRValue(BackgroundColor);
  g := GetGValue(BackgroundColor);
  b := GetBValue(BackgroundColor);

  i := (r+g+b) div 3;

  if i > 128 then
    result := clBlack
  else
    result := clWhite;
end;

function Color32ToColor(inp: tcolor32): tcolor;
var
  r, g, b: byte;
begin
  // Entfernt den Alpha-Kanal
  // Wichtig, da die Farbe FFFFFFFF nicht an die Listbox übergeben werden kann,
  // da es "nil" repräsentiert. Deswegen dürfen wir nur Pointer auf TColor's
  // übergeben.

  r := RedComponent(inp);
  g := GreenComponent(inp);
  b := BlueComponent(inp);
  result := RGB(r, g, b);
end;

function textausgabe(inp: tcolor): string;
begin
  result := 'R='+dreinull(GetRValue(inp))+' G='+dreinull(GetGValue(inp))+' B='+dreinull(GetBValue(inp));
end;

procedure TMainForm.highlight(inp: tcolor);
var
  color: TColor;
  h, w, intens: integer;
  markcolor, bordermark: tcolor32;
begin
  markcolor := Color32(ColorMarkSelect.Color);
  bordermark := Color32(ColorBorderSelect.Color);

  shape.Top := 0 - shape.Height div 2;
  shape.Visible := ProgressPanel.Checked;
  border.Bitmap.Clear;
  for h := 0 to image.Bitmap.height - 1 do
  begin
    if Application.Terminated then break;
    shape.Top := shape.Top + 1;

    for w := 0 to image.Bitmap.width - 1 do
    begin
      if Application.Terminated then break;
      color := Color32ToColor(BackupFarbe.PixelS[w, h]);

      if color <> inp then
      begin
        intens := Intensity(Color32(color));
        image.Bitmap.PixelS[w, h] := Gray32(intens, 0);
        // Hier kein ColorReanalyzingNecessary=true, da das echte Bild in FarbBackup ist.
      end
      else
      begin
        image.Bitmap.PixelS[w, h] := markcolor;
        // Hier kein ColorReanalyzingNecessary=true, da das echte Bild in FarbBackup ist.

        border.Bitmap.PixelS[0, h + MarkerBorderWidth] := bordermark;
        border.Bitmap.PixelS[w + MarkerBorderWidth, 0] := bordermark;
        border.Bitmap.PixelS[image.Bitmap.Width + MarkerBorderWidth + 1, h + MarkerBorderWidth + 1] := bordermark;
        border.Bitmap.PixelS[w + MarkerBorderWidth + 1, image.Bitmap.Height + MarkerBorderWidth + 1] := bordermark;
      end;
    end;

    if ProgressPanel.Checked and (h mod actrate.Value = 0) then
    begin
      image.Repaint;
      border.Repaint;
      application.ProcessMessages;
    end;
  end;

  image.Repaint;
  border.Repaint;
  Application.ProcessMessages;

  shape.Visible := false;
end;

procedure TMainForm.btn_exit_click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.btn_farbtabelle_click(Sender: TObject);
var
  myFile: TextFile;
  i: integer;
  s, cap, tc, tn: string;
begin
  if dlg_save_text.Execute then
  begin
    AssignFile(myFile, dlg_save_text.filename);
    ReWrite(myFile);
    cap := Format(lng_farbtabelle, [uppercase(extractfilename(dlg_open.filename))]);
    WriteLn(myFile, cap);
    s := '';
    for i := 0 to length(cap) - 1 do
      s := s + '=';
    WriteLn(myFile, s);
    WriteLn(myFile);
    WriteLn(myFile, lng_dezfarbe+#9+#9+lng_bedeutung);
    WriteLn(myFile, '----------------------------------------------------------------');

    for i := 0 to listbox.Count - 1 do
    begin
      tc := textausgabe(TColor(listbox.Items.Objects[i]));
      tn := listbox.Items.strings[i];
      if (tc = tn) then
        WriteLn(myFile, tc+#9#9)
      else
        WriteLn(myFile, tc+#9#9+tn);
    end;

    CloseFile(myFile);

    shellexecute(application.handle, 'open', pchar(dlg_save_text.filename), '', '', SW_NORMAL);
  end;
end;

procedure TMainForm.btn_markentf_click(Sender: TObject);
begin
  btn_markentf.enabled := false;
  listbox.ItemIndex := -1;
  image.Bitmap.Assign(BackupFarbe);
  border.Bitmap.Clear;
end;

procedure TMainForm.AnalyzeColors;
var
  i, j, k: integer;
  c: TColor32;
  ColorKnown: boolean;
  c_obj: TObject;
  KnownColors: array of TObject;
begin
  if not ColorReanalyzingNecessary then exit;

  listbox.Clear;
  lbl_farben_value.caption := '0';
  setlength(KnownColors, 0);

  ControlAct(false);

  shape.Top := 0 - shape.Height div 2;
  shape.Pen.Color := clOlive;
  shape.Brush.Color := clYellow;
  shape.visible := ProgressPanel.Checked;

  for i := 0 to image.Bitmap.height - 1 do
  begin
    if Application.Terminated then break;
    shape.top := shape.top + 1;

    for j := 0 to image.Bitmap.width - 1 do
    begin
      if Application.Terminated then break;
      c := image.Bitmap.PixelS[j, i];
      c_obj := pointer(Color32ToColor(c));

      ColorKnown := false;
      for k := 0 to length(KnownColors) - 1 do
      begin
        if KnownColors[k] = c_obj then ColorKnown := true;
      end;

      // IndexOfObject ist extrem viel langsamer als ein linearer Array-Vergleich!
      // if listbox.Items.IndexOfObject(c_obj) = -1 then
      if not ColorKnown then
      begin
        listbox.Items.AddObject(textausgabe(Color32ToColor(c)), c_obj);
        lbl_farben_value.caption := IntToStr(listbox.Count);

        setlength(KnownColors, length(KnownColors)+1);
        KnownColors[length(KnownColors)-1] := c_obj;
      end;
    end;

    if ProgressPanel.Checked and (i mod actrate.Value = 0) then
    begin
      Application.ProcessMessages;
    end;
  end;

  Application.ProcessMessages;

  shape.visible := false;
  shape.Pen.Color := clMaroon;
  shape.Brush.Color := clRed;

  ColorReanalyzingNecessary := false;

  ControlAct(true);
end;

procedure TMainForm.btn_open_click(Sender: TObject);
begin
  if dlg_open.Execute then
  begin
    try
      image.Bitmap.LoadFromFile(dlg_open.FileName);
      ColorReanalyzingNecessary := true;
      shape.Width := image.Width + 2;
      OneFileLoaded := true;
      btn_save.Enabled := true;
      btn_markentf.Enabled := false;
      listbox.Items.Clear;
      border.Bitmap.Width := image.Width + 2 * MarkerBorderWidth;
      border.Bitmap.Height := image.Height + 2 * MarkerBorderWidth;
      border.Bitmap.Clear;
      application.ProcessMessages;
    except
      MessageDlg(lng_erroropen, mtError, [mbOK], 0);
    end;

    if pnl_coloranalyzer.Visible then
    begin
      BackupFarbe.Assign(image.Bitmap);
      AnalyzeColors;
    end;

    if pnl_antiline.Visible then
    begin
      if not HasLinePixels then
        AntiLineHaken(true)
      else
        AntiLineHaken(false);
    end;
  end;
end;

procedure TMainForm.btn_save_click(Sender: TObject);
begin
  if dlg_save.Execute then
  begin
    image.Bitmap.SaveToFile(dlg_save.FileName);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned(BackupFarbe) then BackupFarbe.free;
  SaveConfiguration;
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
const
  VK_ESC = 27;
begin
  if key = chr(VK_ESC) then close;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  puls := 0;
  DoubleBuffered := true;
  image_scrollbox.DoubleBuffered := true;
  indicator_ver.ClientWidth := 1;
  indicator_hor.ClientHeight := 1;
  btn_open.SetFocus;
  LoadConfiguration;
end;

procedure TMainForm.ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer; Layer: TCustomLayer);
var
  c: TColor32;
  c_obj: TObject;
begin
  if not pnl_coloranalyzer.Visible then exit;
  if not image.Enabled then exit;

  indicator_ver.Left := x;
  indicator_ver.Top := image.Top;
  indicator_ver.Height := image.Height;
  //indicator_ver.Width := image.Width;

  indicator_hor.Top := y;
  indicator_hor.Left := image.Left;
  //indicator_hor.Height := image.Height;
  indicator_hor.Width := image.Width;

  c := BackupFarbe.PixelS[x, y];
  c_obj := pointer(Color32ToColor(c));
  if listbox.items.IndexOfObject(c_obj) <> -1 then
  begin
    listbox.Selected[listbox.items.IndexOfObject(c_obj)] := true;
    listbox.SetFocus;
  end;
end;

procedure TMainForm.ImageMouseLeave(Sender: TObject);
begin
  if not pnl_coloranalyzer.Visible then exit;
  if not image.Enabled then exit;

  PulsTimer.enabled := false;
  indicator_ver.Visible := false;
  indicator_hor.Visible := false;
end;

procedure TMainForm.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
var
  c: TColor;
begin
  if not pnl_coloranalyzer.Visible then exit;
  if not image.Enabled then exit;

  ControlAct(false);
  btn_markentf.Enabled := false;

  c := Color32ToColor(BackupFarbe.PixelS[x, y]);
  highlight(c);

  ControlAct(true);
  btn_markentf.Enabled := true;

  if listbox.items.IndexOfObject(pointer(c)) <> -1 then
  begin
    listbox.Selected[listbox.items.IndexOfObject(pointer(c))] := true;
    listbox.SetFocus;
  end;
end;

(* function Heller(Color: TColor; Wert: Integer): TColor;
begin
  result := ColorAdjustLuma(Color, Wert, false);
end; *)

procedure TMainForm.listbox_drawitem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  col: TColor;
begin
  with Control as TListBox do
  begin
    if Index >= Items.Count then exit;
    col := TColor(Items.Objects[Index]);
    Canvas.Brush.Color := col;
    Canvas.FillRect(Rect);
    Canvas.Font.Color := TextContrastColor(col);
    Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
  end;
end;

procedure TMainForm.tmr_puls_timer(Sender: TObject);
begin
  if pulsrev then
  begin
    if puls - CrossPuls.Value <= 0 then pulsrev := not pulsrev;
    dec(puls, CrossPuls.Value);
  end
  else
  begin
    if puls + CrossPuls.Value >= 255 then pulsrev := not pulsrev;
    inc(puls, CrossPuls.Value);
  end;

  indicator_ver.Color := HSLtoRGB(puls, 255, 128);
  indicator_hor.Color := indicator_ver.Color;
end;

procedure TMainForm.indicator_MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ImageMouseDown(Sender, Button, Shift, TWinControl(Sender).Left + X,
    TWinControl(Sender).Top + Y, image.Layers.MouseListener (** OK? **));
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  listbox.height := pnl_coloranalyzer.Height - listbox.Top - pnl_color_bottom.Height - 8;
end;

procedure TMainForm.ImageMouseEnter(Sender: TObject);
begin
  if not pnl_coloranalyzer.Visible then exit;
  if not image.Enabled then exit;

  PulsTimer.enabled := true;
  indicator_ver.Visible := true;
  indicator_hor.Visible := true;
end;

procedure TMainForm.indicator_verMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  indicator_hor.Top := TWinControl(Sender).Top + y;
end;

procedure TMainForm.indicator_horMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  indicator_ver.Left := TWinControl(Sender).Left + x;
end;

procedure TMainForm.Namengeben1Click(Sender: TObject);
var
  r: string;
begin
  if listbox.ItemIndex = -1 then exit;
  InputQuery(lng_name_cap, lng_name_txt, r);
  if r <> '' then
  begin
    listbox.Items.Strings[listbox.ItemIndex] := r;
  end;
end;

procedure TMainForm.listboxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // Mausposition auf bessere Art und Weise herausfinden
  popupmenu.Popup(pnl_right.Left + listbox.Left + x,
                  pnl_right.Top  + listbox.Top  + y);
end;

procedure TMainForm.Markcolor1Click(Sender: TObject);
begin
  ControlAct(false);
  btn_markentf.Enabled := false;

  highlight(TColor(listbox.Items.Objects[listbox.ItemIndex]));

  ControlAct(true);
  btn_markentf.Enabled := true;

  listbox.Selected[listbox.ItemIndex] := true;
  listbox.SetFocus;
end;

procedure TMainForm.Farbinformationen1Click(Sender: TObject);
begin
  ShowMessage(textausgabe(TColor(listbox.Items.Objects[listbox.ItemIndex])));
end;

procedure TMainForm.ToolsClick(Sender: TObject);
begin
  if pnl_coloranalyzer.Visible and (Sender = BtnToolCA) then exit;
  if pnl_colorchanger.Visible and (Sender = BtnToolCC) then exit;
  if pnl_antiline.Visible and (Sender = BtnToolAL) then exit;
  if pnl_antiescape.Visible and (Sender = BtnToolAE) then exit;
  if pnl_blackwhite.Visible and (Sender = BtnToolSW) then exit;
  if pnl_multiply.Visible and (Sender = BtnToolMultiply) then exit;
  if pnl_misc.Visible and (Sender = BtnToolMisc) then exit;

  pnl_coloranalyzer.Visible := Sender = BtnToolCA;
  pnl_colorchanger.Visible := Sender = BtnToolCC;
  pnl_antiline.Visible := Sender = BtnToolAL;
  pnl_antiescape.Visible := Sender = BtnToolAE;
  pnl_blackwhite.Visible := Sender = BtnToolSW;
  pnl_multiply.Visible := Sender = BtnToolMultiply;
  pnl_misc.Visible := Sender = BtnToolMisc;

  if Sender = BtnToolCA then
  begin
    FormResize(self); // Workaround wegen wsMaximized
    BackupFarbe.Assign(image.Bitmap);
    AnalyzeColors;
    image.Cursor := crNone;
  end
  else
  begin
    if btn_markentf.Enabled then btn_markentf.Click;
    image.Cursor := crDefault;
    border.Bitmap.Clear;
  end;

  if Sender = BtnToolAL then
  begin
    if not HasLinePixels then
      AntiLineHaken(true)
    else
      AntiLineHaken(false);
  end;

  if Sender = BtnToolAE then
  begin
    showmessage(lng_ae_warnung);
  end;

  if Sender = BtnToolSW then
  begin
    showmessage(lng_sw_warnung);
  end;
end;

procedure TMainForm.ControlAct(state: boolean);
begin
  // Allgemein
  image.Enabled := state;
  btn_open.Enabled := state;
  btn_save.Enabled := state and OneFileLoaded;

  // Anti Line
  RightDownBtn.Enabled := state;
  DownBtn.Enabled := state;
  LeftDownBtn.Enabled := state;
  RightBtn.Enabled := state;
  LeftBtn.Enabled := state;
  RightTopBtn.Enabled := state;
  UpBtn.Enabled := state;
  LeftUpBtn.Enabled := state;
  AutoBtnA.Enabled := state;
  AutoBtnB.Enabled := state;
  ColorAntiLine.Enabled := state;

  // Coloranalyzer
  listbox.Enabled := state;
  btn_farbtabelle.Enabled := state and OneFileLoaded;
  // btn_markentf wird hier nicht verändert!
  if not state then PulsTimer.Enabled := state;
  if not state then indicator_ver.Visible := state;
  if not state then indicator_hor.Visible := state;
  ColorBorderSelect.Enabled := state;
  ColorMarkSelect.Enabled := state;

  // Hauptmenü
  BtnToolCA.Enabled := state;
  BtnToolCC.Enabled := state;
  BtnToolAL.Enabled := state;
  BtnToolAE.Enabled := state;
  BtnToolSW.Enabled := state;
  BtnToolMisc.Enabled := state;

  // Anti Escape
  BtnAntiEscapeStart.Enabled := state;
  ColorEscapeColor.Enabled := state;
  ColorEscapeLinie.Enabled := state;

  // Color Changer
  BtnColorReplace.Enabled := state;
  BtnColorSwap.Enabled := state;
  ColorChangerDest.Enabled := state;
  ColorChangerSource.Enabled := state;

  // SW Maker
  MakeSW.Enabled := state;
  SWGrenze.Enabled := state;

  // Sonstiges
  BtnUpdate.Enabled := state;
  BtnTutorial.Enabled := state;
  CrossPuls.Enabled := state;
  ProgressPanel.Enabled := state;
  if state then
    ProgressPanelClick(Self) // Status von ActRate ggf. noch Disabled
  else
    ActRate.Enabled := false;

  application.ProcessMessages;
end;

function TMainForm.CountLinePixels: Integer;
var
  l, t: integer;
begin
  result := 0;
  for t := 0 to image.Bitmap.Height - 1 do
  begin
    for l := 0 to image.Bitmap.Width - 1 do
    begin
      if image.Bitmap.PixelS[l, t] = Color32(ColorAntiLine.Color) then
      begin
        inc(result);
      end;
    end;
  end;
end;

function TMainForm.HasLinePixels: boolean;
var
  l, t: integer;
begin
  result := false;
  for t := 0 to image.Bitmap.Height - 1 do
  begin
    for l := 0 to image.Bitmap.Width - 1 do
    begin
      if image.Bitmap.PixelS[l, t] = Color32(ColorAntiLine.Color) then
      begin
        result := true;
        exit;
      end;
    end;
  end;
end;

procedure TMainForm.AutoBtnAClick(Sender: TObject);
var
  pixcount: integer;
begin
  ControlAct(false);

  repeat
    // Verhindern, dass eine Endlosschleife entsteht
    pixcount := CountLinePixels;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(-1, +0); // RightBtn.Click;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(+1, +0); // LeftBtn.Click;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(+0, -1); // DownBtn.Click;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(+0, +1); // UpBtn.Click;

    if CountLinePixels = pixcount then break;
  until false;

  if not HasLinePixels then AntiLineHaken(true);

  ControlAct(true);
end;

procedure TMainForm.AntiLineProcess(lv, tv: integer);

  procedure Inner(t, l: integer);
  var
    c: TColor32;
  begin
    c := Color32(ColorAntiLine.Color);

    if l+lv < 0 then exit;
    if t+tv < 0 then exit;
    if l+lv > image.Bitmap.Width - 1 then exit;
    if t+tv > image.Bitmap.Height - 1 then exit;

    if (image.Bitmap.PixelS[l+lv, t+tv] <> c) and
       (image.Bitmap.PixelS[l, t] = c) then
    begin
      image.Bitmap.PixelS[l, t] := image.Bitmap.PixelS[l+lv, t+tv];
      ColorReanalyzingNecessary := true;
    end;
  end;

var
  t, l: integer;
begin
  if tv = -1 then
  begin
    for t := image.Bitmap.height - 1 downto 0 do
    begin
      if lv = -1 then
      begin
        for l := image.Bitmap.width - 1 downto 0 do
        begin
          Inner(t, l);
          if Application.Terminated then break;
        end;
      end
      else
      begin
        for l := 0 to image.Bitmap.width - 1 do
        begin
          Inner(t, l);
          if Application.Terminated then break;
        end;
      end;
      (* if Arbeitslaufbalken.Checked and (t mod actrate.Value = 0) then
      begin
        image.Repaint;
        application.ProcessMessages;
      end; *)
    end;
  end
  else
  begin
    for t := 0 to image.Bitmap.Height - 1 do
    begin
      if lv = -1 then
      begin
        for l := image.Bitmap.Width - 1 downto 0 do
        begin
          Inner(t, l);
          if Application.Terminated then break;
        end;
      end
      else
      begin
        for l := 0 to image.Bitmap.Width - 1 do
        begin
          Inner(t, l);
          if Application.Terminated then break;
        end;
      end;
      (* if Arbeitslaufbalken.Checked and (t mod actrate.Value = 0) then
      begin
        image.Repaint;
        application.ProcessMessages;
      end; *)
    end;
  end;

  image.Repaint;
  application.ProcessMessages;
end;

procedure TMainForm.AntiLinesClicks(Sender: TObject);
begin
  ControlAct(false);
  if Sender = RightDownBtn then AntiLineProcess(-1, -1);
  if Sender = DownBtn      then AntiLineProcess(+0, -1);
  if Sender = LeftDownBtn  then AntiLineProcess(+1, -1);
  if Sender = RightBtn     then AntiLineProcess(-1, +0);
  if Sender = LeftBtn      then AntiLineProcess(+1, +0);
  if Sender = RightTopBtn  then AntiLineProcess(-1, +1);
  if Sender = UpBtn        then AntiLineProcess(+0, +1);
  if Sender = LeftUpBtn    then AntiLineProcess(+1, +1);

  if not HasLinePixels then
    AntiLineHaken(true)
  else
    AntiLineHaken(false);

  ControlAct(true);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // VCL's erstellen (Turbo Delphi Explorer Kompatibilität)

  border := TImage32.Create(image_scrollbox);
  border.Parent := image_scrollbox;
  border.Color := clBlack;
  border.Left := 0;
  border.Top := 0;
  border.AutoSize := true;
  border.OnMouseDown := ImageMouseDown;
  border.OnMouseEnter := ImageMouseEnter;
  border.OnMouseLeave := ImageMouseLeave;
  border.OnMouseMove := ImageMouseMove;

  image := TImage32.Create(border);
  image.Parent := border;
  image.Color := clBlack;
  image.Left := 1;
  image.Top := 1;
  image.AutoSize := true;
  image.OnMouseDown := ImageMouseDown;
  image.OnMouseEnter := ImageMouseEnter;
  image.OnMouseLeave := ImageMouseLeave;
  image.OnMouseMove := ImageMouseMove;

  Shape := TShape.Create(image);
  Shape.Parent := image;
  Shape.Brush.Color := clRed;
  Shape.Pen.Color := clMaroon;
  Shape.Visible := false;
  Shape.Height := 5;

  indicator_hor := TPanel.Create(image);
  indicator_hor.Parent := image;
  indicator_hor.BevelOuter := bvNone;
  indicator_hor.Color := clRed;
  indicator_hor.Visible := false;
  indicator_hor.OnMouseDown := indicator_MouseDown;
  indicator_hor.OnMouseMove := indicator_horMouseMove;

  indicator_ver := TPanel.Create(image);
  indicator_ver.Parent := image;
  indicator_ver.BevelOuter := bvNone;
  indicator_ver.Color := clRed;
  indicator_ver.Visible := false;
  indicator_ver.OnMouseDown := indicator_MouseDown;
  indicator_ver.OnMouseMove := indicator_verMouseMove;

  // Weiter...

  BackupFarbe := TBitmap32.Create;
  shape.Left := 0;
  indicator_hor.Cursor := crNone;
  indicator_ver.Cursor := crNone;
  image.Top := MarkerBorderWidth;
  image.Left := MarkerBorderWidth;

  Constraints.MinWidth := BtnToolMisc.Left + BtnToolMisc.Width + 8 + pnl_right.Width;
end;

procedure TMainForm.PopupMenuPopup(Sender: TObject);
var
  e: boolean;
begin
  e := listbox.ItemIndex <> -1;
  Markcolor1.Enabled := e;
  Namengeben1.Enabled := e;
  Farbinformationen1.Enabled := e;
  Namenzurcksetzen1.Enabled := e;
end;

procedure TMainForm.AntiEscape;
var
  i, j: integer;
  s, r: TColor32;
begin
  s := Color32(ColorEscapeLinie.Color);
  r := Color32(ColorEscapeColor.Color);

  ControlAct(false);
  shape.Visible := ProgressPanel.Checked;

  // Im 3x3 Raster (1x1 Pixelfortschreiten) werden
  // Diagonalen, Sekrechten und Waagerechten
  // auf eine 1 Nichtschwarzpixel-Lücke zwischen 2 Schwarzen durch
  // einen Roten Pixel ersetzt
  for j := 0 to image.Bitmap.Height - 1 do
  begin
    if Application.Terminated then break;
    shape.top := j - Shape.Height div 2 + image.top;

    for i := 0 to image.Bitmap.Width - 1 do
    begin
      if Application.Terminated then break;

      // 3x3 Waagerecht
      if  (image.Bitmap.PixelS[i+0, j+0] =  s)
      and (image.Bitmap.PixelS[i+1, j+0] <> s)
      and (image.Bitmap.PixelS[i+2, j+0] =  s)
      and (image.Bitmap.PixelS[i+1, j+1] <> s) // Zusatzregel
      and (image.Bitmap.PixelS[i+1, j-1] <> s) // Zusatzregel
      then
      begin
        image.Bitmap.PixelS[i+1, j+0] := r;
        ColorReanalyzingNecessary := true;
      end;

      // 3x3 Senkrecht
      if  (image.Bitmap.PixelS[i+0, j+0] =  s)
      and (image.Bitmap.PixelS[i+0, j+1] <> s)
      and (image.Bitmap.PixelS[i+0, j+2] =  s)
      and (image.Bitmap.PixelS[i-1, j+1] <> s) // Zusatzregel
      and (image.Bitmap.PixelS[i+1, j+1] <> s) // Zusatzregel
      then
      begin
        image.Bitmap.PixelS[i+0, j+1] := r;
        ColorReanalyzingNecessary := true;
      end;

      // 3x3 Linksoben nach Rechtsunten
      if  (image.Bitmap.PixelS[i+0, j+0] =  s)
      and (image.Bitmap.PixelS[i+1, j+1] <> s)
      and (image.Bitmap.PixelS[i+2, j+2] =  s) then
      begin
        image.Bitmap.PixelS[i+1, j+1] := r;
        ColorReanalyzingNecessary := true;
      end;

      // 3x3 Rechtsoben nach Linksunten
      if  (image.Bitmap.PixelS[i+2, j+0] =  s)
      and (image.Bitmap.PixelS[i+1, j+1] <> s)
      and (image.Bitmap.PixelS[i+0, j+2] =  s) then
      begin
        image.Bitmap.PixelS[i+1, j+1] := r;
        ColorReanalyzingNecessary := true;
      end;

      // 2x3 (Waagerecht) Linksoben nach Rechtsunten
      if  (image.Bitmap.PixelS[i+0, j+0] =  s)
      and (image.Bitmap.PixelS[i+1, j+0] <> s)
      and (image.Bitmap.PixelS[i+1, j+1] <> s)
      and (image.Bitmap.PixelS[i+2, j+1] =  s) then
      begin
        image.Bitmap.PixelS[i+1, j+0] := r;
        ColorReanalyzingNecessary := true;
      end;

      // 2x3 (Waagerecht) Rechtsoben nach Linksunten
      if  (image.Bitmap.PixelS[i+0, j+1] =  s)
      and (image.Bitmap.PixelS[i+1, j+0] <> s)
      and (image.Bitmap.PixelS[i+1, j+1] <> s)
      and (image.Bitmap.PixelS[i+2, j+0] =  s) then
      begin
        image.Bitmap.PixelS[i+1, j+1] := r;
        ColorReanalyzingNecessary := true;
      end;

      // 3x2 (Senkrecht) Linksoben nach Rechtsunten
      if  (image.Bitmap.PixelS[i+0, j+0] =  s)
      and (image.Bitmap.PixelS[i+0, j+1] <> s)
      and (image.Bitmap.PixelS[i+1, j+1] <> s)
      and (image.Bitmap.PixelS[i+1, j+2] =  s) then
      begin
        image.Bitmap.PixelS[i+0, j+1] := r;
        ColorReanalyzingNecessary := true;
      end;

      // 3x2 (Senkrecht) Linksunten nach Rechtssoben
      if  (image.Bitmap.PixelS[i+1, j+0] =  s)
      and (image.Bitmap.PixelS[i+0, j+1] <> s)
      and (image.Bitmap.PixelS[i+1, j+1] <> s)
      and (image.Bitmap.PixelS[i+0, j+2] =  s) then
      begin
        image.Bitmap.PixelS[i+1, j+1] := r;
        ColorReanalyzingNecessary := true;
      end;
    end;

    if ProgressPanel.Checked and (j mod actrate.Value = 0) then
    begin
      image.Repaint;
      border.Repaint;
      Application.ProcessMessages;
    end;
  end;

  image.Repaint;
  border.Repaint;
  Application.ProcessMessages;

  shape.Visible := false;
  ControlAct(true);
end;

procedure TMainForm.BtnAntiEscapeStartClick(Sender: TObject);
begin
  AntiEscape;
end;

procedure TMainForm.BtnTutorialClick(Sender: TObject);
begin
  (* if FileExists(tut) then
  begin
    ShellExecute(Application.handle, 'open', tut, '', '', sw_normal);
  end
  else
  begin
    ShowMessageFmt(lng_tut_not_found, [tut]);
  end; *)

  ShellExecute(Application.handle, 'open', tut_url, '', '', sw_normal);
end;

procedure TMainForm.BtnColorReplaceClick(Sender: TObject);
var
  x, y: integer;
begin
  shape.Top := 0 - shape.Height div 2;

  shape.Visible := ProgressPanel.Checked;
  ControlAct(false);

  for y := 0 to image.Bitmap.Height - 1 do
  begin
    shape.Top := shape.Top + 1;

    for x := 0 to image.Bitmap.Width - 1 do
    begin
      if image.Bitmap.PixelS[x, y] = Color32(ColorChangerSource.Color) then
      begin
        image.Bitmap.PixelS[x, y] := Color32(ColorChangerDest.Color);
        ColorReanalyzingNecessary := true;
      end;
    end;

    if ProgressPanel.Checked and (y mod actrate.Value = 0) then
    begin
      image.Repaint;
      Application.ProcessMessages;
    end;
  end;

  image.Repaint;
  Application.ProcessMessages;

  shape.Visible := false;
  ControlAct(true);
end;

procedure TMainForm.BtnColorSwapClick(Sender: TObject);
var
  x, y: integer;
begin
  shape.Top := 0 - shape.Height div 2;

  shape.Visible := ProgressPanel.Checked;
  ControlAct(false);

  for y := 0 to image.Bitmap.Height - 1 do
  begin
    shape.Top := shape.Top + 1;

    for x := 0 to image.Bitmap.Width - 1 do
    begin
      if image.Bitmap.PixelS[x, y] = Color32(ColorChangerSource.Color) then
      begin
        image.Bitmap.PixelS[x, y] := Color32(ColorChangerDest.Color);
        ColorReanalyzingNecessary := true;
      end
      else if image.Bitmap.PixelS[x, y] = Color32(ColorChangerDest.Color) then
      begin
        image.Bitmap.PixelS[x, y] := Color32(ColorChangerSource.Color);
        ColorReanalyzingNecessary := true;
      end;
    end;

    if ProgressPanel.Checked and (y mod actrate.Value = 0) then
    begin
      image.Repaint;
      Application.ProcessMessages;
    end;
  end;

  image.Repaint;
  Application.ProcessMessages;

  shape.Visible := false;
  ControlAct(true);
end;

procedure TMainForm.BtnUpdateClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', vts_url, '', '', sw_normal);
end;

procedure TMainForm.Namenzurcksetzen1Click(Sender: TObject);
var
  r: string;
begin
  if listbox.ItemIndex = -1 then exit;
  r := textausgabe(TColor(listbox.Items.Objects[listbox.ItemIndex]));
  listbox.Items.Strings[listbox.ItemIndex] := r;
end;

procedure TMainForm.ColorSelect(Sender: TObject);
var
  col: TColor;
begin
  ColorForm.FColorChoose := TPanel(Sender).Color;

  // Workaround: http://www.delphipraxis.net/topic75743,0,asc,0.html
  // TODO: COMPILER-DIREKTIVE
  // ColorForm.PopupParent := Screen.ActiveForm;

  if ColorForm.ShowModal = IDOK then
  begin
    col := ColorForm.FColorChoose;

    TPanel(Sender).Color := col;
    TPanel(Sender).Font.Color := TextContrastColor(col);

    if Sender = ColorAntiLine then
    begin
      if not HasLinePixels then
        AntiLineHaken(true)
      else
        AntiLineHaken(false);
    end;
  end;
end;

procedure TMainForm.AutoBtnBClick(Sender: TObject);
var
  pixcount: integer;
begin
  ControlAct(false);

  repeat
    // Verhindern, dass eine Endlosschleife entsteht
    pixcount := CountLinePixels;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(-1, -1); // RightDownBtn.Click;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(+1, -1); // LeftDownBtn.Click;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(-1, +1); // RightTopBtn.Click;

    if not HasLinePixels or Application.Terminated then break;
    AntiLineProcess(+1, +1); // LeftUpBtn.Click;

    if CountLinePixels = pixcount then break;
  until false;

  if not HasLinePixels then AntiLineHaken(true);

  ControlAct(true);
end;

procedure TMainForm.AntiLineHaken(Haken: boolean);
begin
  if Haken then
  begin
    ColorAntiLine.Caption := 'ü'; // Haken
    ColorAntiLine.Hint := lng_anti_escape_hint + lng_anti_escape_finished;
  end
  else
  begin
    ColorAntiLine.Caption := '';
    ColorAntiLine.Hint := lng_anti_escape_hint;
  end;
end;

procedure TMainForm.ProgressPanelClick(Sender: TObject);
begin
  LblActRate.Enabled := TCheckBox(Sender).Checked;
  ActRate.Enabled := TCheckBox(Sender).Checked;
end;

procedure TMainForm.SaveConfiguration;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey(ckey, true) then
    begin
      reg.WriteBool(ProgressPanel.Name, ProgressPanel.Checked);
      reg.WriteInteger(ActRate.Name, ActRate.Value);
      reg.WriteInteger(SWGrenze.Name, SWGrenze.Value);
      reg.WriteInteger(CrossPuls.Name, CrossPuls.Value);
      reg.WriteInteger(ColorEscapeColor.Name, ColorEscapeColor.Color);
      reg.WriteInteger(ColorEscapeLinie.Name, ColorEscapeLinie.Color);
      reg.WriteInteger(ColorAntiLine.Name, ColorAntiLine.Color);
      reg.WriteInteger(ColorBorderSelect.Name, ColorBorderSelect.Color);
      reg.WriteInteger(ColorMarkSelect.Name, ColorMarkSelect.Color);
      reg.WriteInteger(ColorChangerDest.Name, ColorChangerDest.Color);
      reg.WriteInteger(ColorChangerSource.Name, ColorChangerSource.Color);
      reg.CloseKey;
    end;
  finally
    reg.Free;
  end;

  ColorForm.SaveConfiguration;
end;

procedure TMainForm.LoadConfiguration;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKeyReadOnly(ckey) then
    begin
      if reg.ValueExists(ProgressPanel.Name) then
      begin
        ProgressPanel.Checked := reg.ReadBool(ProgressPanel.Name);
        ProgressPanelClick(Self);
      end;

      if reg.ValueExists(ActRate.Name) then
        ActRate.Value := reg.ReadInteger(ActRate.Name);

      if reg.ValueExists(SWGrenze.Name) then
        SWGrenze.Value := reg.ReadInteger(SWGrenze.Name);

      if reg.ValueExists(CrossPuls.Name) then
        CrossPuls.Value := reg.ReadInteger(CrossPuls.Name);

      if reg.ValueExists(ColorEscapeColor.Name) then
        ColorEscapeColor.Color := reg.ReadInteger(ColorEscapeColor.Name);

      if reg.ValueExists(ColorEscapeLinie.Name) then
        ColorEscapeLinie.Color := reg.ReadInteger(ColorEscapeLinie.Name);

      if reg.ValueExists(ColorAntiLine.Name) then
      begin
        ColorAntiLine.Color := reg.ReadInteger(ColorAntiLine.Name);
        if not HasLinePixels then
          AntiLineHaken(true)
        else
          AntiLineHaken(false);
      end;

      if reg.ValueExists(ColorBorderSelect.Name) then
        ColorBorderSelect.Color := reg.ReadInteger(ColorBorderSelect.Name);

      if reg.ValueExists(ColorMarkSelect.Name) then
        ColorMarkSelect.Color := reg.ReadInteger(ColorMarkSelect.Name);

      if reg.ValueExists(ColorChangerDest.Name) then
        ColorChangerDest.Color := reg.ReadInteger(ColorChangerDest.Name);

      if reg.ValueExists(ColorChangerSource.Name) then
        ColorChangerSource.Color := reg.ReadInteger(ColorChangerSource.Name);

      reg.CloseKey;
    end;
  finally
    reg.Free;
  end;

  ColorForm.LoadConfiguration;
end;

procedure TMainForm.MakeSWClick(Sender: TObject);
var
  h, w, intens, grenze: integer;
begin
  ControlAct(false);

  shape.Top := 0 - shape.Height div 2;
  shape.Visible := ProgressPanel.Checked;

  grenze := SWGrenze.Value;

  for h := 0 to image.Bitmap.height - 1 do
  begin
    if Application.Terminated then break;
    shape.Top := shape.Top + 1;

    for w := 0 to image.Bitmap.width - 1 do
    begin
      if Application.Terminated then break;
      intens := Intensity(image.Bitmap.PixelS[w, h]);

      // Graustufe:
      // image.Bitmap.PixelS[w, h] := Gray32(intens, 0);

      // Fallunterscheidung S/W
      if intens >= grenze then
        image.Bitmap.PixelS[w, h] := clWhite
      else
        image.Bitmap.PixelS[w, h] := clBlack;

      ColorReanalyzingNecessary := true;
    end;

    if ProgressPanel.Checked and (h mod actrate.Value = 0) then
    begin
      image.Repaint;
      application.ProcessMessages;
    end;
  end;

  image.Repaint;
  Application.ProcessMessages;

  shape.Visible := false;
  ControlAct(true);
end;

function MultiplyColors(c1, c2: TColor32): TColor32;
var
  r, g, b: byte;
begin
  r := round(RedComponent(c1) / 255 * RedComponent(c2));
  g := round(GreenComponent(c1) / 255 * GreenComponent(c2));
  b := round(BlueComponent(c1) / 255 * BlueComponent(c2));
  result := Color32(r, g, b);
end;

procedure TMainForm.BtnLetMultiplyClick(Sender: TObject);
var
  lay2: TBitmap32;
  c1, c2: TColor32;
  i, j: integer;
begin
  if dlg_open2.Execute then
  begin
    lay2 := TBitmap32.Create;
    try
      lay2.LoadFromFile(dlg_open2.FileName);
      if (lay2.Width <> image.Width) or (lay2.Height <> image.Height) then
      begin
        showmessage('Warnung! Die Bilder sind unterschiedlich groß. Das Ergebnis könnte unerwünscht sein.');
        // TODO: Ggf. Möglichkeit zum Abbrechen bieten
      end;

      ControlAct(false);

      shape.Top := 0 - shape.Height div 2;
      shape.Pen.Color := clOlive;
      shape.Brush.Color := clYellow;
      shape.visible := ProgressPanel.Checked;

      for i := 0 to image.Bitmap.height - 1 do
      begin
        if Application.Terminated then break;
        if i >= lay2.Height then break;

        shape.top := shape.top + 1;

        for j := 0 to image.Bitmap.width - 1 do
        begin
          if Application.Terminated then break;
          if j >= lay2.Width then break;

          c1 := image.Bitmap.PixelS[j, i];
          c2 := lay2.PixelS[j, i];

          image.Bitmap.PixelS[j, i] := MultiplyColors(c1, c2);

          ColorReanalyzingNecessary := true;
        end;

        if ProgressPanel.Checked and (i mod actrate.Value = 0) then
        begin
          image.Repaint;
          Application.ProcessMessages;
        end;
      end;

      image.Repaint;
      Application.ProcessMessages;

      shape.visible := false;
      shape.Pen.Color := clMaroon;
      shape.Brush.Color := clRed;

      ControlAct(true);
    finally;
      lay2.Free;
    end;
  end;
end;

end.
