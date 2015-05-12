:: move to script directory
cd /d %0\..

:: create or empty paintingtemp.ahkinc (necessary if paintingtemp.ahkinc already exists)
>> "paintingtemp.ahkinc" echo.
:: does nothing if %1 does not exist:
copy %1 "paintingtemp.ahkinc"
start "C:\Program Files (x86)\AutoHotkey\AutoHotkey.exe" "DrawOnScreen.ahk" "%1"