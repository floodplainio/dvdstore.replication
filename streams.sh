#!/bin/sh
NAME="DVD-stream"
CONTAINER="dexels/navajo-bare:3.8.1"
ENV="-e TZ=Europe/Amsterdam \
     -e NO_REDIS=true \
     -e CONTAINERNAME=test-stream-replication-1 \
     -e INSTANCENAME=test-stream-replication-1 \
     -e CONTAINER=${CONTAINER} \
     -e KAFKA_STREAMS_THREADCOUNT=1\
     -e GIT_REPOSITORY_TYPE=any\
     -e GIT_REPOSITORY_FILEINSTALL=etc\
     -e GIT_REPOSITORY_DEPLOYMENT=test\
     -e GIT_REPOSITORY_URL=https://github.com/flyaruu/dvdstore.replication\
     -e GIT_REPOSITORY_TOKEN=269a5808444240eca76d1aff8e485cb8d605dd0c\
     -e GIT_REPOSITORY_SLEEPTIME=3600000\
     -e GIT_REPOSITORY_GITHUB=true\
     -e TOPIC_REPLICATION_COUNT=1\
     -e REPLICATION_MESSAGE_FORMAT=JSON\
     -e CLUSTER_USE_DEFAULT_CLASSLOADER=true\
     -e LOGLEVEL=INFO\
     -e LOGAPPENDERS="stdout,out"\
     -e TENANT_MASTER=DVDSTORE\
     -e TOPIC_PARTITION_COUNT=1\
     -e GIT_REPOSITORY_BRANCH=master\
     -e GENERATION=2\
     -e startflags=-Xmx1000m\
     -e KAFKA_STREAMS_DISABLECACHE=True\
     -e REPARTITION_FORCE_LOGAPPENDTIME=True\
     -e HAZELCAST_SIMPLE=True\
     -e CLUSTER=test-knvb-replication\
     -e REDIS_DEDOT=true\
     -e INTERACTIVE=true"
PARAMETERS=" --ulimit nofile=8192:8192"
PORTMAPPINGS=" -p 8181:8181 "
LINK=""
SETTINGS=" --ulimit nofile=32768:32768"
echo "Starting $CONTAINER as $NAME... "
echo "Expecting host: $EXPOSEDHOST"
docker rm $NAME 2>/dev/null
VOLUMES_FROM=""
docker run  --network=replication-demo_default --rm --name $NAME ${LINK} ${VOLUMES_FROM} ${VOLUMES} ${PORTMAPPINGS} ${ENV} ${SETTINGS} -i -t ${CONTAINER} ${PARAMETERS}
RETVAL=$?
exit $RETVAL
