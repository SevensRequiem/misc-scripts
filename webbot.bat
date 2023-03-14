@echo off
color 1
echo Please enter a web address.
set /p s=Website:
goto 1
:1
start %s%
start %s%
ping localhost -n 3 -nul
goto 1