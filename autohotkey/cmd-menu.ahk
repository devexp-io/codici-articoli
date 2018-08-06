c=cd c:\
Desktop=cd C:\Users\Sa\Desktop
start=npm start
build=ng build --prod

SetWorkingDir, %A_ScriptDir%
SetTimer, UPDATEDSCRIPT, 1000
return

#IfWinActive ahk_class ConsoleWindowClass
~MButton::
MouseGetPos, OutputVarX, OutputVarY
if(OutputVarY > 100){
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


runApp:
	cmd:=%A_ThisMenuItem%
	Send,%cmd%{Enter}
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



