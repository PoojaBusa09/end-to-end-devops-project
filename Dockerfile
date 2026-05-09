FROM eclipse-temurin:17-jdk
<<<<<<< HEAD
=======

WORKDIR /app
>>>>>>> f49eedf (Updated app, Docker, Kubernetes configs and cleaned repo structure)

WORKDIR /app

<<<<<<< HEAD
COPY target/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
=======
ENTRYPOINT ["java","-cp","app.jar","com.devops.App"]
>>>>>>> f49eedf (Updated app, Docker, Kubernetes configs and cleaned repo structure)
