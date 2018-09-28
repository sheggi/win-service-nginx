@echo off

cd /D %~dp0

if not exist logs\nginx.pid GOTO skip
nginx.exe -s quit
del logs\nginx.pid

:skip

taskkill /f /IM nginx.exe 