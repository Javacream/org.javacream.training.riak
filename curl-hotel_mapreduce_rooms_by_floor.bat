@echo off
cls
echo "HOTEL MAPREDUCE 1"
curl -X POST http://192.168.164.128:8098/mapred -H "Content-Type: application/json" --data-binary "@hotel_mapreduce_rooms_by_floor.js"
echo. 
pause>nul
cls
