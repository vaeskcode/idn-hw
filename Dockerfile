FROM maven:3.8.4-openjdk-11 as maven_builder
WORKDIR /app
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/ && mvn package
FROM tomcat:9.0.62-jre11-openjdk-slim
COPY --from=maven_builder /app/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
