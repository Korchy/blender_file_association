@echo off
@setlocal enableextensions

net session >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    
    @REM executed by administrator

    @REM set current path
    @cd /d "%~dp0"

    IF EXIST blender.exe (

        @REM register blender for associations
        blender.exe -r

        @REM register in context menu "new"
        reg add HKCR\.blend\ShellNew
        reg add HKCR\.blend\ShellNew /v NullFile /t REG_SZ

    ) ELSE (
        echo Can't find "blender.exe"
        echo Copy this file to the blender directory and execute it again
    )

) ELSE (
    @REM administrator access required
    echo Execute this file with "Run as Administrator" privilege
)

pause
