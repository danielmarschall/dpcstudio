program AntiLine;

uses
  Forms,
  Main in 'Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Anti-Line 1.0';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
