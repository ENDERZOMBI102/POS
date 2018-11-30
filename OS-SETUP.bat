@Echo off
echo. inizio log >> POSetup.log
echo.>>POSetup.log
echo. inizio processo di installazione> POSetup.log
:test
set /a EULA=0
set /a errorlevel=0
title test
echo.>>POSetup.log
echo. test connessione.. >> POSetup.log
ping -n 1 www.google.it | find "TTL=" >nul 
if errorlevel 1 ( 
    echo.>>POSetup.log
    echo. connessione non riuscita >> POSetup.log
    goto conerr
) else (
    echo.>>POSetup.log
    echo. connessione riuscita >> POSetup.log
	goto P0
)

:P0
title Setup POS-MAIN
cls
echo Type confirm if you accept My eula and want to install PromptOS
echo if you don't like to install on this place you can copy this file
echo to another directory
echo .
echo .
echo type confirm to install
echo type EULA to print the eula to screen
:0
set /p userinp= 
set userinp=%userinp:~0%
if "%userinp%"=="confirm" goto install_part
if "%userinp%"=="EULA" goto EULAGREE
if "%userinp%"=="admin" goto admin1
if "%userinp%"=="exit" exit
goto 0

:admin1
set /a EULA=1
goto install_part

:error_EULA
title Setup POS-ERROR
cls
echo ops! please accept the EULA to continue install!
pause
goto P0

:EULAGREE
cls
title Setup POS-EULA
echo ops! seems on this place don't have anythig!
echo type yes to accept the EULA or type no
:00
set /p userinp= 
set userinp=%userinp:~0%
if "%userinp%"=="yes" goto P1
if "%userinp%"=="no" exit
goto 00

:P1
set /a EULA=1
goto P0

:install_part
cls
title Setup POS-INSTALL
if "%EULA%"=="0" goto error_EULA
echo creating folder...
mkdir PromptOS
cd PromptOS
echo downloading files..
certutil.exe -urlcache -split -f "https://github.com/ENDERZOMBI102/POS/raw/master/promptOS.zip" promptOS.zip
certutil.exe -urlcache -split -f "https://github.com/ENDERZOMBI102/POS/raw/master/unzip.exe" unzip.exe
ren unzip.* unzip.exe
ren promptOS.* promptOS.zip
if not exist unzip.exe goto err
if not exist promptOS.zip goto err
echo download complete!
    echo.>>POSetup.log
    echo. unzipping files >> POSetup.log
unzip promptOS.zip
del promptOS.zip
    echo.>>POSetup.log
    echo. files was unzziped! >> POSetup.log
echo install complete!
title Setup POS-COMPLETE
echo Press any key to close this Setup and start the POS
pause>nul
    echo.>>POSetup.log
    echo. install completed >> POSetup.log
start START_OS
exit

:err
title Setup POS-ERROR!
cls
echo error! download failed! error!
    echo.>>POSetup.log
    echo. errore nel download >> POSetup.log
pause
exit

:conerr
title Setup POS-CONNECTION ERROR
echo your PC is offline! please connect to internet
echo for start the setup.
echo press any key to retest the connection
pause>nul
goto test
exit
