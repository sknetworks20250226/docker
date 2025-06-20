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
