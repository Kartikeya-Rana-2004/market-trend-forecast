@echo off
echo ========================================================
echo   Pushing Market Trend Forecasting Engine to GitHub
echo ========================================================
echo.
echo 1. Make sure you created the empty repo on GitHub:
echo    https://github.com/new  (Name: market-trend-forecast)
echo.
pause
echo.
echo Pushing to GitHub...
git push -u origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo [SUCCESS] Pushed to GitHub successfully!
    echo Your live site will automatically deploy to:
    echo https://kartikeya-rana-2004.github.io/market-trend-forecast/
) else (
    echo [ERROR] Push failed. Please verify that the repository exists on GitHub.
)
echo.
pause
