FROM java:8
WORKDIR /
COPY ./initial/target/gs-maven-0.1.0.jar gs-maven-0.1.0.jar
CMD java -jar gs-maven-0.1.0.jar
