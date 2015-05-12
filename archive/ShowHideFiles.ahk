
/*
Platform:           Win XP, Win 7
Author:             rbrtryn

Script Function:
Show/Hide hidden folders, files and extensions in Windows XP and Windows 7

All of these system settings are found in the Windows Registry at:
Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced

The specific values are:
    Hidden              Show hidden files?      ( 2 = no , 1 = yes )
    HideFileExt         Show file extensions?   ( 1 = no , 0 = yes )
    ShowSuperHidden     Show system files?      ( 0 = no , 1 = yes )

In order to show protected system files Windows requires that both
the ShowSuperHidden and the hidden settings be set to yes, i.e. both set to 1
*/

#NoEnv
#SingleInstance force
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode RegEx

GroupAdd BroadcastGroup , ahk_class ExploreWClass|CabinetWClass|Progman

; If you don't like the hotkeys defined, you can change them here
HotKey #i  , ToggleHiddenFilesStatus
Hotkey #^i , ToggleSystemFilesStatus
Hotkey #+i , ToggleFileExtStatus

MakeTrayMenu()

Return ; ___________________End AutoExecute Section______________________________________

; Toggle the show/hide of hidden files
ToggleHiddenFilesStatus:
    `(GetRegValue( "Hidden" ) = 1 ) ? SetRegValue( "Hidden" , 2 ) : SetRegValue( "Hidden" , 1 )
    Menu Tray , ToggleCheck , Show Hidden Files
    UpdateWindows()
Return

; Toggle the show/hide of system files
ToggleSystemFilesStatus:
    GetRegValue( "ShowSuperHidden" ) ? SetRegValue( "ShowSuperHidden" , 0 ) : SetRegValue( "ShowSuperHidden" , 1 )
    Menu Tray , ToggleCheck , Show System Files
    UpdateWindows()
Return

; Toggle the show/hide of extensions for known file types
ToggleFileExtStatus:
    GetRegValue( "HideFileExt" ) ? SetRegValue( "HideFileExt" , 0 ) : SetRegValue( "HideFileExt" , 1 )
    Menu Tray , ToggleCheck , Show File Extentions
    UpdateWindows()
Return

About:
    MsgBox  ,  , About ShowHide ,
    ( LTrim
        This program will show/hide hidden files, system files and file extensions
        via hotkey or menu selection.

        Works on both Windows XP and Windows 7
        rbrtryn 2011
    )
Return

MenuExit:
    ExitApp
Return

GetRegValue( ValueName )
{
    SubKey := "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    RegRead Value , HKCU , %SubKey% , %ValueName%
    Return Value
}

SetRegValue( ValueName , Value )
{
    SubKey := "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    RegWrite REG_DWORD , HKCU , %SubKey% , %ValueName% , %Value%
}

UpdateWindows()
{
    Code := ( InStr( "WIN_7,WIN_VISTA" , A_OSVERSION ) ) ? 41504 : 28931
    WinGet WindowList , List , ahk_Group BroadcastGroup
    Loop %WindowList%
        PostMessage 0x111 , %Code% ,  ,  , % "ahk_id" WindowList%A_Index%
}

MakeTrayMenu()
{
Menu Default Menu , Standard
Menu Tray , NoStandard
Menu Tray , Add , Exit , MenuExit
Menu Tray , Add , About , About
Menu Tray , Add
Menu Tray , Add , Default Menu , :Default Menu
Menu Tray , Add
Menu Tray , Add , Show System Files , ToggleSystemFilesStatus
Menu Tray , Add , Show File Extentions , ToggleFileExtStatus
Menu Tray , Add , Show Hidden Files , ToggleHiddenFilesStatus
Menu Tray , Default , Show Hidden Files

; If any of the menu items need to start off checked, take care of it here
If ( GetRegValue( "Hidden" ) = 1 )
    Menu Tray , Check , Show Hidden Files
If ( GetRegValue( "ShowSuperHidden" ) = 1 )
    Menu Tray , Check , Show System Files
If ( GetRegValue( "HideFileExt" ) = 0 )
    Menu Tray , Check , Show File Extentions
}