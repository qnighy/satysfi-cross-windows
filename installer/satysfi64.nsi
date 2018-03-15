Outfile "satysfi64-installer.exe"

InstallDir "$PROGRAMFILES64\SATySFi"

LicenseData "../licenses/LGPL-3.0"

Page license
Page directory
Page instfiles

Section
    SetOutPath $INSTDIR
    WriteUninstaller "$INSTDIR\uninstall.exe"
    File /r "../satysfi64/*"
SectionEnd

Section "uninstall"
    Delete "$INSTDIR\uninstall.exe"
SectionEnd
