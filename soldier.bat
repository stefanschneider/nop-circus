@echo off

IF !%1==! (
	echo Usage: %0 {app dir} {command to run}
	exit /B 1
)

set destPath=%1
cd %destPath%

rem shift arguments http://stackoverflow.com/questions/9363080/how-to-make-shift-work-with-in-batch-files
shift
set "args="
:parse
if "%~1" neq "" (
  set args=%args% %1
  shift
  goto :parse
)
if defined args set args=%args:~1%

cmd.exe /c %args%
exit /B 0