#SingleInstance force
SetTitleMatchMode, RegEx
SetWorkingDir, %A_ScriptDir%
SetTimer, UPDATEDSCRIPT, 1000
  
return

XButton2::Send,{LWin down}{Tab}{LWin up}

#IfWinActive ahk_class Shell_TrayWnd
XButton1::
	Send,{Alt down}{Tab}{Alt up}
return



#IfWinActive Google Chrome
XButton1::Browser_Back


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
