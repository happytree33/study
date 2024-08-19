@echo off

set PROFILE=d:\search\prosearch\dbcrawler\setenv.bat

if exist "%PROFILE%" (
	call %PROFILE%
	echo set global environment: %PROFILE%
	echo.
) else (
	echo no such global environment: %PROFILE%
	exit /b 1
)

call %DBCRAWLER_HOME%\batch\dbcrawler.bat mail dyn

del %DBCRAWLER_HOME%\json\mail\backup\*C.json
