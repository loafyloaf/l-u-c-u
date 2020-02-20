FROM adoptopenjdk:8-jre-openj9

USER root
RUN apt-get update && apt-get upgrade -y e2fsprogs libgnutls30 libgcrypt20 libsasl2-2
USER 1001

RUN mkdir -p /opt/app/lib
COPY target/user-cleanup-utility-1.0-SNAPSHOT.jar /opt/app
COPY target/lib/* /opt/app/lib/
CMD ["java", "-jar", "/opt/app/user-cleanup-utility-1.0-SNAPSHOT.jar"]