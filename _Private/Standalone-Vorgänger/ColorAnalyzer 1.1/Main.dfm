object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'ColorAnalyzer'
  ClientHeight = 411
  ClientWidth = 593
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = Form_Close
  OnKeyPress = Form_KeyPress
  OnShow = Form_Show
  PixelsPerInch = 96
  TextHeight = 13
  object scrollbox: TScrollBox
    Left = 0
    Top = 0
    Width = 408
    Height = 411
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object image_border: TImage
      Left = 0
      Top = 0
      Width = 0
      Height = 0
      Visible = False
    end
    object image: TImage
      Left = 0
      Top = 0
      Width = 0
      Height = 0
      AutoSize = True
      Visible = False
      OnMouseDown = image_MouseDown
      OnMouseLeave = image_MouseLeave
      OnMouseMove = image_MouseMove
    end
    object shape: TShape
      Left = 0
      Top = 0
      Width = 65
      Height = 5
      Brush.Color = clRed
      Pen.Color = clMaroon
      Visible = False
    end
    object shape_hor: TShape
      Left = 8
      Top = 40
      Width = 25
      Height = 25
      Cursor = crCross
      Brush.Color = clLime
      Pen.Color = clYellow
      Visible = False
      OnMouseDown = shape_var_click
    end
    object shape_ver: TShape
      Left = 40
      Top = 40
      Width = 25
      Height = 25
      Cursor = crCross
      Brush.Color = clLime
      Pen.Color = clYellow
      Visible = False
      OnMouseDown = shape_var_click
    end
  end
  object pnl_right: TPanel
    Left = 408
    Top = 0
    Width = 185
    Height = 411
    Align = alRight
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 1
    object lbl_title: TLabel
      Left = 8
      Top = 8
      Width = 99
      Height = 13
      Caption = 'ColorAnalyzer 1.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_farben_name: TLabel
      Left = 8
      Top = 224
      Width = 65
      Height = 13
      Caption = 'Farbanzahl:'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lbl_farben_value: TLabel
      Left = 80
      Top = 224
      Width = 7
      Height = 13
      Caption = '0'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object btn_exit: TButton
      Left = 8
      Top = 376
      Width = 169
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = 'Beenden'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn_exit_click
    end
    object listbox: TListBox
      Left = 8
      Top = 24
      Width = 169
      Height = 193
      Style = lbOwnerDrawFixed
      Color = clGray
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnClick = listbox_click
      OnDrawItem = listbox_drawitem
    end
    object btn_open: TButton
      Left = 8
      Top = 312
      Width = 169
      Height = 25
      Cursor = crHandPoint
      Caption = 'Bild '#246'ffnen'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn_open_click
    end
    object btn_markentf: TButton
      Left = 8
      Top = 248
      Width = 169
      Height = 25
      Cursor = crHandPoint
      Caption = 'Markierung entfernen'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_markentf_click
    end
    object btn_save: TButton
      Left = 8
      Top = 344
      Width = 169
      Height = 25
      Cursor = crHandPoint
      Caption = 'Abbildung speichern'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_save_click
    end
    object btn_farbtabelle: TButton
      Left = 8
      Top = 280
      Width = 169
      Height = 25
      Cursor = crHandPoint
      Caption = 'Farbtabelle erstellen'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn_farbtabelle_click
    end
  end
  object dlg_open: TOpenDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmap (*.bmp)|*.bmp|Alle Dateien (*.*)|*.*'
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 8
  end
  object dlg_save: TSaveDialog
    DefaultExt = '.bmp'
    Filter = 'Bitmap (*.bmp)|*.bmp|Alle Dateien (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 8
  end
  object dlg_save_text: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Textdatei (*.txt)|*.txt|Alle Dateien (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 72
    Top = 8
  end
  object tmr_puls: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmr_puls_timer
    Left = 104
    Top = 8
  end
end
