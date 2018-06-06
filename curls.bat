@echo off

echo "CREATE FAVORITE"
curl -v -X PUT http://192.168.186.143:8098/riak/rooms2/r2 -H "Content-Type: application/json" -d "{\"style\": \"single\", \"capacity\": 27}"
rem Anschauen: http://192.168.186.143:8098/riak/favs/db
echo. 
pause>nul
