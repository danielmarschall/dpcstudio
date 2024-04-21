unit Color;

{$WARNINGS OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Registry;

type
  TColorForm = class(TForm)
    GrpColorSave: TGroupBox;
    ColorSave01: TPanel;
    ColorSave02: TPanel;
    ColorSave03: TPanel;
    ColorSave04: TPanel;
    ColorSave05: TPanel;
    ColorSave06: TPanel;
    ColorSave07: TPanel;
    ColorSave09: TPanel;
    ColorSave11: TPanel;
    ColorSave12: TPanel;
    ColorSave13: TPanel;
    ColorSave08: TPanel;
    ColorSave14: TPanel;
    ColorSave15: TPanel;
    ColorSave16: TPanel;
    ColorSave10: TPanel;
    ColorSave20: TPanel;
    ColorSave21: TPanel;
    ColorSave22: TPanel;
    ColorSave17: TPanel;
    ColorSave23: TPanel;
    ColorSave24: TPanel;
    ColorSave25: TPanel;
    ColorSave26: TPanel;
    ColorSave19: TPanel;
    ColorSave27: TPanel;
    ColorSave18: TPanel;
    LblMouseBtn: TLabel;
    GrpOther: TGroupBox;
    ColorWindows: TPanel;
    LbxBildfarben: TListBox;
    OKBtn: TButton;
    CancelBtn: TButton;
    dlg_color: TColorDialog;
    LblFarbenImBild: TLabel;
    LblFarbe: TLabel;
    LblWinExplain1: TLabel;
    LblWinExplain2: TLabel;
    procedure ColorSaveMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure ColorWindowsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LbxBildfarbenClick(Sender: TObject);
    procedure LbxBildfarbenDblClick(Sender: TObject);
  public
    FColorChoose: TColor;
    procedure LoadConfiguration;
    procedure SaveConfiguration;
  end;

var
  ColorForm: TColorForm;

implementation

uses Main;

const
  colorsaves = 28;
  ckey = 'Software\ViaThinkSoft\DPC-Studio\Settings\';

{$R *.dfm}

procedure TColorForm.ColorSaveMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FColorChoose := TPanel(Sender).Color;
    ModalResult := mrOk;
  end
  else if Button = mbRight then
  begin
    TPanel(Sender).Color := ColorWindows.Color;
  end;
end;

procedure TColorForm.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TColorForm.OKBtnClick(Sender: TObject);
begin
  FColorChoose := ColorWindows.Color;
  ModalResult := mrOk;
end;

procedure TColorForm.ColorWindowsClick(Sender: TObject);
var
  i: integer;
begin
  if dlg_color.Execute then
  begin
    TPanel(Sender).Color := dlg_color.Color;

    for i := 0 to LbxBildfarben.Items.Count - 1 do
    begin
      if TColor(LbxBildfarben.Items.Objects[i]) = dlg_color.Color then
      begin
        LbxBildfarben.Selected[i] := true;
      end;
    end;
  end;
end;

procedure TColorForm.FormShow(Sender: TObject);
begin
  MainForm.AnalyzeColors;
  LbxBildfarben.Items.Assign(MainForm.listbox.Items);
  LbxBildfarben.OnDrawItem := MainForm.listbox_drawitem;
  LbxBildfarben.ItemIndex := -1;
  ColorWindows.Color := FColorChoose;
end;

procedure TColorForm.LbxBildfarbenClick(Sender: TObject);
begin
  if LbxBildfarben.ItemIndex = -1 then exit;
  ColorWindows.Color := TColor(LbxBildfarben.Items.Objects[LbxBildfarben.ItemIndex]);
end;

procedure TColorForm.LbxBildfarbenDblClick(Sender: TObject);
begin
  LbxBildfarbenClick(Sender);
  if OkBtn.Enabled then OkBtn.Click;
end;

function zweinull(inp: integer): string;
begin
  result := inttostr(inp);
  if length(inttostr(inp)) = 1 then result := '0'+inttostr(inp);
end;

procedure TColorForm.LoadConfiguration;
var
  reg: TRegistry;
  i: integer;
  c: TComponent;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKeyReadOnly(ckey) then
    begin
      for i := 1 to colorsaves do
      begin
        c := ColorForm.FindComponent('ColorSave' + zweinull(i));
        if c <> nil then
        begin
          if reg.ValueExists(TPanel(c).Name) then
          begin
            TPanel(c).Color := reg.ReadInteger(TPanel(c).Name);
          end;
        end;
      end;

      if reg.ValueExists(ColorWindows.Name) then
      begin
        ColorWindows.Color := reg.ReadInteger(ColorWindows.Name);
      end;

      reg.CloseKey;
    end;
  finally
    reg.Free;
  end;
end;

procedure TColorForm.SaveConfiguration;
var
  reg: TRegistry;
  i: integer;
  c: TComponent;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey(ckey, true) then
    begin
      for i := 1 to colorsaves do
      begin
        c := ColorForm.FindComponent('ColorSave' + zweinull(i));
        if c <> nil then
        begin
          reg.WriteInteger(TPanel(c).Name, TPanel(c).Color);
        end;
      end;

      reg.WriteInteger(ColorWindows.Name, ColorWindows.Color);

      reg.CloseKey;
    end;
  finally
    reg.Free;
  end;
end;

end.
