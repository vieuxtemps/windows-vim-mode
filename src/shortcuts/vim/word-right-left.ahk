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
        Send, +{Right}+^{Right}+{Left}
    } else {
        Send, {Right}^{Right}{Left}
    }

    Return
