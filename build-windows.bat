@echo off
setlocal
cd /d "%~dp0"
where cargo >nul 2>&1 || (echo [ERRO] Rust nao instalado. Instale em https://rustup.rs/ & pause & exit /b 1)
echo Compilando Capture Studio para Windows...
cargo build --release
if errorlevel 1 (echo [ERRO] Falha na compilacao. & pause & exit /b 1)
if not exist dist mkdir dist
copy /Y "target\release\rust-screen-recorder.exe" "dist\CaptureStudio.exe" >nul
if exist "ffmpeg.exe" copy /Y "ffmpeg.exe" "dist\ffmpeg.exe" >nul
echo.
echo Executavel pronto: %~dp0dist\CaptureStudio.exe
pause
