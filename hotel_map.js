{
"inputs":[
["rooms","101"],["rooms","102"],["rooms","103"]
],
"query":[
{"map":{
"language":"javascript",
"source":
"function(v) {
/* From the Riak object, pull data and parse it as JSON */
var parsed_data = JSON.parse(v.values[0].data);
var data = {};
/* Key capacity number by room style string */
data[parsed_data.style] = parsed_data.capacity;
data.data=parsed_data;
}"
}}
]
}