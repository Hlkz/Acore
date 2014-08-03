
@echo off
setlocal EnableDelayedExpansion

cd world
for /D %%d in (*) do (
	if exist %DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_%%d.sql del %DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_%%d.sql
	for %%a in (%%d\*.sql) do (
		echo -- %%a >>%DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_%%d.sql
		copy/b %DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_%%d.sql+"%%a" %DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_%%d.sql
	)
)
