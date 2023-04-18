FROM  engramadan/parsertool-base:latest AS app
WORKDIR /app
COPY . /app
EXPOSE 8080
ENV DB_USERNAME="${DB_USERNAME}" \
    DB_PASSWORD="${DB_PASSWORD}" \
    DB_URL="${DB_URL}"

COPY  ParserTool-1.0-SNAPSHOT.jar /app/
#ENTRYPOINT ["java", "-jar", "/app/ParserTool-1.0-SNAPSHOT.jar"]

FROM container-registry.oracle.com/database/enterprise:21.3.0.0 AS db
COPY create-user.sql /opt/oracle/scripts/startup