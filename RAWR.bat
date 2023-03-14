@echo off
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp.vbs"
set text=Hack Program Started
echo speech.speak "%text%" >> "temp.vbs"
start temp.vbs
pause
del temp.vbs
cls
color 2
echo Please log in to start.
set /p u=Username:
set /p p=Password:
if %u%==%hg1% if %p%==%hg2%
cls
tree
cls
ping localhost -n 3 >nul
echo Login was successful!
ping localhost -n 1 >nul
goto 2
:2
set /p d=Destination:
ping localhost -n 2 >nul
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp.vbs"
set text=Getting Required Information.
echo speech.speak "%text%" >> "temp.vbs"
start temp.vbs
ping localhost -n 3 >nul
del temp.vbs
ping localhost -n 10 >nul
title Hacking %d%,In progress!
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp.vbs"
set text=Hacking %d%
echo speech.speak "%text%" >> "temp.vbs"
start temp.vbs
ping localhost -n 3 >nul
del temp.vbs
:matrix
color 0a

echo Hacking %d% %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%
echo Done with hack! %random%code%d%%random%serverID%random%<port:556>%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%
goto matrix