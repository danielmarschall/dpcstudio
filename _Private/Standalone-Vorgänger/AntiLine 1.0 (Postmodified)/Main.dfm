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
    object image: TImage
      Left = 0
      Top = 0
      Width = 0
      Height = 0
      AutoSize = True
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
      Width = 110
      Height = 21
      Caption = 'Anti-Line 1.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object spe_search: TShape
      Left = 72
      Top = 96
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Brush.Color = clBlack
      Pen.Color = clWhite
      OnMouseDown = spe_search_MouseDown
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
      TabOrder = 2
      OnClick = btn_exit_click
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
      TabOrder = 0
      OnClick = btn_open_click
    end
    object btn_dir_1: TButton
      Left = 24
      Top = 48
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #230
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn_dir_click
    end
    object btn_dir_2: TButton
      Left = 72
      Top = 48
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #226
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_dir_click
    end
    object btn_dir_3: TButton
      Left = 120
      Top = 48
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #229
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn_dir_click
    end
    object btn_dir_4: TButton
      Left = 24
      Top = 96
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #224
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btn_dir_click
    end
    object btn_dir_5: TButton
      Left = 120
      Top = 96
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #223
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btn_dir_click
    end
    object btn_dir_6: TButton
      Left = 24
      Top = 144
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #228
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btn_dir_click
    end
    object btn_dir_7: TButton
      Left = 72
      Top = 144
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #225
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btn_dir_click
    end
    object btn_dir_8: TButton
      Left = 120
      Top = 144
      Width = 41
      Height = 41
      Cursor = crHandPoint
      Caption = #227
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Wingdings'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = btn_dir_click
    end
    object btn_auto1: TButton
      Left = 24
      Top = 200
      Width = 137
      Height = 33
      Cursor = crHandPoint
      Caption = 'AUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btn_auto1_click
    end
    object btn_save: TButton
      Left = 8
      Top = 344
      Width = 169
      Height = 25
      Cursor = crHandPoint
      Caption = 'Bild speichern'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_save_click
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
  object dlg_color: TColorDialog
    Left = 72
    Top = 8
  end
end
