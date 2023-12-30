<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>    
<head>
    <link href="<c:url value="/resources/css/searchPage.css"/>" rel='stylesheet' />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div id="con">
        <div id="container">
            <div id="logo" onclick='location.href="<c:url value='/'/>"'><h1><b id="yy">tonic</b><b id="jj">bank</b></h1></div>

			<fieldset id="search">
	        	<form action="search" method="get" onsubmit="return formCheck(this);">
		            <input id="searcht" name="keyword" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력하세요" autocomplete="off">
		            <button id="searchBtn" type="submit">검색</button>
	        	</form>
	        </fieldset>

            <div id="side">
	            <p>토닉뱅크를 더 안전하게 이용하세요</p>
	            <c:set var="loginoutLink" value="${empty sessionScope.userId? '/login/login' :'/login/logout' }"/>
				<c:set var="loginout" value="${empty sessionScope.userId?'로그인':'로그아웃' }"/>
	            <input type="submit" class="side" id="my" name="tabs" value="마이페이지">
	            <c:if test="${empty sessionScope.userId }">
	            	<input type="submit" class="side" id="h" name="tabs" onclick="location.href='<c:url value="/signUp/join"/>'" value="회원가입">
            	</c:if>
	            <input type="submit" class="side" id="h" name="tabs" onclick="location.href='<c:url value="${loginoutLink }"/>'" value="${loginout }" checked>
	            <c:if test="${not empty sessionScope.userId }">
					<input type="submit" class="side" id="l" name="tabs" value="${sessionScope.nick}">
				</c:if>
	        </div>
			
        	<div id="result">
        	
        	<div class="result" style="margin-top: 0px;">
        	
            	  <h4> (총 <b>${proPh.totalCnt }</b>건)
                
                <c:choose>
                	<c:when test="${ empty productList }">
								<div class="emptyList">
									<p>상품이 없습니다.</p>
								</div>
				</c:when>
				<c:otherwise>
                  <c:forEach var="prod" items="${ productList }" begin="${ (proPh.sc.page-1)*10 }" end="${ (proPh.sc.page-1)*10+9 }">
                
                <div>
                <img src="/tonicbank/resources/img/${prod.name }.jpg" alt="" class="img">
                <ul>
                	<li>브랜드명:</li>
                    <li>상품명: ${prod.name }</li>
                    <li>가격: ${prod.price } ~</li>
                    <li>성분: ${prod.ingredient } </li>
                    <li>효능: ${prod.efficacy }</li>
                    <li>후기(<a href="#">${prod.review }</a>)</li>

                </ul>
                </div>
                </c:forEach>
           </c:otherwise>
                </c:choose>
                
            	</div>
            	
            	
            	</div>
            	<div id="page">
					<c:if test="${proPh.showPrev }">
		
						<a
							href="<c:url value='/morepro${proPh.sc.getQueryString(proPh.beginPage-1) }'/>">&lt;</a>
					</c:if>
					<c:forEach var="i" begin="${proPh.beginPage }" end="${proPh.endPage }">
						<a class='${proPh.sc.page== i ? "active": "" }'
							href="<c:url value='/morepro${ proPh.sc.getQueryString(i)}'/>">${i }</a>
					</c:forEach>
					<c:if test="${proPh. showNext }">
						<a
							href="<c:url value='/morepro${proPh.sc.getQueryString(proPh.endPage+1) }'/>">&gt;</a>
		
					</c:if>
				</div>
			</div>
			
	        <footer>
	            <div id="ft">
		            <ul>
		                <li class="ft">회사소개</li>
		                <li class="ft">개인정보처리방침</li>
		                <li class="ft">여행약관</li>
		                <li class="ft">저작권정책</li>
		                <li class="ft">Q&A</li>
		                <li class="ft" id="fta">사이트맵</li>
		            </ul>
		            <p id="ad">(우)26464 충청북도 청주시 **동 **로 *** (TEL)043-1234-5678 사업자 등록번호: 202-81-50707</p>
					<p><a href="#" title="f"></a><a href="#" title="i"></a><a href="#" title="k"></a></p>
				</div>
	        </footer>
	    </div>
    </div>
    <script>
	    function formCheck(frm){
			if (frm.keyword.value.trim() === "") {
		        alert("검색어를 입력하세요");
		        return false;
		    }
			return true;
		}
    </script>
</body>
</html>