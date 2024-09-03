@echo off
@echo off

# Load environment variables from .env file
for /f "tokens=*" %%i in (.env) do set %%i

docker build -t civitai-image .

if "%MODELS_DIR%"=="" (
  echo Error: MODELS_DIR is not set. Please set it in the .env file.
  exit /b 1
)

docker run --name civitai-container -v %cd%:/home/civitaiuser -v %MODELS_DIR%:/home/civitaiuser/models -e LC_ALL=C.UTF-8 -e PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH -e PATH=$PATH:/home/civitaiuser/.local/bin -it civitai-image zsh
pause
