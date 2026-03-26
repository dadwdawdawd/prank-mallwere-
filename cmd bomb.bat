@echo off
title KERNEL_PANIC_0x0000007B [cite: 1]
color 0c

:glitch
:: --- THE BIG BOX: Data Extraction Simulation ---
start cmd /c "mode con: cols=120 lines=40 & color 0a & title SECTOR_READ & tree C:/ & pause" 

:: --- THE SMALL BOX: Critical Error Alert ---
start cmd /c "mode con: cols=30 lines=5 & color 4f & title ALERT & echo FATAL EXCEPTION & echo 0x0045F & timeout /t 3"

:: --- THE MEDIUM BOX: Network Intrusion ---
start cmd /c "mode con: cols=60 lines=20 & color 0e & title WARNING & echo DELETING TEMPORARY SYSTEM FILES... & netstat -an & timeout /t 5" 

:: Randomizing the "Memory Leak" messages
echo ERROR: Memory leak detected at 0x%RANDOM%
echo Attempting to stabilize...

timeout /t 1 >nul
goto glitch