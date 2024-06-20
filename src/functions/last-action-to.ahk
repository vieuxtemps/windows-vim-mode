; Last Action-To
; From vim docs: Repeat latest f, t, F or T [count] times.

StoreLAT(char, command, restoreClipboard, includingLast, backwards) {
  LAT["char"] := char
  LAT["command"] := command
  LAT["restoreClipboard"] := restoreClipboard
  LAT["includingLast"] := includingLast
  LAT["backwards"] := backwards
}

DoLAT(thisDir, oppositeDir) {
  if (LAT["char"]) {
    if (LAT["last"] == oppositeDir) {
      LAT["backwards"] := not LAT["backwards"]
      if (LAT["command"])
        LAT["command"] := LAT["command"] == "{Left}" ? "{Right}" : "{Left}"
    }

    if (visualMode)
      actionToVisual(LAT["char"], LAT["command"], LAT["restoreClipboard"], LAT["includingLast"], LAT["backwards"])
    else
      actionTo(LAT["char"], LAT["command"], LAT["restoreClipboard"], LAT["includingLast"], LAT["backwards"])
  }

  LAT["last"] := thisDir
}