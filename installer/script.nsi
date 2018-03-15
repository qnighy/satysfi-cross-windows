Name "SATySFi for Windows"
Outfile "../${RELEASE_NAME}-installer.exe"
!if ${RELEASE_NAME} == "satysfi64"
!define UNINST_KEY \
    "Software\Microsoft\Windows\CurrentVersion\Uninstall\SATySFi64"
!else
!define UNINST_KEY \
    "Software\Microsoft\Windows\CurrentVersion\Uninstall\SATySFi32"
!endif

!if ${RELEASE_NAME} == "satysfi64"
!define MULTIUSER_USE_PROGRAMFILES64
!endif

!include "FileFunc.nsh"

RequestExecutionLevel user

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
!if ${RELEASE_NAME} == "satysfi64"
    WriteRegStr SHCTX "${UNINST_KEY}" "DisplayName" "SATySFi for Windows (64bit)"
!else
    WriteRegStr SHCTX "${UNINST_KEY}" "DisplayName" "SATySFi for Windows (32bit)"
!endif
    WriteRegStr SHCTX "${UNINST_KEY}" "UninstallString" \
        "$\"$INSTDIR\uninstall.exe$\" /$MultiUser.InstallMode"
    WriteRegStr SHCTX "${UNINST_KEY}" "QuietUninstallString" \
        "$\"$INSTDIR\uninstall.exe$\" /$MultiUser.InstallMode /S"
    WriteUninstaller "$INSTDIR\uninstall.exe"
    File /r "../${RELEASE_NAME}/*"

    ${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
    IntFmt $0 "0x%08X" $0
    WriteRegDWORD SHCTX "${UNINST_KEY}" "EstimatedSize" "$0"
SectionEnd

Section "uninstall"
    !include "remove-list.nsh"
    Delete "$INSTDIR\uninstall.exe"
    RmDir "$INSTDIR"
    DeleteRegKey SHCTX "${UNINST_KEY}"
SectionEnd

Function .onInit
  !insertmacro MULTIUSER_INIT
FunctionEnd

Function un.onInit
  !insertmacro MULTIUSER_UNINIT
FunctionEnd
