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
		가설 1. localhost:443/wordpress && https://localhost/wordpress -> kyukim.42.fr 연결

	문제 3. wordpress 인스톨 페이지를 보면 안 된다. 도커를 세팅한 상황에서 이미 인스톨이 되어 있어야 하고, login 페이지에서 login 해야한다.
		일단 var/lib/mysql/ 의 파일을 전부 덮어썼을 때, user_name 까지는 존재한다고 인식한다.
		다만 /WordPress/ 의 파일을 덮어쓰는게 무한 루프처럼 잘 진행되지 않는다.

	문제 4. 80 포트 막기. 오직 443 포트만 사용. (쉬움) v

	문제 5. TLS 1.2/1.3 쓰여야 함. (쉬움) v

	문제 6. docker volume ls 쳤을 때 /home/kyukim/data 가 나오도록 (중간)
		아아... /home/kyukim/data/DB 혹은 /home/kyukim/data/wordpress 처럼 /home/kyukim/data/ 의 하위경로로 볼륨을 쓰라는 말이구나.
		docker build -v 옵션으로 설정했을 때 docker volume ls 에 잡힌다.
		호스트의 볼륨 경로(DB, WordPress)를 우선 만들고 -> 컨테이너의 서비스가 사용하는 디렉토리와 마운트
		각 서비스(nginx, php-fpm, mariaDB, wordpress)  의 경로 설정은 어디에서?
			Nginx : etc/nginx/sites-available/default -> root /path
			mariaDB : my.cnf -> datadir = /path
		문제 6.1. 볼륨 리스트의 디폴트 경로가 /var/lib/docker 라는데 이걸 어떻게 /home/kyukim/data/ 로 바꾸느냐.


	문제 7. wordpress 유저 계정으로 글이 써 지는지? 관리자 계정으로만 어드민 대쉬보드에 접근이 가능한지?

	문제 8. root 에 패스워드 '없이' 데이터베이스 접근 가능하면 안 됨. (쉬움)
		mysql.user 의 root 가 unix_soket 플러그인을 사용하기 때문에 루트 계정으로 비번 없이 접근할 수 있다.
		따라서 root 계정의 플러그인과 패스워드를 바꿔줘야 한다.
		해결 : alter user 'root'@'localhost' identfied by 'kim@13245'; - help:mtak님
			유저의 비밀번호를 바꿔주며 플러그인도 '' 으로 바꿔준다.

	문제 9. 버추얼 박스를 끄고 다시 켠 뒤에서 웹사이트와 설정이 그대로 남아있나? (중간)



피드백
	doker-compose 에서 네트워크처럼 볼륨도 설정이 가능하다.

	dockr-compose image prune : 컨테이너 연결 안 된 이미지 삭제

	VM 실행 경로를 USB 로 하는 방법

	VM 속도문제 -> CPU 리소스 할당

20211220(월) 18:10 ~

docker, docker-compose 를 루트 권한 없이 열게 하는게 좋을까? 사용자 계정에 루트 권한을 쓰게 해주는게 좋을까?

Wordpress 볼륨을 제대로 데이터가 남아있는 것 같은데 mariaDB 는 경로를 바꿔줘야 하는걸까?

20210104(화) 23:38 ~
	도메인 바꾸기를 제외하곤 모두 완성한 상태로 버추얼박스에 넘기자
	루트경로, 볼륨 관리를 가능하면 환경변수로 처리하자. 뚝딱 바꿀 수 있게.

20210107(금) 19:35 ~
	DB 볼륨을 var/lib/mysql/wordpress 로 잡으면 컨테이너를 다 껐다 켰을 때, wp-admin/install.php 로 이어진다.
		var/lib/mysql 안의 ib* 파일들이 있는데 해당 파일들이 바뀌어서 그런 것으로 추정한다.
	DB 볼륨을 var/lib/mysql 로 잡으면 컨테이너를 다 껐다 켰을 때, wp 와 DB 의 연결이 끊긴다.
	와씨...드디어 워드프레스 띄우는거 유지 성공...
		컨테이너 다 지웠다 켰을 때
		볼륨, 컨테이너 다 지우고 버추얼박스까지 껐다 켰을 때
	남은거
		mysql 에서 root 비번 없이 못 들어가게 잠궜을 때 데이터베이스 접근하기
		/home/kyukim/data/DB, /home/kyukim/data/WordPress 경로 만드는 것 Makefile 에 포함
			해당 경로에 폴더가 존재하는지 확인 할 방법을 찾지 못해 보류
				.sh 안의 if 문이 Makefile 에서 생략된다.
		mysqld_safe --skip-grant-tables 찾아보자

20210108(토) 15:56 ~
	db.sql 에서 alter user ... 으로 mysql 접근 차단 재현 성공
		그런데 웹페이지가 뜬다...?
		mariadb 컨테이너는 자꾸 멈추는데...?

20210109(일) 15:53 ~
	mariadb.env 로 이제 돌긴 하는데 mariadb 컨테이너가 멈추는건 여전하다.
		mariadb_error.log 에 root@localhost access denied 가 계속 쌓인다.


20210117(월) 19:55 ~
	왜 wp user create 가 안 먹히지...?
		그대로 커맨드 치면 들어가는데...
		멍청하게 옵션 사이에 \ 를 빼먹었다...
	wordpress 안에 유저 2명 세팅 성공!
	
20210119(일) 18:26
	으아아아아아 드디어 DB 접근 문제(access denied for root@localhost...) 해결했다아아아아
		공식문서에서 올바른 플러그인 변경, 비밀번호 변경 쿼리문을 찾았다.
		진짜 진짜 앞으로 공식문서 무시하지 말자ㅠㅠ
	남은 문제
		볼륨을 제외한 도커를 다 날리고 VM 을 끈 뒤, 다시 들어가서 클론받고 make 했을 때, DB 접근이 막힌다.
		hosts 파일 수정 자동화

20210122(토) 18:03
	make -> make fclean -> make 하면 다시 root@localhost 가 거절된다.
		alter ... 구문 주석처리 했지만 해결 x
		db.sql 을 지운다면?
			아예 DB 자체가 안 돌아간다.
		가설 1. mysql 이 이미 데이터가 존재하는 볼륨을 썼을 때, 환경변수가 초기화되지 않는다.
			확인 : 들어갔는데...?? -> echo $MYSQL_ROOT_PASSWORD : root
		가설 2. root 계정 비번, 플러그인 세팅이 안 됐나?
			확인 : 됐는데?? -> mysql_native_password
		의문 : 왜 처음엔 거절당하지 않는데 2번째 부터 거절당하나?
		MYSQL_PWD=root 처럼 비밀번호를 환경변수로 줘 버리면 기껏 막아 둔 mysql 로그인이 뚫린다.
		
