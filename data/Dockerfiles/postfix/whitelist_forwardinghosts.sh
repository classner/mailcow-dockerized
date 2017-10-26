#!/bin/bash

while read QUERY; do
	QUERY=($QUERY)
	if [ "${QUERY[0]}" != "get" ]; then
		echo "500 dunno"
		continue
	fi
	result=$(curl -s http://172.25.1.251:8081/forwardinghosts.php?host=${QUERY[1]})
	logger -t whitelist_forwardinghosts -p mail.info "Look up ${QUERY[1]} on whitelist, result $result"
	echo ${result}
done
