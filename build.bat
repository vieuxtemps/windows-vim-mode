@echo off
setlocal

echo Compiling...

rmdir /S /Q build 2>nul
mkdir build

set "AHK=C:\Program Files\AutoHotkey"
set "BASE=AutoHotkeyU64.exe"

copy "%AHK%\Compiler\Ahk2Exe.exe" .
copy "%AHK%\%BASE%" .

Ahk2Exe.exe /icon "icons\transparent-white.ico" /in "windows-vim-mode.ahk" /out "build\windows-vim-mode.exe" /bin %BASE%

if %errorlevel% equ 0 (
    echo Compilation successful.
) else (
    echo Compilation failed.
)

echo Copying additional files...
echo:
echo Copying icons...
xcopy /Q /I icons build\icons
echo Copying data...
xcopy /Q /I data build\data
echo Copying LICENSE...
xcopy /Q LICENSE build
echo Copying README.md...
xcopy /Q README.md build

del "Ahk2Exe.exe"
del "%BASE%"

echo Zipping...
echo:
set /p "VERSION=Enter release version number: "
set "INPUT=build"
set "OUTPUT=windows-vim-mode-v%VERSION%.zip"
powershell -command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::CreateFromDirectory('%INPUT%', '%OUTPUT%')"

echo:
for /f %%a in ('powershell -command "(certutil -hashfile %OUTPUT% MD5)[1]"') do set "MD5=%%a"
echo MD5: %MD5%
for /f %%a in ('powershell -command "(certutil -hashfile %OUTPUT% SHA1)[1]"') do set "SHA1=%%a"
echo SHA1: %SHA1%
for /f %%a in ('powershell -command "(certutil -hashfile %OUTPUT% SHA256)[1]"') do set "SHA256=%%a"
echo SHA256: %SHA256%
echo VirusTotal : https://www.virustotal.com/gui/file/%SHA256%

echo:
move %OUTPUT% dist

echo Done.
echo:

pause