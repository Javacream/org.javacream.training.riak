{"inputs":"rooms",
 "query":[
          {

        	  
        	  "map":{
                   "language":"javascript",
                   "source": "function(v) {
                        var parsed_data = JSON.parse(v.values[0].data);
          				var data = {}
          				data[parsed_data.style] = parsed_data.style
          				return [data];
	                          }"
                 }
          },
          {"reduce":{
                   "language":"javascript",
                   "source":
                             "function(v) {
                                	var totals = {}
                	   				for (var i = 0; i < v.length; i++){
                	   					for (attr in v[i]){
                	   						totals[attr] = v[i][attr]
                	   					}
                	   				}
          						return [totals]
                              }"
                     }
          }
        ]
}