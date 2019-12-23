#!/bin/sh
curl http://replication-demo.dexels.com:9200/dvdstore-test-generation-3-simple-dvdstore-test-generation-3-simple-film/_search?q=Gina+Darkness\&_source=title | jq .hits.hits[]._source.title
