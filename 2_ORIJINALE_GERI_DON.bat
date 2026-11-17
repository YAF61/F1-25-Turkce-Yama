@echo off
chcp 65001 >nul
title F1 25 - Orijinal Dosyaya Geri Donme

openfiles >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo [YETKI] Yonetici haklari isteniyor...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

echo ========================================================
echo        EA SPORTS F1 25 - ORIJINALE GERI DON
echo ========================================================
echo.

set "GAME_DIR=C:\Program Files\EA Games\F1 25"

if not exist "%GAME_DIR%\F1_25.exe" (
    echo [HATA] Oyun klasoru bulunamadi: %GAME_DIR%
    pause
    exit /b 1
)

if exist "game.dat.ORIJINAL" (
    copy /y "game.dat.ORIJINAL" "%GAME_DIR%\game.dat" >nul
    echo.
    echo [BASARILI] Orijinal temiz oyun dosyasi geri yuklendi!
    echo Oyun su an orijinal Ingilizce haline dondu.
    echo.
) else (
    echo [HATA] game.dat.ORIJINAL dosyasi bulunamadi!
)

echo Cikmak icin bir tusa basin...
pause >nul
