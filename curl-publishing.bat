@echo off
cls
echo "CREATE PUBLISHER pub1"
curl -X PUT http://192.168.164.128:8098/riak/publishers/pub1 -H "Content-Type: application/json" -d "{\"name\" : \"Publisher1\"}"  -H "Link: </riak/books/isbn1>; riaktag=\"publishes\"" -H "Link: </riak/books/isbn2>; riaktag=\"publishes\""
echo. 
pause>nul
cls

echo "CREATE PUBLISHER pub2"
curl -X PUT http://192.168.164.128:8098/riak/publishers/pub2 -H "Content-Type: application/json" -d "{\"name\" : \"Publisher2\"}" -H "Link: </riak/books/isbn3>; riaktag=\"publishes\"" -H "Link: </riak/books/isbn4>; riaktag=\"publishes\"" -H "Link: </riak/books/isbn5>; riaktag=\"publishes\""
echo. 
pause>nul
cls

echo "CREATE BOOKS"
curl -X PUT http://192.168.164.128:8098/riak/books/isbn1 -H "Content-Type: application/json" -d "{\"title\" : \"RIAK\", \"price\": 19.99, \"pages\": 200}" -H "Link: </riak/publishers/pub1>; riaktag=\"publishedBy\""
curl -X PUT http://192.168.164.128:8098/riak/books/isbn2 -H "Content-Type: application/json" -d "{\"title\" : \"MongoDB\", \"price\": 29.99, \"pages\": 300}" -H "Link: </riak/publishers/pub1>; riaktag=\"publishedBy\""
curl -X PUT http://192.168.164.128:8098/riak/books/isbn3 -H "Content-Type: application/json" -d "{\"title\" : \"HBASE\", \"price\": 9.99, \"pages\": 400}" -H "Link: </riak/publishers/pub2>; riaktag=\"publishedBy\""
curl -X PUT http://192.168.164.128:8098/riak/books/isbn4 -H "Content-Type: application/json" -d "{\"title\" : \"NoSQL\", \"price\": 39.99, \"pages\": 800}" -H "Link: </riak/publishers/pub2>; riaktag=\"publishedBy\""
curl -X PUT http://192.168.164.128:8098/riak/books/isbn5 -H "Content-Type: application/json" -d "{\"title\" : \"Neo4J\", \"price\": 49.99, \"pages\": 500}" -H "Link: </riak/publishers/pub2>; riaktag=\"publishedBy\""
echo. 
pause>nul
cls
