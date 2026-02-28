@echo off
setlocal
cd /d "%~dp0"

echo [1/4] Checking virtual environment...
if not exist ".venv\Scripts\python.exe" (
  echo Creating .venv...
  py -m venv .venv 2>nul
  if errorlevel 1 python -m venv .venv
)

echo [2/4] Activating environment...
call ".venv\Scripts\activate.bat"

echo [3/4] Installing requirements (if missing)...
python -m pip install --disable-pip-version-check -q -r requirements.txt

echo [4/4] Starting Cyber Incident Management...
start "" "http://127.0.0.1:5000"
python app.py

endlocal
