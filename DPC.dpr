program DPC;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Color in 'Color.pas' {ColorForm};

{$R *.res}

{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.Title := 'Digital Plain Color Studio';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TColorForm, ColorForm);
  Application.Run;
end.
