@echo off
title Push Market Trend Forecast to GitHub
echo ========================================================
echo   Pushing Market Trend Forecasting Engine to GitHub
echo ========================================================
echo.
echo Pushing to https://github.com/Kartikeya-Rana-2004/market-trend-forecast.git ...
echo (If a browser window pops up, click 'Sign in with your browser')
echo.
git push -u origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo ========================================================
    echo [SUCCESS] Pushed to GitHub successfully!
    echo.
    echo Next step: Enable GitHub Pages in your repo settings:
    echo 1. Go to: https://github.com/Kartikeya-Rana-2004/market-trend-forecast/settings/pages
    echo 2. Under 'Build and deployment', choose 'GitHub Actions'
    echo    (The included workflow will deploy automatically!)
    echo.
    echo Your live dashboard will be online at:
    echo https://kartikeya-rana-2004.github.io/market-trend-forecast/
    echo ========================================================
) else (
    echo [ERROR] Push failed. If authentication failed, try running:
    echo git push -u origin main
)
echo.
pause
