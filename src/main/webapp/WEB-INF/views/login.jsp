<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://kit.fontawesome.com/bf7f5ff0d8.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/tonicbank/resources/css/login.css">
</head>
<body>
	<div id="logo"><a href="<c:url value='/'/>"><h1><b id="yy">tonic</b><b id="jj">bank</b></h1></a></div>
	<form id="log" action="<c:url value='/login/login'/>" method="post" onsubmit="return formCheck(this);">
		<div id="log"></div>
		<div id="msg">
			<c:if test="${not empty param.msg }">
				<i class="fa fa-exclamation-circle"> ${param.msg}</i>
			</c:if>
		</div>
		<input type="hidden" name="fromURL"  value='${fromURL}'>
		<ul>
			<li>
				<label for="user-id" id="userid"></label>
		        <input id="user-id" class="log" name="userId" type="text" placeholder="아이디" value="${cookie.userId.value}" required>
		    </li>
		    <li>
		        <label for="user-pwd"></label>
		        <input id="user-pwd" class="log" name="pwd" type="password"  placeholder="비밀번호" required>
		    </li>
		    <label id="save1"><input id="save" type="checkbox" name="rememberId" ${empty cookie.userId.value? "" : "checked" }>id기억</label>
		</ul>
		<div id="side">
		    <input type="submit" id="l" name="tabs"  value="로그인"><br>
		    <input type="submit" class="side" id="h" name="tabs"  onclick="location.href='<c:url value="/signUp/join"/>'" value="회원가입" checked>
		    <input type="submit" class="side" id="c" name="tabs" onclick="location.replace('/project/register/findId')" value="아이디찾기">
		    <input type="submit" class="side" id="p" name="tabs" onclick="location.replace('/project/register/findPwd')" value="비밀번호찾기">
		</div>
		<hr>
		<div id="kakao">
			<p id="kaka">카카오 고객이신가요?</p>
			<img src="/tonicbank/resources/img/카카오.png">
			<input type="submit" id="k" name="tabs" onclick="location.replace('main')" value="카카오로 로그인">
		</div>
		<p id="ft">@tonicbank Corp. All rights reserved.</p>
	</form>
</body>
</html>
