@echo off
setlocal

:: Ensure MSFS_SDK environment variable is set
if "%MSFS_SDK%"=="" (
    echo MSFS_SDK environment variable is not set.
    goto end
)

:: Run fspackagetool.exe
"%MSFS_SDK%\Tools\bin\fspackagetool.exe" ".\flightdash-panel\Build\flightdash-panel.xml" -nomirroring

:: Check if the previous command was successful
if %ERRORLEVEL% neq 0 (
    echo Failed to run fspackagetool.exe
    goto end
)

:: Copy the generated .spb file
copy /Y ".\flightdash-panel\Build\Packages\flightdash-panel\Build\flightdash-panel.spb" ".\flightdash-panel\InGamePanels"

:: Check if the copy was successful
if %ERRORLEVEL% neq 0 (
    echo Failed to copy file.
    goto end
)

echo Success!
:end
endlocal
