FROM openjdk:8-alpine
EXPOSE 8080 3306 9090
RUN mkdir -p /root/upload
COPY /PDFs /root/upload/
ADD  http://10.252.7.162:8081/repository/maven-releases/com/semperti/trial/journals/test-9.2/journals-test-9.2.jar /root/upload/
CMD ["java","-jar","/root/upload/journals-test-9.2.jar"]
