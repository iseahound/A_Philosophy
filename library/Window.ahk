;NOTES
;
;0x8 is Always on Top. This variable does not apply when added as a hex. (idky)
;0x20 is Click Through, however it needs transparency to be applied. So 0x80020 to a normal, opaque window. 
;0x80000 is Transparency. The actual transparency variable is stored elsewhere. 



Montage(){
   WinSet, AlwaysOnTop, OFF, A         ;Tricky! A Style value cannot be negative.
   WinGet, ExStyle, ExStyle, A         ;If it would be negative, it is not applied.
   WinSet, ExStyle, -0x80020, A        ;Therefore, if the style value has not changed,
   WinGet, Normal, ExStyle, A          ;then it never had a Style to begin with. 
   if (ExStyle = Normal){
      WinSet, AlwaysOnTop, On, A       ;Apply styles. 
      WinSet, ExStyle, +0x80020, A
      WinSet, Transparent, 187, A
   }
   return
}

Peek(){                                ;3D drag and drop!
   WinGet, ID, ID, A
   WinGet, ExStyle, ExStyle, ahk_id %ID%
   WinGet, Transparent, Transparent, ahk_id %ID%
   WinSet, AlwaysOnTop, ON,  ahk_id %ID%
   WinSet, ExStyle, 0x80020, ahk_id %ID%
   WinSet, Transparent, 125, ahk_id %ID% 
   if (Transparent = "")
      Transparent := "OFF"
   KeyWait, Space
   if !(ExStyle & 0x8)
      WinSet, AlwaysOnTop, OFF,  ahk_id %ID%
   WinSet, ExStyle, %ExStyle%, ahk_id %ID%
   WinSet, Transparent, %Transparent%, ahk_id %ID%
   WinActivate, ahk_id %ID%
}

AlwaysOnTop(){
   WinSet, AlwaysOnTop, Toggle, A
}

AlwaysOnTopM(){
   MouseGetPos,,, MouseWin
   WinSet, AlwaysOnTop, Toggle, ahk_id %MouseWin%
}

ClickThrough(){
   WinGet, ExStyle, ExStyle, A
   if (ExStyle & 0x80020)
      WinSet, ExStyle, -0x80020, A
   else WinSet, ExStyle, +0x80020, A
}

ClickThroughM(){
   MouseGetPos,,, MouseWin
   WinGet, ExStyle, ExStyle, ahk_id %MouseWin%
   if (ExStyle & 0x80020)
      WinSet, ExStyle, -0x80020, ahk_id %MouseWin%
   else WinSet, ExStyle, +0x80020, ahk_id %MouseWin%
}

Move(x){
   if (x = 1)
      WinMove, A, , 0, A_ScreenHeight/2, A_ScreenWidth/2, A_ScreenHeight/2
   if (x = 2)
      WinMove, A, , 0, A_ScreenHeight/2, A_ScreenWidth, A_ScreenHeight/2
   if (x = 3)
      WinMove, A, , A_ScreenWidth/2, A_ScreenHeight/2, A_ScreenWidth/2, A_ScreenHeight/2
   if (x = 4)
      WinMove, A, , 0, 0, A_ScreenWidth/2, A_ScreenHeight
   if (x = 6)
      WinMove, A, , A_ScreenWidth/2, 0, A_ScreenWidth/2, A_ScreenHeight
   if (x = 7)
      WinMove, A, , 0, 0, A_ScreenWidth/2, A_ScreenHeight/2
   if (x = 8)
      WinMove, A, , 0, 0, A_ScreenWidth, A_ScreenHeight/2
   if (x = 9)
      WinMove, A, , A_ScreenWidth/2, 0, A_ScreenWidth/2, A_ScreenHeight/2
   if (x = 0)
      WinMinimize, A
}

Opacity(n){
   WinGet, Transparent, Transparent, A
   if (Transparent = "")
      Transparent := 255
   TransValue := Transparent + n
   if (TransValue >= 255)
      WinSet, Transparent, OFF, A
   else if (TransValue < 1)
      WinSet, Transparent, 1, A
   else WinSet, Transparent, %TransValue%, A
}

OpacityM(n){
   MouseGetPos,,, MouseWin
   WinGet, Transparent, Transparent, ahk_id %MouseWin%
   if (Transparent = "")
      Transparent := 255
   TransValue := Transparent + n
   if (TransValue >= 255)
      WinSet, Transparent, OFF, ahk_id %MouseWin%
   else if (TransValue < 1)
      WinSet, Transparent, 1, ahk_id %MouseWin%
   else WinSet, Transparent, %TransValue%, ahk_id %MouseWin%
}

Reset(){
   WinSet, AlwaysOnTop, OFF, A
   WinSet, ExStyle, -0x80020, A
   WinSet, Transparent, OFF, A
}

ResetAll(){
   WinGet, id, list,,,                  ;Program Manager   ;Don't exclude the desktop
   Loop, %id%
   {
      this_id := id%A_Index%
      WinActivate, ahk_id %this_id%
      Reset()
   }
}