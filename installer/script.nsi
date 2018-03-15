Name "SATySFi for Windows"
Outfile "../${RELEASE_NAME}-installer.exe"

!if ${RELEASE_NAME} == "satysfi64"
    InstallDir "$PROGRAMFILES64\SATySFi"
!else
    InstallDir "$PROGRAMFILES\SATySFi"
!endif

LicenseData "../licenses/LGPL-3.0"

!include "${NSISDIR}\Contrib\Modern UI 2\MUI2.nsh"

!insertmacro MUI_PAGE_LICENSE "../licenses/LGPL-3.0"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

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

