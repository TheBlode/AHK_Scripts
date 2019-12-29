#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Suspend my PC
; 26/11/2016
; M McCarthy
; Version 1

; Inform user of impending suspension
MsgBox, 1, Scheduled `Suspend, The system will `suspend `in 1 minute. Click `Cancel to abort., 60

; If user aborts then exit
IfMsgBox, Cancel
{

; Abort suspend...exit application
ExitApp

}

; Suspend PC
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)

; Exit application
ExitApp