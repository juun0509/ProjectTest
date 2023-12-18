<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link href="<c:url value="/resources/css/write.css"/>" rel='stylesheet' />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
</head>
<body>
	<form method="post"  onsubmit="return formCheck(this)" id="writer">
            <div id="wcontainer">
                <h2>카테고리</h2>
                <select class="category" name="category" title="select">
                    <option value="1" selected>자유</option>
                    <option value="2" >후기</option>
                </select>
            </div>

            <div id="wcontainer2">
                <h2>제목</h2>
                <input id="title" type="text" name="title" placeholder="제목을 입력해주세요" value=${not empty dto.title? dto.title:"" }>
            </div>

            <div id="wcontainer3" style="display: none;">
                <h2>상품검색</h2>
                <a id="searchPro" onclick ="window.open('<c:url value="/community/writePop" />','pop','width=280,height=320, left=0, status=no ,location=no, directoryies=no,toolbar=no, menubar=no,resizable=no')">이곳을 클릭해서 상품을 검색해주세요.</a>
            </div>

            <div id="wcontainer4">
                <h2>내용</h2>
                <div ></div>
                <textarea id="editor" name="content" placeholder="내용을 입력하세요">${not empty dto.content? dto.content:"" }</textarea>
            </div>



        <div id="wbtns"> 
        <button type="submit">등록</button>
        </div>
 
    </form>
    
    <script>
    ClassicEditor.create( document.querySelector( '#editor' ), {
    		language: "ko",
    		ckfinder: {
				uploadUrl : '<c:url value="/community/image" />'
			}
    	})
    	.catch( error => {
        	console.error( error );
    	});
    </script>
</body>
</html>