@echo off
echo "HOTEL MAPREDUCE 1"
curl -X POST http://192.168.186.143:8098/mapred -H "Content-Type: application/json" --data-binary "@publishing_mapreduce.js"
echo. 
pause>nul
cls
