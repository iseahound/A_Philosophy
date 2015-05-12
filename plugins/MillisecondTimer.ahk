/*
 *		Millisecond Timer (Updated with split times 10/12/2013)
 *
 *		Directions: 
 *			Start/Stop/Continue/Reset = Self Explanatory
 *			Split button: saves time without stopping the clock. Useful for lap times.
 *			Copying: click on the time displayed to save it. Also, click on split times to save them.
 */
 
 ;Timer GUI
	Gui , Timer:Font , s20 , Courier Bold
	Gui , Timer:Add  , Text , Center w225 gCopyMain , 00:00:00:000
	Gui , Timer:Font , s10 , Verdana
	Gui , Timer:Add  , Button , x25 y60 w90 gStop Section , Stop
	Gui , Timer:Add  , Button , x25 y60 w90 gStart, Start
	Gui , Timer:Add  , Button , w60 ys x125 gSplit, Split
	Gui , Timer:Add  , Button , w60 ys x195 gReset , Reset
	Loop 20
		Gui , Timer:Add , Text , Section xm gCopySplits , %A_Space%Split %A_Index%: `t00:00:00:000
	Gui , Timer:+AlwaysOnTop
	Gui , Timer:Show , h100 , Timer
	Control , Hide , , Button1 , Timer
	AdjTime = 0
	Exit

Start:
	Control , Hide , , Button2 , Timer
	Control , Show , , Button1 , Timer  ;  Shows Stop Button
	GuiControl , Focus , Button1
	StopClock = 0	
	ST := A_TickCount ; Start Time
	While StopClock = 0
		ControlSetText 	, Static1 , % FormatCT((A_TickCount - ST) + AdjTime)
	StopClock = 0
	Exit

Stop:
Reset:
	Control , Show , , Button2 , Timer  ;  Shows Start Button
	Control , Hide , , Button1 , Timer
	GuiControl , Focus , Button2
	StopClock = 1
	IF (A_ThisLabel = "Reset")
	{
		AdjTime = 0
		ControlSetText , Button2 , Start
		ControlSetText 	, Static1 , 00:00:00:000
		If SplitNum > 0
			WinMove , Timer ,,,,, 130
		SplitNum:=
		SplitTxtAll:=
	}else{
		AdjTime := ((A_TickCount - ST) + AdjTime)
		ControlSetText , Button2 , Continue
	}
	Exit
	
Split:
	ControlGetText , Split , Static1
	h = 130
	If (SplitNum < 20) & (Split <> "00:00:00:000")  ;  Up to 20 splits, but ignored if the timer has not started.
	{
		SplitNum++
		ControlID := "Static" . SplitNum+1
		Splittxt = Split %SplitNum%: `t%Split%
		ControlSetText , %ControlID% , %A_Space%%SplitTxt%
		SplitTxtAll := SplitTxtAll . "`n" . SplitTxt
		WinMove , Timer ,,,,, % h + SplitNum*31  ;  determines the height of the GUI
	}	
	Exit
	
CopyMain:
	ControlGetText , Clipboard , Static1
	MsgBox, 262192, Time Copied to Clipboard, Copied to Clipboard: %Clipboard%, 2
	Exit

CopySplits:
	Clipboard := SplitTxtAll
	MsgBox, 262192, Splits Copied to Clipboard, Copied to Clipboard: `n`n%Clipboard%, 2
	Exit

TimerGuiClose:
	ExitApp

FormatCT(ms)  ;  Formats milliseconds into 00:00:00:000 (last three digits are milliseconds)
{
	StringRight , mil , ms , 3
	StringTrimRight , sec , ms , 3
	min := Floor(sec/60)
	sec := sec-(min*60)
	hrs := Floor(min/60)
	min := min-(hrs*60)
	While StrLen(sec) <> 2
		sec := "0" . sec
	While StrLen(mil) <> 3
		mil := "0" . mil
	While StrLen(min) <> 2
		min := "0" . min
	While StrLen(hrs) <> 2
		hrs := "0" . hrs 
	return , hrs . ":" . min . ":" . sec . ":" . mil
}