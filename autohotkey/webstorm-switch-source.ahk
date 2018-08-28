html=html
css=scss
ts=ts
app=app.component.ts
module=app.module.ts
style=style.scss
it=it.json
en=en.json
service=service.ts
store=store.ts
component=component.ts
curr:=0

SetWorkingDir, %A_ScriptDir%
SetTimer, UPDATEDSCRIPT, 1000
return


#IfWinActive ahk_class Chrome_WidgetWin_1

#s::
XButton2:: 
temp:=clipboardall

filename:= grabFileName()
line:=countRows()
;charsCount:=countCols()
x=%filename%:%line%
sleep,100
WinActivate, ahk_class SunAwtFrame
WinWaitActive, ahk_class SunAwtFrame
Sleep,100
Send,^p
Send,%x%
Sleep,100
Send,{Enter}

clipboard:=temp
return

#IfWinActive ahk_class SunAwtFrame

#s::
XButton2::
	temp:=clipboardall
	Send,^+c
	ClipWait, 1
	file:=clipboard
	
	line:=countRows()
	StringGetPos, c, file, \, R
	c := c+1
	StringTrimLeft, OutputVar, file, c
	WinActivate, ahk_class ahk_class Chrome_WidgetWin_1
	WinWaitActive, ahk_class ahk_class Chrome_WidgetWin_1
	KeyWait, LButton, D
	Sleep,100
	Send,^p
	Sleep,100
	Send,%OutputVar%:%line%
	clipboard:=temp
return

F7::Send,console.log(){LEFT}

^r::
~MButton::
MouseGetPos, OutputVarX, OutputVarY
if(OutputVarY > 150){
	Loop, Read, %A_ScriptFullPath%
	{
		if(StrLen(A_LoopReadLine)<1)
			break
		StringSplit, programs, A_LoopReadLine, = 
		Menu, apps, Add, %programs1%, runApp
		filepath=
		Loop, %programs2%
		 {
		 	filepath=%A_LoopFileLongPath%
		 	StringReplace, filepath, filepath, .ahk, .exe
		 }
		Menu, apps, Icon, %programs1%, %filepath%
		%programs1%=%programs2%
	}
	Menu,Apps,show	
}
return

#t::
	open("ts")
return

#h::
	open("html")
return



#c::
	open("scss")
return

#b::
Send,^!j
Sleep,100
Send,{Enter}
Sleep,100
Send,b{Esc}{Esc}
return

#i::
Send,^!j
Sleep,100
Send,{Enter}
Sleep,100
Send,i{Esc}{Esc}
return

#u::
Send,<ul>{Enter}<li>
return 

WheelLeft::
	clip_temp:=ClipboardAll
	Send,^+c
	ClipWait, 1
	SplitPath, clipboard, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
	clipboard:=clip_temp
	if(ext == "ts")
		open("scss")
	else if(ext == "scss")
		open("html")
	else if(ext == "html")
		open("ts")
return
WheelRight::
	clip_temp:=ClipboardAll
	Send,^+c
	ClipWait, 1
	SplitPath, clipboard, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
	clipboard:=clip_temp
	if(ext == "ts")
		open("html")
	else if(ext == "scss")
		open("ts")
	else if(ext == "html")
		open("scss")
return


open(ext){
	
	clip_temp:=ClipboardAll
	Send,^+c
	ClipWait, 1
	SplitPath, clipboard, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
	sleep,50
	clipboard=%OutNameNoExt%.%ext%
	Send,^p
	ClipWait, 1
	sleep,200
	Send,^v
	sleep,100
	Send,{enter}
	clipboard:=clip_temp
	return
	
}


runApp:
	cmd:=%A_ThisMenuItem%
	;tooltip,%A_ThisMenuItemPos% 
	clip_temp:=ClipboardAll
	if(A_ThisMenuItemPos <= 3){
		sleep,50
		Send,^+c
		ClipWait, 1
		SplitPath, clipboard, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		sleep,50
		;tooltip,%OutNameNoExt%
		clipboard=%OutNameNoExt%.%cmd%
	} else {
		clipboard=%cmd%
	}

	Send,^p
	ClipWait, 1
	Send,^v
	Sleep,120
	if(A_ThisMenuItemPos <= 8)
		Send,{Enter}
	else
		Send,{Home}.{Home}
	clipboard:=clip_temp
return

UPDATEDSCRIPT:
FileGetAttrib,attribs,%A_ScriptFullPath%
IfInString,attribs,A
{
FileSetAttrib,-A,%A_ScriptFullPath%
SplashTextOn,,,Updated script,
Sleep,300
Reload
}
Return


countCols(){
	Send,{Shift down}{Home}{Shift up}
  Send,^c
  ClipWait, 1
  Send,{RIGHT}
  StringLen, charsCount, clipboard
  return charsCount
}


countRows(){
	Send,{Shift down}{PgUp 10}{Shift up}
	sleep, 100
  Send,^c
  sleep, 100
  ClipWait, 1
  Send,{RIGHT}
  StringSplit, foundLines, clipboard, `n
  return foundLines0
}

grabFileName() {
	Send, {RButton}
	sleep, 100
	Send,c
	ClipWait, 1
	file:=clipboard
	StringGetPos, c, file, /, R
	c := c+1
	StringTrimLeft, OutputVar, file, c
	return OutputVar
	
}


