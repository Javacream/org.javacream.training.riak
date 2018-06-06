{"inputs":{
    "bucket":"rooms",
    "key_filters":[["starts_with", "10"]]
 },
 "query":[
          {

        	  
        	  "map":{
                   "language":"javascript",
                   "source": "function(v) {
                        var room_data = JSON.parse(v.values[0].data);
          				room_data.number = v.key;
          				return [room_data];
	                          }"
                 }
          }
        ]
}