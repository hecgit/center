FROM 10.168.17.113/library/alpine-oraclejdk8:slim
LABEL name="center.center"
ADD target/*demo*.jar app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar
