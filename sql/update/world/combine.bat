
@echo off
setlocal EnableDelayedExpansion
set SpellDbc=spelldbc.sql

if exist %SpellDbc% del %SpellDbc%

for %%a in (spelldbc\*.sql) do (
echo /* >>%SpellDbc%
echo * %%a >>%SpellDbc%
echo */ >>%SpellDbc%
copy/b %SpellDbc%+"%%a" %SpellDbc%
echo. >>%SpellDbc%
echo. >>%SpellDbc%)
