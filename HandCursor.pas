unit HandCursor;

//////////////////////////////////////////
// Hand-Cursor Unit by Daniel Marschall //
// Delphi-Praxis CodeLib                //
//////////////////////////////////////////

interface

{$WARNINGS OFF}

implementation

{$IFNDEF BCB}
{$DEFINE DEL1UP}
{$IFNDEF VER80}
{$DEFINE DEL2UP}
{$IFNDEF VER90}
{$DEFINE DEL3UP}
{$IFNDEF VER100}
{$DEFINE DEL4UP}
{$IFNDEF VER120}
{$DEFINE DEL5UP}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}

uses
  Windows { HCURSOR, LoadCursor, IDC_HAND },
  Controls { crHandPoint },
  Forms { Screen };

// IDC_HAND existiert ab Delphi 4

{$IFNDEF DEL4UP}
const
  IDC_HAND = MakeIntResource(32649);
{$ENDIF}

var
  hCur: HCURSOR;

{$R Hand.res}

// ToDo: Prüfen, ob die ganz neuen Delphi-Versionen diese Überschreibung von
// crHandPoint (+ Fallback) vielleicht schon von selbst machen -> Compilerdirektiven.

initialization
  hCur := LoadCursor(0, IDC_HAND);
  if hCur > 0 then
  begin
    Screen.Cursors[crHandPoint] := hCur;
  end
  else
  begin
    hCur := LoadCursor(HInstance, 'HAND');
    if hCur > 0 then
    begin
      Screen.Cursors[crHandPoint] := hCur;
    end;
  end;
end.
