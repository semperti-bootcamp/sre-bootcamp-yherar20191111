FROM openjdk:8-alpine
EXPOSE 8080 3306 8081
RUN mkdir -p /root/upload
COPY /PDFs /root/upload/
ADD http://10.252.7.162:8081/repository/maven-releases/com/semperti/trial/journals/9.1-prod/journals-9.1-prod.jar /root/upload/
CMD ["java","-jar","/root/upload/journals-9.1-prod.jar"]
