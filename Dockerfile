ARG TAG=5.0.0
FROM dexels/navajo-streams:3.3.140
MAINTAINER Frank Lyaruu
USER 431:433
COPY --chown=431:433 navajo /storage/repositories/navajo/
ENV FILE_REPOSITORY_PATH=/storage/repositories/navajo/
ENV FILE_REPOSITORY_TYPE=multitenant
ENV FILE_REPOSITORY_MONITORED=scripts,config,resources,reactive
ENV FILE_REPOSITORY_FILEINSTALL=config
ENV NO_REDIS=true
ENV HAZELCAST_SIMPLE=true
ENV INTERACTIVE=true
ENV NO_BUNDLESYNC=true
ENV CONSOLE_PASS="{sha-256}jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg="
ENV CONSOLE_USER="admin"
ENTRYPOINT ["/opt/felix/startup.sh"]
