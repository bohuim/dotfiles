; AutoHotKey v1.1.33
;
; Comments use format `{Key}_(p|l)(d|u)` where
; - `p` denotes physical.
; - `l` denotes logical.
; - `d` denotes down/press.
; - `u` denotes up/release.
;
; For example, `LWin_pd` is press down on the physical switch located where the
; left Windows button is located on most keyboards (between LCtrl and LAlt).

; ----------
; AutoRun
; ----------
; This section is auto executed on load until the `return` statement.

#InstallKeybdHook

; Group: Revamp CapsLock functionality.
GroupAdd, RevampCapsLock, ahk_exe Code.exe
GroupAdd, RevampCapsLock, ahk_exe Explorer.EXE
GroupAdd, RevampCapsLock, ahk_exe WindowsTerminal.exe
GroupAdd, RevampCapsLock, ahk_exe firefox.exe

; Group: Switch LCtrl and LAlt without changing AltTab.
GroupAdd, LCtrlAltSwap, ahk_exe Code.exe
GroupAdd, LCtrlAltSwap, ahk_exe Discord.exe
GroupAdd, LCtrlAltSwap, ahk_exe Explorer.EXE
GroupAdd, LCtrlAltSwap, ahk_exe firefox.exe
GroupAdd, LCtrlAltSwap, ahk_exe notepad.exe

; Group: AltTab window switcher window.
GroupAdd AltTabWindow, ahk_class MultitaskingViewFrame  ; Windows 10
return

; ---------------
; RevampCapsLock
; ---------------
#IfWinActive, ahk_group RevampCapsLock

; Rebind regular CapsLock to Shift+CapsLock instead.
; +CapsLock::
    ; SetCapsLockState, % (State := !State) ? "on" : "off"
    ; return

; Disable CapsLock functionality entirely.
SetCapsLockState, Off

; CapsLock acts as Escape when tapped alone, or Ctrl+{Key} on key down.
; https://gist.github.com/sedm0784/4443120
CapsLock::
    Send {LControl Down}
    while GetKeyState("CapsLock", "P")
        Sleep, 10
    Send {LControl Up}
    if (A_PriorKey == "CapsLock")
        Send {Esc}
    return

#If ; EndIfWinActive ahk_group RevampCapsLock

; ---------------
; LCtrlAltSwap
; ---------------
#IfWinActive, ahk_group LCtrlAltSwap

LCtrl::LAlt
LAlt::
    Send {Ctrl down}
    KeyWait, LAlt
    Send {Ctrl up}
    ; If the window switcher is open, send Enter_l to select the currently hovered window.
    if WinActive("ahk_group AltTabWindow")
        Send {Enter}
    ; Release any keys to prevent any weird state.
    Send {LCtrl up}{LAlt up}
    return

; Enable AltTab behavior despite above Alt rebind.
; Note: `^` denotes Ctrl_l, so the LAlt binding above triggers here.
*Tab::
    isAltDown := GetKeyState("LAlt", "P")
    isCtrlDown := GetKeyState("LCtrl", "P")
    isShiftDown := GetKeyState("LShift", "P")
    if isAltDown {
        if isShiftDown
            Send {Shift down}{Alt down}{Tab}
        else
            Send {Alt down}{Tab}
    }
    else if isCtrlDown {
        if isShiftDown
            Send +^{Tab}
        else
            Send ^{Tab}
    }
    else {
        ; Otherwise just send tab.
        Send {Tab}
    }
    return

#If ; EndIfWinActive ahk_group LCtrlAltSwap
