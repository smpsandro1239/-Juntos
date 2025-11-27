FROM gradle:8.6-jdk21 AS build
WORKDIR /workspace

# Copiar todo o projeto
COPY --chown=gradle:gradle . /workspace

# Build da aplicação (com retry em caso de problemas de rede)
RUN gradle clean build -x test --no-daemon --refresh-dependencies || \
    (sleep 10 && gradle clean build -x test --no-daemon)

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /workspace/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
