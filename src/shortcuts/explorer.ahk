;

; 'ahk_class #32770' refers to explorer-like file/folder selection windows,
; such as opened when pressing Ctrl+O in many applications.

; Explorer or explorer-like:
;
; p: go backward in history
; P: go one level up
; n: go forward in history
#If Options["ENABLE_WINDOWS_EXPLORER_COMMANDS"] and (WinActive("ahk_exe explorer.exe") or WinActive("ahk_class #32770"))
  p::
    turnVisualModeOff()
    Send, !{Left}
  Return

  +p::
    Send, !{Up}
  Return

  n::
    turnVisualModeOff()
    Send, !{Right}
  Return
#If

; ALl other non-explorer applications (vim-like paste behavior)
#If not Options["ENABLE_WINDOWS_EXPLORER_COMMANDS"] or not (WinActive("ahk_exe explorer.exe") or WinActive("ahk_class #32770"))
  p::
    if (visualMode) {
      Send, {BackSpace}
      switchToNormalMode()
    }

    Send, ^v
  Return

  +p::
    if (visualMode){
      Send, {BackSpace}
      switchToNormalMode()
    }

    Send, {Left}
    Send, ^v
  Return
#If
