program ColorAnalyzer;

uses
  Forms,
  Main in 'Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ColorAnalyzer 1.1';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
