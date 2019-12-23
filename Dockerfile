ARG VERSION=0.0.0
FROM dexels/navajo-streams:${VERSION}
MAINTAINER Frank Lyaruu
USER 431:433
COPY --chown=431:433 . /storage/repositories/navajo/
COPY --chown=431:433 bundles/* /storage/repositories/navajo/plugins/
ENV FILE_REPOSITORY_PATH=/storage/repositories/navajo/
ENV FILE_REPOSITORY_TYPE=any
ENV FILE_REPOSITORY_MONITORED=streams
ENV FILE_REPOSITORY_FILEINSTALL=config,etc,plugins
ENV FILE_REPOSITORY_OUTPUT=/output
ENV FILE_REPOSITORY_STORAGE=/storage
ENV HAZELCAST_SIMPLE=true