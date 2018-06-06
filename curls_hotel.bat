@echo off
cls
echo "PING"
curl http://192.168.186.143:8098/ping
echo. 
pause>nul
cls

echo "LIST BUCKETS"
curl -X GET http://192.168.186.143:8098/riak?buckets=true
echo. 
pause>nul
cls

echo "LIST KEYS"
curl http://192.168.186.143:8098/riak/animals?keys=true
echo. 
pause>nul
cls

echo "PRODUCE 404"
curl -I http://192.168.186.143:8098/riak/no_bucket/no_key
echo. 
pause>nul
cls

echo "CREATE FAVORITE"
curl -v -X PUT http://192.168.186.143:8098/riak/favs/db -H "Content-Type: text/html" -d "<html><body><h1>My new favorite DB is RIAK</h1></body></html>"
rem Anschauen: http://192.168.186.143:8098/riak/favs/db
echo. 
pause>nul
cls

echo "CREATE A DOG"
curl -v -X PUT http://192.168.186.143:8098/riak/animals/ace -H "Content-Type: application/json" -d "{'nickname' : 'The Wonder Dog', 'breed' : 'German Shepherd'}"
rem	return 204
echo. 
pause>nul
cls

echo "CREATE DOG WITH RETURN"
curl -v -X PUT http://192.168.186.143:8098/riak/animals/polly?returnbody=true -H "Content-Type: application/json" -d "{'nickname' : 'Sweet Polly Purebred', 'breed' : 'Purebred'}"
rem	return 200
echo. 
pause>nul
cls
 

echo "CREATE DOG, SERVER SIDE KEY GENERATION"
curl -i -X POST http://192.168.186.143:8098/riak/animals -H "Content-Type: application/json" -d "{'nickname' : 'Sergeant Stubby', 'breed' : 'Terrier'}"
rem return 201: Created, Key unter Location
rem curl http://192.168.186.143:8098/riak/animals/6VZc2o7zKxq2B34kJrm1S0ma3PO
rem curl -i -X DELETE http://192.168.186.143:8098/riak/animals/6VZc2o7zKxq2B34kJrm1S0ma3PO
rem	return 204
echo. 
pause>nul
cls

echo "CREATE CAGE WITH LINK TO POLLY"
curl -v -X PUT http://192.168.186.143:8098/riak/cages/1 -H "Content-Type: application/json" -H "Link: </riak/animals/polly>; riaktag=\"contains\"" -d "{'room' : 101}"
echo. 
pause>nul
cls

echo "POLLY KNOWS  NOTHING OF CAGE"
curl -i http://192.168.186.143:8098/riak/animals/polly
echo. 
pause>nul
cls

echo "CREATE CAGE WITH LINK TO ACE NEXT_TO CAGE 1"
curl -v -X PUT http://192.168.186.143:8098/riak/cages/2 -H "Content-Type: application/json" -H "Link:</riak/animals/ace>;riaktag=\"contains\", </riak/cages/1>;riaktag=\"next_to\"" -d "{'room' : 101}"
echo. 
pause>nul
cls

echo "LINK WALK"
echo "ALL"
curl -v http://192.168.186.143:8098/riak/cages/1/_,_,_
echo. 
pause>nul
cls

echo "ANIMALS"
curl -v http://192.168.186.143:8098/riak/cages/2/animals,_,_
echo. 
pause>nul
cls

echo "NEXT_TO"
curl http://192.168.186.143:8098/riak/cages/2/_,next_to,_
echo. 
pause>nul
cls


echo "NEXT_TO ANIMAL, NO KEEP"
curl http://192.168.186.143:8098/riak/cages/2/_,next_to,0/animals,_,_
echo. 
pause>nul
cls

echo "NEXT_TO ANIMAL, KEEP"
curl http://192.168.186.143:8098/riak/cages/2/_,next_to,1/_,_,_
echo. 
pause>nul
cls

echo "META-DATA"
curl -v -X PUT http://192.168.186.143:8098/riak/cages/1 -H "Content-Type: application/json" -H "X-Riak-Meta-Color: Pink" -H "Link: </riak/animals/polly>; riaktag=\"contains\"" -d "{'room' : 101}"
echo. 
pause>nul
cls

echo "MIME TYPES"
curl -v -X PUT http://192.168.186.143:8098/riak/photos/polly.jpg -H "Content-type: image/jpeg" -H "Link: </riak/animals/polly>; riaktag=\"photo\"" --data-binary @polly.jpg
rem http://192.168.186.143:8098/riak/photos/polly.jpg
echo. 
pause>nul
cls

echo "RUN MAPREDUCE"
curl -X POST -H "content-type:application/json" http://192.168.186.143:8098/mapred --data "{\"inputs\":[[\"rooms\",\"101\"],[\"rooms\",\"102\"],[\"rooms\",\"103\"]],\"query\":[{\"map\":{\"language\":\"javascript\",\"source\":\"function(v) {var parsed_data = JSON.parse(v.values[0].data);var data = {};data[parsed_data.style] = parsed_data.capacity;return [data];}\"}}]}"
echo. 
pause>nul
cls

echo "REGISTER FUNCTIONS"
curl -X PUT -H "content-type:application/json" http://192.168.186.143:8098/riak/my_functions/map_capacity --data "function(v) {var parsed_data = JSON.parse(v.values[0].data);var data = {};data[parsed_data.style] = parsed_data.capacity;return [data];}"
echo. 
pause>nul
cls

echo "REGISTER FUNCTIONS"
curl -X POST -H "content-type:application/json" http://192.168.186.143:8098/mapred --data "{\"inputs\":\"rooms\",\"query\":[{\"map\":{\"language\":\"javascript\",\"bucket\":\"my_functions\",\"key\":\"map_capacity\"}},{\"reduce\":{\"language\":\"javascript\",\"source\":\"function(v) {var totals = {};for (var i in v) {for(var style in v[i]) {if( totals[style] ) totals[style] += v[i][style];else totals[style] = v[i][style];}}return [totals];}\"}}]}}"
echo. 
pause>nul
cls

echo "MAPREDUCE WITH LINKS"
curl -X POST -H "content-type:application/json" http://192.168.186.143:8098/mapred --data "{	\"inputs\":{	\"bucket\":\"cages\",	\"key_filters\":[[\"eq\", \"2\"]]	},	\"query\":[	{\"link\":{	\"bucket\":\"animals\",	\"keep\":false	}},	{\"map\":{	\"language\":\"javascript\",	\"source\":	\"function(v) { return [v]; }\"	}}	]	}"
echo. 
pause>nul
cls
