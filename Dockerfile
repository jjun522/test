# 1. Gradle 이미지를 기반으로 애플리케이션 빌드
FROM gradle:7.6-jdk17 AS builder
WORKDIR /app

# 소스 코드 복사 및 의존성 캐싱
COPY . /app
RUN gradle build --no-daemon

# 2. 최종 실행 이미지 생성
FROM openjdk:17-jdk-slim
WORKDIR /app

# 빌드된 JAR 파일 복사
COPY --from=builder /app/build/libs/*.jar app.jar

# 포트 공개
EXPOSE 8080

# Spring Boot 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]
