# Docker image for building AIC22 Java client
# source code should be mounted to /src

FROM maven:3.8.6-eclipse-temurin-18

SHELL ["/bin/bash", "-c"]

COPY AIC22-Client-Java/pom.xml /pom.xml
RUN mvn dependency:resolve-plugins dependency:resolve clean package

CMD cd /src && rm -rf target && mvn clean package