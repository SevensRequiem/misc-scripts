@echo off
echo Starting...
:load
color 0a
title Loading 1
echo Loading 1 *
ping localhost -n 3 >nul
cls
title Loading 4
echo Loading 4 **
ping localhost -n 1 >nul
cls
title Loading 22
echo Loading 22 ***
ping localhost -n 5 >nul
cls
title Loading 40
echo Loading 40 ****
ping localhost -n 7 >nul
cls
title Loading 69
echo Loading 69 *****
ping localhost -n 2 >nul
cls
title Loading 99
echo Loading 99 ******
ping localhost -n 6 >nul
cls
title Loading 100
echo Loading 100 ******
cls
echo Please log in to start.
set /p u=Username:
set /p p=Password:
if %u%==%hg1% if %p%==%hg2%
tree
ping localhost -n 3 -nul
echo Login was successful!
ping localhost -n 1 -nul
goto 2
:2
set /p d=Destination:
ping localhost
goto 1
:1
title Hacking System,In progress!
:matrix
color 0a
echo Hacking %d% %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%
echo Done with hack! %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%
goto matrix
