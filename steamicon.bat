@echo off

if "%~1"=="" (
    echo Drag a file into the script
    timeout /t 1 > nul
    exit /b
)

if exist "%~1/" (
    goto :directory %~1
    pause
) else if exist "%~1" (
    call :fix "%~1"
    pause
) else (
    echo Cannot find file %1
    timeout /t 1 > nul
    exit /b
)

goto :eof


:: fix function

:directory
echo Processing folder %1
for /f "delims=" %%f in ('dir "%~1\*.url" /b') do (
    call :fix "%~1\%%f"
)
pause
goto :eof

:fix

:: gameid, filepath, filename
for /f "tokens=3 delims=/" %%A in ('findstr /R "^URL=steam://rungameid/.*" "%~1"') do set "gameid=%%A"
for /f "tokens=2 delims==" %%A in ('findstr /R "IconFile=.*" "%~1"') do set "filepath=%%A"
for /d %%I in ("%filepath%") do set "filename=%%~nxI"

echo ----
echo ----
echo SHORTCUT %~1
echo GAME %gameid% - %filename%
echo FILE %filepath% 

if exist "%filepath%" (
    echo Icon exists
) else (
    set "iconurl=https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/apps/%gameid%/%filename%"
    echo URL %iconurl%
    powershell -Command "Invoke-WebRequest -Uri '%iconurl%' -OutFile '%filepath%'"
    echo Success! Icon downloaded
)

exit /b 