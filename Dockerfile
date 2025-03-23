# Etapa de Build
FROM maven:3.9.6-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos do projeto para o contêiner
COPY . .

# Dá permissão de execução ao wrapper do Maven
RUN chmod +x mvnw

# Compila o projeto e gera o JAR
RUN ./mvnw clean package -DskipTests

# Etapa de Execução
FROM eclipse-temurin:21-jdk

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o JAR gerado da etapa de build para a imagem final
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta 8080
EXPOSE 8080

# Define o comando de entrada
ENTRYPOINT ["java", "-jar", "app.jar"]