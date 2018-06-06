@echo off
cls
echo "GET PUBLISHER pub1"
curl -i -X GET http://192.168.186.143:8098/riak/publishers/pub1
echo. 
pause>nul
cls
echo "GET PUBLISHER pub1 LINKS"
curl -i -X GET http://192.168.186.143:8098/riak/publishers/pub1/_,_,_
curl -i -X GET http://192.168.186.143:8098/riak/publishers/pub1/books,publishes,
echo. 
pause>nul
cls
echo "GET  BOOK isbn1 LINKS"
curl -i -X GET http://192.168.186.143:8098/riak/books/isbn1/_,publishedBy,1
echo. 
pause>nul
cls
