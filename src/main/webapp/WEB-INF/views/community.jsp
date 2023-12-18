<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="<c:url value="/resources/css/freeBoard.css"/>"
	rel='stylesheet' />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

</head>
<body>
	<div id=board>
		<div class="category">

			<input class="gory sBtn" type="button" value="전체">
			<input class="gory sBtn" type="button" value="인기">
			<input class="gory sBtn" type="button" value="자유">
			<input class="gory sBtn" type="button" value="후기">

		</div>

		<!-- 게시물 목록 테이블(표) -->
		<table id="table">
			<tr>
				<th width="3%">번호</th>
				<th width="6%">카테고리</th>
				<th width="75%">제목</th>
				<th width="5%">글쓴이</th>
				<th width="5%">작성일</th>
				<th width="3%">조회수</th>
				<th width="3%">추천</th>
			</tr>

			<!-- 목록의 내용 -->
			<c:choose>
				<c:when test="${ empty list }">
					<tr>
						<td colspan="7" align="center">등록된 게시물이 없습니다</td>
					</tr>
				</c:when>

				<c:otherwise>

					<c:choose>
						<c:when test="${not empty param.searchWord}">
							<c:url value="view" var="viewUrl">
								<c:param name="searchField"
									value='${empty param.searchField?"title":param.searchField}' />
								<c:param name="searchWord"
									value='${empty param.searchWord?"":param.searchWord}' />
								<c:param name="pageNum"
									value='${empty param.pageNum?1:param.pageNum}' />
								<c:param name="num" value="${ dto.num}" />
							</c:url>
						</c:when>
						<c:otherwise>
							<c:url value="view" var="viewUrl">
								<c:param name="pageNum"
									value='${empty param.pageNum? 1: param.pageNum }' />
								<c:param name="num" value='${dto.num }' />
							</c:url>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>

			<c:forEach var="board" items="${ list }">
				<tr>

					<td>${board.communityId}</td>
					<!-- 게시물 번호 -->
					<td>${board.category}</td>
					<td id="titletd"><a
						href="<c:url value='/community/read${ph.sc.queryString}&communityId=${board.communityId}'/>">${board.title }</a>
					</td>
					<td>${board.nick}</td>
					<fmt:formatDate var="today" value="${now}" pattern="yyyy.MM.dd" />
					<fmt:formatDate var="reg_date" value="${board.createdDate}" pattern="yyyy.MM.dd" />
					<c:choose>
						<c:when test="${ today <= reg_date }">
							<td class="regdate"><fmt:formatDate value="${board.createdDate}" pattern="HH:mm" /></td>
						</c:when>
						<c:otherwise>
							<td class="regdate"><fmt:formatDate
									value="${board.createdDate}" pattern="yyyy.MM.dd" /></td>
						</c:otherwise>
					</c:choose>
					<td>${board.viewCount}</td>
					<td>${board.likeCount}</td>
				</tr>

			</c:forEach>

		</table>

		<form id="searchList">

			<input name="orderType" type="hidden" value="${ param.orderType }" class="categoryValue">
			<select name="option">
				<option value="A"
					${ph.sc.option=='A'||ph.sc.option==''? "selected" : "" }>제목+내용</option>
				<option value="T" ${ph.sc.option=='T'? "selected" : "" }>제목</option>
				<option value="C" ${ph.sc.option=='C'? "selected" : "" }>내용</option>
				<option value="W" ${ph.sc.option=='W'? "selected" : "" }>글쓴이</option>
			</select> <img src="${pageContext.request.contextPath}/resources/img/돋보기.png"> <input type="text"
				name="keyword" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
			<!--  onsubmit="return searchCheck(this)" -->
			<button id="sBtn" class="sBtn" type="button">검색</button>

		</form>
		<div id="dBtn">
			<button type="button" onclick='location.href="<c:url value='/community/write'/>"'>글쓰기</button>
		</div>





		<div id="page">
			<c:if test="${ph.showPrev }">

				<a
					href="<c:url value='/community/list${ph.sc.getQueryString(ph.beginPage-1) }'/>">&lt;</a>
			</c:if>
			<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
				<a class='${ph.sc.page== i ? "active": "" }'
					href="<c:url value='/community/list${ ph.sc.getQueryString(i)}'/>">${i }</a>
			</c:forEach>
			<c:if test="${ph. showNext }">
				<a
					href="<c:url value='/community/list${ph.sc.getQueryString(ph.endPage+1) }'/>">&gt;</a>

			</c:if>
		</div>
	</div>
	
	<script>
    // DOM이 로드된 후에 실행
    document.addEventListener('DOMContentLoaded', function () {
    	
    	orderTypeSelect();
    	
        // 모든 category 클래스를 선택
        var categoryButtons = document.querySelectorAll('.category .gory');

        // 각 버튼에 클릭 이벤트 추가
        categoryButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                // 모든 버튼에서 'selected' 클래스 제거
                categoryButtons.forEach(function(btn) {
                    btn.classList.remove('selected');
                });

                // 현재 클릭한 버튼에 'selected' 클래스 추가
                button.classList.add('selected');

                // 선택된 버튼의 value 값을 가져와서 categoryValue 클래스의 value에 설정
                var selectedValue = button.value;

                document.querySelector('.categoryValue').value = selectedValue;
                console.log(document.querySelector('.categoryValue').value);
            });
            
        });
        
        var submitButtons = document.querySelectorAll('.sBtn');
        submitButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                document.querySelector('#searchList').submit();
            });
        });
    });
    
    function orderTypeSelect() {
    	let category = "${ param.orderType }";
    	if (category == "인기") {
    		document.querySelector('.gory[value="인기"]').classList.add('selected');
    	}
    	else if (category == "자유") {
    		document.querySelector('.gory[value="자유"]').classList.add('selected');
    	}
    	else if (category == "후기") {
    		document.querySelector('.gory[value="후기"]').classList.add('selected');
    	}
    	else {
    		document.querySelector('.gory[value="전체"]').classList.add('selected');
    	}
    }
</script>
</body>
</html>