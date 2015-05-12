;A_Philosophy - Making Life Simpler
;      By Edison Hua


#NoEnv
#Warn
#NoTrayIcon
#Singleinstance force
#MaxHotkeysPerInterval 200
SetWorkingDir %A_ScriptDir%
SetBatchLines, -1


;On Runtime

   Run plugins\AutoCorrect.ahk
   Run plugins\PleasantTaskbar.ahk   ;c


   #include library\Brightness.ahk
   #include library\ChangeCase.ahk
   #include library\ShowHide.ahk
   #include library\Resolution.ahk
   #include library\Window.ahk

;Extensions

   #include plugins\Rainmeter.ahk    ;c

   ;Variables      ;Don't return before this point


;Mouse

#WheelUp:: WheelLeft
#WheelDown:: WheelRight

$XButton1:: 
   Critical
   Send !+{Escape}
   WinGet, minimized, MinMax, A
      if (minimized)
         WinMaximize, A
   return

$XButton2:: 
   Critical
   Send !{Escape}
   WinGet, minimized, MinMax, A
      if (minimized)
         WinMaximize, A
   return

XButton1 & XButton2::  Send, #d ;Capital D doesn't work!
XButton2 & XButton1::  Send, #d 

XButton2 & WheelUp::   Send {Volume_Up}
XButton2 & WheelDown:: Send {Volume_Down}
XButton2 & MButton::   Send {Volume_Mute}
XButton2 & LButton::   Send {Media_Prev}
XButton2 & RButton::   Send {Media_Next}
 
XButton1 & WheelUp::   MoveBrightness(1)
XButton1 & WheelDown:: MoveBrightness(-1)
XButton1 & MButton UP::SendMessage 0x112, 0xF170, 2,,Program Manager

XButton1 & LButton::
   Critical
   Send, #{NumPadAdd}  ;The first launch should not allow a second zoom. (?)
   PostMessage, 0x112, 0xF020,,, ahk_class MagUIClass
   return

XButton1 & RButton::
   Critical
   if !WinExist("ahk_class MagUIClass")
      return
   Send, #{NumPadSub}
   PostMessage, 0x112, 0xF020,,, ahk_class MagUIClass
   return


;Keyboard

#q::   shutdown, 1
#^q::  shutdown, 12
#!q::  shutdown, 2
#+q::  shutdown, 0
#^!q:: shutdown, 6
#^+q:: DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
#!+q:: DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
#^!+q::WinKill, A

#w::   Run Winword.exe

#^e::  Run ::{645FF040-5081-101B-9F08-00AA002F954E}
#!e::  Run ::{7007ACC7-3202-11D1-AAD2-00805FC1270E}
#+e::  Run ::{208D2C60-3AEA-1069-A2D7-08002B30309D}
#^!+e::Run Explorer shell:::{ED7BA470-8E54-465E-825C-99712043E01C}

#i::   ToggleHiddenFiles()
#^i::  ToggleSystemFiles()
#+i::  ToggleFileExt()

#s::   Run C:\Users\%A_UserName%
#^s::  Run N:\
#!s::  Run M:\
#+s::  Run S:\
#^+s:: Run R:\
#!+s:: Run K:\
#^!s:: Run D:\
#^!+s::Run Y:\

#k::   ChangeCase("Title")
#^k::  ChangeCase("Upper")
#!k::  ChangeCase("Lower")
#+k::  ChangeCase("Sentence")
#^+k:: ChangeCase("K")

#z::   Run plugins\Colorette.exe
#^z::  
       IfWinExist, Calculator
          WinActivate
       else
          Run Calc.exe
       return
#+z::  Run plugins\MillisecondTimer.ahk
#^!z:: Run plugins\UnitConverter.ahk
#^+z:: Run plugins\PeriodicTable.ahk
#!+z:: Run plugins\Noise.ahk

#c::   Run, cmd /K "cd /d C:\Users\%A_UserName% && Powershell"
#!c::  Run, cmd /K "cd /d C:\Users\%A_UserName%"
#^c::  Run C:\Program Files (x86)\Capture2Text\Capture2Text.exe         ;c

#v UP::SendMessage 0x112, 0xF170, 2,,Program Manager ;dim screen
#^v::
       Clip0 = %ClipBoardAll%        ; Text–only paste from ClipBoard
       ClipBoard = %ClipBoard%       ; Convert to text
       Send ^v                       ; For best compatibility: SendPlay
       Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
       ClipBoard = %Clip0%           ; Restore original ClipBoard
       VarSetCapacity(Clip0, 0)      ; Free memory
       Return

#n::   Run Notepad.exe

$^PrintScreen::  
       ifWinExist Snipping Tool
       {
          WinActivate 
          Send, ^n
       }
       else
          Run %A_WinDir%\system32\SnippingTool.exe
       return


;Media Control

#^Space::      Send {Media_Play_Pause}
#^Left::       Send {Media_Prev}
#^Right::      Send {Media_Next}
#^.::          Send {Media_Stop}

#^Up::         Send {Volume_Up}
#^Down::       Send {Volume_Down}
#^WheelUp::    Send {Volume_Up}
#^WheelDown::  Send {Volume_Down}

#^+Up::        MoveBrightness(1)
#^+Down::      MoveBrightness(-1)
#^+WheelUp::   MoveBrightness(1)
#^+WheelDown:: MoveBrightness(-1)

#!Up::         Opacity(16)
#!Down::       Opacity(-16)
#!Left::       WinSet, AlwaysOnTop, Toggle, A
#!Right::      ClickThrough()
#!WheelUp::    OpacityM(16)
#!WheelDown::  OpacityM(-16)
#!LButton::    AlwaysOnTopM()
#!RButton::    ClickThroughM()
#!Space::      Montage()
#Space::       Peek()
#!.::          ResetAll()

#!Numpad0::    Move(0)
#!Numpad1::    Move(1)
#!Numpad2::    Move(2)
#!Numpad3::    Move(3)
#!Numpad4::    Move(4)
#!Numpad5::    Move(5)
#!Numpad6::    Move(6)
#!Numpad7::    Move(7)
#!Numpad8::    Move(8)
#!Numpad9::    Move(9)


;Changing Display Settings

+NumPadAdd::   ChangeDisplaySettings(32, 1920, 1080, 60)
+NumPadSub::   ChangeDisplaySettings(32, 1280, 720, 60)