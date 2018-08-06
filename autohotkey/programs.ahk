NotepadPP=..\apps\PortableApps\PortableApps\Notepad++Portable\Notepad++Portable.exe
Eclipse=P:\dev\eclipse\eclipse.exe
Photoshop=P:\Dropbox\apps\PhotoshopPortable\Photoshop64Portable.exe
Inkscape=..\apps\PortableApps\PortableApps\InkscapePortable\InkscapePortable.exe
ScreenCapture=..\apps\screen capture - images\FSCapture.exe
PortableApps=..\apps\PortableApps\Start.exe
VLC=..\apps\PortableApps\PortableApps\VLCPortable\VLCPortable.exe
Skype=P:\Dropbox\apps\PortableApps\PortableApps\SkypePortable\SkypePortable.exe
FileZilla=P:\Dropbox\apps\PortableApps\PortableApps\FileZillaPortable\FileZillaPortable.exe

;pdfedit=..\apps\PDFEditPortable\Portable Infix Pro PDF Editor v4.25.exe
;Cmder=P:\Dropbox\apps\cmder\Cmder.exe
;PgAdmin3=P:\dev\pgsql\bin\pgAdmin3.exe
;Webstorm=webstorm.ahk
;Forex=forex.ahk
;SourceTree=P:\dev\SourceTree\SourceTree.exe
;VSCode=P:\dev\Microsoft VS Code\Code.exe
;Word=P:\Dropbox\apps\Office15Portable\Word 2013.exe
;PowerPoint=P:\Dropbox\apps\Office15Portable\PowerPoint 2013.exe
;Excel=P:\Dropbox\apps\Office15Portable\Excel 2013.exe
; Chromium=P:\dev\chromium\ChromiumPortable.ahk
; Skype=P:\apps\SkypePortable\SkypePortable.exe
; Chrome=P:\apps\GoogleChromePortable\GoogleChromePortable.exe

#NoTrayIcon

SetWorkingDir, %A_ScriptDir%
return

^q::
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
return


runApp:
	GetKeyState, stateC, Ctrl, P
	if(stateC = "D")
		ruAsAdmin(A_ThisMenuItem)
	GetKeyState, stateC, Shift, P
	if(stateC = "D")
	{
		ppath:=%A_ThisMenuItem%
		InputBox, args, Parameters, Insert the parameters for the program
		Run,%ppath% %args%
	}
	else
	{
		SplitPath, %A_ThisMenuItem%, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
		Run,% %A_ThisMenuItem%, %OutDir%
	}
return

ruAsAdmin(programPath)
{
	SplitPath, programPath, OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
	Loop, %0%  ; No need for the intermediary variable 'param':
    params .= A_Space . """" . %A_Index% . """"
  DllCall("shell32\ShellExecuteA", uint, 0, str, "RunAs", str, programPath
            , str, SubStr(params,2) , str, OutDir, int, 1)
	return
}
