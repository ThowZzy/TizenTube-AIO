@echo off

::Make sure that the root directory is right, its the default one here.
set tizen-dir=C:\tizen-studio

::URL to download wgt files
set url=https://github.com/ThowZzy/TizenTube-Legacy/releases/latest/download

::This line goes to the same drive as tizen studio (if launching from another drive)
%tizen-dir:~0,1%:

echo:
echo =================== WGT Download =====================
echo Downloading wgt files from releases...
echo:
curl -L "%url%/Launcher.wgt" -o "%tizen-dir%/Launcher.wgt"
curl -L "%url%/TizenTube.wgt" -o "%tizen-dir%/TizenTube.wgt"
echo =======================================================

echo:
echo ============= Listing of connected devices ============
cd %tizen-dir%\tools
sdb devices
echo =======================================================

echo:
echo If you can't see your tv in the device list above, open this : %tizen-dir%\tools\device-manager\bin\device-ui-3.0.jar and connect to your TV and rerun the script.
echo:

echo:
echo =========== Installing applications to the TV ===========
cd ide\bin
call tizen install -n %tizen-dir%\Launcher.wgt
call tizen install -n %tizen-dir%\TizenTube.wgt
echo =========================================================

echo:
echo The installation process is over. If all went well, you should have the Launcher and TizenTube installed on your TV.
echo:
pause