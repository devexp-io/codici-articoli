
~LButton::
	WinGetClass, win, A
	
	if(win == "CabinetWClass"){
		MouseGetPos, xpos, ypos 
		if(ypos < 30){
			Clipboard:=ActiveDir()
		}
	}

return



ActiveDir() {
	Dir := A_Desktop
	WinGetText, text, A
	Loop, Parse, text, `n
 	{
 		Line := A_LoopField
 		If(InStr(Line, "Indirizzo: "))
	 		StringTrimLeft, Dir, Line, 11 
	}
	Return Dir
}

