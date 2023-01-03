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
<title>intro Modify Form</title>
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
<link rel="stylesheet" href="style/introDetails.css"/>
</head>
<body>

<div class="container">
	<img id="introPhoto" src="upimage/${introDetails.introPhoto}" alt="${introDetails.introPhoto}"/>
</div>
<div class="container">
	<form action="introModify" id="introModify" method="post">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td class="introTab">번호</td>
					<td>
						<input type="text" name="introId" value="${introDetails.introId}" readonly/>				
					</td>
					<td class="introTab">종류</td>
					<td>
						<input type="text" name="introClass" value="${introDetails.introClass}" readonly/>
					</td>
				</tr>
				<tr>
					<td class="introTab">이름</td>
					<td>
						<input type="text" name="introName" value="${introDetails.introName}"/>
					</td>
					<td class="introTab">조회수</td>
					<td>${introDetails.introHit}</td>
				</tr>
				<tr>
					<td class="introTab" colspan="2">제목</td>
					<td colspan="2">
						<input type="text" name="introTitle" value="${introDetails.introTitle}"/>
					</td>
				</tr>
				<tr>
					<td class="introTab" colspan="4">내용</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="3">${introDetails.introContent}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<button type="submit" class="btn btn-outline-success btn-block">제출</button>
	</form>
</div>
<script>
$(document).ready(function(){
	$("#introModify").submit(function(e){
		e.preventDefault();
		$.ajax({
			url:$("#introModify").attr("href"),
			type:"post",
			data:$("#introModify").serialized(),
			success:function(data){
				$("#mainRagion").html(data);
				$("#skillTitle").text("Introduction Details Modify");
				$("#skillDetails").text("상세 설명 수정을 요청합니다."); 
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