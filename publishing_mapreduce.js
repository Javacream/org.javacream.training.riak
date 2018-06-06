{"inputs":"books",
 "query":[
          {"map":{
                   "language":"javascript",
                   "source": "function(v) {
	                           //var parsed_data = JSON.parse(v.values[0]);
                	   			var o = JSON.parse(v.values[0].data)
                	   			return [{price: o.price, pages: o.pages}];
	                          }"
                 }
          },
          {"reduce":{
                   "language":"javascript",
                   "source":
                             "function(v) {
                       var totals = {};
          for (var i in v) {
           for(var attribute in v[i]) {
            if( totals[attribute] ) totals[attribute] += v[i][attribute];
            else totals[attribute] = v[i][attribute];
            }
           }
           return [totals];
                              }"
                     }
          }
        ]
}