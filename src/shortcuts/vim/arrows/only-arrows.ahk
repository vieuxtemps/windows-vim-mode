j::
    lastDir := "right" ; direction guess
    if (visualMode) {
        Send, +{Down}
    } else {
        Send, {Down}
    }
Return

k::
    lastDir := "left" ; direction guess
    if (visualMode) {
        Send, +{Up}
    } else {
        Send, {Up}
    }
Return

h::
    lastDir := "left"
    if (visualMode) {
        Send, +{Left}
    } else {
        Send, {Left}
    }
Return

l::
    lastDir := "right"
    if (visualMode) {
        Send, +{Right}
    } else {
        Send, {Right}
    }
Return
