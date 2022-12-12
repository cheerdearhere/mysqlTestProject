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
<title>Join Form page</title>
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

<h3 class="text-center text-danger titleText">
	Would you join us?
</h3>
<form action="join" method="post" id="joinForm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div class="form-group">
		<label for="pid">아이디</label>
		<input type="email" class="form-control" name="pid" placeholder="email@address.com" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" id="pid" required/>
	</div>
	<div class="form-group">
		<label for="ppw">비밀번호</label>
		<input type="password" class="form-control" name="ppw" id="ppw" placeholder="대문자, 소문자, 특수문자 8자이상" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{8,50}$" required/>
	</div>
	<div class="form-group">
		<label for="ppw">비밀번호 확인</label>
		<input type="password" class="form-control" id="ppwValid" placeholder="한번 더 입력해주세요." pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{8,50}$" required/>
	</div>
	<div class="form-group">
		<label for="paddress">주소</label>
		<input type="text" class="form-control" name="paddress" id="paddress" placeholder="주소 입력" required/>
	</div>
	<div class="form-group">
		<label for="pprofile">짧은 인사</label>
		<textarea rows="10" class="form-control" name="pprofile" id="pprofile" required></textarea>
	</div>
	<button type="submit" class="btn btn-outline-success">회원가입</button> &emsp;
	<button type="reset" class="btn btn-outline-danger">취 소</button> &emsp;
	<a href="logView" class="btn btn-outline-primary">로그인</a>
</form>
	
<script>
/*검증이 완료된 경우 was_validated class표시*/
document.querySelectorAll("input").forEach(input => {
	input.addEventListener("invalid",()=>{
		document.forms[0].classList.add("was_validated");
	});
});

$(document).ready(function(){
	$("#joinForm").submit((e)=>{
		e.preventDefault();
		const password = document.querySelector("#ppw");
		const passwordValid = document.querySelector("#ppwValid");
		if(password.value!==passwordValid.value){
			password.focus();
			alert("위의 비밀번호와 일치하지 않습니다.");
			return false;
		}
		$.ajax({
			url:$("#joinForm").attr("action"),
			type:$("#joinForm").attr("method"),
			data: $("#joinForm").serialize(),
			success: function(data){
				if(data.search("join-success")> -1){
					$("#mbody").text("가입을 축하합니다.");
					$("#modal").trigger("click");
				}
				else{
					$("#mbody").text("가입 실패: 중복된 ID 입니다.");
					$("#modal").trigger("click");
				}
			},
			error: function(){					
				$("#mbody").text("서버접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
});
</script>
</body>
</html>