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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>Intro Write page</title>
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

<h1 class="display-1 text-center mb-5 titleText">Introduce Write Form</h1>	
<form action="introWrite?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<h2>소개할 캐릭터/동물 등록하기</h2>
	<div class="form-check-inline">
		<label class="form-check-label" for="introClass1">
			<input type="radio" class="form-check-input" id="introClass1" name="introClass" value="game" checked/> Game Character
		</label>
	</div>
	<div class="form-check-inline">
		<label class="form-check-label" for="introClass2">
			<input type="radio" class="form-check-input" id="introClass2" name="introClass" value="animation"/> Animation Character
		</label>
	</div>
	<div class="form-check-inline">
		<label class="form-check-label" for="introClass3">
			<input type="radio" class="form-check-input" id="introClass3" name="introClass" value="animal"/> Animal
		</label>
	</div>
	<div class="form-check-inline">
		<label class="form-check-label" for="introClass4">
			<input type="radio" class="form-check-input" id="introClass4" name="introClass" value="etc"/> Others 
		</label>
	</div><br/>
	<div class="form-group">
		<label for="introTitle">글 제목</label>
		<input type="text" class="form-control" id="introTitle" name="introTitle" placeholder="게시될 글의 제목" required/>
	</div>
	<div class="form-group">
		<label for="introName">이름</label>
		<input type="text" class="form-control" id="introName" name="introName" placeholder="풀네임(캐릭터), 종이름(동물)을 적어주세요" required/>
	</div>
	<div class="form-group">
		<label for="introPhoto">대표 사진</label>
		<input type="file" class="form-control" id="introPhoto" name="introPhoto" required/>
	</div>
	<div class="form-group">
		<label for="introContent">상세 설명</label>
		<textarea rows="10" class="form-control" id="introContent" name="introContent" required></textarea>
	</div>
	<input type="hidden" name="introId" value="0"/>
	<input type="hidden" name="introHit" value="0"/>
	<button type="submit" class="btn btn-outline-success">등록하기</button>
	<a href="intro" class="btn btn-dark intro">목록보기</a>
</form>

<script>
$(document).ready(function(){	
	$(".intro").click(function(event){
		event.preventDefault();
		$.ajax({
			url:$(".intro").attr("href"),
			type:"get",
			data:"",
			success:function(data){
				$("#mainRagion").html(data);
				$("#skillTitle").text("Introduction Character");
				$("#skillDetails").text("캐릭터에대한 설명을 저장하고 볼 수 있는 페이지 입니다."); 
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