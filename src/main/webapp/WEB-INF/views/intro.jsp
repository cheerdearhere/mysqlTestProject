<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>Introduction</title>
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
</head>
<body>

<h1 class="display-1 text-center mb-5 titleText">Introduce</h1>	
<div class="card shadow-lg mx-auto" style="width:70%">
	<img src="image/mio.png" alt="logo" class="card-img-left"/>
	<div class="card-body">
		<h1 class="card-title">Welcome to the Mio World!!</h1>
		<p class="card-text">환영인사</p>
		<a href="mailto:dream-ik89@naver.com?subject=[웹개발 구직중(신입)]조익 입니다.&&body=Java, HTML, CSS, Javascript, SPRING Framework, MyBatis, MySQL..." class="btn btn-outline-danger">Send E-mail</a>
		<a href="https://github.com/cheerdearhere" class="btn btn-outline-secondary">Visit GitHub</a>
		<a href="https://drive.google.com/drive/folders/1_u3TrhhxDfS89NH5k8XnWs-cRzUH1M46?usp=share_link" class="btn btn-outline-success">Visit GoogleNote</a> 
	</div>
</div>
<div class="contatiner">
	<h3 class="text-center text-info" style="margin-top: 90px;">List</h3>
	<a id="introWriteView" class="btn btn-success" href="introWriteView">등록</a>
	<a id="downloadBtn" class="btn btn-danger" href="downloadRequest">fileDownloadTest</a>
	<hr/>	
	<div class="row mb-3">
		<c:forEach items="${allList}" var="dto">
			<div class="col-md-4">
				<div class="card">
					<img class="card-img-top" src="upimage/${dto.introPhoto}" alt="${dto.introPhoto}" style="max-width:280px;width:100%;height:280px;"/>
					<div class="card-body">
						<h5 class="card-title">종류: ${dto.introClass} </h5>
						<h5 class="card-text">이름: ${dto.introName}</h5>
						<a href="introDetails?introId=${dto.introId}" class="pClick stretched-link text-dark" style="text-decoration:none">자세히 보기</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#introWriteView").click(function(e){
		e.preventDefault();
		$.ajax({
			url:"introWriteView",
			type:"get",
			data:"",
			success:function(data){
				$("#mainRagion").html(data);
				$("#skillTitle").text("Introduction Character Write page");
				$("#skillDetails").text("캐릭터에대한 설명을 저장하기위한 페이지 입니다."); 
			},
			error:function(){
				$("#errorMessage").text("서버접속 실패");
				$("#mbody").text("서버 오류");
				$("#modal").trigger("click");
			}
		}); 
	});
	$(".pClick").click(function(e){
		e.preventDefault();
		let target=$(e.target);
		let url=target.attr("href");
		$.ajax({
			url:url,
			type:"get",
			data:"",
			success:function(data){
				$("#mainRagion").html(data);
				$("#skillTitle").text("Character Details page");
				$("#skillDetails").text("캐릭터에대한 상세 설명 페이지 입니다. url: "+url); 
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