@echo off

@REM ====================
@REM Determine if file or folder
@REM ====================

if "%~1"=="" (
    echo Drag a file into the script
    timeout /t 1 > nul
    exit /b
)

if exist "%~1/" (
    goto :scanDirectory %~1
    pause
) else if exist "%~1" (
    call :fixShortcut "%~1"
    pause
) else (
    echo Cannot find file %1
    timeout /t 1 > nul
    exit /b
)

exit /b

@REM ====================
@REM Scan Directory
@REM ====================

:scanDirectory
echo Processing folder %1
for /f "delims=" %%f in ('dir "%~1\*.url" /b') do (
    call :fixShortcut "%~1\%%f"
)
pause
exit /b

@REM ====================
@REM Fix Shortcut
@REM ====================

:fixShortcut

:: gameid, filepath, filename
echo SOURCE "%~1"
for /f "tokens=3 delims=/" %%A in ('findstr /R "^URL=steam://rungameid/.*" "%~1"') do set "gameid=%%A"
for /f "tokens=2 delims==" %%A in ('findstr /R "IconFile=.*" "%~1"') do set "filepath=%%A"
for /d %%I in ("%filepath%") do set "filename=%%~nxI"

if "%filepath%"=="" (
    echo Unable to get game info
    exit /b 1
)

echo ----
echo ----
echo SHORTCUT %~1
echo GAME %gameid% - %filename%
echo FILE %filepath% 
echo URI https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/%gameid%/%filename%

if exist "%filepath%" (
    echo Icon exists
) else (
    powershell -Command "Invoke-WebRequest -Uri 'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/%gameid%/%filename%' -OutFile '%filepath%'"
    echo Success! Icon downloaded
)

exit /b 