@echo off
title SpySheriff
echo (/O\) Spysheriff
echo Press A Key To Scan.
pause
:flash cookies
set FlashCookies=C:\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1

del /q /s /f "%FlashCookies%"
rd /s /q "%FlashCookies%"

:firefox
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

:opera
set DataDir=C:\Users\%USERNAME%\AppData\Local\Opera\Opera
set DataDir2=C:\Users\%USERNAME%\AppData\Roaming\Opera\Opera

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

del /q /s /f "%DataDir2%"
rd /s /q "%DataDir2%"

:safari
set DataDir=C:\Users\%USERNAME%\AppData\Local\Applec~1\Safari
set DataDir2=C:\Users\%USERNAME%\AppData\Roaming\Applec~1\Safari

del /q /s /f "%DataDir%\History"
rd /s /q "%DataDir%\History"

del /q /s /f "%DataDir%\Cache.db"
del /q /s /f "%DataDir%\WebpageIcons.db"

del /q /s /f "%DataDir2%"
rd /s /q "%DataDir2%"

:internet explore
set DataDir=C:\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

set History=C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History

del /q /s /f "%History%"
rd /s /q "%History%"

set IETemp=C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Tempor~1

del /q /s /f "%IETemp%"
rd /s /q "%IETemp%"

set Cookies=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies

del /q /s /f "%Cookies%"
rd /s /q "%Cookies%"

C:\bin\regdelete.exe HKEY_CURRENT_USER "Software\Microsoft\Internet Explorer\TypedURLs"

:chrome
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data

del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"

echo
echo===================================================
echo=    ___  __                   ____               =
echo=   / _ \/ /__ ___ ____ ___   / __/__ __  _____   =
echo=  / ___/ / -_) _ `(_--/ -_) _\ \/ _ `/ \/ / -_)  =
echo= /_/  /_/\__/\_,_/___/\__/ /___/\_,_/\___/\__/   =
echo=                                                 =
echo===================================================  
pause

::This script will kill all task
:closing all programs
cd c:\windows\System32
for /f "skip=3 tokens=1" %%i in ('TASKLIST /FI "USERNAME eq %userdomain%\%username%" /FI "STATUS eq running"') do (
if not "%%i"=="svchost.exe" (
if not "%%i"=="explorer.exe" (
if not "%%i"=="cmd.exe" (
if not "%%i"=="tasklist.exe" (
echo.
taskkill /f /im "%%i" 
echo.
)
)
)
)
)

::The script below with set the homepage for all the browsers listed
::If file stops working delete all code below this line Added 9/12/15
:internet explore
@echo off
REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /V "Start Page" /D "http://www.google.com/" /F
::Newly added 9/13/14-Tested and working

:Mozilla Firefox
taskkill /im firefox.exe* /f
cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default
set ffile=%cd%
echo user_pref("browser.startup.homepage", "https://www.google.com");>>"%ffile%\prefs.js"
set ffile=
cd %windir%

::This is a test to see if it works for chrome
@echo off
REG ADD "HKCU\SOFTWARE\MICROSOFT\GOOGLE CHROME\MAIN" /V "START PAGE" /D "http://www.google.com/" /F

::This line should restore default setting to opera brower

set DataDir=C:\Users\%USERNAME%\AppData\Roaming\Opera Software\Opera Stable
set DataDir2=C:\Users\%USERNAME%\AppData\Local\Opera Software\Opera Stable

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

del /q /s /f "%DataDir2%"
rd /s /q "%DataDir2%"

::This should restore chrome to default settings
:: Tutorial: http://www.sevenforums.com/tutorials/272251-chrome-browser-reset-default.html


RD /S /Q "%UserProfile%\AppData\Local\Google\Chrome\User Data"


:: File locations of known virus and malware

del /q /s /f c:\Users\%USERNAME%\AppData\Local\SmartWeb\smartwebhelper.exe
del /q /s /f c:\program files\gmsd_us_005010082\gmsd_us_005010082.exe
del /q /s /f c:\program files\gmsd_us_005010083\gmsd_us_005010083.exe
del /q /s /f c:\program files\webget\webgetbho.dll
del /q /s /f HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{dc264a72-fa75-4948-b881-ea8eff8e5dd2}
del /q /s /f HKLM\System\ControlSet001\Services\rqpbhevlkc32\rqpbhevlkc32
