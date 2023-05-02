#!/bin/bash
# -k: 인증서가 없는 경우, -s: 상태바 생략
CURRENT_PROFILE=$(curl -k -s https://127.0.0.1/profile/)
echo $CURRENT_PROFILE
echo "# 현재 구동중인 Server: $CURRENT_PROFILE"

if [ $CURRENT_PROFILE == \"set1\" ]
then
    IDLE_PROFILE=set2
    IDLE_PORT=8001
elif [ $CURRENT_PROFILE == \"set2\" ]
then
    IDLE_PROFILE=set1
    IDLE_PORT=8000
else
  echo "두 서버 모두 점유 중입니다."
  exit 1
fi

echo $IDLE_PROFILE

echo "# 현재 구동중인 SERVER의 PID를 종료합니다."