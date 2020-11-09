; AutoHotKey v1.1.33
;
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

