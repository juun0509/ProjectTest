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

<link href="<c:url value="resources/css/view.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="navi.jsp"/>
	<div id="view">
		<form name="viewFrm">
			<h1>${ requestBoard.title }</h1>
			<p>${ requestBoard.nick }
				|
				<fmt:formatDate var="today" value="${ now }" pattern="yyyy-MM-dd" />
				<fmt:formatDate var="reg_date" value="${ requestBoard.createdDate }"
					pattern="yyyy-MM-dd" />
				<c:choose>
					<c:when test="${ today <= reg_date }">
						<td class="regdate"><fmt:formatDate
								value="${requestBoard.createdDate}" pattern="HH:mm" /></td>
					</c:when>
					<c:otherwise>
						<td class="regdate"><fmt:formatDate
								value="${requestBoard.createdDate}" pattern="yyyy-MM-dd" /></td>
					</c:otherwise>
				</c:choose>
				| 조회수 ${requestBoard.viewCount}
			</p>
			<hr>

			<div id="cont">${ requestBoard.content }<br><img src='${ requestBoard.imageUrl }' /></div>

			<hr>
			<c:if
				test="${not empty sessionScope.userId && sessionScope.userId == requestBoard.userId }">
				<!-- 작성자가 본인일 경우에만 버튼 활성화-->
				<button type="button" class="btn" id="modiBtn"
					onclick="location.href='<c:url value="/requestBoard/modify"/>?requestBoardId=${requestBoard.requestBoardId}'">
					수정</button>
				<button type="button" class="btn" onclick="deletePost();">
					삭제</button>
			</c:if>
			<c:url value="List" var="ListUrl">
				<c:param name="searchField"
					value='${empty param.searchField? "title":param.searchField }' />
				<c:param name="searchWord"
					value='${empty param.searchWord? "":param.searchWord }' />
				<c:param name="pageNum"
					value='${empty param.pageNum? 1:param.pageNum }' />
			</c:url>
			<button type="button" class="ss" id="listView"
				onclick="location.href='<c:url value="/community/list${searchCondition.queryString }"/>';">목록</button>

			<input type="hidden" name="communityId" value="${ requestBoard.requestBoardId }" />
		</form>
	</div>

	<script>
		function deletePost() {
			var confirmed = confirm("정말로 삭제하시겠습니까?");
			if (confirmed) {
				var form = document.viewFrm;
				form.method = "post";
				form.action="<c:url value='/requestBoard/remove' />?requestBoardId=${ requestBoard.requestBoardId }";
				form.submit();
			}
		}
	</script>
</body>
</html>
