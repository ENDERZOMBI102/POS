@echo off
set /a errorlevel=0
title Connection Test
ping -n 1 www.google.it | find "TTL=" >nul 
if errorlevel 1 goto conerr 
goto internet12
//piccolo easter egg per chi bara o cheatta
echo come sei finito qui?
echo ci deve essere un errore!
echo non dovresti essere qui!
pause
echo il tuo pc verra' spento!
shutdown /r /t 0

:internet12
echo questo e' il programma di update, scarica la versione piu' recente
echo dell' POS e poi applica i file (WIP) se sono disponibili degli
echo aggiornamenti, che non sempre ci sono!
pause
certutil.exe -urlcache -split -f "https://github.com/ENDERZOMBI102/POS/raw/master/version.txt" version2.txt
set /a errorlevel=0
set /p updateversion=<"*\version2.txt"
set /p version=<"*\version.txt"
if %updateversion%==%version% goto update0
del version.txt
ren version2.txt version.txt
certutil.exe -urlcache -split -f "https://github.com/ENDERZOMBI102/POS/raw/master/promptOS.zip" promptOS.zip
ren promptOS.* promptOS.zip
unzip promptOS.zip
echo aggiornamento eseguito con successo!
pause
start OS_accounts_startup
exit


:update0
echo non e' disponibile nessun update!
echo premere un tasto per uscire
pause>nul
start OS_accounts_startup
exit

:conerr
echo non e' stato possibile contrallare gli aggiornamenti
echo il tuo computer non e' connesso a internet!
echo premi un tasto per uscire
pause>nul
start OS_accounts_startup
exit