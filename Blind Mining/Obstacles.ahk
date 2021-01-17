#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Declare variables
block_counter = 0

; Main loop
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
		SoundPlay, nothing.mp3
		SoundPlay, block.mp3
	}

	; Write pixel colour to file
	FileDelete, block_pixel.txt
	FileAppend, %colour%, block_pixel.txt
}