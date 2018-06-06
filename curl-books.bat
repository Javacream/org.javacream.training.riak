@echo off
cls
echo "CREATE BOOK isbn1"
curl -v -X PUT http://192.168.186.143:8098/riak/books/isbn1 -H "Content-Type: application/json" -d "{'isbn' : 'isbn1', 'title' : 'RIAK in Action', 'price': 19.99, 'pages': 200}"
echo. 
pause>nul
cls
echo "CREATE BOOK server side POST"
curl -v -X POST http://192.168.186.143:8098/riak/books -H "Content-Type: application/json" -d "{\"isbn\" : \"isbn2\", \"title\" : \"Server Side Key Generation\", \"price\": 9.99, \"pages\": 500}"
echo. 
pause>nul
cls

