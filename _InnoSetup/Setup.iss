; DPC Studio Script für InnoSetup 5.2.3
; Fehler bei Uninstallation: ReadOnly, Anwendung in Benutzung

[Setup]
AppName=Digital Plain Color Studio
AppVerName=Digital Plain Color Studio 1.1
AppVersion=1.1.0.0
AppCopyright=© Copyright 2006 - 2009 ViaThinkSoft
AppPublisher=ViaThinkSoft
AppPublisherURL=https://www.viathinksoft.de/
AppSupportURL=https://www.daniel-marschall.de/
AppUpdatesURL=https://www.viathinksoft.de/
DefaultDirName={autopf}\DPC-Studio
DefaultGroupName=Digital Plain Color Studio
UninstallDisplayIcon={app}\DPC.exe
VersionInfoCompany=ViaThinkSoft
VersionInfoCopyright=© Copyright 2006 - 2009 ViaThinkSoft
VersionInfoDescription=Digital Plain Color Bitmap Utilities
VersionInfoTextVersion=1.1.0.0
VersionInfoVersion=1.1.0.0
;WizardImageFile=Setup\Images\Large.bmp
;WizardSmallImageFile=Setup\Images\Small.bmp
;SetupIconFile=Setup\Icon.ico
OutputDir=.
OutputBaseFilename=DPC_Studio_Setup
; Configure Sign Tool in InnoSetup at "Tools => Configure Sign Tools" (adjust the path to your SVN repository location)
; Name    = sign_single   
; Command = "C:\SVN\...\sign_single.bat" $f
SignTool=sign_single
SignedUninstaller=yes

[Languages]
Name: de; MessagesFile: "compiler:Languages\German.isl"
Name: en; MessagesFile: "compiler:Default.isl"

[Files]
; Allgemein
Source: "..\DPC.exe"; DestDir: "{app}"; Flags: ignoreversion signonce
;Source: "DPC-Tutorial.pdf"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Allgemein
Name: "{group}\Digital Plain Color Studio"; Filename: "{app}\DPC.exe"
;Name: "{group}\{cm:UninstallProgram,DPC Studio}"; Filename: "{uninstallexe}"
;Name: "{group}\ViaThinkSoft"; Filename: "https://www.viathinksoft.de/"

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

