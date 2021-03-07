; ========================================
; Schedule Eye Breaks
; Written by The_Blode
; 22/02/2019
; Draws a black overlay over your screen every 20 minutes for 30 seconds to allow you to rest your eyes.
; To terminate the script, press Control + X
; To pause the script, press Control + Z
; ========================================

; ========================================
; Main Loop
; ========================================
Loop
{
	; Sleep for 20 minutes
	Sleep, 1200000
	; Draw black screen overlay for 30 seconds
	drawBlackScreen(30000)

	; Sleep for 20 minutes
	Sleep, 1200000
	; Draw black screen overlay for 30 seconds
	drawBlackScreen(30000)

	; Sleep for 20 minutes
	Sleep, 1200000

	; Draw black screen overlay for 30 seconds
	drawBlackScreen(30000)
}

; ========================================
; Hotkeys
; ========================================
; Control + Z - pause hotkey
^z::Pause

; Control + X - script exit hotkey
^x::ExitApp

; ========================================
; Functions
; ========================================
; Function name: drawBlackScreen
; Function description: this function will draw a black overlay over the entire screen.
drawBlackScreen(number_of_seconds)
{
	Gui, Color, black
	; Gui +AlwayOnTop
	Gui -Caption
	Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%
	Sleep, %number_of_seconds%
	Gui, Destroy
}