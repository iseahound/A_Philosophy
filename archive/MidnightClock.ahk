#Singleinstance force
#Persistent
#NoTrayIcon
#NoEnv
#include Random.ahk
#include MD5.ahk 

if (A_Hour >= 0 and A_Hour <= 06)
   SetTimer, StateCheck, 100
else ExitApp

StartTime := A_TickCount
DreamState:= 0


MidnightClock:

   if (A_Hour >= 0 and A_Hour <= 06) {

      if (GetKeyState("LWin") and GetKeyState("F12") = 1) {

         if FileExist("M:\Address.txt") {
            FileRead, Address, Address.txt
            Address := RegexReplace(Address, "\s*$", "")
            Address := MD5(Address)
         }

         if (rand() > .12 and Address != "7160E334207145FEDE0649C2D44F025E") {
            shutdown, 13
            ;MsgBox Exit 2
            return
         }
 
         Sleep, 5000
         Run , TASKKILL /F /IM explorer.exe ;Process, close, explorer.exe
         Send, #d
         ifExist, M:\Address.txt
            FileDelete, M:\Address.txt
         ifExist, TurnOfTheDay.txt
            FileDelete, TurnOfTheDay.txt
         FileAppend, 
(
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
12 o'clock - Midnight |
______________________|
                                         The bells are ringing.

_______________________________________________________________
***************************************************************

              
          Who dares seek the light at the turn of the day?
             When magic and mysteries are coming awake?
           Deep in the night, where forgotten secrets lay
            Explore lost paths, discover wishes to make
      
             Quick! After it! The starlight will fade. 
           Blend in the night as your shadow slips away. 


 + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

   Lie in the bed, tumble around
   Dream joyous dreams, insights profound


Your answer? (Press Enter to send)
>
 ¯¯¯¯¯¯¯¯¯¯¯¯¯


), TurnOfTheDay.txt


         Run, TurnOfTheDay.txt
         Sleep, 3000
         DreamState:=1
         WinActivate, TurnOfTheDay
         Send, {Down 26}{Right}{Space}
         return
      }
      else {
         ;MsgBox Exit 4
         shutdown, 13
         return
      }
   }
return

StateCheck:
if (A_TickCount - StartTime >= 600000) {
   shutdown, 13
   ;MsgBox Exit 9
}

if (DreamState = 1) {
   ifWinExist, TurnOfTheDay
      WinActivate, TurnOfTheDay
   ifWinNotExist, TurnOfTheDay
      shutdown, 13
      ;MsgBox Exit 3
}
return

::dreamer::
   Send, {Down 2}{Enter}Let the dreams begin.
   Sleep, 2000
   WinClose, TurnOfTheDay
   Send, !n
   FileDelete, TurnOfTheDay.txt
   ExitApp
return

::admin::
  Send, {Down 2}{Enter}Access Denied.{Up 3}{Right 2}
return

::password::
  Send, {Down 2}{Enter}Aren't you cute?{Up 3}{Right 2}
return

::yes::
  Send, {Down 2}{Enter}No!{Up 3}{Right 2}
return
