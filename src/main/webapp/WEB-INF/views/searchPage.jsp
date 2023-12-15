<!DOCTYPE html>
<html lang="ko">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>    
<head>
    <link href="<c:url value="/resources/css/searchPage.css"/>" rel='stylesheet' />
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

</head>
<body>
    <div id="con">
        <div id="container">
            <div id="logo" onclick="location.replace('/home')"><h1><b id="yy">tonic</b><b id="jj">bank</b></h1></div>


            <fieldset id="search">
                <div id="sel">
                    <select id="prod" title="select">
                    <option value="" selected>전체</option>
                    <option value="1" >상품명</option>
                    <option value="2" >성분명</option>
                    <option value="3" >브랜드명</option>
                    </select>
                </div>
                <input id="searcht" type="text" placeholder="검색어를 입력하세요" autocomplete="off">
                
            </fieldset>



            <div id="side">
                <p>토닉뱅크를 더 안전하게 이용하세요</p>
                <input type="submit" class="side" id="my" name="tabs" value="마이페이지">
                <input type="submit" class="side" id="h" name="tabs" onclick="location.replace('/signUp/join')" value="회원가입" checked>
                <input type="submit" class="side" id="l" name="tabs" onclick="location.replace('/login/login')" value="로그인">
            </div>





        <div id="result">

            <h2>전체검색결과 총 ?건</h2>

            <div class="result" style="margin-top: 0px;">
                <h4>카테고리>상품명 (총 <b>?</b>건)<a>더보기</a></h4>
                <div>
                <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                <ul>
                    <li>브랜드명:</li>
                    <li>상품명:</li>
                    <li>가격:</li>
                    <li>성분:</li>
                    <li>효능:</li>
                    <li>후기(<a>1</a>)</li>

                </ul>
                </div>


                <div>
                    <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                    <ul>
                        <li>브랜드명:</li>
                        <li>상품명:</li>
                        <li>가격:</li>
                        <li>성분:</li>
                        <li>효능:</li>
                        <li>후기(<a>1</a>)</li>
    
                    </ul>
                    </div>







            </div>

            <div class="result">
                <h4>카테고리>성분명 (총 <b>?</b>건)<a>더보기</a></h4>
                <div>
                <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                <ul>
                    <li>브랜드명:</li>
                    <li>상품명:</li>
                    <li>가격:</li>
                    <li>성분:</li>
                    <li>효능:</li>
                    <li>후기(<a>1</a>)</li>

                </ul>
                </div>
            </div>
                
            <div class="result">
                <h4>카테고리>브랜드명 (총 <b>?</b>건)<a>더보기</a></h4>
                <div>
                <img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img">
                <ul>
                    <li>브랜드명:</li>
                    <li>상품명:</li>
                    <li>가격:</li>
                    <li>성분:</li>
                    <li>효능:</li>
                    <li>후기(<a>1</a>)</li>

                </ul>
                </div>
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
</body>
</html>