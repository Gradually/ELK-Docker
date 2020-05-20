#!/bin/bash
# 日期
DATE=`date -d "1 day ago" +%Y.%m.%d`
# ES访问路径
ES_HOST="127.0.0.1:9200"
# 日志索引名
LOG_NAME="demo"
echo $DATE
echo $ES_HOST
curl -XGET http://$ES_HOST/_cat/indices?v|grep $LOG_NAME|grep $DATE|awk -F '[ ]+' '{print $3}'>index.log

for elk in `cat ./index.log`
do
 curl -XDELETE "http://127.0.0.1:9200/$elk"
done