# 1. 프로젝트 구조 설계
```
DOCKER
|- Dockerfile
|- docker-compose.yml
|- requirements.txt
|- 장고 프로젝트 폴더
```
# 2. Django 프로젝트 생성
```
docker-compose run web django-admin startproject config .
```
# 3. Django 데이터베이스 설정 변경
``
import os
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('DJANGO_DB_NAME', 'mydb'),
        'USER': os.environ.get('DJANGO_DB_USER', 'myuser'),
        'PASSWORD': os.environ.get('DJANGO_DB_PASSWORD', 'mypassword'),
        'HOST': os.environ.get('DJANGO_DB_HOST', 'db'),
        'PORT': os.environ.get('DJANGO_DB_PORT', '5432'),
    }
}
```