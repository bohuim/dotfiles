; AutoHotKey v1.1.33

; ----------
; LCtrlAlt
; ----------
; Add apps to a group.
GroupAdd, LCtrlAltSwap, ahk_exe Code.exe
GroupAdd, LCtrlAltSwap, ahk_exe Discord.exe
GroupAdd, LCtrlAltSwap, ahk_exe Explorer.EXE
GroupAdd, LCtrlAltSwap, ahk_exe WindowsTerminal.exe
GroupAdd, LCtrlAltSwap, ahk_exe firefox.exe
GroupAdd, LCtrlAltSwap, ahk_exe notepad.exe
return

; Swap LCtrl and LAlt for the above group.
#IfWinActive, ahk_group LCtrlAltSwap
    LAlt::LCtrl
    LCtrl::LAlt

; ----------
; CapsLock
; ----------
; References
; https://gist.github.com/sedm0784/4443120

; Rebind regular CapsLock to Shift+CapsLock instead.
+CapsLock::
    SetCapsLockState, % (State := !State) ? "on" : "off"
    return

; CapsLock acts as Escape when tapped alone, or Ctrl+{Key} on key down.
CapsLock::
    Send {LControl Down}
    KeyWait, CapsLock
    Send {LControl Up}
    if (A_PriorKey == "CapsLock")
    {
        Send {Esc}
    }
    return

