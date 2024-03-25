# GraalVM을 기반 이미지로 사용
# JVM 21이 설치된 도커 이미지를 기반해서 사용하겠다.
FROM ghcr.io/graalvm/graalvm-community:21

# 작업 디렉토리 설정
WORKDIR /app

# 호스트 시스템의 build/libs 디렉토리 내의 모든 .jar 파일을
# 컨테이너의 /app 디렉토리로 복사
# WORKDIR /app을 해서 /app/app.jar가 됨
COPY build/libs/*.jar /app/app.jar

# 실행할 JAR 파일 지정
# 여기서는 단일 JAR 파일을 가정하고 있지만, 여러 파일이 있는 경우
# 실행할 특정 파일을 지정해야 합니다.
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "app.jar"]
