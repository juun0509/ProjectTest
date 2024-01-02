<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/navi.css">
</head>
<body>
    <nav id="nav">
        <div id="logo" onclick="location.replace('minipro.html')"><h1><b id="yy">tonic</b><b id="jj">bank</b></h1></div>

        <div id="top"><ul id="topMenu">
            <li><a href="#">정보게시판</a></li>
            <li><a href="#">자유게시판</a></li>
            <li><a href="#">고객센터</a>
                <ul id="goul">
                    <li><a href="#">제품등록요청</a></li>
                    <li><a href="#">공지사항</a></li>
                </ul>
            </li>
            <li><a href="#">제품</a>
                <ul>
                    <li><a href="#">제품비교</a></li>
                    <li><a href="#">제품</a></li>
                </ul>
            </li>
        </ul></div>



        <div id="side">
            <p>토닉뱅크를 더 안전하게 이용하세요</p>
            <input type="submit" class="side" id="my" name="tabs" value="마이페이지">
            <input type="submit" class="side" id="h" name="tabs" onclick="location.replace('회원가입.html')" value="회원가입" checked>
            <input type="submit" class="side" id="l" name="tabs" onclick="location.replace('로그인.html')" value="로그인">
        </div>
        </nav>
        </body>
        </html>