{"inputs":"rooms",
 "query":[
          {

        	  
        	  "map":{
                   "language":"javascript",
                   "source": "function(v) {
                        var parsed_data = JSON.parse(v.values[0].data);
          				var data = {}
          				data.capacity = parsed_data.capacity
          				return [data];
	                          }"
                 }
          },
          {"reduce":{
                   "language":"javascript",
                   "source":
                             "function(v) {
                                	var totals = {capacity: 0}
                	   				for (var i = 0; i < v.length; i++){
                	   					totals.capacity += v[i].capacity;
                	   				}
          						return [totals]
                              }"
                     }
          }
        ]
}