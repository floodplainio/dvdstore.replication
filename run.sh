docker run --rm --network replication-demo_default --name stream \
	-e FILE_REPOSITORY_DEPLOYMENT=test \
	-e CONSOLE_PASS="{sha-256}jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=" \
        -e CONSOLE_USER=admin \
	-p 8181:8181 floodplain/dvdstore.replication:latest

