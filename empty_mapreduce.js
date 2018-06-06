{"inputs":"bucket",
 "query":[
          {"map":{
                   "language":"javascript",
                   "source": "function(v) {
	                           //var parsed_data = JSON.parse(v.values[0]);
                	   			var o = JSON.parse(v.values[0].data)
                	   			return [o];
	                          }"
                 }
          },
          {"reduce":{
                   "language":"javascript",
                   "source":
                             "function(v) {
                                return [v];
                              }"
                     }
          }
        ]
}