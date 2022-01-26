@ECHO OFF
TITLE WSL Backup
SET WSL_NAME=Ubuntu
SET MYDATE=%date:~6,4%%date:~3,2%%date:~0,2%
ECHO Starting Backup of %WSL_NAME%... (this might take several minutes)
wsl.exe --export %WSL_NAME% %UserProfile%\Documents\WSL-Backup\ubuntu-%MYDATE%.tar
ECHO Backup Completed!!
ECHO Starting WSL %WSL_NAME%
wsl.exe -d %WSL_NAME% exit
ECHO Compressing the Backup
"C:\Program Files\7-Zip\7z.exe" a -tzip -sdel "%UserProfile%\Box\WSL-Backup\ubuntu-%MYDATE%.zip" "%UserProfile%\Box\WSL-Backup\ubuntu-%MYDATE%.tar"

PAUSE
