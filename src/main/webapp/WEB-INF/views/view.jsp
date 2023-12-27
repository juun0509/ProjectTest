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

<link href="<c:url value="/resources/css/view.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<div id="view">
		<form name="viewFrm">
			<p>
				<c:choose>
					<c:when test="${ board.category == 'popularity' }">인기</c:when>
					<c:otherwise>후기</c:otherwise>
				</c:choose>
			</p>
			<h1>${ community.title }</h1>
			<p>${ community.nick }
				|
				<fmt:formatDate var="today" value="${ now }" pattern="yyyy-MM-dd" />
				<fmt:formatDate var="reg_date" value="${ community.createdDate }"
					pattern="yyyy-MM-dd" />
				<c:choose>
					<c:when test="${ today <= reg_date }">
						<td class="regdate"><fmt:formatDate
								value="${community.createdDate}" pattern="HH:mm" /></td>
					</c:when>
					<c:otherwise>
						<td class="regdate"><fmt:formatDate
								value="${community.createdDate}" pattern="yyyy-MM-dd" /></td>
					</c:otherwise>
				</c:choose>
				| 조회수 ${community.viewCount}
			</p>
			<hr>
			<c:if test="${ community.category == '후기' }">
				<div id="product">
					<img
						src="${pageContext.request.contextPath}/resources/img/slide1.jpg"
						alt="" class="img">
	
					<h4>${product.name}</h4>
					<div>${ product.ingredient }</div>
					<div>${ product.efficacy }</div>
				</div>
			</c:if>

			<div id="cont">${ community.content }</div>


			<div id="like">
				좋아요 <img
					src="${pageContext.request.contextPath}/resources/img/qlsgkxm.png"
					id="heart" class="heart" style="cursor: pointer;" width="20px;"
					height="20px;"> <span id="likeNum">${ community.likeCount }</span>
				</td>

			</div>


			<hr>
			<c:if
				test="${not empty sessionScope.userId && sessionScope.userId == community.userId }">
				<!-- 작성자가 본인일 경우에만 버튼 활성화-->
				<button type="button" class="btn" id="modiBtn"
					onclick="location.href='<c:url value="/community/modify?communityId=${community.communityId}"/>';">
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

			<input type="hidden" name="communityId" value="${ community.communityId }" />
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
		function deletePost() {
			var confirmed = confirm("정말로 삭제하시겠습니까?");
			if (confirmed) {
				var form = document.viewFrm;
				form.method = "post";
				form.action="<c:url value='/community/remove' />${ sc.queryString }";
				form.submit();
			}
		}
	
		let bno = "${community.communityId}";

		// 댓글 가져오기 함수
		let showList = function(bno) {
			$.ajax({
				type : 'GET', // 요청 메서드
				url : '/tonicbank/community/comments?communityId=' + bno, // 요청 URI
				dataType : 'json', // 전송받을 데이터의 타입, 생략해도 됨: 기본이 json
				success : function(result) {
					// result가 오면 commentList에 담기
					// 댓글목록 가져온 것을 commmentList에 담게 됨
					// 들어오는 배열을 toHtml이라는 함수를 이용해서 <li>태그로 만든다음 그것을 commentList에 넣는다.
					$("#commentList").html(toHtml(result));
				},
				error : function() {
					alert("error")
				} // 에러가 발생했을 때, 호출될 함수
			}); // $.ajax()

		}

		// document 시작
		$(document).ready(function() {
			showList(bno);

			$("#sendBtn").click(function() {
				
				if (${empty sessionScope.userId}) {
					alert("로그인이 필요한 서비스입니다.");
					return;
				}
				
				let comment = $("textarea[name=comment]").val();

				if (comment.trim() == '') {
					alert("댓글을 입력해주세요");
					$("input[name=comment]").focus();
					return;
				}

				// 쓰기
				$.ajax({
					type : 'POST',
					url : '/tonicbank/community/comments?mod=comment',
					headers : {
						"content-type" : "application/json"
					},
					data : JSON.stringify({
						communityId : bno,
						content : comment
					}), // 전송할 데이터를 JSON으로!
					success : function(result) {
						alert(result);
						showList(bno); //  쓰기가 성공했을 때 보여줄꺼임
					},
					error : function() {
						alert("error")
					}
				});
			});
		
			$('#commentList').on('click', '#regBtn', function() {
				
				let pcno = $(this).parent().parent().parent().parent().attr('data-cno');
				let comment = $('textarea[name=coComment]').val();
				console.log(pcno);
				
				$.ajax({
					type : 'POST',
					url : '/tonicbank/community/comments?mod=recomment',
					headers : {
						"content-type" : "application/json"
					},
					data : JSON.stringify({
						communityId : bno,
						content : comment,
						parentCommentId : pcno
					}),
					success : function(result) {
						alert(result);
						showList(bno);
					},
					error : function() {
						alert("error");
					}
				});
			});
			
			$("#commentList").on("click", ".commentView", function() {
				
				if (${empty sessionScope.userId}) {
					alert("로그인이 필요한 서비스입니다.");
					return;
				}
				
				$('.replyBox').detach();
				let pnick = $(this).parent().children('.commenter').text();
				
				let tmp = '<li class="replyBox">';
				tmp += '<div id="coCommentText">';
				tmp += '<span>@' + pnick + '</span><br>';
				tmp += '<textarea type="text" placeholder="댓글을 입력해주세요" name="coComment"></textarea>';
				tmp += '<br>';
				tmp += '<button id="regBtn" type="button">등록</button>';
				tmp += '<button id="cancelBtn" type="button">취소</button>';
				tmp += '</div>';
				tmp += '</li>';
				
				$(this).after(tmp);
			});
			
			$("#commentList").on('click', '#cancelBtn', function() {
				$('.replyBox').detach();
			})

			// $(".delBtn").click(function () {
			$("#commentList").on("click", ".delBtn", function() {
				// li가 버튼의 부모
				let cno = $(this).parent().parent().attr("data-cno");
				
				if(!confirm("정말로 삭제하시겠습니까?")) {
					return;
				}

				$.ajax({
					type : 'DELETE',
					url : '/tonicbank/community/comments/' + cno + '?communityId=' + bno,
					success : function(result) {
						alert(result)
						// 삭제된 다음에 새로 갱신되어야 함
						showList(bno);
					},
					error : function() {
						alert("error");
					}
				});
			});

			$("#commentList").on("click", ".modBtn", function() {
				let comment = $(this).siblings('.comment').text();
				
				let tmp = '<textarea class="comment">';
				tmp += comment;
				tmp += '</textarea>';
				
				$(this).siblings('.comment').html(tmp);
				$(this).siblings('.delBtn').text("취소");
				$(this).siblings('.delBtn').removeClass('delBtn').addClass('resetBtn');
				$(this).removeClass('modBtn').attr('id', 'modBtn');
			});

			$('#commentList').on('click', '#modBtn', function() {
				let comment = $("textarea[class=comment]").val();
				let cno = $(this).parent().parent().attr("data-cno");
				console.log(comment);
				console.log(cno);

				if (comment.trim() == '') {
					alert("댓글을 입력해주세요");
					$("textarea[][name=comment]").focus();
					return;
				}

				// 쓰기
				$.ajax({
					type : 'PATCH',
					url : '/tonicbank/community/comments/' + cno,
					headers : {
						"content-type" : "application/json"
					},
					data : JSON.stringify({
						communityCommentId : cno,
						content : comment
					}), // 전송할 데이터를 JSON으로!
					success : function(result) {
						alert(result);
						showList(bno); //  수정이 성공했을 때 보여줄거임
					},
					error : function() {
						alert("error")
					}
				});
			});
			
			
			// 좋아요 버튼 눌렀을 때
			$("#view").on("click", "#like", function() {
				
				if (${ empty sessionScope.userId }) {
					alert("로그인이 필요한 서비스입니다.");
					return;
				}
				
				$.ajax({
					type: 'post',
					url: '/tonicbank/community/like',
					data: {
						communityId: bno
					},
					success: function(result) {
						$('#likeNum').html(result.likeCount);
					},
					error: function() {
						alert("좋아요 버튼 에러");
					}
				});
			});
		});

		// 배열들어온 것을 <li>태그를 이용해서 전체 <ul>를 구성한 다음에 그것을 넣을 것이다.
		let toHtml = function(comments) {
			let tmp = "<ul>";

			// 댓글 하나하나 들고와서 tmp에 쌓는다.
			comments
					.forEach(function(comment) {
						
						if (comment.deleteStatus) {
							tmp += '<li style="margin-left: ' + (comment.step * 2) + 'em" data-cno=' + comment.communityCommentId;
	                        tmp += ' data-pcno=' + comment.parentCommentId;
	                        tmp += ' data-bno=' + comment.communityId + '>';
							// span태그에 넣어야 나중에 작성자만 따로 읽어오기 쉽다.
							tmp += ' <div id="commentbox"><span class="commenter"></span>';
							tmp += ' <span class="update"></span>';
							tmp += ' <br>'
							tmp += ' <div class="comment">삭제된 댓글입니다.</div>';
							tmp += ' <br>'
							tmp += '<button class="delBtn"></button>';
							tmp += '<button class="modBtn"></button></div>';
							tmp += '<hr>';
							tmp += '</li>';
						}
						else {
							tmp += '<li style="margin-left: ' + (comment.step * 2) + 'em" data-cno=' + comment.communityCommentId;
	                        tmp += ' data-pcno=' + comment.parentCommentId;
	                        tmp += ' data-bno=' + comment.communityId + '>';
							// span태그에 넣어야 나중에 작성자만 따로 읽어오기 쉽다.
							tmp += ' <div id="commentbox"><span class="commenter">' + comment.nick + '</span>';
							tmp += ' <span class="update">(' + formatDateAgo(comment.createdDate) + ')</span>';
							tmp += ' <br>'
							tmp += ' <div class="comment">' + comment.content + '</div>';
							tmp += ' <br>'
							if ("${ sessionScope.userId }" == comment.userId) {
								tmp += '<button class="delBtn">삭제</button>';
								tmp += '<button class="modBtn">수정</button>';
							}
							tmp += '<button class="commentView">댓글</button>';
							tmp += '</div>';
							tmp += '<hr style="clear: both;">';
							tmp += '</li>';
						}
					})

			return tmp + "</ul>"; // ul을 html로 반환한다.
		}
		
		function formatDateAgo(date) {
		    const now = new Date();
		    const diff = now - date;
		    const seconds = Math.floor(diff / 1000);
		    const minutes = Math.floor(seconds / 60);
		    const hours = Math.floor(minutes / 60);
		    const days = Math.floor(hours / 24);
		    const years = Math.floor(days / 365);

		    if (years > 0) {
		        return years === 1 ? '1 년 전' : years + ` 년 전`;
		    } else if (days > 0) {
		        return days === 1 ? '어제' : days + ` 일 전`;
		    } else if (hours > 0) {
		        return hours === 1 ? '1 시간 전' : hours + ` 시간 전`;
		    } else if (minutes > 0) {
		        return minutes === 1 ? '1 분 전' : minutes + ` 분 전`;
		    } else {
		        return '방금 전';
		    }
		}
	</script>
</body>
</html>