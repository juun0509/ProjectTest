<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link href='<c:url value="/resources/css/requestWrite.css"/>' rel='stylesheet' />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>등록요청게시판 - 수정하기</title>
    
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<form method="post" enctype="multipart/form-data" action='<c:url value="/requestBoard/modify" />'>
		<input type="hidden" value="${ requestBoard.requestBoardId }" name="requestBoardId" />
		<input type="hidden" value="${ requestBoard.imageUrl }" name="oldFileName" />
        <div id="wcontainer">
        <h2>제목</h2>
        <input id="wtitle" type="text" name="title" placeholder="제목을 입력하세요" value="${ requestBoard.title }">
        <h2>내용</h2>
        <textarea id="wcontent" name="content" placeholder="내용을 입력하세요">${ requestBoard.content }</textarea>
       
		<div id="showImage">
			<c:if test="${ not empty requestBoard.imageUrl }">
				<img alt="" src="${ requestBoard.imageUrl }">
			</c:if>
		</div>
        <input id="wimg" type="file" name="wimg" placeholder="이미지를 첨부해주세요" onchange="uploadFile()" value="${ requestBoard.imageUrl }">
        <input type="hidden" name="imageUrl" id="imgFile" value="${ requestBoard.imageUrl }">
       
            <div id="wbtns"> 
                <button type="submit">수정</button>
            </div>

        </div>
</form>
    
    <script>
	    function uploadFile() {
	        var fileInput = document.querySelector("input[name=wimg]");
	        var file = fileInput.files[0];
	
	        var formData = new FormData();
	        formData.append('file', file);
	
	        $.ajax({
	            url: '/tonicbank/requestBoard/image',  // 서버의 업로드 처리 URL로 변경해야 합니다.
	            type: 'POST',
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(response) {
	                console.log('File uploaded successfully:', response);
	                document.querySelector('input[name=imageUrl]').value = response;
	                
	                let showImage = document.querySelector('#showImage');
	                let imgTag = '<img src="' + response + '" />';
	                
	                showImage.innerHTML = imgTag;
	            },
	            error: function(error) {
	                console.error('File upload failed:', error);
	            }
	        });
	    }
    </script>
</body>
</html>