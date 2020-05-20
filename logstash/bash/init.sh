#!/bin/bash
pwd
# ping -c 10 ${ELASTICSEARCH_CONTAINER_NAME}
# echo ${ELASTICSEARCH_PASSWORD}
# ping -c 10 elk_es
# logstash-plugin install logstash-codec-json_lines
echo "开始安装插件"
bin/logstash-plugin install --no-verify
logstash -f ./pipeline/logstash.conf --config.reload.automatic
