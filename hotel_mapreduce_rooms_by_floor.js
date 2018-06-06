{"inputs":[
["rooms","101"],["rooms","4711"],["rooms","666"],["rooms","667"],["rooms","668"]
],
 "query":[
          {"map":{
                   "language":"javascript",
                   "source": "function(v) {
	                           var room_data = JSON.parse(v.values[0].data);
	                           var data = {};
	                           data[v.key.slice(0, 2)] = room_data.capacity;
	                           return [data];
	                          }"
                 }
          },
          {"reduce":{
              "language":"javascript",
              "source":
                        "function(v) {
                            var container = {};
            	  			for (var i = 0; i < v.length; i++){
                        	   var floor_room_data = v[i];
                        	   var data = [];
                        	   var counter = 0;
                        	   for (var attr in floor_room_data){
                        		   data[counter] = floor_room_data[attr];
                        		   counter++;
                        	   }
                        	   if (!container[data[0]]){
                        		   container[data[0]] = 0;
                        	   }
                        	   container[data[0]] += data[1];
                           }
            	  			var result = [];
                       	   var result_data = [];
                       	   counter = 0;
            	  			for (var attr in container){
            	  				result.push()
            	  			}
            	  			return [result];
                         }"
                }
     }

       ]
}