<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link href="<c:url value="/resources/css/requestWrite.css"/>" rel='stylesheet' />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
</head>
<body>
<form method="post"  enctype="multipart/form-data">
        <div id="wcontainer">
        <h2>제목</h2>
        <input id="wtitle" type="text" name="title" placeholder="제목을 입력하세요" value=${not empty dto.title? dto.title:"" }>
        <h2>내용</h2>
        <textarea id="wcontent" name="content" placeholder="내용을 입력하세요">제품명: 
제조사: 
내용: 





이미지:</textarea>
       
       
        <input id="wimg" type="file" name="imgsrc" placeholder="이미지를 첨부해주세요" onchange="readURL(this);" value=${not empty dto.imgFile? dto.imgFile:"" }>
        <input type="hidden" name="imgFile" id="imgFile">
       
            <div id="wbtns"> 
                <button type="submit">등록</button>
            </div>

        </div>
</form>
    
</body>
</html>