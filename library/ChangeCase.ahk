ChangeCase(c) {

   AutoTrim Off  
   ClipboardOld = %ClipboardAll%
   Clipboard =  ; Must start off blank for detection to work.
   Send, ^c
   ClipWait 1
   if ErrorLevel
      return
   if (c = "Lower")
      StringLower, clipboard, clipboard
   if (c = "Upper")
      StringUpper, clipboard, clipboard
   if (c = "Title")
      StringUpper, clipboard, clipboard, T
   if (c = "Sentence") {
      X = I,LOL
      S = 
      T := RegExReplace(clipboard, "[\.\!\?]\s+|\R+|\t+", "$0þ")
      Loop Parse, T, þ 
      {
         StringLower L, A_LoopField
         I := Chr(Asc(A_LoopField))
         StringUpper I, I
         S .= I SubStr(L,2)
      }
      Loop Parse, X, `,
         S := RegExReplace(S, "i)\b" A_LoopField "\b", A_LoopField)
      Clipboard = %S%
   }
   if (c = "K")
      Clipboard := RegexReplace(clipboard, "_", " ")
   Send, ^v
   Sleep 50                             ; Don't change clipboard while it is pasted! (Sleep > 0)
   Clipboard = %ClipboardOld%
   VarSetCapacity(ClipboardOld, 0)      ; Free memory
   AutoTrim On
}