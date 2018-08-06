
SetTitleMatchMode, 2


^1::
	WinActivate, ahk_class Chrome_WidgetWin_1
	WinWaitActive, ahk_class Chrome_WidgetWin_1
	Send, ^t
	Send,^l
	Send,https://devexp.io{Enter}
return
