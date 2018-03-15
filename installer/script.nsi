Outfile "../${RELEASE_NAME}-installer.exe"

!if ${RELEASE_NAME} == "satysfi64"
    InstallDir "$PROGRAMFILES64\SATySFi"
!else
    InstallDir "$PROGRAMFILES\SATySFi"
!endif

LicenseData "../licenses/LGPL-3.0"

Page license
Page directory
Page instfiles

Section
    SetOutPath $INSTDIR
    WriteUninstaller "$INSTDIR\uninstall.exe"
    File /r "../${RELEASE_NAME}/*"
SectionEnd

Section "uninstall"
    !include "remove-list.nsh"
    Delete "$INSTDIR\uninstall.exe"
    RmDir "$INSTDIR"
SectionEnd

