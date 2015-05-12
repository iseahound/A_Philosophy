:: move to script directory
cd /d %0\..

copy %1 "paintingtemp.ahkinc"
>> "paintingtemp.ahkinc" echo.
>> "paintingtemp.ahkinc" echo Sleep 1000
>> "paintingtemp.ahkinc" echo ExitApp
"C:\Program Files (x86)\AutoHotkey\AutoHotkey.exe\..\Compiler\Ahk2exe.exe" /in "DrawOnScreen.ahk" /out "%~n1.exe"
del "paintingtemp.ahkinc"