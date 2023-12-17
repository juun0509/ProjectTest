<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/tonicbank/resources/css/home.css">
</head>
<body>
	<div id="con">
		<div id="container">
	        <div id="logo" onclick='location.href="<c:url value='/'/>"'><h1><b id="yy">영</b>양<b id="jj">제</b></h1></div>
			
	        <fieldset id="search">
	        	<form action="search" method="get" onsubmit="return formCheck(this);">
		            <input id="searcht" name="keyword" type="text" placeholder="검색어를 입력하세요" autocomplete="off">
		            <button id="searchBtn" type="submit">검색</button>
	        	</form>
	        </fieldset>
	
	        <div id="nav">
	        	<ul id="topMenu">
		            <li><a href="#">정보게시판</a></li>
		            <li><a href="<c:url value='/community/list'/>">자유게시판</a></li>
		            <li><a href="#">고객센터</a>
		                <ul>
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
	        	</ul><hr>
			</div>

	        <div id="slideshow">
	        	<div id="slides" class="slides">
	          		<img src="/tonicbank/resources/img/slide1.jpg" alt="" class="slide"><div class="slidet"><h2>가을철 건강관리 꿀팁!<br>영양제 추천</h2><span><br> 잘 고르는 TIP 알아보기</span></div>
	            	<img src="/tonicbank/resources/img/slide5.jpg" alt="" class="slide"><div class="slidet"><h2>30대 남자</h2><span>필수 영양제 추천<br> 2023 인기순위 TOP9!</span></div>
	            	<img src="/tonicbank/resources/img/slide4.jpg" alt="" class="slide"><div class="slidet"><h2>센트룸 실버 우먼</h2><span>실버세대 여성을 위한 맞춤 영양설계!<br>멀티비타민</span></div>
	            	<img src="/tonicbank/resources/img/slide2.jpg" alt="" class="slide"><div class="slidet"><h2>칼슘영양제</h2><span>뼈와 치아의 구성요소 칼슘<br>추천 건강가이드</span></div>
	            	<button class="btn" id="prev">&lang;</button>
	            	<button class="btn" id="next">&rang;</button>
	        	</div>
	        </div>

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

	        <div id="tabMenu">
	            <input type="radio" id="tab1" name="tabs" checked>
	            <label for="tab1">정보게시판</label>
	            <input type="radio" id="tab2" name="tabs">
	            <label for="tab2">자유게시판</label>
	            <div id="notice" class="tabContent">
	                <h2>정보게시판</h2>
	                <ul>
	                    <li><b>전체 | </b>봐도 어려운 영양제 단위 정리해드립니다</li>
	                    <li><b>전체 | </b> 과학적으로 증명된 영양제들</li>
	                    <li><b>전체 | </b>궁합이 좋은 영양제 찾기</li>
	                    <li><b>위장 | </b>유산균의 효능과 종류 정리</li>
	                    <li><b>피로&면역 | </b>현대인들의 면역력 뇌 피로 영양제 추천</li>
	                    <li><b>항산화 | </b>항산화의 효능과 원리</li>
	                    <button type="submit" class="more">더보기</button>
	                </ul>
	            </div>
	            <div id="gallery" class="tabContent">
	            	<h2>자유게시판</h2>
	            	<ul class="gr">
	           			<li>
	                    	<img src="/tonicbank/resources/img/비오비타.jpg">
	                    	<div class="caption">
	                        	<h3>닉네임: 비타</h3>
	                        	<p>제품명:비오비타<br>아기 유산균 비오비타 베베 두 달 후기입니다</p>
	                   		</div>
						</li>
						<li>
	                		<img src="/tonicbank/resources/img/관절.jpg">
	                    	<div class="caption">
		                        <h3>닉네임: 팔팔</h3>
		                        <p>제품명: 씨스팡 관절팔팔<br>씨스팡 관절팔팔 초록잎홍합추출오일 후기</p>
	                    	</div>
						</li>
						<li>
							<img src="/tonicbank/resources/img/밀크.jpg">
							<div class="caption">
		                        <h3>닉네임: 밀크</h3>
		                        <p>제품명:밀크씨슬<br>간 겅강 챙겨보려 합니다. 뉴트리코어 유기농 밀크씨슬 후기</p>
		                    </div>
						</li>
						<li>
							<img src="/tonicbank/resources/img/메가.jpg">
	                    	<div class="caption">
		                        <h3>닉네임: 메가</h3>
		                        <p>제품명: 메가도스<br>비타민c 메가도스 6개월 느낀점</p>
	                    	</div>
	                	</li>
	                    <li>
							<img src="/tonicbank/resources/img/가르.jpg">
							<div class="caption">
								<h3>닉네임: 니아</h3>
								<p>제품명: 가르시니아 캄보자아<br>195일동안 영양제 먹으면서 다이어트 한 결과 대공개!</p>
							</div>
						</li>
	                </ul>
	            </div>
	        </div>
	        
	        <div id="links">
	            <ul>
	                <li>
	                    <a href="#">
	                        <span id="quick-icon1"></span>
	                        <p>성분비교</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                        <span id="quick-icon2"></span>
	                        <p>권장량</p>
						</a>
	                </li>
	                <li>
						<a href="#">
		                    <span id="quick-icon3"></span>
		                    <p>AI추천</p>
	                    </a>
	                </li>
	            </ul>
	        </div>

	        <div id="tabMenu2">
	            <input type="radio" id="tab3" name="tab" checked>
	            <label for="tab3">맞춤 추천</label>
	            <input type="radio" id="tab4" name="tab">
	            <label for="tab4">떴다! 방영상품</label>
	            <div id="recom" class="tabContent2">
	                <h2>가을시즌 추천</h2>
	                <ul class="recom">
	                    <li id="room">
	                    	<img src="/tonicbank/resources/img/센트룸.jpg">
	                    	<div class="caption2">
		                        <h3>닥터린</h3>
		                        <p>송중기 초임계 알티지(rTG) 오메가3 <br> <br>19,000원~</p>
		                    </div>
	                    </li>
	                    <li>
	                    	<img src="/tonicbank/resources/img/고려은단.jpg">
		                    <div class="caption2">
		                        <h3>고려은단</h3>
		                        <p>비타민 13종 미네랄 10종 올인원!<br> 멀티비타민 <br><br>39,000원~</p>
		                    </div>
	                    </li>
	                    <li>
		                    <img src="/tonicbank/resources/img/닥터린.jpg">
		                    <div class="caption2">
		                        <h3>센트룸 실버 우먼</h3>
		                        <p>실버세대 여성을 위한 맞춤 영양설계!<br>멀티비타민<br> <br>9,000원~</p>
		                    </div>
	                	</li>
	                    <li>
		                    <img src="/tonicbank/resources/img/메디트리.jpg" id="tree">
		                    <div class="caption2">
		                        <h3>메디트리</h3>
		                        <p>유기농 고함량<br>비오틴+비타민B12+셀렌<br><br>29,000원~</p>
		                    </div>
	                	</li>
	                </ul>
	            </div>
	            <div id="recom2" class="tabContent2">
	                <h2>떴다! 방영상품</h2>
	                <ul class="recom">
	                    <li>
	                    	<img src="/tonicbank/resources/img/익스트림.jpg" id="new" onclick="you('https://www.youtube.com/watch?v=WEMDd0-c9fY','pop','500','400')">
		                    <div class="caption3">
		                        <h3>익스트림 블랙마카<br>1800 김종국 흑마늘 야관문 흑삼</h3>
		                        <p>34900원</p>
		                    </div>
	                    </li>
	                    <li>
		                    <img src="/tonicbank/resources/img/옵티.jpg">
		                    <div class="caption3">
		                        <h3 class="black">옵티머스트 3+1개월<br> 17차 완판 100원 이벤트!</h3>
		                        <p class="black">179,500원</p>
		                    </div>
	                    </li>
	                </ul>
	            </div>
			</div>
			
	        <div id="contents">
	            <h2>인기 태그</h2>
				<ul>
					<li><a>피로&면역</a><img src="/tonicbank/resources/img/피로색.png"></li>
	                <li><a>피부</a><img src="/tonicbank/resources/img/피부색.png"></li>
	                <li><a>항산화</a><img src="/tonicbank/resources/img/항산화색.png"></li>
	                <li><a>위장</a><img src="/tonicbank/resources/img/장색.png"></li>
	                <li><a>다이어트</a><img src="/tonicbank/resources/img/다이어트색.png"></li>
				</ul>
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
		
	    let prev_bttn=document.getElementById("prev");
		let next_bttn=document.getElementById("next");
		let imgs=document.querySelectorAll("#slides img");
		let text=document.querySelectorAll("#slides div");
		let img_num=0;
	
		showimg(img_num);
	
		prev_bttn.onclick=function(){
	    	img_num--;
		    if(img_num<0){
		        img_num=imgs.length-1;
		    }
		    showimg(img_num);
		    console.log(img_num)
		};
	
		next_bttn.onclick=function(){
		    img_num++;
		    if(img_num>imgs.length-1){
		        img_num=0;
		    }
		    showimg(img_num);
		    console.log(img_num)
		};
	
		function showimg(n){
		    for(let i=0;i<imgs.length;i++){
		        imgs[i].style.display="none";
		        text[i].style.display="none";
		    }
		    imgs[n].style.display="block";
		    text[n].style.display="block";
		   
		}
	
		//슬라이드 이미지
		var index = 0; //이미지에 접근하는 인덱스
        window.onload = function () {
            slideShow();
        }
		
        function slideShow() {
            var i;
            var x = document.getElementsByClassName("slide");  
            var t = document.getElementsByClassName("slidet"); 
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
                t[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
            }
            index++;
            if (index > x.length) {
                index = 1;  //인덱스가 초과되면 1로 변경
            }
            x[index - 1].style.display = "block";
            t[index - 1].style.display = "block";  //해당 인덱스는 block으로
            setTimeout(slideShow, 4000);   //함수를 4초마다 호출
        }

		function you(doc, win,w,h){
		       var left=0;
		       var top=0;
		       var opt="left="+left+",top="+top+",width="+w+",height="+h;
		       window.open(doc,win,opt);
		}
	</script>
</body>
</html>
