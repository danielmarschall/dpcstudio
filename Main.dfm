object MainForm: TMainForm
  Left = 66
  Top = 114
  Caption = 'Digital Plain Color Studio'
  ClientHeight = 136
  ClientWidth = 120
  Color = clBlack
  Constraints.MinHeight = 175
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object pnl_right: TPanel
    Left = -65
    Top = 0
    Width = 185
    Height = 136
    Align = alRight
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 0
    object pnl_control: TPanel
      Left = 0
      Top = 32
      Width = 185
      Height = 105
      Align = alBottom
      BevelOuter = bvNone
      Color = clBlack
      TabOrder = 0
      ExplicitTop = 31
      object btn_exit: TButton
        Left = 8
        Top = 72
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
        TabOrder = 0
        OnClick = btn_exit_click
      end
      object btn_save: TButton
        Left = 8
        Top = 40
        Width = 169
        Height = 25
        Cursor = crHandPoint
        Caption = 'Bild speichern'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btn_save_click
      end
      object btn_open: TButton
        Left = 8
        Top = 8
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
        TabOrder = 2
        OnClick = btn_open_click
      end
    end
    object pnl_multi: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 32
      Align = alClient
      BevelOuter = bvNone
      Color = clBlack
      TabOrder = 1
      ExplicitHeight = 31
      object pnl_colorchanger: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 32
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 1
        Visible = False
        ExplicitHeight = 31
        object TitleColorChanger: TLabel
          Left = 8
          Top = 8
          Width = 121
          Height = 21
          Caption = 'Color Changer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblQuellfarbe: TLabel
          Left = 32
          Top = 56
          Width = 50
          Height = 13
          Caption = 'Quellfarbe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblZielfarbe: TLabel
          Left = 128
          Top = 56
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Zielfarbe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object BtnColorReplace: TButton
          Left = 32
          Top = 152
          Width = 137
          Height = 33
          Cursor = crHandPoint
          Caption = 'Farbe ersetzen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BtnColorReplaceClick
        end
        object BtnColorSwap: TButton
          Left = 32
          Top = 200
          Width = 137
          Height = 33
          Cursor = crHandPoint
          Caption = 'Farbe tauschen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BtnColorSwapClick
        end
        object ColorChangerSource: TPanel
          Left = 32
          Top = 80
          Width = 41
          Height = 41
          Cursor = crHandPoint
          Hint = 'Quellfarbe'
          BevelOuter = bvLowered
          Color = clBlack
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = ColorSelect
        end
        object ColorChangerDest: TPanel
          Left = 128
          Top = 80
          Width = 41
          Height = 41
          Cursor = crHandPoint
          Hint = 'Zielfarbe'
          BevelOuter = bvLowered
          Color = clBlack
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = ColorSelect
        end
      end
      object pnl_coloranalyzer: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 32
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 0
        Visible = False
        ExplicitHeight = 31
        object TitleColorAnalyzer: TLabel
          Left = 8
          Top = 8
          Width = 124
          Height = 21
          Caption = 'Color Analyzer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnl_color_bottom: TPanel
          Left = 0
          Top = -49
          Width = 185
          Height = 81
          Align = alBottom
          BevelOuter = bvNone
          Color = clBlack
          TabOrder = 1
          ExplicitTop = -50
          object lbl_farben_name: TLabel
            Left = 8
            Top = 0
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
            Top = 0
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
          object btn_markentf: TButton
            Left = 8
            Top = 24
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
            TabOrder = 0
            OnClick = btn_markentf_click
          end
          object btn_farbtabelle: TButton
            Left = 8
            Top = 56
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
            TabOrder = 1
            OnClick = btn_farbtabelle_click
          end
        end
        object listbox: TListBox
          Left = 8
          Top = 40
          Width = 169
          Height = 249
          Cursor = crHandPoint
          Style = lbOwnerDrawFixed
          Color = clGray
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnDrawItem = listbox_drawitem
          OnMouseDown = listboxMouseDown
        end
        object ColorMarkSelect: TPanel
          Left = 160
          Top = 8
          Width = 17
          Height = 17
          Cursor = crHandPoint
          Hint = 'Markerfarbe im Bild'
          BevelOuter = bvLowered
          Color = clRed
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = ColorSelect
        end
        object ColorBorderSelect: TPanel
          Left = 144
          Top = 8
          Width = 17
          Height = 17
          Cursor = crHandPoint
          Hint = 'Markerfarbe am Rand'
          BevelOuter = bvLowered
          Color = clLime
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = ColorSelect
        end
      end
      object pnl_antiescape: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 31
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 3
        Visible = False
        object ImgAntiEscapeMatrix: TImage
          Left = 20
          Top = 56
          Width = 145
          Height = 107
          Hint = 'Verf'#252'gbare Matrizzen'
          ParentShowHint = False
          Picture.Data = {
            07544269746D6170FE040000424DFE0400000000000036000000280000001700
            0000110000000100180000000000C80400000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF808080808080808080808080FFFFFFFFFFFF8080808080808080
            80808080FFFFFF000000808080808080808080808080808080FFFFFF80808080
            8080808080808080808080FFFFFF808080FFFFFF000000808080FFFFFFFFFFFF
            808080000000FFFFFF808080FFFFFF000000808080FFFFFFFFFFFF0000008080
            80FFFFFF808080000000FF0000FFFFFF808080FFFFFF808080FF0000FFFFFF80
            8080FFFFFFFFFFFF808080FFFFFFFF0000808080FFFFFF000000808080000000
            FF0000FFFFFF808080FFFFFF808080FFFFFFFFFFFF000000808080FFFFFF8080
            80000000FFFFFF808080FFFFFFFFFFFF808080FFFFFF000000808080FFFFFF00
            0000808080808080808080808080808080FFFFFF808080808080808080808080
            808080FFFFFF808080808080808080808080FFFFFFFFFFFF8080808080808080
            80808080FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000008080808080808080808080808080
            80FFFFFF808080808080808080808080808080FFFFFF80808080808080808080
            8080808080FFFFFF808080808080808080808080808080000000808080FFFFFF
            000000FFFFFF808080FFFFFF808080FFFFFFFFFFFFFFFFFF808080FFFFFF8080
            80FFFFFF000000FFFFFF808080FFFFFF808080FFFFFF000000FFFFFF80808000
            0000808080000000FFFFFF000000808080FFFFFF808080000000FFFFFF000000
            808080FFFFFF808080000000FFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFF
            FF000000808080000000808080FFFFFFFFFFFFFFFFFF808080FFFFFF808080FF
            FFFF000000FFFFFF808080FFFFFF808080FFFFFF000000FFFFFF808080FFFFFF
            808080FFFFFF000000FFFFFF8080800000008080808080808080808080808080
            80FFFFFF808080808080808080808080808080FFFFFF80808080808080808080
            8080808080FFFFFF808080808080808080808080808080000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000808080808080808080808080808080FFFFFF808080808080808080808080
            808080FFFFFF808080808080808080808080808080FFFFFF8080808080808080
            80808080808080000000808080FFFFFFFFFFFFFFFFFF808080FFFFFF80808000
            0000FFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFF000000808080FFFFFF
            808080000000FFFFFFFFFFFF808080000000808080FFFFFFFFFFFFFFFFFF8080
            80FFFFFF808080FF0000FFFFFFFFFFFF808080FFFFFF808080FFFFFFFF0000FF
            FFFF808080FFFFFF808080FFFFFFFF0000FFFFFF808080000000808080000000
            FF0000000000808080FFFFFF808080000000FFFFFFFFFFFF808080FFFFFF8080
            80000000FFFFFFFFFFFF808080FFFFFF808080FFFFFFFFFFFF00000080808000
            0000808080808080808080808080808080FFFFFF808080808080808080808080
            808080FFFFFF808080808080808080808080808080FFFFFF8080808080808080
            80808080808080000000}
          Proportional = True
          ShowHint = True
          Stretch = True
        end
        object TitleAntiEscape: TLabel
          Left = 8
          Top = 8
          Width = 99
          Height = 21
          Caption = 'Anti Escape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblLinienfarbe: TLabel
          Left = 16
          Top = 184
          Width = 53
          Height = 13
          Caption = 'Linienfarbe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblEscapeFarbe: TLabel
          Left = 113
          Top = 184
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Escapefarbe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object BtnAntiEscapeStart: TButton
          Left = 16
          Top = 272
          Width = 153
          Height = 41
          Cursor = crHandPoint
          Caption = 'Anti Escape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BtnAntiEscapeStartClick
        end
        object ColorEscapeLinie: TPanel
          Left = 16
          Top = 208
          Width = 41
          Height = 41
          Cursor = crHandPoint
          Hint = 'Linienfarbe'
          BevelOuter = bvLowered
          Color = clBlack
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ColorSelect
        end
        object ColorEscapeColor: TPanel
          Left = 128
          Top = 208
          Width = 41
          Height = 41
          Cursor = crHandPoint
          Hint = 'Escapefarbe'
          BevelOuter = bvLowered
          Color = clRed
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = ColorSelect
        end
      end
      object pnl_antiline: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 31
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 2
        Visible = False
        object TitleAntiLine: TLabel
          Left = 8
          Top = 8
          Width = 76
          Height = 21
          Caption = 'Anti Line'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblAutoDescA: TLabel
          Left = 32
          Top = 248
          Width = 122
          Height = 19
          Caption = #224' '#223' '#226' '#225
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblAutoDescB: TLabel
          Left = 40
          Top = 320
          Width = 110
          Height = 19
          Caption = #230' '#229' '#228' '#227
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RightDownBtn: TButton
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
          TabOrder = 0
          OnClick = AntiLinesClicks
        end
        object DownBtn: TButton
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
          TabOrder = 1
          OnClick = AntiLinesClicks
        end
        object LeftDownBtn: TButton
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
          TabOrder = 2
          OnClick = AntiLinesClicks
        end
        object RightBtn: TButton
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
          TabOrder = 3
          OnClick = AntiLinesClicks
        end
        object LeftBtn: TButton
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
          TabOrder = 4
          OnClick = AntiLinesClicks
        end
        object RightTopBtn: TButton
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
          TabOrder = 5
          OnClick = AntiLinesClicks
        end
        object UpBtn: TButton
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
          TabOrder = 6
          OnClick = AntiLinesClicks
        end
        object LeftUpBtn: TButton
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
          TabOrder = 7
          OnClick = AntiLinesClicks
        end
        object AutoBtnA: TButton
          Left = 24
          Top = 208
          Width = 137
          Height = 33
          Cursor = crHandPoint
          Caption = 'AUTO A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = AutoBtnAClick
        end
        object ColorAntiLine: TPanel
          Left = 72
          Top = 96
          Width = 41
          Height = 41
          Cursor = crHandPoint
          BevelOuter = bvLowered
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -26
          Font.Name = 'Wingdings'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = ColorSelect
        end
        object AutoBtnB: TButton
          Left = 24
          Top = 280
          Width = 137
          Height = 33
          Cursor = crHandPoint
          Caption = 'AUTO B'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = AutoBtnBClick
        end
      end
      object pnl_blackwhite: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 31
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 4
        Visible = False
        object TitleBlackWhite: TLabel
          Left = 8
          Top = 8
          Width = 95
          Height = 21
          Caption = 'S/W Maker'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblWeissgrenze: TLabel
          Left = 32
          Top = 48
          Width = 100
          Height = 13
          Caption = 'Wei'#223'grenze (0..255)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LblWarnDithering: TLabel
          Left = 16
          Top = 152
          Width = 117
          Height = 13
          Caption = 'Achtung: Kein Dithering!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object MakeSW: TButton
          Left = 16
          Top = 104
          Width = 153
          Height = 33
          Cursor = crHandPoint
          Caption = 'Schwarzwei'#223' machen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnClick = MakeSWClick
        end
        object SWGrenze: TSpinEdit
          Left = 32
          Top = 64
          Width = 121
          Height = 22
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 128
        end
      end
      object pnl_misc: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 31
        Align = alClient
        BevelOuter = bvNone
        Color = clBlack
        TabOrder = 5
        Visible = False
        object TitleMisc: TLabel
          Left = 8
          Top = 8
          Width = 84
          Height = 21
          Caption = 'Sonstiges'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LblVersion: TLabel
          Left = 24
          Top = 56
          Width = 74
          Height = 13
          Caption = 'Version 1.1.0.0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object BtnUpdate: TButton
          Left = 24
          Top = 88
          Width = 145
          Height = 33
          Cursor = crHandPoint
          Caption = 'ViaThinkSoft (Web)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BtnUpdateClick
        end
        object BtnTutorial: TButton
          Left = 24
          Top = 136
          Width = 145
          Height = 33
          Cursor = crHandPoint
          Caption = 'DPC Tutorial (Web-PDF)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BtnTutorialClick
        end
        object Grp_Config: TGroupBox
          Left = 24
          Top = 200
          Width = 145
          Height = 161
          Caption = 'Konfiguration'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object LblActRate: TLabel
            Left = 16
            Top = 48
            Width = 92
            Height = 13
            Caption = 'Aktualisierungsrate'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LblCrossPuls: TLabel
            Left = 16
            Top = 104
            Width = 75
            Height = 13
            Caption = 'Fadenkreuzpuls'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object ActRate: TSpinEdit
            Left = 16
            Top = 64
            Width = 89
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 1000
            MinValue = 1
            ParentFont = False
            TabOrder = 0
            Value = 10
          end
          object CrossPuls: TSpinEdit
            Left = 16
            Top = 120
            Width = 89
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 255
            MinValue = 1
            ParentFont = False
            TabOrder = 1
            Value = 1
          end
          object ProgressPanel: TCheckBox
            Left = 16
            Top = 24
            Width = 121
            Height = 17
            Caption = 'Fortschrittslaufbalken'
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = ProgressPanelClick
          end
        end
      end
    end
    object pnl_multiply: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 31
      Align = alClient
      BevelOuter = bvNone
      Color = clBlack
      TabOrder = 2
      Visible = False
      object TitleMultiply: TLabel
        Left = 8
        Top = 8
        Width = 112
        Height = 21
        Caption = 'Multiplizierer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnLetMultiply: TButton
        Left = 24
        Top = 72
        Width = 145
        Height = 33
        Cursor = crHandPoint
        Caption = 'Mit Bild multiplizieren'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtnLetMultiplyClick
      end
    end
  end
  object pnl_left: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 136
    Align = alClient
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 1
    object image_scrollbox: TScrollBox
      Left = 0
      Top = 0
      Width = 721
      Height = 88
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBlack
      ParentColor = False
      TabOrder = 1
      ExplicitHeight = 87
    end
    object pnl_tools: TPanel
      Left = 0
      Top = 88
      Width = 721
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      Color = clBlack
      TabOrder = 0
      ExplicitTop = 87
      object BtnToolCA: TButton
        Left = 8
        Top = 8
        Width = 105
        Height = 33
        Cursor = crHandPoint
        Hint = 'Zum '#220'berpr'#252'fen und markieren der verf'#252'gbaren Farben'
        Caption = 'Color Analyzer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ToolsClick
      end
      object BtnToolCC: TButton
        Left = 120
        Top = 8
        Width = 105
        Height = 33
        Cursor = crHandPoint
        Hint = 'Zum Tauschen und Wechseln von Farben'
        Caption = 'Color Changer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ToolsClick
      end
      object BtnToolAL: TButton
        Left = 232
        Top = 8
        Width = 97
        Height = 33
        Cursor = crHandPoint
        Hint = 'Zum Entfernen von Linien'
        Caption = 'Anti Line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = ToolsClick
      end
      object BtnToolAE: TButton
        Left = 336
        Top = 8
        Width = 105
        Height = 33
        Cursor = crHandPoint
        Hint = 
          'Zum automatischen schlie'#223'en von kleinen Linienl'#252'cken (nicht empf' +
          'ohlen!)'
        Caption = 'Anti Escape'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = ToolsClick
      end
      object BtnToolMisc: TButton
        Left = 672
        Top = 8
        Width = 105
        Height = 33
        Cursor = crHandPoint
        Hint = 'Updates und Versionsinformationen'
        Caption = 'Sonstiges'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = ToolsClick
      end
      object BtnToolSW: TButton
        Left = 448
        Top = 8
        Width = 105
        Height = 33
        Cursor = crHandPoint
        Hint = 
          'Bild umwandeln in 100% S/W.Matrizze (F'#252'r Dithering wird PaintSho' +
          'p Pro anstelle empfohlen)'
        Caption = 'S/W Maker'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = ToolsClick
      end
      object BtnToolMultiply: TButton
        Left = 560
        Top = 8
        Width = 105
        Height = 33
        Cursor = crHandPoint
        Hint = 
          'Eine AntiLine-Matrize mit dem Originalbild multiplizieren (Kolor' +
          'ation hat weichere Kanten).'
        Caption = 'Multiplizierer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = ToolsClick
      end
    end
  end
  object dlg_save_text: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Textdatei (*.txt)|*.txt|Alle Dateien (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 72
    Top = 8
  end
  object PulsTimer: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmr_puls_timer
    Left = 104
    Top = 8
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 136
    Top = 8
    object Markcolor1: TMenuItem
      Caption = 'Markieren'
      OnClick = Markcolor1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Namengeben1: TMenuItem
      Caption = 'Namen geben...'
      OnClick = Namengeben1Click
    end
    object Namenzurcksetzen1: TMenuItem
      Caption = 'Namen zur'#252'cksetzen'
      OnClick = Namenzurcksetzen1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Farbinformationen1: TMenuItem
      Caption = 'Farbinformationen...'
      OnClick = Farbinformationen1Click
    end
  end
  object dlg_open: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 
      'Alle (*.bmp;*.jpg;*.jpeg;*.ico;*.emf;*.wmf)|*.bmp;*.jpg;*.jpeg;*' +
      '.ico;*.emf;*.wmf|JPEG-Grafikdatei (*.jpg)|*.jpg|JPEG-Grafikdatei' +
      ' (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Symbole (*.ico)|*.ico|Erw' +
      'eiterte Metadateien (*.emf)|*.emf|Metadateien (*.wmf)|*.wmf'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 8
  end
  object dlg_save: TSavePictureDialog
    DefaultExt = '.bmp'
    Filter = 
      'Alle (*.bmp;*.jpg;*.jpeg;*.ico;*.emf;*.wmf)|*.bmp;*.jpg;*.jpeg;*' +
      '.ico;*.emf;*.wmf|JPEG-Grafikdatei (*.jpg)|*.jpg|JPEG-Grafikdatei' +
      ' (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Symbole (*.ico)|*.ico|Erw' +
      'eiterte Metadateien (*.emf)|*.emf|Metadateien (*.wmf)|*.wmf'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 40
    Top = 8
  end
  object dlg_open2: TOpenPictureDialog
    DefaultExt = '.bmp'
    Filter = 
      'Alle (*.bmp;*.jpg;*.jpeg;*.ico;*.emf;*.wmf)|*.bmp;*.jpg;*.jpeg;*' +
      '.ico;*.emf;*.wmf|JPEG-Grafikdatei (*.jpg)|*.jpg|JPEG-Grafikdatei' +
      ' (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|Symbole (*.ico)|*.ico|Erw' +
      'eiterte Metadateien (*.emf)|*.emf|Metadateien (*.wmf)|*.wmf'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 40
  end
end
