#SingleInstance Force

; Set title match mode to match any string in the title of a window
SetTitleMatchMode,2

;Allows for the script to be reloaded everytime it's saved
SetTimer,UPDATEDSCRIPT,1000

UPDATEDSCRIPT:
FileGetAttrib,attribs,%A_ScriptFullPath%
IfInString,attribs,A
{
	FileSetAttrib,-A,%A_ScriptFullPath%
	Sleep,500
	Reload
}
Return

LWin & e:: send, {escape}

LWin & k:: send, {up}

LWin & j:: send, {down} 

LWin & h:: send, {left} 

LWin & l:: send, {right} 

LWin & b:: send, ^{Left}

LWin & f:: send, ^{Right} 

F1::Suspend, Off ; stop suspending autohotkeys

+F1::Suspend, On ; suspend autohotkeys

exit_sequence_exists_in(variable)
{
	if variable contains !
	{
		send :{esc}
		return true
	}
}

start_processing_mnemonic()
{
    if ErrorLevel = Timeout
    {
        msgbox, Timed out waiting for mnemonic key sequence
        return
    }
}

process_universal_mnemonic(mnemonic)
{
	if mnemonic = a ; alt
	{
		send {Alt down}
		Input, mnemonic, T2 V, abcdefghijklmnopqrstuvwxyz{esc}, 
			if exit_sequence_exists_in(mnemonic)
				return
		send {Alt up}!
		return
	}
    if mnemonic = q ; quit 
    {
        send !{F4}
        return
    }
    if mnemonic = rm ; remove
    {
        send {delete}
		sleep 100
		send {enter}
        return
    }
    if mnemonic = r ; right click
    {
        send +{F10}
        return
    }
    if mnemonic = pt ; previous tab
    {
        send +^{tab}
        return
    }
    if mnemonic = nt ; next tab
    {
        send ^{tab}
        return
    }
    if mnemonic = cp ; copy
    {
        send ^c
        return
    }
	if mnemonic = re ; redo
	{
		send ^y
		return
	}
	if mnemonic = u ; undo
	{
		send ^z
		return
	}
    if mnemonic = mv ; move
    {
        send ^x
        return 
    }
    if mnemonic = p ; paste
    {
        send +{ins}
        return
    }
    if mnemonic = max ; maximize
    {
        send #{up}
        return
    }
    if mnemonic = min ; minimize
    {
        send #{down}
        return
    }
    if mnemonic = j ; page down
    {
        send {PgDn}
        return
    }
	if mnemonic = h ; home
	{
		send {Home}
		return
	}
	if mnemonic = l ; end
	{
		send {End}
		return
	}
    if mnemonic = k ; page up
    {
        send {PgUp}
        return
    }
    if mnemonic = r ; rename
    {
        send {f2}
        return
    }
    if mnemonic = mw ; move window
    {
        send +#{right}
        return
    }
	if mnemonic = s ; save
	{
		send ^s
		return
	}
	if mnemonic = sr ; squeeze right
	{
		send {LWin Down}{right}{LWin Up}
		return
	}
	if mnemonic = sl ; squeeze left
	{
		send {LWin Down}{left}{LWin Up}
		return
	}
	if mnemonic = v ; visual mode
	{
		send {LShift Down}
		return
	}
}

LWin & space::
Input, mnemonic, T2, {enter}{esc}, 
	if ErrorLevel = Timeout
		return
	if ErrorLevel = EndKey:Escape
		return
	if exit_sequence_exists_in(mnemonic)
		return
process_mnemonic(mnemonic)
return

LWin & `;::
Input, mnemonic, T2, {enter}, 
	if ErrorLevel = Timeout
		return
	if ErrorLevel = EndKey:Escape
		return
	if exit_sequence_exists_in(mnemonic)
		return

if mnemonic = p ; previous window
{
	send !{tab}
	return
}
if mnemonic = s ; switch window
{
	inputbox, window_title, switch window, enter window title
		if ErrorLevel 
			return
		ToggleWinMinimize(window_title)
		return
}
if mnemonic = ff ; switch to firefox
{
	ToggleWinMinimize("ahk_class MozillaWindowClass")
	return
}
if mnemonic = vim ; switch to gvim
{
	ToggleWinMinimize("ahk_class Vim")
	return
}
if mnemonic = con ; switch to console
{
	ToggleWinMinimize("ahk_class Console_2_Main")
	return
}
if mnemonic = vis ; switch to visual studio
{
	ToggleWinMinimize("Microsoft Visual Studio")
	return
}
if mnemonic = out ; switch to outlook
{
	ToggleWinMinimize("Outlook")
	return
}
if mnemonic = babe ; switch to addie's chat window
{
	ToggleWinMinimize("addie")
	return
}

process_mnemonic(mnemonic)
{
	start_processing_mnemonic()

	process_universal_mnemonic(mnemonic)

	IfWinActive, ahk_class Vim
	{
		process_gvim_mnemonic(mnemonic)
		return
	}
	IfWinActive, ahk_class MozillaWindowClass
	{
		process_firefox_mnemonic(mnemonic)
		return
	}
	IfWinActive, ahk_class Console_2_Main
	{
		process_powershell_mnemonic(mnemonic)
		return
	}
	IfWinActive, Microsoft Visual Studio
	{
		process_visual_studio_mnemonic(mnemonic)
		return
	}
	IfWinActive, Outlook
	{
		process_outlook_mnemonic(mnemonic)
		return
	}
	IfWinActive, ahk_class CabinetWClass
	{
		process_windows_explorer_mnemonic(mnemonic)
		return
	}
}

#include %A_ScriptDir%\visual studio autohotkey mappings.ahk
#include %A_ScriptDir%\gvim autohotkey mappings.ahk
#include %A_ScriptDir%\windows explorer autohotkey mappings.ahk
#include %A_ScriptDir%\powershell autohotkey mappings.ahk
#include %A_ScriptDir%\firefox autohotkey mappings.ahk
#include %A_ScriptDir%\outlook autohotkey mappings.ahk

ToggleWinMinimize(TheWindowTitle)
{
	SetTitleMatchMode,2
	DetectHiddenWindows, Off
    IfWinExist, %TheWindowTitle%
    {
	  WinGet, winid, ID, %TheWindowTitle%
	  DllCall("SwitchToThisWindow", "UInt", winid, "UInt", 1)
    }
	Return
}

LWin & a::
LWin & c::
LWin & d::
LWin & w::
LWin & g::
LWin & i::
LWin & m::
LWin & n::
LWin & o::
LWin & p::
LWin & q::
LWin & r::
LWin & s::
LWin & t::
LWin & u::
LWin & v::
LWin & x::
LWin & y::
LWin & z::
LWin & ,:: 
LWin & 4::
LWin & 0::
