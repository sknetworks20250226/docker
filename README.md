# Docker 시작하기
# 1. 도커 데스크탑 설치
# 2. 재부팅
# 3. vscode에서 가상환경만들고 터미널에서 도커 명령어 실행
```
# 설치 확인
docker --version
# 도커이미지 만들기
myapp/
|- app.py
|- requirements.txt
|- Dockerfile

app.py 파일내용

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello Docker!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
-------------------------------------------------

requirements.txt 파일내용

flask
----------------------------------------

Dokerfile 파일내용

# 베이스 이미지
FROM python:3.11-slim

# 작업 디렉토리 설정
WORKDIR /app

# 의존성 파일 복사
COPY requirements.txt .

# 의존성 설치
RUN pip install --no-cache-dir -r requirements.txt

# 파일복사
COPY . .

# 컨테이너 시작 시 실행할 명령어
CMD ["python", "app.py"]
--------------------------------------------
```

# 도커 이미지 빌드
```
docker build -t myapp:latest .
```

# 도커 컨데이터 실행
```
docker run -d -p 5000:5000 myapp
```

# 브라우져에서 확인
```
localhost:5000
127.0.0.1:5000
```

# 커너이너 또는 이미지 확인은 docker desktop이용 또는
```
# 실행중인 컨테이너 확인
docker ps

# 중지
docker stop <CONTAINER ID>
```

# 기존 존재하는 이미지를 컨테이너에서 실행
```
docker run -d -it ubuntu:16.04
```

# 컨테이너 내부 접속
```
docker exec -it <CONTAINER ID OR NAME> /bin/bash
```