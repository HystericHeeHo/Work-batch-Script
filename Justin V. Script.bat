ECHO OFF
COLOR 0B
CLS
IF "%~1"=="" GOTO MENU
IF "%~1"=="-DEFAULT" GOTO DEFAULT
SHIFT

:MENU
ECHO.
ECHO --------------------------------------------------------------------------------
ECHO by Justin Adams
ECHO --------------------------------------------------------------------------------
ECHO.
ECHO Start of Day
ECHO ==============
ECHO 1. Default
ECHO 2. Choose which Apps to open
ECHO.
ECHO End of Day
ECHO ==============
ECHO 9. Close all programs 
ECHO.
ECHO Exit
ECHO ==============
ECHO 0. Exit this script
ECHO.
SET /P M=Type 1, 2, 3, 9, or 0 then press ENTER:
IF %M%==1 GOTO DEFAULT
IF %M%==2 GOTO SELECTAPPMENU
IF %M%==9 GOTO CLOSE
IF %M%==0 GOTO EXIT

:EXIT
EXIT /B 0


:DEFAULT
echo Welcome to SWK Technologies
net time \\w2k12-ad1 /set /yes

net use i: /delete
net use l: /delete
net use k: /delete
net use p: /delete
net use n: /delete
net use s: /delete

echo Mapping to Home Folder
net use h: /home /PERSISTENT:NO

net use k: \\swkfs\network_services /PERSISTENT:NO
net use p: \\swkfs\public /PERSISTENT:NO
net use i: \\swkfs\clients /PERSISTENT:NO
net use l: \\swkfs\library /PERSISTENT:NO
net use n: \\swkfs\nws_library
net use s: \\snj-dc\SNJ-Folder

START chrome https://cw.swktech.com
ping localhost -n 3 >nul
GOTO MENU




:SELECTAPPMENU
CLS
ECHO --------------------------------------------------------------------------------
ECHO Written by Justin Adams
ECHO --------------------------------------------------------------------------------
ECHO Select App Menu
ECHO --------------------------------------------------------------------------------
ECHO 1.  APP1
ECHO 2.  APP2
ECHO 3.  APP3
ECHO.
ECHO 0. BACK
SET /P P=Type 1-6 or 0 then press ENTER:
IF %P%==1 GOTO APP1
IF %P%==2 GOTO APP2
IF %P%==3 GOTO APP3
CLS
GOTO SELECTAPPMENU


:APP1
START 
ECHO --------------------------------------------------------------------------------
ECHO Started: APP1
ECHO --------------------------------------------------------------------------------
ECHO.
GOTO SELECTAPPMENU

:APP2
IF EXIST 
ECHO --------------------------------------------------------------------------------
ECHO Started APP2
ECHO --------------------------------------------------------------------------------
ECHO.
GOTO SELECTAPPMENU

:APP3
START  
ECHO --------------------------------------------------------------------------------
ECHO Started APP3
ECHO --------------------------------------------------------------------------------
ECHO.
GOTO SELECTAPPMENU

:CLOSE
CLS
taskkill /F /IM chrome.exe
ping localhost -n 1 >nul
taskkill /F /IM outlook.exe
ping localhost -n 1 >nul
GOTO MENU