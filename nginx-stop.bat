@echo off

cd /D %~dp0

taskkill /f /IM nginx.exe 

if not exist logs\nginx.pid GOTO exit
nginx.exe -s quit
del logs\nginx.pid

:exit