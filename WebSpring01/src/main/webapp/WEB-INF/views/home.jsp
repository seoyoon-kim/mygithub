<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<div class="continer">
<h1>HOME</h1>
	<img src="<%=request.getContextPath()%>/resources/sea.PNG"/>
</div> 
</html>

<!-- spring에서 dbcp 설정 
	1. ojdbc.jar를 WEB-INF/lib에 추가한다.
	2. buildPath 를 add Jar 건다
	
	3. pom.xml에 dependence를 추가한다
	<!-- ojdbc8.jar   --
		<dependency>
		<groupId>com.oracle</groupId>
		<artifactId>ojdbc8</artifactId>
		<version>11.2.0.1.0</version>
		<scope>system</scope>
		<systemPath>${basedir}/src/main/webapp/WEB_INF/lib/ojdbc8.jar</systemPath>
		</dependency>
	<!-- spring-jdbc  	--
	<!-- https://mvnrepository.com/artifact/org.springframework/spring-jdbc -- 
	<dependency>
	    <groupId>org.springframework</groupId>
	    <artifactId>spring-jdbc</artifactId>
	    <version>5.2.6.RELEASE</version>
	</dependency>
	
	4. servlet-context.xml에 데이터베이스 정보를 세팅한다
	<!-- 오라클 서버 위치, 아이디, 비번 jdbc드라이브 세팅 -- 
	<beans:bean name="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<beans:property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"></beans:property>
		<beans:property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"></beans:property>
		<beans:property name="username" value="c##scott"></beans:property>
		<beans:property name="password" value="tiger"></beans:property>
	</beans:bean>
	 



-->