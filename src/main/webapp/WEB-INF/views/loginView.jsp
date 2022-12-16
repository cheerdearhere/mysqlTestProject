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
<title>로그인</title>
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

<div class="container text-center mt-1 mb-0">
	<h1 id="skillTitle">Hello world!</h1>
	<P id="skillDetails"></P>
	<p id="clock"></p>
</div>
<script src="js/clock.js"></script>
<nav class="navbar navbar-expand-md sticky-top" style="background-color:#fff;">
		<a class="navbar-brand nav-link" href="home" style="color:#FFFFFF;font-family:fascinate;font-weight:bold;font-size:3vw;text-shadow:0 -3px red, 3px 3px blue, -3px 3px green;">
			<img class="rounded-circle" src="image/mio.png" alt="logo" style="width:35%;"/>
			MIO WORLD
		</a>
</nav>
<div id="mainRagion" class="container mt-3">
	<h1 class="display-1 text-center mb-5 titleText">
		Log in!!
	</h1>
	<div id="loginfo" class="text-success"></div>
	<form id="logFrm" name="logFrm" method="post" action="login">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="form-group">
			<input type="email" class="form-control" name="pId" placeholder="e-mail을 입력하세요." required/>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="pPw" placeholder="비밀번호를 입력하세요." required/>
			<p class="logInfo">소문자, 대문자, 특수문자를 포함합니다.</p>
		</div>
		<div class="form-group form-check">
			<input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe" checked/>
			<label for="rememberMe" class="form-check-label" aria-describedby="rememberMeHelp">remember me!</label>
		</div>
		<button type="submit" class="btn btn-outline-dark">로그인</button> &emsp; 
		<a href="joinView" id="joinView" class="btn btn-danger">계정이 없어요</a>&emsp; 
		<a href="home" class="btn btn-outline-secondary">홈으로 갈래요</a>
	</form>
</div>

<footer class="container mt-5 p-0">
	<div class="jumbotron text-center mb-0 p-4">
		<h3>&copy;Online page Copyright</h3>
				<form action="#" method="post">
			<div class="form-group">
				<label for="email">&emsp;주문 문의</label>
				<input type="email" class="form-control" id="email" placeholder="로그인 후에 이용해주세요" readonly/>
			</div>
			<button type="submit" class="btn btn-secondary" disabled>Sign Up</button>
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
				$("#skillDetails").text("login의 #mainRegion에 joinView를 호출합니다."); 
			},
			error:function(){
				$("#errorMessage").text("서버접속 실패");
				$("#mbody").text("서버 오류");
				$("#modal").trigger("click");
			}
		});
	});
	<c:choose>
		<c:when test="${not empty log}">
			$("#loginfo").text("welcome");
		</c:when>
		<c:when test="${not empty logout}">
			$("#skillTitle").text("log out 완료");
			$("#skillDetails").text("spring security를 통해 로그아웃했습니다. HttpSession의 rememberMe 쿠키를 만료시켜 사용자 정보를 삭제했습니다.");
			$("#loginfo").text("log out 성공");
		</c:when>
		<c:when test="${not empty error}">
			$("#loginfo").text("welcome");
		</c:when>
		<c:otherwise>
			$("#loginfo").text("information");
		</c:otherwise>
	</c:choose>
});
</script>
</body>
</html>
