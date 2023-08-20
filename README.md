# Windows Vim Mode

<p align="center">
  <img src="icons/transparent-white.ico" />
</p>

Windows Vim Mode enables systemwide vim-like shortcuts on Windows. This is a fork of [vim-everywhere](https://github.com/lubokkanev/vim-everywhere), originally written by lubokkanev. It is written to be modular and as minimalistic as possible, and only emulate vim keypresses by sending Ctrl and Shift combinations. In contrast, other similar projects available for both Windows and macOS might do arguably invasive actions, such as reading clickable elements on the screen (for on-screen hinting) or copying text for token analysis to implement word movements, which goes against the philosophy of windows-vim-mode. All windows-vim-mode does is emulate vim commands by sending key combinations that are present in most Windows textboxes (such as Ctrl+&rarr; or Ctrl+Shift+&rarr;) when `Normal` or `Visual` modes are enabled.

# Notable changes from vim-everywhere
- Timer-based On-screen Display (OSD) for the current mode, including for numbered/repeat commands (such as `5p` or `5w`).
- Safer and more reliable code for sending keypresses, most notably fixed an issue where holding `w` to navigate between words could trigger a tab or window being closed by sending `Ctrl+W` by accident. Published versions of windows-vim-mode have been thoroughly tested and should behave exactly as expected without disrupting your workflow.
- Cleaned up and better organized codebase. Some unused and application-specific functions were removed and all hotkeys that remain were made to resemble vanilla vim.
- Fixed tray icons (visual mode now has its own icon).
- `Esc` can now be used to exit modes.
- Better mode transitions when exiting modes (`Visual` &rarr; `Normal` &rarr; `Insert`). Transitioning from `Visual` to `Normal` instead of `Insert` seems to work better for real-world text selection scenarios.
- Many fixes for textboxes that are delay-sensitive.
- Code for numbered/repeated commands (e.g. `5p`) and multiple key commands (e.g. `ciw`) was completely rewritten and made more readable.
- Numbered/repeated commands are now limited to 25 to prevent catastrophic scenarios.
- Improved cursor positioning when leaving `Visual` mode.
- Many fixed commands and also new commands, such as join lines (`J`) and replace (`r`).

# Installing

You can either download and execute the script directly with AutoHotkey v1 or download and execute the pre-compiled binaries. This code was only tested with AutoHotkey v1.1.37.00 and will not run with AutoHotkey v2. Using earlier versions of AutoHotkey v1 might break some functionality. Only Windows 10 22H2 and Windows 11 22H2 were tested and confirmed to work, although it might work with earlier Windows versions.

## As an AutoHotkey script
- Download the source code.
- Open **windows-vim-mode.ahk** with [AutoHotkey v1](https://github.com/AutoHotkey/AutoHotkey/releases). 
- Press `Shift+Capslock` or `Ctrl+[` to go into `Normal` mode. 
- Use vim-like shortcuts systemwide. 
- Press `Esc`, `i` or `a` to return to `Insert` mode. 

## Compiled version
- Download and unzip the binaries.
- Open **windows-vim-mode.exe**.

# Tips

- I strongly suggest using `Shift+Capslock` to enter `Normal` mode. This will allow your hands to be properly positioning for high-likelihood proceeding commands (such as h/j/k/l/w/v/b). Pressing `Shift+Capslock` should not turn your Capslock light indicator on.
- I strongly suggest using [Microsoft PowerToys](https://github.com/microsoft/PowerToys) to remap `Esc` to `Capslock` and `Capslock` to `Esc`, since this is the way vim was originally meant to be used. Note that you don't need to do this to use `Shift+Capslock` to enter `Normal` mode, and that AutoHotkey will ignore your PowerToys remap (i.e. the code will always consider `Capslock` to be your physical Capslock key).

# Commands

Here is a partial list of available commands:

## Insert mode

Insert mode does nothing other than allowing you to enter `Normal` mode by pressing `Shift+Capslock` or `Ctrl+[`.

## Normal mode

- Switch to Insert mode: `Esc`, `i`, `a`
- Switch to Visual mode: `v`, `V`
- Positioning: `0`, `$`, `h`, `j`, `k`, `l`, `4j`, `4k`, `gg`, `G`
- Word navigation: `w`, `b`, `e`
- Copy: `Y`, `y0`, `y$`
- Paste: `p`, `P`
- Text addition/deletion: `A`, `I`, `C`, `c0`, `c$`, `dd`, `D`, `d0`, `d$`, `x`, `cb`, `cw`, `ce`, `dw`, `diw`, `ciw`, `daw`, `caw`, `<C-w>`, `r`, `s`, `S`
- Repeat commands: `8w`, `5e`, `2b`, `3p`, `3P`
- Scrolling: `<C-u>`, `<C-d>`
- Undo/redo: `u`, `<C-r>`
- Indent: `<<`, `>>`
- Line commands: `o`, `O`, `5o`, `5O`, `J`
- Previous/next: `<C-n>` (&darr;), `<C-p>` (&uarr;)
- Reload windows-vim-mode: `<C-A-r>`
- Exit windows-vim-mode: `<C-A-x>`

## Normal mode - additional commands

These commands are not considered vanilla vim, but are included by default and you might find them useful.

- Go to previous/next (useful for going back/forward in Windows Explorer): `<A-n>` (Alt+&rarr;), `<A-p>` (Alt+&larr;)
- Simulate mouse scrolling: `m` (scroll down), `,` (scroll up). This will follow your operating system's scrolling setting ('Scroll inactive windows when I hover over them').

## Visual mode

Most of the normal mode commands will work in visual mode. You will most likely end up using one of these:

- Switch to Normal mode: `Esc`
- Switch to Insert mode: `i`, `a`
- Positioning (with selection): `0`, `$`, `h`, `j`, `k`, `l`, `4j`, `4k`, `gg`, `G`
- Word navigation: `w`, `b`, `e`
- Copy: `y`
- Text addition/deletion: `s`, `x`, `d`

# Similar and recommended tools

## Browser (Chromium/Firefox)

- Vimium

## Visual Studio Code

- VSCodeVim, vscode-neovim

## Windows

- vim-everywhere (the original)
- mouseable
- TextEditorAnywhere

## macOS

- Karabiner-Elements
- Hammerspoon / VimMode.spoon

## Linux/macOS

- warpd
- vim-anywhere (good-enough TextEditorAnywhere alternative, not to be confused with vim-everywhere)