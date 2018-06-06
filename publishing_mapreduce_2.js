{"inputs":"books",
 "query":[
          {"map":{
                   "language":"javascript",
                   "source": "function(v) {
	                           var parsed_data = JSON.parse(v.values[0].data);
	                           return {parsed_data.title, parsed_data.price};
	                          }"
                 }
          },
          {"reduce":{
                   "language":"javascript",
                   "source":
                             "function(v) {
                                return v;
                              }"
                     }
          }
        ]
}