<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/tonicbank/resources/css/findProduct.css">
</head>
<body>
    <div id="con">
    <div id="header"><h1>상품 찾기</h1></div>
    <div id="main">

        <div id="sel">
            <select class="selTag" id="selTag" title="select">
            <option value="" selected>태그선택</option>
            <option value="1" >피로&면역</option>
            <option value="2" >피부</option>
            <option value="3" >항산화</option>
            <option value="4" >장&배변</option>
            <option value="5" >다이어트</option>
            <option value="6" >뼈&관절</option>
            <option value="7" >임산부</option>
            <option value="8" >베이비&키즈</option>
            <option value="9" >눈</option>
            <option value="10" >간</option>
            <option value="11" >당뇨</option>
            <option value="12" >혈압</option>
            <option value="13" >갱년기</option>
            <option value="14" >여성</option>
            <option value="15" >남성&전립선</option>
            <option value="16" >호르몬</option>
            <option value="17" >탈모</option>
            <option value="18" >비염</option>
            <option value="19" >뇌</option>
            <option value="20" >위</option>
            <option value="21" >혈관</option>
            <option value="22" >치아</option>
            <option value="23" >기타</option>
            </select>
            <select class="selTag" title="select">
                <option value="" selected>성분선택</option>
                <option value="1" >CLA</option>
                <option value="2" >DHA</option>
                <option value="3" >Hawthorn</option>
                <option value="4" >MSM</option>
                <option value="5" >NAC</option>
                <option value="6" >가르시니아</option>
                <option value="7" >감마리놀렌산</option>
                <option value="8" >강황(커큐민)</option>
                <option value="9" >계피</option>
                <option value="10" >구기자(고지)</option>
                <option value="11" >글루코사민</option>
                <option value="12" >나토키나제</option>
                <option value="13" >노니</option>
                <option value="14" >녹색입홍합</option>
                <option value="15" >녹용</option>
                <option value="16" >다시마-켈프</option>
                <option value="17" >달맞이꽃종자유</option>
                <option value="18" >동충하초</option>
                <option value="19" >라이코펜</option>
                <option value="20" >로얄제리</option>
                <option value="21" >루테인</option>
                <option value="22" >리보스</option>
                <option value="23" >리프리놀</option>

                <option value="24" >마그네슘</option>
                <option value="25" >마누카꿀</option>
                <option value="26" >마늘</option>
                <option value="27" >마카</option>
                <option value="28" >망간</option>
                <option value="29" >멜라토닌</option>
                <option value="30" >모링가</option>
                <option value="31" >미네랄</option>
                <option value="32" >밀크씨슬</option>
                <option value="33" >종합비타민</option>
                <option value="34" >멀티비타민</option>
                <option value="35" >발포비타민</option>
                <option value="36" >비타민A</option>
                <option value="37" >비타민B Complex</option>
                <option value="38" >비타민C</option>
                <option value="39" >비타민D</option>
                <option value="40" >비타민E</option>
                <option value="41" >비타민K</option>
                <option value="42" >비오틴</option>
                <option value="43" >버섯균사체</option>
                <option value="44" >면역균사체</option>
                <option value="45" >바이오플라보노이드</option>
                <option value="46" >베타카로틴</option>

                <option value="47" >보라지 오일</option>
                <option value="48" >보스웰리아(유향)</option>
                <option value="49" >브로컬리</option>
                <option value="50" >블랙체리</option>
                <option value="51" >블루베리</option>
                <option value="52" >빌베리</option>
                <option value="53" >상어연골</option>
                <option value="54" >생선오일</option>
                <option value="55" >석류</option>
                <option value="56" >세라펩타제</option>
                <option value="57" >셀레늄</option>
                <option value="58" >스피루리나</option>
                <option value="59" >식이유황</option>
                <option value="60" >식이섬유</option>
                <option value="61" >쏘팔메토</option>
                <option value="62" >씨벅손</option>
                <option value="63" >아로니아베리</option>
                <option value="64" >아르기닌</option>
                <option value="65" >아마씨</option>
                <option value="66" >아미노산</option>
                <option value="67" >아사이베리</option>
                <option value="68" >아스타잔틴</option>
                <option value="69" >아연</option>

                
                <option value="70" >악마의 발톱</option>
                <option value="71" >알로에</option>
                <option value="72" >캐나다알부민</option>
                <option value="73" >알콕시글리세롤</option>
                <option value="74" >엘더베리</option>
                <option value="75" >엽록소</option>
                <option value="76" >엽산</option>
                <option value="77" >영양제</option>
                <option value="78" >오메가9</option>
                <option value="79" >오레가노</option>
                <option value="80" >오미자</option>
                <option value="81" >오메가3</option>
                <option value="82" >오메가6</option>
                <option value="83" >올리브잎</option>
                <option value="84" >유산균</option>
                <option value="85" >에키네시아</option>
                <option value="86" >은행잎추출물</option>
                <option value="87" >이소플라본</option>
                <option value="88" >인</option>
                <option value="89" >차가버섯</option>
                <option value="90" >철분</option>
                <option value="91" >초록입홍합</option>
                <option value="92" >초유</option>
                <option value="93" >채소분말</option>

                <option value="94" >카무카무</option>
                <option value="95" >카테킨</option>
                <option value="96" >칼슘</option>
                <option value="97" >칼륨</option>
                <option value="98" >크롬</option>
                <option value="99" >타트체리</option>
                <option value="100" >태반</option>
                <option value="101" >파크노제놀</option>
                <option value="102" >판토텐산</option>
                <option value="103" >포도씨</option>
                <option value="104" >포스콜린</option>
                <option value="105" >폴리코사놀</option>
                <option value="106" >프로바이오틱스</option>
                <option value="107" >프리바이오틱스</option>
                <option value="108" >프로폴리스</option>
               
                <option value="109" >하프물범오일</option>
                <option value="110" >화분</option>
                <option value="111" >활성탄소</option>
                <option value="112" >헴프씨오일</option>
                <option value="113" >호박씨</option>
                <option value="114" >효모</option>
                <option value="115" >효소</option>
                <option value="116" >히알우론산</option>
                <option value="117" >비폴렌</option>
                <option value="118" >새싹보리</option>
                <option value="119" >아티초크</option>
               
                </select>
                <select class="selTag" title="select">
                    <option value="" selected>성분선택</option>
                    <option value="1" >CLA</option>
                    <option value="2" >DHA</option>
                    <option value="3" >Hawthorn</option>
                    <option value="4" >MSM</option>
                    <option value="5" >NAC</option>
                    <option value="6" >가르시니아</option>
                    <option value="7" >감마리놀렌산</option>
                    <option value="8" >강황(커큐민)</option>
                    <option value="9" >계피</option>
                    <option value="10" >구기자(고지)</option>
                    <option value="11" >글루코사민</option>
                    <option value="12" >나토키나제</option>
                    <option value="13" >노니</option>
                    <option value="14" >녹색입홍합</option>
                    <option value="15" >녹용</option>
                    <option value="16" >다시마-켈프</option>
                    <option value="17" >달맞이꽃종자유</option>
                    <option value="18" >동충하초</option>
                    <option value="19" >라이코펜</option>
                    <option value="20" >로얄제리</option>
                    <option value="21" >루테인</option>
                    <option value="22" >리보스</option>
                    <option value="23" >리프리놀</option>
    
                    <option value="24" >마그네슘</option>
                    <option value="25" >마누카꿀</option>
                    <option value="26" >마늘</option>
                    <option value="27" >마카</option>
                    <option value="28" >망간</option>
                    <option value="29" >멜라토닌</option>
                    <option value="30" >모링가</option>
                    <option value="31" >미네랄</option>
                    <option value="32" >밀크씨슬</option>
                    <option value="33" >종합비타민</option>
                    <option value="34" >멀티비타민</option>
                    <option value="35" >발포비타민</option>
                    <option value="36" >비타민A</option>
                    <option value="37" >비타민B Complex</option>
                    <option value="38" >비타민C</option>
                    <option value="39" >비타민D</option>
                    <option value="40" >비타민E</option>
                    <option value="41" >비타민K</option>
                    <option value="42" >비오틴</option>
                    <option value="43" >버섯균사체</option>
                    <option value="44" >면역균사체</option>
                    <option value="45" >바이오플라보노이드</option>
                    <option value="46" >베타카로틴</option>
    
                    <option value="47" >보라지 오일</option>
                    <option value="48" >보스웰리아(유향)</option>
                    <option value="49" >브로컬리</option>
                    <option value="50" >블랙체리</option>
                    <option value="51" >블루베리</option>
                    <option value="52" >빌베리</option>
                    <option value="53" >상어연골</option>
                    <option value="54" >생선오일</option>
                    <option value="55" >석류</option>
                    <option value="56" >세라펩타제</option>
                    <option value="57" >셀레늄</option>
                    <option value="58" >스피루리나</option>
                    <option value="59" >식이유황</option>
                    <option value="60" >식이섬유</option>
                    <option value="61" >쏘팔메토</option>
                    <option value="62" >씨벅손</option>
                    <option value="63" >아로니아베리</option>
                    <option value="64" >아르기닌</option>
                    <option value="65" >아마씨</option>
                    <option value="66" >아미노산</option>
                    <option value="67" >아사이베리</option>
                    <option value="68" >아스타잔틴</option>
                    <option value="69" >아연</option>
    
                    
                    <option value="70" >악마의 발톱</option>
                    <option value="71" >알로에</option>
                    <option value="72" >캐나다알부민</option>
                    <option value="73" >알콕시글리세롤</option>
                    <option value="74" >엘더베리</option>
                    <option value="75" >엽록소</option>
                    <option value="76" >엽산</option>
                    <option value="77" >영양제</option>
                    <option value="78" >오메가9</option>
                    <option value="79" >오레가노</option>
                    <option value="80" >오미자</option>
                    <option value="81" >오메가3</option>
                    <option value="82" >오메가6</option>
                    <option value="83" >올리브잎</option>
                    <option value="84" >유산균</option>
                    <option value="85" >에키네시아</option>
                    <option value="86" >은행잎추출물</option>
                    <option value="87" >이소플라본</option>
                    <option value="88" >인</option>
                    <option value="89" >차가버섯</option>
                    <option value="90" >철분</option>
                    <option value="91" >초록입홍합</option>
                    <option value="92" >초유</option>
                    <option value="93" >채소분말</option>
    
                    <option value="94" >카무카무</option>
                    <option value="95" >카테킨</option>
                    <option value="96" >칼슘</option>
                    <option value="97" >칼륨</option>
                    <option value="98" >크롬</option>
                    <option value="99" >타트체리</option>
                    <option value="100" >태반</option>
                    <option value="101" >파크노제놀</option>
                    <option value="102" >판토텐산</option>
                    <option value="103" >포도씨</option>
                    <option value="104" >포스콜린</option>
                    <option value="105" >폴리코사놀</option>
                    <option value="106" >프로바이오틱스</option>
                    <option value="107" >프리바이오틱스</option>
                    <option value="108" >프로폴리스</option>
                   
                    <option value="109" >하프물범오일</option>
                    <option value="110" >화분</option>
                    <option value="111" >활성탄소</option>
                    <option value="112" >헴프씨오일</option>
                    <option value="113" >호박씨</option>
                    <option value="114" >효모</option>
                    <option value="115" >효소</option>
                    <option value="116" >히알우론산</option>
                    <option value="117" >비폴렌</option>
                    <option value="118" >새싹보리</option>
                    <option value="119" >아티초크</option>
              
                    </select>
                    <button type="button" class="search">검색</button>
                    <p>*중복가능</p>
                </div>
    
    <fieldset id="field2">
        <p>정렬<br></p>        
        <input class="sort" type="button" name="sort" value="가격" >
        <input class="sort" type="button" name="sort" value="이름" >
        <input class="sort" type="button" name="sort" value="용량" >
        <input class="sort" type="button" name="sort" value="인기" >
        <input class="sort" type="button" name="sort" value="후기" >
    </fieldset>


    </div>
    <div id="main2">
        <fieldset id="field3">
            <ul>
                <li><h3>상품1</h3></li>
                <li><img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img"></li>
                <li>가격 100000~150000</li>
                <li>옵션: (태그)(태그)(태그)</li>
                <li>효능: (간)(심장)(머리)</li>
                <li>후기 <a id="review">(1)</a></li>

            </ul>      
             <button type="button" class="view">상세보기</button>  
  
        </fieldset>



    </div>
  
</div>

</body>
</html>