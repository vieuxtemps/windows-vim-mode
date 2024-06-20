; Options

global IniFile := "options.ini"
global Options := {}

if (!FileExist(IniFile)) {
  FileCopy, % A_WorkingDir "\data\defaultOptions.ini", % A_WorkingDir "\" IniFile
}

ReadIni(section, key, defaultValue) {
  outVar := 0
  IniRead, outVar, % IniFile , % section, % key
  if (outVar = "ERROR")
    Options[key] := defaultValue
  else
    Options[key] := outVar
}

; [Options]
ReadIni("Options", "ENABLE_WINDOWS_EXPLORER_COMMANDS", 1)
ReadIni("Options", "ENABLE_AUXILIARY_CLIPBOARD_COMMANDS", 1)
ReadIni("Options", "ENABLE_ADDITIONAL_COMMANDS", 1)
ReadIni("Options", "REPEAT_COMMANDS_LIMIT", 25)

; [OnScreenDisplay]
ReadIni("OnScreenDisplay", "OSD_SMALL", 0)
ReadIni("OnScreenDisplay", "OSD_ON_TOP", 0)
ReadIni("OnScreenDisplay", "OSD_TRANSPARENT_BACKGROUND", 0)
ReadIni("OnScreenDisplay", "OSD_OPACITY", 215)

; [Shortcuts]
ReadIni("Shortcuts", "RELOAD_SHORTCUT", "^#+r")
ReadIni("Shortcuts", "OPEN_OPTIONS_SHORTCUT", "^#+s")
ReadIni("Shortcuts", "EXIT_SHORTCUT", "^#+x")

; [NeoMouseKeys]
ReadIni("NeoMouseKeys", "INTEROPERABILITY", 0)
ReadIni("NeoMouseKeys", "ACTIVATION", "^e")

if (Options["INTEROPERABILITY"]) {
  activation := Options["ACTIVATION"]
  fn := Func("EnableNeoMousekeys").Bind(activation)
  HotKey, % "$" activation, % fn
}
