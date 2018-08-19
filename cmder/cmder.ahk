projects=cd P:\Dropbox\projcts
start=npm start
build=ng build --prod

SetWorkingDir, %A_ScriptDir%
SetTimer, UPDATEDSCRIPT, 1000
return

#IfWinActive ahk_class VirtualConsoleClass
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
	if(A_ThisMenuItem == "Pack_qshared"){
		RunWait,P:\dev\node\npm.cmd run pack, P:\Dropbox\qberg\qshared-module
		RunWait,P:\dev\node\npm.cmd install file:..\\qshared-module\\lib\\qshared-module-1.0.0.tgz,P:\Dropbox\qberg\qsearch-module
	}
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

#IfWinActive ahk_class VirtualConsoleClass
::cdc::
 Send,cd %clipboard%
return
::ns::
 Send,npm start{enter}
return



