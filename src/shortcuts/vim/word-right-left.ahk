$w::
$+w::
    if (visualMode) {
        Send, +^{Right}
    } else {
        Send, ^{Right}
    }

    Return

$b::
$+b::
    if (visualMode) {
        Send, +^{Left}
    } else {
        Send, ^{Left}
    }

    Return

$e::
$+e::
    if (visualMode) {
        Send, +{Right}+^{Right}+{Left}
    } else {
        Send, {Right}^{Right}{Left}
    }

    Return
