#Persistent
#SingleInstance force
#NoTrayIcon

SetTimer, CheckTime,       60000 ;Every minute
SetTimer, MidnightClock,   60000
SetTimer, MidnightWarning, 60000

time_index := 1
StartTime := A_TickCount

notify_times=3600000,7200000,10800000,14400000,18000000,21600000,25200000
notify_names=1 hour,2 hours,3 hours,4 hours,5 hours,6 hours,7 hours

StringSplit notify_time, notify_times, `,
StringSplit notify_name, notify_names, `,

#a:: 
   MsgBox, 0, TimeCounter, % "Currently, " ConvertMSToHourMinSec(A_TickCount - StartTime) "have passed."
   GoSub, CheckTime
return

CheckTime:
   TimeElapsed := A_TickCount - StartTime
   CurrentReminder := notify_time%time_index%
   CurrentName := notify_name%time_index%

   if (TimeElapsed > CurrentReminder) {
      MsgBox, 260, Reminder, It has been %CurrentName%.

      time_index++ ;Only increases if notification pops up
   }
return

MidNightWarning:
   if (A_Hour = 23 and A_Min = 55)
      MsgBox, 0, MidnightClock, Midnight is approaching.

   if (A_Hour = 23 and A_Min = 59)
      MsgBox, 0, MidnightClock, Midnight is almost here.
return

MidnightClock:
   if (A_Hour = 0 and A_Min = 0)
      Run, MidnightClock.ahk

   if (A_Hour = 01 and A_Min = 30)
      shutdown, 13

   if (A_Hour >= 02 and A_Hour <= 04)
      shutdown, 13
 
return


ConvertMSToHourMinSec(ms){
  return, floor(((ms / 1000) / 60 )/ 60) " hours "
        . floor(mod(((ms / 1000)/ 60), 60)) " minutes and "
        . floor(mod((ms / 1000), 60)) " seconds "
  ;     . floor(mod(ms, 1000)) " milliseconds " ;No need for milliseconds
}