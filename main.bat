@echo off
setlocal

REM URL of the Lua binaries zip file
set "URL=https://downloads.sourceforge.net/project/luabinaries/5.4.2/Tools%20Executables/lua-5.4.2_Win64_bin.zip?ts=gAAAAABmeta0_f-sa5Eo83XLciCMKe12fe1eUsG9M2uiPDSzWbzD1slFheShU0thFq2ZNG-Tg8XiJvuEle25XDy6of1j7BF52w%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fluabinaries%2Ffiles%2F5.4.2%2FTools%2520Executables%2Flua-5.4.2_Win64_bin.zip%2Fdownload"
set "ZIP_FILE=lua-5.4.2_Win64_bin.zip"
set "OUTPUT_DIR=."

REM Download the zip file
echo Downloading %ZIP_FILE%...
curl -L -o "%ZIP_FILE%" "%URL%"

REM Check if curl succeeded
if %ERRORLEVEL% neq 0 (
    echo Failed to download %ZIP_FILE%.
    exit /b %ERRORLEVEL%
)

REM Extract the downloaded zip file
echo Extracting %ZIP_FILE%...
powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%OUTPUT_DIR%' -Force"

REM Check if extraction succeeded
if %ERRORLEVEL% neq 0 (
    echo Failed to extract %ZIP_FILE%.
    exit /b %ERRORLEVEL%
)

REM Clean up by removing the zip file
echo Cleaning up...
del "%ZIP_FILE%"

echo Done.
endlocal
exit /b 0
