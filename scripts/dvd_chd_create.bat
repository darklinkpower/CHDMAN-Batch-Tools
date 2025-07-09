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
        if /i "%%~xi"==".iso" (
            if not exist "%%~dpni.chd" (
                echo Creating: %%~fi to %%~dpni.chd...
                "%CHDMAN%" createdvd -i "%%~fi" -o "%%~dpni.chd"
            ) else (
                echo Skipping: %%~dpni.chd already exists.
            )
        ) else (
            echo Skipping unsupported file: %%~nxi
        )
    )
    pause
    goto :eof
)

rem Otherwise scan recursively
for /r %%i in (*.iso) do (
    if not exist "%%~dpni.chd" (
        echo Creating: %%~fi to %%~dpni.chd...
        "%CHDMAN%" createdvd -i "%%~fi" -o "%%~dpni.chd"
    ) else (
        echo Skipping: %%~dpni.chd already exists.
    )
)
pause