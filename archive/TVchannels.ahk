;TVchannels
;   Just like TV!


#SingleInstance force
#NoTrayIcon
SetBatchLines, -1


;Functions

   AppArray[i].match(j) := return j = Apparray[i]


;Mouse

XButton1::
   Send !+{Escape}
   Send {Alt UP}
   WinGetActiveTitle, Title
   WinGet, minimized, MinMax, %title%
      if (minimized)
         WinMaximize, %title%
   SetTimer, ChannelDisplay, -1
return

XButton2::
   Send !{Escape}
   Send {Alt UP}
   WinGetActiveTitle, Title
   WinGet, minimized, MinMax, %title%
      if (minimized)
         WinMaximize, %title%
   SetTimer, ChannelDisplay, -1
return

XButton1 & XButton2::  Send, #d ;Capital D doesn't work!
XButton2 & XButton1::  Send, #d 

XButton2 & WheelUp::   Send {Volume_Up}
XButton2 & WheelDown:: Send {Volume_Down}
 
XButton1 & MButton::   SendMessage 0x112, 0xF170, 2,,Program Manager
XButton1 & WheelUp::   MoveBrightness(1)
XButton1 & WheelDown:: MoveBrightness(-1)
#include Brightness.ahk



ChannelDisplay:

   if (!AppArray)
      AppArray := Object()

   WinGet, active_id,   ID, A
   WinGet, active_name, ProcessName, A
   active_name := RegExReplace(active_name, "\..*$", "")

   Channel_No := 256
   NowArray   := Object()


   WinGet, Current, List,,, Program Manager
   Loop, %Current% {
      WinGetTitle, title,% "ahk_id " Current%A_Index%
      If title=
      Current--
      If title=ChannelBox
      Current--
   }
   Loop, %Current% {
      NowArray.insert(Current%A_Index%)
   }


   for i, in NowArray {
      Exist := false
      for j, in AppArray {
         if (NowArray[i] = AppArray[j]) {
             Exist := true
             break
         }
      }
      if (Exist = false) {
         AppArray.insert(NowArray[i])
      }
   }

   NowArray := ""

   for i, in AppArray {
      if (AppArray[i] = active_id) {
          Channel_No = %i%
          break
      }
   }


   IfWinExist ChannelBox
   {
   Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
   nwValue := Floor((3/20) * A_ScreenWidth - (1/50) * A_ScreenWidth)
   GuiControl, Move, Number, w%nwValue%
   GuiControl, Move, Name, w%nwValue%
   GuiControl, Text, Number, %Channel_No%
   GuiControl, Text, Name, %active_name%
   }
   else {

   yValue := Floor(0.80 * A_ScreenHeight)
   wValue := Floor((3/20) * A_ScreenWidth)
   hValue := Floor((2/15) * A_ScreenHeight)

   xPos   := Floor((1/8) * wValue)
   yPos1  := Floor((1/8) * hValue)
   yPos2  := Floor((72/100) * hValue)

   fSize1 := Floor(0.05 * A_ScreenHeight)
   fSize2 := Floor((1/60) * A_ScreenHeight)


   Gui, 1: Default
   Gui, Margin, 0, 0
   Gui, Color, 0xf1f2f4
   Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption

   Gui, Add,  Text, x0 y0 w%wValue% h%hValue% 0x12
   Gui, Font, s%fSize1% q5, Verdana
   Gui, Add,  Text, x%xPos% y%yPos1% vNumber, %Channel_No%
   Gui, Font, s%fSize2% q5, Verdana
   Gui, Add,  Text, x%xPos% y%yPos2% vName, %active_name%
   Gui, Show, x0 y%yValue% w%wValue% h%hValue% NoActivate, ChannelBox
   }

   SetTimer, Destroy, -1000

return


Destroy:
   Gui, Destroy
return