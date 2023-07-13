m:: 
    Loop, 20
      Send, {Down}
    Return

,:: 
    Loop, 20
      Send, {Up}
    Return

^u::
    Send, {PgUp}
    Return

^d::
    Send, {PgDn}
    Return

^e::
    SendInput, ^{Down}{Down}
    Return

^y::
    SendInput, ^{Up}{Up}
    Return

${::
    if inIntellij() {
        Send, !+y
    } else {
        Send, {{}
    }

    Return

$}::
    if inIntellij() {
        Send, !+u
    } else {
        Send, {}}
    }

    Return

:?*CZB0:zz::
    if inIntellij() {
        Send, ^m
    }

    Return

z::
    Return

