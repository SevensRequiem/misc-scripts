@ECHO OFF
title Shutdown Timer
color 0a
CLS
ECHO Choose a shutdown time.
ECHO =======================================

CHOICE /C 123456789 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 9 GOTO 9
IF ERRORLEVEL 8 GOTO 9
IF ERRORLEVEL 7 GOTO 7
IF ERRORLEVEL 6 GOTO 6
IF ERRORLEVEL 5 GOTO 5
IF ERRORLEVEL 4 GOTO 4
IF ERRORLEVEL 3 GOTO 3
IF ERRORLEVEL 2 GOTO 2
IF ERRORLEVEL 1 GOTO 1

:1
CLS
ECHO Shutting down in 1 hour.
start C:\Windows\System32\shutdown.exe -s -t 3600
ping localhost -n 3 >nul
exit
:2
CLS
ECHO Shutting down in 2 hour.
start C:\Windows\System32\shutdown.exe -s -t 7200
ping localhost -n 3 >nul
exit
:3
CLS
ECHO Shutting down in 3 hour.
start C:\Windows\System32\shutdown.exe -s -t 10800
ping localhost -n 3 >nul
exit
:4
CLS
ECHO Shutting down in 4 hour.
start C:\Windows\System32\shutdown.exe -s -t 14400
ping localhost -n 3 >nul
exit
:5
CLS
ECHO Shutting down in 5 hour.
start C:\Windows\System32\shutdown.exe -s -t 18000
ping localhost -n 3 >nul
exit
:6
CLS
ECHO Shutting down in 6 hour.
start C:\Windows\System32\shutdown.exe -s -t 21600
ping localhost -n 3 >nul
exit
:7
CLS
ECHO Shutting down in 7 hour.
start C:\Windows\System32\shutdown.exe -s -t 25200
ping localhost -n 3 >nul
exit
:8
CLS
ECHO Shutting down in 8 hour.
start C:\Windows\System32\shutdown.exe -s -t 28800
ping localhost -n 3 >nul
exit
:9
CLS
ECHO Shutting down in 9 hour.
start C:\Windows\System32\shutdown.exe -s -t 32400
ping localhost -n 3 >nul
exit