#Persistent
#SingleInstance force
#NoTrayIcon
#MaxHotkeysPerInterval 200
#Warn

SetTimer, Focus, -3600000 ;Run once
SetTimer, AlwaysOn, 60000 ;1 minute


StartTime := A_TickCount
Break := 0
Working := 0
MinutesLeft:= 0

return


#a::  MsgBox, 0, TimeCounter, % "Currently, " ConvertMSToHourMinSec(A_TickCount - StartTime) "have passed."
#^a:: Gosub, Focus


Focus:

if (Break = 0) {

   Gui, 1: Default
   Gui, Margin, 0, 0
   Gui, Color, 0x000000
   Gui, Font, s32, Verdana
   Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption

   xCenter2 := A_ScreenWidth / 2 -325
   yCenter2 := A_ScreenHeight / 2 -100
   xCenter1 := A_ScreenWidth / 2 -300
   yCenter1 := A_ScreenHeight / 2 -75
   Gui, Add, Text, x%xCenter2% y%yCenter2% w650 h200 0x04
   Gui, Add, Text, x%xCenter1% y%yCenter1% w600 h150 0x05
   Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, BlackBox ;Title
   Sleep, 200

   xCenter := A_ScreenWidth / 2 -250
   yCenter := A_ScreenHeight / 2 -29
   Gui, Add, Edit, x%xCenter% y%yCenter% w500 h50 r1 +Number vMinutesLeft, How many minutes?
   ;Height is a set value

   Sleep, 700
   Send, {Tab}

   Break := 0.5
   SetTimer, BreakTime, 100 ;ON
}
return

#ifWinExist BlackBox
   Enter::
   NumpadEnter::

      if (Break = 0.5 ) {
         Gui, Submit
         SetTimer, BreakTime, OFF
         Gui, Destroy
         Break := 1

         if (IsNumber(MinutesLeft) && MinutesLeft <= 120) {
            MinutesLeft := MinutesLeft * -60000
            SetTimer, Finished, %MinutesLeft%
         } 
         else if (IsNumber(MinutesLeft) && MinutesLeft > 120) {
            MinutesLeft := MinutesLeft - 60
            SetTimer, Refocus, -3600000
         } 
         else {
            SetTimer, Finished, -3600000
         }
      }
   return

   z:: 
      ifWinNotExist DrawOnScreen
         Run DrawOnScreen.ahk
   return

   Up::
      if (Break = 0.5)
         Working++
   return
   Down::
      if (Working = 2 || Working = 12)
         Working+=10
   return
   Left::
      if (Working = 22 || Working = 1122)
         Working+=100
   return
   Right::
      if (Working = 122)
         Working+=1000
      if (Working = 1222) {
         Working+=1000
         Gui, Add, Edit, w250 h50 r1 vMyEdit
         Send, {Tab}
      }
   return
   :*:baselectstart::
      if (Working = 2222) {
         SetTimer, BreakTime, OFF
         Gui, Destroy
         Break := 256
         MsgBox, Remember!
      }
   return
#ifWinExist


Refocus:
   Gui, 1: Default
   Gui, Color, 0x000000
   Gui, Margin, 10, 10
   Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
   Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, BlackBox

   SetTimer, BreakTime, 100
   Sleep, 3600000
   SetTimer, BreakTime, OFF
   Gui, Destroy
   Break++

   if (MinutesLeft <= 120) {
      MinutesLeft := MinutesLeft * -60000
      SetTimer, Finished, %MinutesLeft%
   }
   else {
      MinutesLeft := MinutesLeft - 120
      SetTimer, Refocus, -7200000
   }
return


AlwaysOn:

   if (A_Hour = 2 and A_Min = 0)
      Run, MidnightClock.ahk

   if (A_Hour >= 04 and A_Hour <= 05)
      shutdown, 13

return

Test:

return


Idle:
;if( A_TimeIdle > 10000)
return


BreakTime:
   ifWinExist, DrawOnScreen
      WinActivate, DrawOnScreen
   ifWinNotExist, DrawOnScreen
      WinActivate, BlackBox
return


Finished:
   shutdown, 13
   ;MsgBox Finished!
   ;ExitApp 
return

;Esc::ExitApp                                   ;Blot this out!

IsNumber(n){
   return, RegExMatch(n, "^\d+$")
}

ConvertMSToHourMinSec(ms){
   return, floor(((ms / 1000) / 60 )/ 60) " hours "
         . floor(mod(((ms / 1000)/ 60), 60)) " minutes and "
         . floor(mod((ms / 1000), 60)) " seconds "
}