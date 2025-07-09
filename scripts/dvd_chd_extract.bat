@echo off

rem Get full path to __chdman.exe in the same folder as this script
set "CHDMAN=%~dp0chdman.exe"

rem Check if __chdman.exe exists in the script's directory
if not exist "%CHDMAN%" (
    echo Error: chdman.exe not found in script directory: %~dp0
    pause
    exit /b
)

rem If arguments (drag/CLI)
if not "%~1"=="" (
    for %%i in (%*) do (
        if not exist "%%~dpi%%~ni.iso" (
            echo Extracting: %%~fi to %%~dpi%%~ni.iso...
            "%CHDMAN%" extractdvd -i "%%~fi" -o "%%~dpi%%~ni.iso"
        ) else (
            echo Skipping: %%~dpi%%~ni.iso already exists.
        )
    )
    pause
    goto :eof
)

rem Otherwise recursive
for /r %%i in (*.chd) do (
    if not exist "%%~dpni.iso" (
        echo Extracting: %%~fi to %%~dpi%%~ni.iso...
        "%CHDMAN%" extractdvd -i "%%~fi" -o "%%~dpni.iso"
    ) else (
        echo Skipping: %%~dpi%%~ni.iso already exists.
    )
)
pause