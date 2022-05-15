# Inception
이 프로젝트는 Docker를 사용하여 시스템 관리에 대한 지식을 넓히는 것을 목표로 합니다. 여러 Docker 이미지를 가상화하여 가상 머신에서 만듭니다.

## Preface
---------------------------------------------------------------------------------------------------------------------------------
이 매뉴얼은 내가 단계적으로 무엇을 읽고 무엇을 했는지에 대한 정보입니다. 여기에 제공된 모든 링크는 완전한 정보가 아니며 StackOverflow나 다른 소스들도 사용했습니다.

## VirtualBox 구현 - Ubuntu 20.04, 컨테이너 - debian:buster
---------------------------------------------------------------------------------------------------------------------------------
1. <a href="https://mainia.tistory.com/2379">버추얼박스(VirtualBox) 이용해서 우분투(Ubuntu) 설치하기</a><br>
2. <a href="https://dongle94.github.io/docker/docker-ubuntu-install/">Ubuntu에 Docker 설치하기</a><br>
3. <a href="https://maru1000.tistory.com/39">Docker-Compose 설치하기</a><br>
4. 작업에 필요한 VIM, MAKE, GIT 및 기타 프로그램, 플러그인을 설치합니다.<br>
5. Ubuntu에서 호스트 변경: vim /etc/hosts 다음 localhost를 ****.42.fr로 변경합니다.<br>
6. Makefile 생성:<br>
&emsp; 6.1. 컨테이너 빌드 및 재구축의 편의를 위해 일반 Makefile 설정을 지정합니다.<br>
&emsp; &emsp; 6.1.1. 컨테이너를 실행<br>
&emsp; &emsp; 6.1.2. 컨테이너 일시적으로 멈춤<br>
&emsp; &emsp; 6.1.3. 컨테이너의 모든 것을 제거하고 클린.<br>
7. <a href="https://hoony-gunputer.tistory.com/entry/docker-compose-yaml-%ED%8C%8C%EC%9D%BC-%EC%9E%91%EC%84%B1">docker compose yaml 파일 작성</a><br>
&emsp; 7.1. 네트워크를 만듭니다. <br>
&emsp; 7.2. 볼륨 + 다른 링크를 만듭니다. <br>
&emsp; 7.3. 컨테이너 구축을 위한 명령(서비스)을 만듭니다. 네트워크와 볼륨을 연결하기. <br>
8. NGINX - dockerfile, nginx, config, openssl:<br>
&emsp; 8.1. nginx와 openssl을 설치 <br>
&emsp; 8.2. openssl 인증서에 서명 <br>
&emsp; 8.3. nginx 구성 변경: etc/nginx/sites-enabled/defaul.conf <a href="https://architectophile.tistory.com/12">nginx 기본 설정 방법</a><br> 
&emsp; &emsp; 8.3.1. <a href="https://nginx.org/en/docs/beginners_guide.html">nginx 기초적인 이해</a><br>
&emsp; &emsp; 8.3.2. 인터넷에서 nginx 구성에 추가하는 방법(ssl_portocol TLSv1.2, TLSv1.3 및 ssl_certificate) <br>
&emsp; 8.4. 컨테이너를 시작하고, daemon off.
9. MARIADB - dockerfile, mariadb, config 50-server, 데이터베이스 생성:<br>
&emsp; 9.1. 설치 <br>
&emsp; 9.2. 데이터베이스 생성<br>
&emsp; &emsp; 9.2.1. host_name은 %이거나 강제로 지정하고 해당 이름을 사용해야함 <br>
&emsp; 9.3. 50-server.cnf 설정 - 로컬 호스트를 닫고 3306을 열어야함 <br>
&emsp; 9.4. 컨테이너 시작.
10. WORDPRESS - dockerfile, wordpress, php, wp-config, php-fpm, www.conf <br>
&emsp; 10.1. <a href="https://wordpress.org/about/requirements/">워드프레스가 작동하는 데 필요한 요구사항들</a> <br>
&emsp; 10.2. <a href="https://velog.io/@jjiglet/PHP-FPM-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EC%84%A4%EC%A0%95#:~:text=php%2Dfpm%20%EC%84%A4%EC%B9%98%EB%8A%94%20%EB%A7%A4%EC%9A%B0,%EB%95%8C%EB%AC%B8%EC%97%90%20%EC%9E%98%20%EB%94%B0%EB%9D%BC%EC%99%80%EC%95%BC%ED%95%9C%EB%8B%A4.&text=%EC%9E%85%EB%A0%A5%ED%95%98%EC%97%AC%20%EC%84%A4%EC%B9%98%EB%A5%BC%20%ED%95%A9%EB%8B%88%EB%8B%A4.&text=%EC%84%A4%EC%B9%98%EA%B0%80%20%EC%99%84%EB%A3%8C%20%EB%90%98%EC%97%88%EC%9C%BC%EB%A9%B4%20php,%EC%84%A4%EC%B9%98%ED%99%95%EC%9D%B8%EC%9D%B4%20%EA%B0%80%EB%8A%A5%ED%95%A9%EB%8B%88%EB%8B%A4.&text=%EC%9D%98%20%EB%82%B4%EC%9A%A9%EC%A4%91%EC%97%90%20listen%3D%20%EC%9D%84%20%EC%B0%BE%EC%95%84%EC%84%9C%20%EC%88%98%EC%A0%95%ED%95%98%EB%A9%B4%20%EB%90%A9%EB%8B%88%EB%8B%A4.">php와 php-fpm 설치 </a><br>
&emsp; 10.3. <a href="https://www.php.net/manual/en/install.fpm.configuration.php">ввв.conf</a>/etc/php/x.x/fpm/pool.d를 설정<br>
&emsp; 10.4. <a href="https://ko.wordpress.org/txt-install/#:~:text=%EC%9B%B9%EB%B8%8C%EB%9D%BC%EC%9A%B0%EC%A0%80%EC%97%90%20http%3A%2F%2F,%EB%A5%BC%20%EB%A7%8C%EB%93%A4%EA%B8%B0%20%EC%8B%9C%EC%9E%91%ED%95%98%EB%A9%B4%20%EB%90%A9%EB%8B%88%EB%8B%A4.">워드프레스 설치: /etc/php/x.x/fpm/pool.d</a>  <br>
&emsp; 10.5. <a href="https://linux.die.net/man/8/php-fpm">컨테이너 시작</a>
