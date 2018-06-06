{
"inputs":[
["rooms","101"],["rooms","102"],["rooms","103"]
],
"query":[
{"map":{
"language":"javascript",
"source":
"function(riakObject) {
/* From the Riak object, pull data and parse it as JSON */
var room_data = JSON.parse(riakObject.values[0].data);
var data = {};
/* Key capacity number by room style string */

data[room_data.style] = room_data.capacity;


//var map_result = {};
//map_result.demo = 'demo';
//map_result.style = room_data.style;

return [data];
}"
}}
]
}