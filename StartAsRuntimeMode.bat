@ECHO OFF

SETLOCAL

set MSOFFICE_HOME=C:\Program Files\Microsoft Office\
set MSOFFICE_HOME_86=C:\Program Files (x86)\Microsoft Office\

for %%i in ("%MSOFFICE_HOME%", "%MSOFFICE_HOME_86%") do (
  call :LOOKUP_THEN_START_IF_EXISTS %%i
)
exit /b


:LOOKUP_THEN_START_IF_EXISTS
SETLOCAL
SET ACCESS_EXE=
echo %1

rem 実行ディレクトリを保存
for /f "usebackq tokens=*" %%i IN (`cd`) DO @set WORK=%%i
rem 実行ファイルがあれば保存
for /f "usebackq tokens=*" %%i IN (`dir %1 /A-D /B /S ^| findstr "\\MSACCESS.EXE$"`) DO @SET "ACCESS_EXE=%%i"
if defined ACCESS_EXE (
  echo 起動！
  "%ACCESS_EXE%" /runtime "%WORK%\変換.accde"
)
exit /b
