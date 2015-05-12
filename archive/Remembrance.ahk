#Persistent
#SingleInstance force
#NoTrayIcon
#include KeyboardLED.ahk

   if (A_Hour = 0 and A_Min = 0) {

Loop 4{
KeyboardLED(2,"switch")
Sleep, 100
KeyboardLED(7,"off")
Sleep, 100
}
Loop 4{
KeyboardLED(6,"switch")
Sleep, 100
KeyboardLED(7,"off")
Sleep, 100
}
Loop 4{
KeyboardLED(7,"switch")
Sleep, 100
KeyboardLED(7,"off")
Sleep, 100
}


Loop 6 {
KeyboardLED(2,"switch")
Sleep, 100
KeyboardLED(4,"switch")
Sleep, 100
KeyboardLED(1,"switch")
Sleep, 100
KeyboardLED(4,"switch")
Sleep, 100
}

Loop 2{
KeyboardLED(7,"switch")
Sleep, 100
KeyboardLED(7,"off")
Sleep, 100
}

Loop 2 {
KeyboardLED(1,"switch")
Sleep, 100
KeyboardLED(5,"switch")
Sleep, 100
KeyboardLED(7,"switch")
Sleep, 100
KeyboardLED(5,"switch")
Sleep, 100
KeyboardLED(1,"switch")
Sleep, 100
KeyboardLED(7,"off")
Sleep, 200
}

Loop 2{
KeyboardLED(7,"switch")
Sleep, 100
KeyboardLED(7,"off")
Sleep, 100
}

KeyboardLED(0,"off")
}
      return


   if (A_Hour = 2 and A_Min = 0)
      Run, MidnightClock.ahk


   if (A_Hour >= 4 and A_Hour <= 5)
      Shutdown, 13