## Sub Domain Setting in Nginx
- `m.mysite.com`과 `dev.mysite.com`과 같이 subdomain을 설정하기 위해서는 upstream 명령어를 사용할 수 있습니다.
- 이를 위해, 먼저 Domain 제공 사이트에서 CNAME과 프로토콜/Port를 등록합니다. (해당 과정은 도메인 사이트마다 다릅니다.)
- 도메인 관리 페이지에서 `이름 - 유형 - 데이터`를 `dev - CNAME - HOST_IP` 순서대로 기록하고 저장합니다. (여기서 dev는 도메인 접두사)

### Nginx conf 파일 설정
- 현재 repository에서는 `/code/templates/default.conf.template` 설정값을 `envsubst` 실행파일을 통해 환경변수가 적용된 코드로 변환하는 과정을 우선적으로 수행합니다.
- 따라서, nginx.conf 파일에 직접 세팅하지 않고, `default.conf.template` 파일에 설정값을 설정합니다.
  ```nginx
  # /code/templates/default.conf.template
  server {
  }

  ...

  upstream dev {
      server 127.0.0.1:3000;
  }

  server {
      listen	${NGINX_PORT};
      server_name	dev.${NGINX_HOST};
      location / {
          return 308 https://$host$request_uri;
      }
  }
  server {
      listen	443 ssl;
      server_name	dev.${NGINX_HOST};
      ssl_certificate /etc/letsencrypt/live/${NGINX_HOST}/fullchain.pem;
      ssl_certificate_key /etc/letsencrypt/live/${NGINX_HOST}/privkey.pem;
      location / {
          proxy_pass http://dev; 
      }
  }
  ```
  - upstream 이후 설정은 위와 같습니다. `dev.`으로 시작하는 url을 입력 받을 때, 80 포트 및 443 포트를 listen하도록 server 블록을 구성합니다. 
  - 80 포트로 입력받는 경우, 443 포트로 redirect하여 https 설정을 사용하도록 server 블록을 구성합니다. 443 포트의 server 블록은 proxy_pass를 통해 upstream 블록(`dev`)으로 요청을 돌립니다.
  - 위의 과정을 모두 수행하면, 도커컴포즈 내에 동작하는(upstream 블록에 기록되어 있는) `127.0.0.1:3000`가 요청을 전달받게 됩니다.
