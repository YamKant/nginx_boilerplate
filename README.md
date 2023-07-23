# nginx_boilerplate
- nginx를 사용해서 서버를 세팅하기 위한 간단한 구조를 Boilerplate code로 작성합니다.
- [docker compose를 사용한 간단한 서비스 구축](./default)
- [container와 compose를 함께 사용한 배포환경 구성](./django-server)

### 구현 내용
- nginx docker image 내부 `/docker-entrypoint.d/20-envsubst-on-templates.sh`를 사용한 nginx 설정파일 환경변수 적용
- 커네이너 서비스별 분리 및 도커 네트워크를 사용한 서비스 내부 통신기능 추가
- static file 서빙 및 WAS로 reverse proxy
- upstream directive를 이용한 로드밸런싱(라운드 로빈 방식)
- ssl 적용 (임시적으로 open ssl) 및 log 설정
