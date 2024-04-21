program AntiEscaper;

uses
  Forms,
  Bild in 'Bild.pas' {PicForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'AntiEscaper';
  Application.CreateForm(TPicForm, PicForm);
  Application.Run;
end.
