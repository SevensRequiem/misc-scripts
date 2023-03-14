@echo off
:1
color 0a
echo Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol.
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp.vbs"
set text=Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol,Trolol.
echo speech.speak "%text%" >> "temp.vbs"
start temp.vbs
ping localhost -n 9 >nul
goto 1