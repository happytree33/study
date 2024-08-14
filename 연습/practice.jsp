//키바나

GET test/_search
{
	"query":{
		"bool":{
			"must":[
				{ "exists" : { "field": "FIELD_CONTENT"}},
				{ "range": {"FIELD_CONTENT" : { "gt" : ""}}}
			]
		}
	}
}

GET test/_search
{
	"query":{
		"bool":{
			"must":{
				"nested":{
					"path":"FIELD_FILE",
					"query":{ "exists": { "field" : "FIELD_FILE.FIELD_FILE_CONTENT" }}
				}
			}
		}
	}
}