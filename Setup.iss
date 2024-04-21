; DPC Studio Script für InnoSetup 5.2.3
; Fehler bei Uninstallation: ReadOnly, Anwendung in Benutzung

[Setup]
AppName=Digital Plain Color Studio
AppVerName=Digital Plain Color Studio 1.1
AppVersion=1.1.0.0
AppCopyright=© Copyright 2006 - 2009 ViaThinkSoft.
AppPublisher=ViaThinkSoft
AppPublisherURL=http://www.viathinksoft.de/
AppSupportURL=http://www.daniel-marschall.de/
AppUpdatesURL=http://www.viathinksoft.de/
DefaultDirName={pf}\DPC-Studio
DefaultGroupName=Digital Plain Color Studio
UninstallDisplayIcon={app}\DPC.exe
VersionInfoCompany=ViaThinkSoft
VersionInfoCopyright=© Copyright 2006 - 2009 ViaThinkSoft.
VersionInfoDescription=Digital Plain Color Bitmap Utilities
VersionInfoTextVersion=1.1.0.0
VersionInfoVersion=1.1.0.0
;WizardImageFile=Setup\Images\Large.bmp
;WizardSmallImageFile=Setup\Images\Small.bmp
Compression=lzma
OutputBaseFilename=Setup
;SetupIconFile=Setup\Icon.ico

[Languages]
Name: de; MessagesFile: "compiler:Languages\German.isl"
Name: en; MessagesFile: "compiler:Default.isl"

[Files]
; Allgemein
Source: "DPC.exe"; DestDir: "{app}"; Flags: restartreplace ignoreversion
;Source: "DPC-Tutorial.pdf"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Allgemein
Name: "{group}\Digital Plain Color Studio"; Filename: "{app}\DPC.exe"
Name: "{group}\{cm:UninstallProgram,DPC Studio}"; Filename: "{uninstallexe}"
Name: "{group}\ViaThinkSoft"; Filename: "http://www.viathinksoft.de/"

[Run]
Filename: "{app}\DPC.exe"; Description: "{cm:LaunchProgram,DPC Studio}"; Flags: nowait postinstall skipifsilent

[Code]
function InitializeSetup(): Boolean;
begin
  if CheckForMutexes('DPCSetup') = false then
  begin
    Createmutex('DPCSetup');
    Result := true;
  end
  else
  begin
    Result := False;
  end;
end;

