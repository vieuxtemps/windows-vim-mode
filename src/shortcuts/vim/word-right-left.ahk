$w::
$+w::
    lastDir := "right"
    if (visualMode) {
        Send, +^{Right}
    } else {
        Send, ^{Right}
    }
Return

$b::
$+b::
    lastDir := "left"
    if (visualMode) {
        Send, +^{Left}
    } else {
        Send, ^{Left}
    }
Return

$e::
$+e::
    lastDir := "right"
    if (visualMode) {
        Send, +^{Right}
    } else {
        Send, ^{Right}
    }

; ---------------------------------------------------------
; Alternative behavior for 'e'/'E': Clipboard-based version
; ---------------------------------------------------------
; clipSaved := ClipboardAll
;clipSaved := Clipboard
;if (visualMode) {
;    Send, +{Right}^+{Right}
;    Sleep, 2
;    Send, +{Left}
;    Sleep, 2
;    Send, +{Right}
;    Sleep, 2
;    Send, ^c
;    Sleep, 2
;} else {
;    Send, {Right}^{Right}
;    Sleep, 2
;    Send, {Left}
;    Sleep, 2
;    Send, +{Right}
;    Sleep, 2
;    Send, ^c
;    Sleep, 2
;}
;ClipWait, 1
;clipboardContent := Clipboard
;Clipboard := ClipSaved
;clipSaved := ""
;Sleep, 2
;if (visualMode) {
;    if (SubStr(clipboardContent, 0) = " ") {
;        Send, +{Left}
;    }
;} else {
;    If (clipboardContent = " ")
;        Send, {Left}
;    else
;        Send, {Right}
;}
Return
