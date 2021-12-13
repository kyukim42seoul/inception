[Solved]

wordpress - mariadb connection

	wordpress container -> install php7.3-mysqli && modify php.ini 'extention=mysqli'

	mariadb container -> change host 'localhost' to '%'(maybe or wordpress) && modify my.cnf for bind-address=0.0.0.0(default=127.0.0.1)

[PROBLEM]

db.sql file not applied to mysql by entrypoint.sh;

nginx keep running after 2nd container open because of 'daemon off' timing

20211210(금) 15:00 ~

	1. PDF 내용 일부 노션에 옮기고 한글로 번역
	2. inception_again 일부 세팅
		컨테이너 여는 부분까지(지속 x)

20211211(토) 16:00 ~

	1. 노션(notion)
		1. 설치 패키지 설명 적는 중
	
	문제 1. php-fpm 의 -R 옵션이 뭔지 못 찾겠다.
		해결(?) -F 옵션 만으로도 컨테이너가 꺼지지 않는다.

20211212(일) 09:00 ~

	버추얼 박스에 도커 설치 후 호스트 OS(맥)에서 localhost 로 접근하기 시도 중...
		시도 1. virtual box 해당 VM 에서 포트 포워딩 설정 127.0.0.1:80 -> debian IP:80
			실패 : localhost 접근 거절

10:17 ~

	문제 1. su 쓰지 않고 도커 등을 사용할 수 있게 debian user 설정

20211213(월)
12:09 ~ 카페베네

	어제 문제 1.
		해결. /etc/sudoers 파일에 "root ..." 적힌 줄 아래로 [user] ALL=(ALL):(ALL) ALL 추가. sudo 사용 가능해짐.

	문제 2. you have to configure your domain name so it points to your local IP address. PDF 의 이 내용이 kyukim.42.fr 로 127.0.0.1 을 가리켜야만
	하는 것인지, 혹은 VM 안의 웹사이트 ip 를 가리키면 되는 것인지?


피드백
	doker-compose 에서 네트워크처럼 볼륨도 설정이 가능하다.

	dockr-compose image prune : 컨테이너 연결 안 된 이미지 삭제

	VM 실행 경로를 USB 로 하는 방법

	VM 속도문제 -> CPU 리소스 할당
