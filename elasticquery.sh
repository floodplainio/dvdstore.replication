#!/bin/sh
curl http://replication-demo.dexels.com:9200/dvdstore-test-generation-14-simple-dvdstore-test-generation-14-simple-dvd/_search?q=Gina+Monkey\&pretty=true\&_source=title| jq .hits.hits[]._source.title
