; AutoHotKey v1.1.33
; Maps CapsLock to ESC when tapped alone, or Ctrl+{Key} on key down.
; 
; References
; https://gist.github.com/sedm0784/4443120

; Create a group for all apps that should have CapsLock functionality overriden.
SetTitleMatchMode, 2 ; match anywhere in title string
GroupAdd, CapsLockOverrideGroup, ahk_exe WindowsTerminal.exe

; Hook onto the window change event, and call the custom function below.
#Persistent
gui +LastFound
DllCall("RegisterShellHookWindow", UInt, WinExist())
onWindowChange := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")
OnMessage(onWindowChange, "OnWindowChange")
return

; This function is triggered whenever the active window changes.
; If the active window is a part of the CapsLockOverrideGroup, disable CapsLock;
; otherwise, simply turn it off but available for use.
OnWindowChange(wParam, lParam) {
    SetCapsLockState, % WinActive("ahk_group CapsLockOverrideGroup") ? "alwaysoff" : "off"
}

; For the apps with CapsLock disabled, use it as a dual purpose Ctrl+ or Esc.
#IfWinActive ahk_group CapsLockOverrideGroup
CapsLock::
    Send {LControl Down}
    KeyWait, CapsLock
    Send {LControl Up}
    if (A_PriorKey == "CapsLock")
    {
        Send {Esc}
    }
    return

