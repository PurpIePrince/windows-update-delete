@echo off
if not "%1" == "am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

chcp 65001
title "윈도우 업데이트 파일 제거 by PurplePrince"
mode con cols=90 lines=25
color 1F
echo.  ┌────────────────────────────────────────────────────────────────────────────────┐
echo.
echo.        윈도우 업데이트 파일을 제거해서 C드라이브 용량을 확보합니다.
echo.        진행 후에는 업데이트 기록이 사라지며 이전 상태로 복구가 불가능합니다.
echo.        Contact me : purple_prince@naver.com
echo.
echo.  └────────────────────────────────────────────────────────────────────────────────┘
echo.
echo.진행하려면 아무 키나 눌러주세요.
pause > Null
echo.
echo.Windows Update 서비스를 중지합니다.
net stop wuauserv
echo.백그라운드 인텔리전트 전송 서비스를 중지합니다.
net stop bits
echo.윈도우 업데이트 파일을 제거합니다.
echo.
rd c:\windows\softwaredistribution /q /s
echo.Windows Update 서비스를 실행합니다.
net start wuauserv
echo.백그라운드 인텔리전트 전송 서비스를 실행합니다.
net start bits
echo.
echo.작업이 완료되었습니다.
pause > Null
