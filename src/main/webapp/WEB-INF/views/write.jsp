<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
	<link href="<c:url value="/resources/css/write.css"/>" rel='stylesheet' />
	<script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<form method="post"  onsubmit="return formCheck(this)" id="writer" action='<c:url value="/community/write" />'>
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
                <textarea id="editor" name="content" placeholder="내용을 입력하세요">${not empty dto.content? dto.content:"" }</textarea>
            </div>


		<input type="hidden" name="productName" value="">
        <div id="wbtns"> 
        	<button type="submit">등록</button>
        </div>
 
    </form>
    
    <script>
    	$(document).ready(function() {
    		if (${ empty sessionScope.userId }) {
    			alert("로그인이 필요한 서비스입니다.");
    			history.back();
    		}
    	});
    
	    document.querySelector("select[name=category]").addEventListener("change", function () {
	        // select 태그의 현재 선택된 옵션의 value 가져오기
	        var selectedValue = document.querySelector("select[name=category]").value;
	
	        // id가 wcontainer3인 div 요소 가져오기
	        var wcontainer3 = document.getElementById("wcontainer3");
	
	        // value가 2이면 스타일을 block으로, 아니면 숨김(display: none)으로 설정
	        if (selectedValue === "2") {
	            wcontainer3.style.display = "block";
	        } else {
	            wcontainer3.style.display = "none";
	        }
	    });
	    
	    window.addEventListener('message', function(event) {
	    	console.log('Received message from popup:', event.data);
	    	
	    	$.ajax({
	    		url : '/tonicbank/product/find',
	    		type : 'post',
	    		contentType: 'application/json',
	    		data : JSON.stringify({
	    			name : event.data,
	    			ingredient : "",
	    			efficacy : ""
	    		}),
	    		success : function(result) {
	    			console.log(result);
	    			console.log(name);
	    			$('#wcontainer3 #searchPro').detach();
	    			
	    			let tmp = '<a id="searchPro" onclick ="window.open(\'<c:url value="/community/writePop" />\',\'pop\',\'width=280,height=320, left=0, status=no ,location=no, directoryies=no,toolbar=no, menubar=no,resizable=no\')">';
	    			tmp += '<div class="selectedProduct">';
	    			tmp += '<div class="productImage">';
	    			tmp += '<img alt="" src="/tonicbank/resources/img/slide1.jpg">';
	    			tmp += '</div>';
	    			tmp += '<div style="padding-left: 10px;">';
	    			tmp += '<input type="hidden" name="productName" value="' + result[0].name + '">';
	    			tmp += '<div class="productName">' + result[0].name + '</div>';
	    			tmp += '<div class="productInfo">';
	    			tmp += '<span>' + result[0].ingredient + '</span>';
	    			tmp += '<span>' + result[0].efficacy + '</span>';
	    			tmp += '</div>';
	    			tmp += '</div>';
	    			tmp += '</div>';
	    			tmp += '</a>';
	    			
	    			$('#wcontainer3').append(tmp);
	    		},
	    		error : function() {
	    			
	    		}
	    	});
	    });
	    
        ClassicEditor
            .create( document.querySelector( '#editor' ), {
            	language: 'ko',
            	ckfinder: {
            		uploadUrl: "/tonicbank/community/image",
            		withCredentials: true
            	}
            })
            .catch( error => {
                console.error( error );
            } );
    </script>
</body>
</html>