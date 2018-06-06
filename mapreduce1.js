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
return [data];
}"
}}
]
}




{
	"inputs":"rooms",
	"query":[
	{"map":{
	"language":"javascript",
	"bucket":"my_functions",
	"key":"map_capacity"
	}},
	{"reduce":{
	"language":"javascript",
	"source":
	"function(v) {
	var totals = {};
	for (var i in v) {
	for(var style in v[i]) {
	if( totals[style] ) totals[style] += v[i][style];
	else totals[style] = v[i][style];
	}
	}
	return [totals];
	}"
	}}
	]
	}



{
	"inputs":{
	"bucket":"cages",
	"key_filters":[["eq", "2"]]
	},
	"query":[
	{"link":{
	"bucket":"animals",
	"keep":false
	}},
	{"map":{
	"language":"javascript",
	"source":
	"function(v) { return [v]; }"
	}}
	]
	}
