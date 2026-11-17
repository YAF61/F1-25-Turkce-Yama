@echo off
chcp 65001 >nul
title F1 25 - %100 Türkçe Yama Kurulumu (Build 1.0.145)

:: Administrator kontrolü ve otomatik yetki yükseltme
openfiles >nul 2>&1
if '%errorlevel%' NEQ '0' (
    echo [YETKI] Yonetici haklari isteniyor...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"

echo ========================================================
echo         EA SPORTS F1 25 - TURKCE YAMA KURULUMU
echo                  (Build: 1.0.145.2472)
echo ========================================================
echo.

set "GAME_DIR=C:\Program Files\EA Games\F1 25"

if not exist "%GAME_DIR%\F1_25.exe" (
    echo [HATA] Oyun klasoru bulunamadi: %GAME_DIR%
    echo Lutfen F1 25 oyununun yuklu oldugundan emin olun.
    pause
    exit /b 1
)

if not exist "game.dat" (
    echo [HATA] game.dat dosyasi bu klasorde bulunamadi!
    pause
    exit /b 1
)

echo [1/3] Orijinal dosya kontrol ediliyor...
if not exist "%GAME_DIR%\game.dat.ORIJINAL" (
    if exist "game.dat.ORIJINAL" (
        copy /y "game.dat.ORIJINAL" "%GAME_DIR%\game.dat.ORIJINAL" >nul
        echo [BILGI] Orijinal dosyanin guvenli yedegi alindi.
    )
)

echo [2/3] Turkce yama dosyasi oyun klasorune kopyalaniyor...
copy /y "game.dat" "%GAME_DIR%\game.dat" >nul

if %errorlevel% EQU 0 (
    echo.
    echo ========================================================
    echo      TEBRIKLER! TURKCE YAMA BASARIYLA KURULDU!
    echo ========================================================
    echo.
    echo Bilgiler:
    echo  * Hicbir harici programa veya mod loader'a gerek yoktur.
    echo  * Oyunu dogrudan Epic Games veya EA App uzerinden baslatabilirsiniz.
    echo  * Oyun ici dil ayari "English" olmalidir (Turkce otomatik yuklenir).
    echo  * Orijinal haline donmek isterseniz "2_ORIJINALE_GERI_DON.bat" calistirabilirsiniz.
    echo.
) else (
    echo.
    echo [HATA] Dosya kopyalanirken bir sorun olustu.
)

echo Cikmak icin bir tusa basin...
pause >nul
