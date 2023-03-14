@echo off
goto homea
:iop

:homea
:home
set ch=1
color 0b
title Logon Screen
cls
echo         Chat Logon
echo _______________________________
echo 1. Logon
echo.
echo 2.Create an Account
echo.
echo 3.Exit
echo _______________________________
echo.
set /p ch=Choice Number: 
if %ch%==1 goto logon
if %ch%==2 goto account
if %ch%==3 exit
color 0c
echo Please enter a valid number.
ping localhost -n 2 >nul
goto home

:logon
color 
cls
set /p un=Username:
echo ____________________________
set /p pass=Password:
if NOT Exist "\\YOURSERVER\PUBLIC\CHAT\USERS\%un%.unfile" goto not
echo %pass% >"%tmp%\chtmp.tmp"
fc "%tmp%\chtmp.tmp" "\\YOURSERVER\PUBLIC\CHAT\USERS\%un%.unfile" >nul
if errorlevel==1 goto incor
cls
goto chat







:account
cls
color 0b
set /p nu=New Username:
echo _____________________
set /p np=New Password:
echo %np% >"\\YOURSERVER\PUBLIC\CHAT\USERS\%nu%.unfile"
cls
goto logon

:not
cls
color 0b
echo This username does not exist. Please make an account.
ping localhost -n 4 >nul
goto home

:incor
color 0c
cls
echo You have entered the wrong username or password. (Both are case sensitive)
ping localhost -n 2 >nul
goto home



:chat
set name=%un%
echo %name% has joined the chatroom. >>\\YOURSERVER\Public\Chat\Program_Files\chatroom.chatfile
start \\YOURSERVER\Public\Chat\Program_Files\msgbox.cmd
:chat1

cls
color 0b
set /p text=Text:

goto 2



:exit
cls
echo %name% has left the chatroom. >>\\YOURSERVER\Public\Chat\Program_Files\chatroom.chatfile
taskkill /im cmd.exe
exit

:clear
cls
echo _________CHAT ROOM____________ >>\\YOURSERVER\Public\Chat\Program_Files\chatroom.chatfile
goto chat1





:2
echo %name% : %text% >>\\YOURSERVER\Public\Chat\Program_Files\chatroom.chatfile   
goto chat1
