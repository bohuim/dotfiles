; AutoHotKey v1.1.33

; ----------
; AutoRun
; ----------
; This section is auto executed on load until the `return` statement.

; Group the following apps together.
GroupAdd, LCtrlAltSwap, ahk_exe Code.exe
GroupAdd, LCtrlAltSwap, ahk_exe Discord.exe
GroupAdd, LCtrlAltSwap, ahk_exe Explorer.EXE
GroupAdd, LCtrlAltSwap, ahk_exe WindowsTerminal.exe
GroupAdd, LCtrlAltSwap, ahk_exe firefox.exe
GroupAdd, LCtrlAltSwap, ahk_exe notepad.exe

return

; ----------
; LCtrlAlt
; ----------
; Activate the rebinds belows for the `LCtrlAltSwap` group.
#IfWinActive, ahk_group LCtrlAltSwap
    ; Swap LCtrl <-> LAlt to simulate macOS bindings.
    ; Since LAlt and cmd are in the same physical location.
    LAlt::LCtrl
    LCtrl::LAlt
    ; Specially rebind window tabbing.
    LAlt & Tab::AltTabAndMenu
    LCtrl & Tab::^Tab

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

