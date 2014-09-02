
@echo off
setlocal EnableDelayedExpansion

set WorldSQL=%DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_world_database.sql

if exist %WorldSQL% del %WorldSQL%
for %%a in (world\*.sql) do (
	echo -- %%a >>%WorldSQL%
	copy/b %WorldSQL%+"%%a" %WorldSQL%
)

cd world
for /D %%d in (*) do (
	for %%a in (%%d\*.sql) do (
		echo -- %%a >>..\%WorldSQL%
		copy/b ..\%WorldSQL%+"%%a" ..\%WorldSQL%
	)
)
