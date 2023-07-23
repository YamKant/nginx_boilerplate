# Nginx를 이용한 무중단 배포
- Django server를 무중단 배포하기 위한 Nginx와 Docker container를 세팅합니다.
- [구체적인 설명 참고](https://yamkant.github.io/server/server-1/)

### 최종 목표
- nginx 단독 컨테이너 구성
- docker-compose를 사용한 django server 여러대 구성
- nginx load balancing을 활용한 django server 구동
- Blue-Green 배포 형식으로 nginx 및 docker-compose 세팅
