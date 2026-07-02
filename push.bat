@echo off
cd /d %~dp0

git add .

for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format \"yyyy-MM-dd HH:mm:ss\""') do set commitMsg=%%I

git commit -m "[%commitMsg%]"

git push origin main

pause