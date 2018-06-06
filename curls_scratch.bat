echo "MAPREDUCE WITH LINKS"
curl -X POST -H "content-type:application/json" http://192.168.186.143:8098/mapred --data "{	\"inputs\":{	\"bucket\":\"cages\",	\"key_filters\":[[\"eq\", \"2\"]]	},	\"query\":[	{\"link\":{	\"bucket\":\"animals\",	\"keep\":false	}},	{\"map\":{	\"language\":\"javascript\",	\"source\":	\"function(v) { return [v]; }\"	}}	]	}"
echo. 
pause>nul
cls
