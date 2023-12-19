;
; Windows Explorer group
;
; "ahk_class #32770" refers to explorer-like file pickers, such as opened when pressing Ctrl+O in many applications
; "ahk_class WorkerW" refers to the desktop (when focused)
;
GroupAdd, Explorer, ahk_exe explorer.exe
GroupAdd, Explorer, ahk_class #32770
GroupAdd, Explorer, ahk_class WorkerW

ExplorerActive() {
  return Options["ENABLE_WINDOWS_EXPLORER_COMMANDS"] and WinActive("ahk_group Explorer")
}
