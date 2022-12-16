<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>Main page</title>
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
<!-- basic style sheet -->
<link rel="stylesheet" href="style/basicStyle.css"/>
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
<div class="container text-center mt-1 mb-0">
	<h1 id="skillTitle">SPRING security를 통해 Log in 완료</h1>
	<P id="skillDetails">${user_id} 님 안녕하세요. </P>
	<p id="clock"></p>
</div>
<nav class="navbar navbar-expand-md sticky-top" style="background-color:#fff;">
	<button class="navbar-toggler btn btn-dark" type="button" data-toggle="collapse" data-target="#collapsiblebar">
		<span class="navbar-toggler-icon text-dark" ></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsiblebar">
		<a class="navbar-brand nav-link" href="home" style="color:#FFFFFF;font-family:fascinate;font-weight:bold;font-size:3vw;text-shadow:0 -3px red, 3px 3px blue, -3px 3px green;">
			<img class="rounded-circle" src="image/mio.png" alt="logo" style="width:35%;"/>
			MIO WORLD
		</a>
		<ul class="navbar-nav nav">
			<li class="nav-item">
				<a class="nav-link" href="home">
					<i class="fas fa-home"></i>Home
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="intro">
					<i class="fas fa-cat"></i>Info
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="navigator">
					<i class="fas fa-dog"></i>Relative
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled" href="#">
					<i class="fas fa-hammer"></i>Cunstruction...
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="table">
					<i class="fas fa-book"></i>Table
				</a>
			</li>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a class="nav-link" href="logoutView">logout</a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGE')">
				<li class="nav-item">
					<a class="nav-link" href="managerPage">관리자</a>
				</li>
			</sec:authorize>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdownMenu" data-toggle="dropdown">more</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="userPage">my page</a><!-- 화면 전환 -->
					<a class="dropdown-item" href="customerServices">고객센터</a><!-- toggle버튼 고려 -->
				</div>
			</li>
		</ul>
	</div>
</nav>

<div id="mainRagion" class="container mt-3">
	<div class="container">
		<h1 class="display-1 text-center mb-5 titleText">
			WELCOME TO<br/>MIO WORLD!!
		</h1>	
	</div>
	<div id="homecat" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-slide-to="0" data-target="#homecat" class="active"></li>
			<li data-slide-to="1" data-target="#homecat"></li>
			<li data-slide-to="2" data-target="#homecat"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="image/deskCat.jpeg" alt="desk_cat" width="1100" height="500"/>
				<div class="carousel-caption">
					<h1 class="display-1" style="font-family:fascinate;text-shadow:5px 5px 5px black;font-size:5.9vw;">Desk Cat</h1>
				</div>	 
			</div>
			<div class="carousel-item">
				<img src="image/healthCat.jpeg" alt="health_cat" width="1100" height="500"/>
				<div class="carousel-caption">
					<h1 class="display-1" style="font-family:fascinate;text-shadow:5px 5px 5px black;font-size:5.9vw;">Healthy Cat</h1>
				</div> 
			</div>
			<div class="carousel-item">
				<img src="image/babyCat.jpeg" alt="baby_cat" width="1100" height="500"/>
				<div class="carousel-caption">
					<h1 class="display-1" style="font-family:fascinate;text-shadow:5px 5px 5px black;font-size:5.9vw;">Baby Cat</h1>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#homecat" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a>
		<a class="carousel-control-next" href="#homecat" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
</div>

<footer class="container mt-5 p-0">
	<div class="jumbotron text-center mb-0 p-4">
		<h3>&copy;Online page Copyright</h3>
				<form action="#" method="post">
			<div class="form-group">
				<label for="email">&emsp;주문 문의</label>
				<input type="email" class="form-control" id="email" placeholder="Enter email"/>
			</div>
			<button type="submit" class="btn btn-danger">Sign Up</button>
		</form>
	</div>
</footer>

<!-- modal for error info -->
<button type="button" id="modal" class="d-none" data-toggle="modal" data-target="#myModal">
	Error informations
</button>
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h4 class="modal-tilte">
					<i class="fa fa-info-circle" aria-hidden="true" id="errorMessage">
						Info
					</i>
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<h4 id="mbody" class="text-center">message</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>
			</div>
		</div>
	</div>
</div>
<script src="js/clock.js"></script>
<script>
$(document).ready(function(){	
	$("#joinView").click(function(event){
		event.preventDefault();
		$.ajax({
			url:$("#joinView").attr("href"),
			type:"get",
			data:"",
			success:function(data){
				$("#mainRagion").html(data);
				$("#skillTitle").text("Ajax, SPRING Framework");
				$("#skillDetails").text("상세설명"); 
			},
			error:function(){
				$("#errorMessage").text("서버접속 실패");
				$("#mbody").text("서버 오류");
				$("#modal").trigger("click");
			}
		});
	});
});
</script>
</body>
</html>
