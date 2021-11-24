FROM java:8
COPY ./initial/target/gs-maven-0.1.0-shaded.jar gs-maven-0.1.0-shaded.jar
CMD java -jar gs-maven-0.1.0-shaded.jar
