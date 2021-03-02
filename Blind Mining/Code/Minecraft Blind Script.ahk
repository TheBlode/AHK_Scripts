#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Blind Mining Script!
; Written by The_Blode
; 22/05/2020
; A script that attempts to help blind users play Minecraft!

; Declare variables
left_counter = 1
right_counter = 1
pixel_shift = 50
refocus_counter = 0

; Welcome user to Blind Mining!
SoundPlay, sounds/welcome.mp3, 1

; Play instructions on how to use the script
SoundPlay, sounds/instructions.mp3, 1

; Let's play Minecraft!
SoundPlay, sounds/play.mp3, 1

; =============================================================
; Main loop
; =============================================================
; Declare variables
block_counter = 0

Loop
{
	; Sleep a little
	Sleep, 1000

	; Grab current pixel
	PixelGetColor, colour, 427, 265

	; Debug
	SplashTextOn, 1, 1, %colour%

	; Check against last pixel colour to determine if we hit an obstable
	FileReadLine, lastColour, block_pixel.txt, 1

	; Play clicky sound
	IfEqual, colour, %lastColour%
	{
		SoundPlay, sounds/obstable.mp3
	}

	; Write pixel colour to file
	FileDelete, block_pixel.txt
	FileAppend, %colour%, block_pixel.txt
}

; =============================================================
; Hotkeys
; =============================================================
; Remap left arrow key for turning left
Left::
{
	; Get current mouse position
	MouseGetPos, x, y

	; Subtract pixels from the x position (to turn left)
	EnvSub, x, 50

	; Multiply by the counter to move further left
	EnvMult, pixel_shift, %left_counter% 

	; Simulate the mouse moving left
	MouseMove, %x%, %y%

	; Increment counter
	left_counter++

	; Draw tiny window to allow turning
	SplashTextOn, 1, 1, %x% %y%

	; Refocus after certain number of turns
	result := Mod(refocus_counter, 25)
	refocus_counter++

	IfEqual, result, 0
	{
		; Focus ahead
		focusAhead()
		
		; Reset counter
		refocus_counter = 1
	}

	; Exit
	return
}

; Remap right arrow key for turning right
Right::
{
	; Get current mouse position
	MouseGetPos, x, y

	; Subtract pixels from the x position (to turn right)
	EnvAdd, x, 50

	; Multiply by the counter to move further right
	EnvMult, 500, %right_counter% 

	; Simulate the mouse moving right
	MouseMove, %x%, %y%

	; Increment counter
	right_counter++

	; Draw tiny window to allow turning 
	SplashTextOn, 1, 1, %x% %y%

	; Refocus after certain number of turns
	result := Mod(refocus_counter, 25)
	refocus_counter++

	IfEqual, result, 0
	{
		; Focus ahead
		focusAhead()

		; Reset counter
		refocus_counter = 1
	}

	; Exit
	return
}

focusAhead()
{
	; Look at the floor
	Loop, 14
	{
		; Get current mouse position
		MouseGetPos, x, y

		; Look at the floor
		EnvAdd, y, 100
		
		; Look down
		MouseMove, %x%, %y%
		
		; Wait a little
		Sleep, 10

		; Draw tiny window to allow turning 
		SplashTextOn, 1, 1, %x% %y%
	}

	; Refocus straight ahead
	Loop, 6
	{
		; Get current mouse position
		MouseGetPos, x, y

		; Look up
		EnvSub, y, 100
		
		; Look up
		MouseMove, %x%, %y%
		
		; Wait a little
		Sleep, 50

		; Draw tiny window to allow turning 
		SplashTextOn, 1, 1, %x% %y%
	}

	; Exit
	return
}

; =============================================================
; End of Hotkeys
; =============================================================