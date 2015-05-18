#!/bin/bash

if [ $# -ne 1 ]; then
	echo "please provide path to maven." >&2
	return 1
fi

mvn -e -U -B dependency:copy -Dartifact=org.slf4j:slf4j-ext:LATEST:jar -Dproject.basedir=. -DoutputDirectory=$1/lib
mvn -e -U -B dependency:copy -Dartifact=org.apache.logging.log4j:log4j-api:LATEST:jar -Dproject.basedir=. -DoutputDirectory=$1/lib
mvn -e -U -B dependency:copy -Dartifact=org.apache.logging.log4j:log4j-slf4j-impl:LATEST:jar -Dproject.basedir=. -DoutputDirectory=$1/lib
mvn -e -U -B dependency:copy -Dartifact=org.apache.logging.log4j:log4j-core:LATEST:jar -Dproject.basedir=. -DoutputDirectory=$1/lib

mv $1/lib/slf4j-simple-*.jar{,.backup}

echo '<?xml version="1.0" encoding="UTF-8" ?>
<configuration>
<properties>
<property name="maven.logging.root.level">INFO</property>
</properties>
<appenders>
<Console name="console" target="SYSTEM_OUT">
<PatternLayout pattern="%highlight{[%p{WARN=WARNING}]} %msg%n%throwable" />
</Console>
</appenders>
<loggers>
<root level="${sys:maven.logging.root.level}">
<appender-ref ref="console"/>
</root>
</loggers>
</configuration>' > $1/conf/logging/log4j2.xml
