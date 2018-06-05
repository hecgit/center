FROM 10.168.17.113/library/alpine-oraclejdk8:slim
LABEL center.center=center
ADD target/*center*.jar app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar