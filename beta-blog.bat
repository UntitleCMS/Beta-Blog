@echo off

CALL ./compose.bat^
 up --force-recreate --build -d %1

docker image prune -f
