# Definindo a imagem base
FROM openjdk:21-jdk-slim AS build

# Configuração do Java 21
ENV JAVA_HOME=/usr/local/openjdk-21
ENV PATH=$JAVA_HOME/bin:$PATH

# Definindo o diretório de trabalho no contêiner
WORKDIR /app

# Copiando os arquivos do projeto para o contêiner
COPY curso .

# Compilando o projeto com Maven
RUN ./mvnw clean install -DskipTests

# Imagem para rodar a aplicação
FROM openjdk:21-jdk-slim

# Definindo o diretório de trabalho para a aplicação
WORKDIR /app

# Copiando o JAR gerado do contêiner de build para o contêiner de execução
COPY --from=build /app/target/curso-0.0.1-SNAPSHOT.jar /app/curso.jar

# Expondo a porta que a aplicação vai rodar
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["java", "-jar", "curso.jar"]