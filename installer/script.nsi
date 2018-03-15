Name "SATySFi for Windows"
Outfile "../${RELEASE_NAME}-installer.exe"

!if ${RELEASE_NAME} == "satysfi64"
!define MULTIUSER_USE_PROGRAMFILES64
!endif

!define MULTIUSER_INSTALLMODE_INSTDIR "SATySFi"
!define MULTIUSER_EXECUTIONLEVEL Highest
!define MULTIUSER_MUI
!define MULTIUSER_INSTALLMODE_COMMANDLINE
# MULTIUSER_USE_PROGRAMFILES64 is not supported in nsis < 3.0
!include MultiUser-patched.nsh
!include MUI2.nsh

!insertmacro MUI_PAGE_LICENSE "lgpl-3.0.txt"
!insertmacro MULTIUSER_PAGE_INSTALLMODE
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

Function .onInit
  !insertmacro MULTIUSER_INIT
FunctionEnd

Function un.onInit
  !insertmacro MULTIUSER_UNINIT
FunctionEnd
