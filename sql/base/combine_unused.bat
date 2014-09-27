
@echo off
setlocal EnableDelayedExpansion

set UnusedSQL=%DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_unused_database.sql

if exist %UnusedSQL% del %UnusedSQL%
for %%a in (unused\*.sql) do (
	echo -- %%a >>%UnusedSQL%
	copy/b %UnusedSQL%+"%%a" %UnusedSQL%
)

cd unused
for /D %%d in (*) do (
	for %%a in (%%d\*.sql) do (
		echo -- %%a >>..\%UnusedSQL%
		copy/b ..\%UnusedSQL%+"%%a" ..\%UnusedSQL%
	)
)
