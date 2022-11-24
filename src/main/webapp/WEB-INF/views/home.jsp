<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
	<title>Home</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--font awesome icon 5.7-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
html, body{
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<h1>
	Hello world!  
</h1>
<P>  The time on the server is ${serverTime}. </P>
<div>
	<ul class="navbar-nav ml-auto">
		<sec:authorize access="isAnonymous()">
			<li class="nav-item">
				<a class="nav-link" href="loginView">로그인</a>
			</li>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<li class="nav-item">
				<a class="nav-link" href="logoutView">로그아웃</a>
			</li>
		</sec:authorize>
	</ul>
</div>
</body>
</html>
