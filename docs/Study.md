## Volume mount
- VOLUME instruction을 사용하여 mount point를 만들기 위해서는, `컨테이너 내에 폴더 생성 - 파일 복사 - 마운트` 세 단계의 과정이 필요합니다.
  ```Dockerfile
  # 공식문서 VOLUME instruction 사용 예시
  # https://docs.docker.com/engine/reference/builder/
  FROM ubuntu
  RUN mkdir /myvol
  RUN echo "hello world" > /myvol/greeting
  VOLUME /myvol
  ```
- HOST에서 먼저 생성한 volume을 docker container 실행시 mount하는 방식은 다음과 같습니다.
  ```shell
  $ docker run -d \
  # https://docs.docker.com/storage/volumes/#create-and-manage-volumes
  --name devtest \
  -v myvol2:/app \
  nginx:latest
  ```
  - 새로 생성될 volume의 이름을 myvol2로 지정하여 컨테이너 내부 /app 폴더에 mount합니다.
  - 새로 생성되는 volume은 `docker volume ls` 명령어로 조회 가능하며, docker volume `inspect myvol` 명령어로 분석 가능합니다.
- 이에대한 번거로움을 줄이고자, `docker-compose.yaml` 에서 다음과 같이 처리합니다.
  ```Dockerfile
  # https://docs.docker.com/compose/compose-file/#volumes
  services:
  nginx:
      ...
      volumes:
      - ./code/templates:/etc/nginx/templates
      - ./code/logs:/var/log/nginx/logs
      - ./code/init.sh:/init.sh
      ...
  ```
  - colon을 기준으로 `VOLUME:CONTAINER_PATH:ACCESS_MODE`를 통해 mount 합니다.
  - ACCESS_MODE는 rw/ro/z/Z가 있습니다.
- docker-compose를 사용할 경우, 외부 컨테이너의 volume을 사용할 수도 있습니다. (`volumes_from` instruction)