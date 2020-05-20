# ELK整合

## 项目运行

### 前台运行
```shell script
docker-compose up
```

### 后台运行
```shell script
docker-compose up -d
```

## 项目目录

- #### docker-compose.yml
    - docker-compose相关配置
- #### clean.sh
    - 定时清理满足条件的索引脚本，这里用的是索引名和时间进行筛选
- #### logback-spring.xml
    - logback配置将日志发送给logstash
```xml
<!--logstash的Maven依赖-->
<dependency>
    <groupId>net.logstash.logback</groupId>
    <artifactId>logstash-logback-encoder</artifactId>
    <version>6.3</version>
</dependency>
```

- #### logstash文件夹
    - ##### bash文件夹
        - init.sh (指定logstash镜像运行脚本)
        - logstash-codec-json_lines (logstash的json_lines插件源码，用于镜像启动时自动安装此插件)
        - Genfile (使用的6.4.0版本的logstash的文件，修改了json_lines的插件相关的配置，指向本地插件目录，因为在线安装插件很慢)
        - logstash.conf (配置)
        
- #### elasticsearch文件夹
    - 存放数据及插件目录