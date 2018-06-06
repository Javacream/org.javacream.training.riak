@echo off
cls
echo "HOTEL MAPREDUCE 1"
curl -X POST http://192.168.164.128:8098/mapred -H "Content-Type: application/json" --data-binary "@hotel_get_all_rooms_mapreduce.js" -o c:\_training\floor1.json
echo. 
pause>nul
