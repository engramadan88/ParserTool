<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <appender name="console" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>

    <logger name="org.hibernate.SQL" level="DEBUG" additivity="false">
        <appender-ref ref="console" />
    </logger>

    <root level="INFO">
        <appender-ref ref="console" />
    </root>
</configuration>
