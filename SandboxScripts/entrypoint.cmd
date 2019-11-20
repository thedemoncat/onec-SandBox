REM Install choco

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM create temp dir
mkdir c:\temp && cd c:\temp

REM install oscript 
REM choco install -y onescript-cli
jdk8choco install -y jdk8 
"C:\users\wdagutilityaccount\desktop\Distrib\OneScript-1.1.1-setup.exe" /silent 
"C:\users\wdagutilityaccount\desktop\Distrib\JavaSetup8u221.exe" /s 
rem Установить определенную версию

start choco install -y apache-httpd
start choco install -y git.install

REM пропишем в PATH, так как почему то само не прописывается(
SET "PATH=%PATH%;C:\Program Files (x86)\OneScript\bin\" 
SET "PATH=%PATH%;C:\ProgramData\chocolatey\tools"
REM SET "PATH=%PATH%;C:\Program Files (x86)\Common Files\Oracle\Java\javapath"
SET "PATH=%PATH%;C:\Program Files\Git\bin"


REM Inastall Vanessa-ADD
start opm install add 
start opm install vanessa-runner
start opm install gitsync && gitsync p init
REM Запускаем ноду


REM Download distr 1С
7z x C:\users\wdagutilityaccount\desktop\Distrib\windows_8_3_15_1565.rar -o"c:\temp\dist"  
pushd dist 
cmd /s /c ""1CEnterprise 8.msi" /qn TRANSFORMS=1049.mst DESIGNERALLCLIENTS=1 THICKCLIENT=1 THINCLIENTFILE=1 THINCLIENT=1 WEBSERVEREXT=1 SERVER=0 CONFREPOSSERVER=1 CONVERTER77=0 SERVERCLIENT=0 LANGUAGES=RU || if "%ERRORLEVEL%"=="3010" exit 0" 
popd 
rmdir /q /s dist

start gitsync p init

copy /Y C:\users\wdagutilityaccount\desktop\Distrib\nethasp.ini "C:\Program Files (x86)\1cv8\conf\nethasp.ini"
copy /Y C:\users\wdagutilityaccount\desktop\Distrib\conf.cfg "C:\Program Files (x86)\1cv8\conf\conf.cfg"

mkdir "C:\users\wdagutilityaccount\.ssh\"
copy /Y C:\users\wdagutilityaccount\desktop\Distrib\ssh\* "C:\users\wdagutilityaccount\.ssh\*"

start C:\users\wdagutilityaccount\desktop\Jenkins_home\start.cmd



