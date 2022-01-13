REM Written by kramwell.com - 13/DEC/2016
REM Simple script to check when a users password has expired in Active Directory

@echo off
cls
setlocal

:GetTarget
	cls
	set /p targetuser=enter username: 
	if not defined targetuser goto GetTarget
	net user %targetuser% /domain>nul 2>nul
	if %errorlevel% neq 0 goto Oops
	goto main
:Oops
	echo No such user as %targetuser%. try again, k?
	pause
	set targetuser=
	goto GetTarget
:Main
	echo.
	Echo Found %USERDOMAIN%\%targetuser%!
	net user %targetuser% /domain | findstr /i password
	echo.
	pause
:eof
cls
goto GetTarget