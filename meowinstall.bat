@echo off
CLS
set currentpath=%cd%
echo Stawting MeowInstall via Chocowatey / Refyne :3
ECHO.
:MENU
ECHO -------------------------------------------
ECHO PRESS 1, 2 OR 3 to select your task, or 4 to EXIT.
ECHO            FIRST TIME press 2! :3
ECHO -------------------------------------------
ECHO.
ECHO 1 - install apps 
ECHO 2 - Chocolatey
ECHO 3 - Upgrade apps
ECHO 4 - Optimize PC
ECHO 5 - EXIT :3
ECHO.


SET /P M=Type 1, 2, 3, 4 or 5 then press ENTER : 
IF %M%==1 GOTO GEN
IF %M%==2 GOTO CLT
IF %M%==3 GOTO UPG
IF %M%==4 GOTO OPM
IF %M%==5 GOTO EOF

REM Optimize
:OPM 
ECHO -------------------------------------------
ECHO Run "iwr -useb https://github.com/prolix-oc/Refyne/releases/latest/download/Refyne.ps1 | iex" in an elevated PowerShell prompt :3
ECHO -------------------------------------------
GOTO MENU


REM Choco
:CLT
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco feature enable -n allowGlobalConfirmation
choco upgrade chocolatey
ECHO -------------------------------------------
ECHO A RESTART OF THE FILE MIGHT BE NECESSARY :3
ECHO -------------------------------------------
GOTO MENU

:UPG
choco upgrade all
GOTO MENU

:GEN
REM install
choco install %currentpath%\meowinstall.config   
IF %M%==2 GOTO DEV
GOTO MENU
:EOF