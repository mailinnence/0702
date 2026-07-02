@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

rem 1. 한글 깨짐 방지
chcp 65001 > nul

rem 2. 변경사항 담기
git add .

rem 3. 실시간 시간 가져오기
for /f "delims=" %%I in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do (
    set "commitMsg=%%I"
)

rem 4. 입력된 모든 글자를 메모 변수에 저장 (앞뒤 큰따옴표 제거 처리)
set "userMsg=%*"
set "userMsg=!userMsg:"=!"

rem 5. 메모가 있으면 시간 뒤에 결합, 없으면 시간만 기록
if "!userMsg!"=="" (
    git commit -m "[!commitMsg!]"
) else (
    git commit -m "[!commitMsg!] - !userMsg!"
)

pause