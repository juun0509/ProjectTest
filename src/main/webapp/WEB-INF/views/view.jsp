<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>tonicbank | ${ community.title }</title>
	<link rel="stylesheet" href="/tonicbank/resources/css/view.css">
</head>
<body>
	<div id="view">
		<form name="viewFrm">
			<p>${ community.category }</p>
			<h1>${ community.title }</h1>
			<p>${ community.nick }
				|
				<fmt:formatDate var="today" value="${ now }" pattern="yyyy-MM-dd" />
				<fmt:formatDate var="reg_date" value="${ community.createdDate }"
					pattern="yyyy-MM-dd" />
				<c:choose>
					<c:when test="${ today <= reg_date }">
						<td class="regdate"><fmt:formatDate value="${community.createdDate}"
								pattern="HH:mm" /></td>
					</c:when>
					<c:otherwise>
						<td class="regdate"><fmt:formatDate value="${community.createdDate}"
								pattern="yyyy-MM-dd" /></td>
					</c:otherwise>
				</c:choose>
				| 조회수 ${community.viewCount}
			</p>
			<hr>

			<div id="product">
				<img src="${pageContext.request.contextPath}/resources/img/slide1.jpg" alt="" class="img">

				<h4>${dto.product}</h4>
				<div>${dto.option}</div>
			</div>

			<p id="cont">
				${ community.content }
			</p>


			<div id="like">
				좋아요 <img src="${pageContext.request.contextPath}/resources/img/qlsgkxm.png" id="heart" class="heart"
					style="cursor: pointer;" width="20px;" height="20px;"> <span
					id="likeNum">5</span>
				</td>

			</div>


			<hr>
			<c:if
				test="${not empty sessionScope.id && sessionScope.id == dto.writer }">
				<!-- 작성자가 본인일 경우에만 버튼 활성화-->
				<button type="button" class="btn" id="modiBtn"
					onclick="location.href='<c:url value="/board/modify?bno=${dto.bno}"/>';">
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
				onclick="location.href='<c:url value="/board/list${searchCondition.queryString }"/>';">목록</button>

		</form>
	</div>



	<div id="comment">
		<h3>댓글 ${dto.commentNum}</h3>
		<hr>

		<div id="commentList">
			<ul>
				<li>
					<div id="commentbox">
						<span class="commenter">닉네임1</span> <span class="update">2020.12.09</span><br>
						<br> <span class="comment">얼음이 있을 뿐이다 그들에게 생명을 불어 넣는
							것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나
							아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한</span><br>
						<button class="modBtn">수정</button>
						<button class="delBtn">삭제</button>

						<button class="commentView">댓글</button>
						<hr>
					</div>
				</li>

				<li>
					<div id="coCommentbox">
						<span class="commenter">닉네임1</span> <span class="update">2020.12.09</span><br>
						<br> <span class="comment">얼음이 있을 뿐이다 그들에게 생명을 불어 넣는
							것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나
							아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한</span><br>
						<button class="modBtn">수정</button>
						<button class="delBtn">삭제</button>

						<button class="commentView">댓글</button>
						<hr>
					</div>
				</li>


				<li>
					<div id="coCommentText">
						<span>@닉네임2</span><br>
						<textarea type="text" placeholder="댓글을 입력해주세요" name="coComment"></textarea>
						<br>
						<button id="regBtn" type="button">등록</button>
						<button id="cancelBtn" type="button">취소</button>
					</div>
				</li>



			</ul>


		</div>
		<!--댓글 목록을 보여줌(ajax를 이용해서 불러올거임)-->















		<h3>댓글달기</h3>
		<textarea type="text" placeholder="내용을 입력해주세요" name="comment"
			id="commentText"></textarea>
		<button id="sendBtn" type="button">등록</button>
	</div>
	<script>
               
                let bno = "${dto.bno}";
            
                // 댓글 가져오기 함수
                let showList = function (bno) {
                    $.ajax({
                        type:'GET',       // 요청 메서드
                        url: '/project/comments?bno=' + bno,  // 요청 URI
                        dataType : 'json', // 전송받을 데이터의 타입, 생략해도 됨: 기본이 json
                        success : function(result) {
                            // result가 오면 commentList에 담기
                            // 댓글목록 가져온 것을 commmentList에 담게 됨
                            // 들어오는 배열을 toHtml이라는 함수를 이용해서 <li>태그로 만든다음 그것을 commentList에 넣는다.
                            $("#commentList").html(toHtml(result));
                        },
                        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
            
                }
            
                // document 시작
                $(document).ready(function(){
                    showList(bno);
            
                    $("#sendBtn").click(function() {
                        let comment = $("input[name=comment]").val();
            
                        if(comment.trim() == '') {
                            alert("댓글을 입력해주세요");
                            $("input[name=comment]").focus();
                            return;
                        }
            
                        // 쓰기
                        $.ajax({
                            type: 'POST',
                            url: '/project/comments?bno=' + bno,
                            headers: {"content-type" : "application/json"},
                            data : JSON.stringify({bno:bno, comment:comment}), // 전송할 데이터를 JSON으로!
                            success : function (result) {
                                alert(result);
                                showList(bno); //  쓰기가 성공했을 때 보여줄꺼임
                            },
                            error : function () {alert("error")}
                        });
                    });
                    
                    // $(".delBtn").click(function () {
                    $("#commentList").on("click", ".delBtn", function () {
                        // li가 버튼의 부모
                        let cno = $(this).parent().attr("data-cno");
                        let bno = $(this).parent().attr("data-bno");
            
                        $.ajax({
                            type: 'DELETE',
                            url: '/project/comments/' + cno + '?bno=' + bno,
                            success : function (result) {
                                alert(result)
                                // 삭제된 다음에 새로 갱신되어야 함
                                showList(bno);
                            }
                        });
                    });
            
                    $("#commentList").on("click", ".modBtn", function () {
                        let cno = $(this).parent().attr("data-cno");
                        let comment = $("span.comment", $(this).parent()).text();
            
                        //1. comment의 내용을 input에 뿌려주기
                        $("input[name=comment]").val(comment);
                        //2. cno 번호를 전달하기
                        $("#modBtn").attr("data-cno", cno);
            
                    })
            
                    $("#modBtn").click(function() {
                        let comment = $("input[name=comment]").val();
                        let cno = $(this).attr("data-cno");
            
                        if(comment.trim() == '') {
                            alert("댓글을 입력해주세요");
                            $("input[name=comment]").focus();
                            return;
                        }
            
                        // 쓰기
                        $.ajax({
                            type: 'PATCH',
                            url: '/project/comments/' + cno,
                            headers: {"content-type" : "application/json"},
                            data : JSON.stringify({cno:cno, comment:comment}), // 전송할 데이터를 JSON으로!
                            success : function (result) {
                                alert(result);
                                showList(bno); //  수정이 성공했을 때 보여줄거임
                            },
                            error : function () {alert("error")}
                        });
                    });
                });
            
                // 배열들어온 것을 <li>태그를 이용해서 전체 <ul>를 구성한 다음에 그것을 넣을 것이다.
                let toHtml = function (comments) {
                    let tmp = "<ul>";
            
                    // 댓글 하나하나 들고와서 tmp에 쌓는다.
                    comments.forEach(function (comment) {
                        tmp += '<li data-cno=' + comment.cno;
                        tmp += ' data-pcno=' + comment.pcno;
                        tmp += ' data-bno=' + comment.bno + '>';
                        // span태그에 넣어야 나중에 작성자만 따로 읽어오기 쉽다.
                        tmp += ' <div id="commentbox"><span class="commenter">' + comment.commenter + '</span>';
                        tmp += ' <span class="update">(' + comment.up_date + ')</span><br>';
                        tmp += ' <span class="comment">' + comment.comment + '</span>';
                        tmp += '<button class="delBtn">삭제</button>';
                        tmp += '<button class="modBtn">수정</button></div>';
                        tmp += '</li>';
                    })
            
                    return tmp + "</ul>"; // ul을 html로 반환한다.
                }
            </script>
</body>
</html>