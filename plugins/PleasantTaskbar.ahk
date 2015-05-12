#SingleInstance force
#NoTrayIcon
#Persistent
CoordMode,Mouse,SCREEN
Gui +LastFound
DllCall("RegisterShellHookWindow","UInt",WinExist()),OnMessage(DllCall( "RegisterWindowMessage","Str","SHELLHOOK" ),"ShellMessage")
SetTimer,CheckMouse, 100
SetWinDelay,0
SetBatchLines,-1
Return

CheckMouse:
MouseGetPos,x,y,hWnd,Ctrl
x_per:=A_ScreenWidth*(5/6)
If (hWnd=WinExist("AHK_class Shell_TrayWnd") || hWnd=WinExist("Start AHK_class Button")
    || ( WinExist("AHK_class Shell_TrayWnd")
    && ( WinExist("ahk_class ahk_class #32768") || WinExist("AHK_class TaskListThumbnailWnd")
    || WinExist("ahk_class DV2ControlHost") || WinExist("AHK_class NotifyIconOverflowWindow")) ) ){
  SetTimer,CheckMouse, 100
  Return
} else if (((x<2 && y>A_ScreenHeight-20) || (x>x_per && x<A_ScreenWidth-15 && y>A_ScreenHeight-2)) && !WinExist("AHK_class Shell_TrayWnd") && !WinExist("ahk_class DV2ControlHost")){
  Sleep,100
  MouseGetPos,_x,_y
  If (!(x=_x && y=_y) || GetKeyState("Lbutton","P")){
    SetTimer,CheckMouse, 100
    Return
  }
  WinShow, AHK_class Shell_TrayWnd
  WinShow, Start AHK_class Button
  WinSet,Redraw,,ahk_class Shell_TrayWnd
} else if (WinExist("ahk_class DV2ControlHost")){
  ;WinHide, ahk_class DV2ControlHost                        ;Causes blinking when Win key is pressed
  WinShow, AHK_class Shell_TrayWnd
  WinShow, Start AHK_class Button
  ;WinShow, ahk_class DV2ControlHost                        ;Not present in old code
  WinSet,Redraw,,ahk_class Shell_TrayWnd
} else if (WinExist("AHK_class Shell_TrayWnd") && x>1){
  WinHide, AHK_class Shell_TrayWnd
  WinHide, Start AHK_class Button
  WinHide, AHK_class NotifyIconOverflowWindow
}
SetTimer,CheckMouse, 100
Return

ShellMessage( wParam,lParam )
{
   If ( wParam = 0x8006 ){
      If WinExist("ahk_class DV2ControlHost") && DVShow:=1
        WinHide, ahk_class DV2ControlHost
      WinShow, AHK_class Shell_TrayWnd
      WinShow, Start AHK_class Button
      If DVShow
        WinShow, ahk_class DV2ControlHost
      WinSet,Redraw,,ahk_class Shell_TrayWnd
      SetTimer,CheckMouse, -5000
    }
}