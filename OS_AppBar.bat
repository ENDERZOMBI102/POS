@Echo off
:inzo
cls
set /a errorlevel=0
ping -n 1 www.google.it | find "TTL=" >nul 
if errorlevel 1 ( 
    echo non connesso
    goto p1
) else (
    echo connesso a internet
    goto p1
)

:p1
time /T
set /a errorlevel=0
pause
goto inzo
