FROM maven:latest as boss
RUN mkdir -p /kamal/project
WORKDIR /kamal/project
ADD . .
RUN mvn clean package


FROM tomcat:latest
RUN rm -rf webapps/ROOT.war
EXPOSE 8080
COPY --from=boss /kamal/project/target/pro1.war webapps/ROOT.war

