#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

currentDesktop := 1
targetDesktop = 1;
DELAY = 150;

~^!1::
goToDesktop(1, DELAY)
return

~^!2::
goToDesktop(2, DELAY)
return

~^!3::
goToDesktop(3, DELAY)
return

~^!4::
goToDesktop(4, DELAY)
return

^#Right::
goToDesktop(currentDesktop+1, DELAY)
return

^#Left::
goToDesktop(currentDesktop-1, DELAY)
return

goToDesktop(deskNumber, delay) {
	global currentDesktop
	global targetDesktop
	targetDesktop := deskNumber
	
	while (currentDesktop != deskNumber && targetDesktop == deskNumber) {
		if (currentDesktop < deskNumber) {
			Send ^#{Right}
			currentDesktop++
		} else if (currentDesktop > deskNumber) {
			Send ^#{Left}
			currentDesktop--
		}
		if (currentDesktop != deskNumber) {
			Sleep delay
		}
	}
	return
}