#!/bin/sh
IMAGE=floodplain/dvdstore.replication
BASEIMAGE=dexels/navajo-streams
BASEMINORVERSION=3.3
IMAGEVERSION=1.0
BASEBUILDNR=$(curl -s "https://circleci.com/api/v1.1/project/github/Dexels/navajo-streams?circle-token=${CIRCLE_TOKEN}&limit=100&offset=0&filter=successful" | jq '[.[]| select(.workflows.job_name == "package_navajo")][0].build_num')
BASETAG=${BASEMINORVERSION}.$BASEBUILDNR
echo "Tagging for: ${IMAGE}:${IMAGEVERSION}.${CIRCLE_BUILD_NUM}  onto super: ${BASEIMAGE}.${BASETAG}"
docker build . --build-arg VERSION=${BASETAG} -t ${IMAGE}:${IMAGEVERSION}.${CIRCLE_BUILD_NUM} -t ${IMAGE}:latest
docker push ${IMAGE}:latest

