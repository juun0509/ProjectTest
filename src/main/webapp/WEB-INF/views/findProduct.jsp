<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/tonicbank/resources/css/findProduct.css">
</head>
<body>
    <div id="con">
    <div id="header"><h1>상품 찾기</h1> <button type="button">맞춤영양제 알아보기→</button> </div>
    <div id="main">

        <div id="sel">
            <select class="selTag" id="selTag" title="select">
          <option value="" selected>Tag selection</option>
				<option value="Fatigue&immune">피로&면역</option>
				<option value="Skin">피부</option>
				<option value="Antioxidant">항산화</option>
				<option value="Intestine&bowel movement">장&배변</option>
				<option value="Diet">다이어트</option>
				<option value="Bone&joint">뼈&관절</option>
				<option value="Pregnant women">임산부</option>
				<option value="Baby&kids">베이비&키즈</option>
				<option value="Eye">눈</option>
				<option value="Liver">간</option>
				<option value="Diabetes">당뇨</option>
				<option value="BloodPressure">혈압</option>
				<option value="Menopause">갱년기</option>
				<option value="Women">여성</option>
				<option value="Men&prostate">남성&전립선</option>
				<option value="Hormone">호르몬</option>
				<option value="HairLoss">탈모</option>
				<option value="Rhinitis">비염</option>
				<option value="Brain">뇌</option>
				<option value="Stomach">위</option>
				<option value="BloodVessel">혈관</option>
				<option value="Tooth">치아</option>
				<option value="Other">기타</option>

            </select>
           
                <select class="selTag" id="selTag2" title="select">
                    <option value="" selected>성분선택</option>
                   <option value="CLA">CLA</option>
							<option value="DHA">DHA</option>
							<option value="Hawthorn">Hawthorn</option>
							<option value="MSM">MSM</option>
							<option value="NAC">NAC</option>
							<option value="Garcinia">가르시니아</option>
							<option value="Gamma-linolenicAcid">감마리놀렌산</option>
							<option value="Turmeric (Curcumin)">강황(커큐민)</option>
							<option value="Cinnamon">계피</option>
							<option value="ChineseMatrimonyVine (Wolfberry)">구기자(고지)</option>
							<option value="Glucosamine">글루코사민</option>
							<option value="Nattokinase">나토키나제</option>
							<option value="Noni">노니</option>
							<option value="Green-lippedMussel">녹색입홍합</option>
							<option value="DeerAntler">녹용</option>
							<option value="Kelp">다시마-켈프</option>
							<option value="Night-bloomingCereusSeedOil">달맞이꽃종자유</option>
							<option value="Cordyceps">동충하초</option>
							<option value="Lycopene">라이코펜</option>
							<option value="RoyalJelly">로얄제리</option>
							<option value="Lutein">루테인</option>
							<option value="Ribose">리보스</option>
							<option value="R-lipoicAcid">리프리놀</option>
							<option value="Magnesium">마그네슘</option>
							<option value="ManukaHoney">마누카꿀</option>
							<option value="Garlic">마늘</option>
							<option value="Maca">마카</option>
							<option value="Manganese">망간</option>
							<option value="Melatonin">멜라토닌</option>
							<option value="Moringa">모링가</option>
							<option value="Mineral">미네랄</option>
							<option value="MilkThistle">밀크씨슬</option>
							<option value="Multivitamin">종합비타민</option>
							<option value="Multivitamin">멀티비타민</option>
							<option value="EffervescentVitamin">발포비타민</option>
							<option value="VitaminA">비타민A</option>
							<option value="VitaminB Complex">비타민B Complex</option>
							<option value="VitaminC">비타민C</option>
							<option value="VitaminD">비타민D</option>
							<option value="VitaminE">비타민E</option>
							<option value="VitaminK">비타민K</option>
							<option value="Biotin">비오틴</option>
							<option value="MushroomExtract">버섯균사체</option>
							<option value="ImmuneBacterialComplex">면역균사체</option>
							<option value="Bioflavonoids">바이오플라보노이드</option>
							<option value="Beta-Carotene">베타카로틴</option>
							
							<option value="BorageOil">보라지 오일</option>
							<option value="Boswellia (Frankincense)">보스웰리아(유향)</option>
							<option value="Broccoli">브로컬리</option>
							<option value="BlackCherry">블랙체리</option>
							<option value="Blueberry">블루베리</option>
							<option value="Bilberry">빌베리</option>
							<option value="SharkCartilage">상어연골</option>
							<option value="FishOil">생선오일</option>
							<option value="Pomegranate">석류</option>
							<option value="Serrapeptase">세라펩타제</option>
							<option value="Selenium">셀레늄</option>
							<option value="Spirulina">스피루리나</option>
							<option value="Sulfur">식이유황</option>
							<option value="DietaryFiber">식이섬유</option>
							<option value="SawPalmetto">쏘팔메토</option>
							<option value="SachaInchi">씨벅손</option>
							<option value="AroniaBerry">아로니아베리</option>
							<option value="Arginine">아르기닌</option>
							<option value="Amaranth">아마씨</option>
							<option value="AminoAcid">아미노산</option>
							<option value="AcaiBerry">아사이베리</option>
							<option value="Astaxanthin">아스타잔틴</option>
							<option value="Zinc">아연</option>
							
							              
                    </select>

                    <input type="text" id="pname" placeholder="상품명을 입력하세요.">
                    <button type="button" class="search" onclick="send()">검색</button>


                    <p>*중복가능</p>
                </div>
    
    <fieldset id="field2">
        <p>정렬<br></p>        
  <input class="sort" type="button" name="sort" value="가격 높은 순" onclick="sortPro(this)">
  <input class="sort" type="button" name="sort" value="가격 낮은 순" onclick="sortPro(this)">
  
<input class="sort" type="button" name="sort" value="이름" onclick="sortPro(this)">
<input class="sort" type="button" name="sort" value="인기" onclick="sortPro(this)">
<input class="sort" type="button" name="sort" value="리뷰" onclick="sortPro(this)">

    </fieldset>


    </div>
    <div id="main2">

        <fieldset class="field3">
        	<ul>
                <li><h3>상품1</h3></li>
                <li><img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img"></li>
                <li>가격 100000~150000</li>
                <li>옵션: (태그)(태그)(태그)</li>
                <li>효능: (간)(심장)(머리)</li>
                <li>후기 <a id="review">(1)</a></li>
    		</ul>
        </fieldset>
    </div>
  
</div>


		<script type="text/javascript">
		
			   var productList = [];
		
		function convertToEnglish(koreanValue) {
			  let englishValue = "";
			  switch (koreanValue) {
			    case "가격 높은 순":
			      englishValue = "priceDesc";
			      break;
			    case "가격 낮은 순":
				      englishValue = "priceAsc";
				      break;
			    case "이름":
			      englishValue = "name";
			      break;
			    case "인기":
			      englishValue = "up";
			      break;
			    case "리뷰":
			      englishValue = "review";
			      break;
			    default:
			      break;
			  }
			  return englishValue;
			}
		function send() {
			  var efficacy = document.getElementById('selTag').value;
			  var ingredient = document.getElementById('selTag2').value;
			  var name = document.getElementById('pname').value;

			 
			    $.ajax({
			      type: "POST",
			      url: "./product/find",
			      contentType: "application/json",
			      data: JSON.stringify({
			    	  name:name,
			        efficacy: efficacy,
			        ingredient: ingredient
			      }),
			      success: function(response) {
			    	  console.log("ajax 성공");
			    	  productList = [];
			    	  var mainDiv = document.getElementById('main2');
					    while (mainDiv.firstChild) {
					        mainDiv.removeChild(mainDiv.firstChild);
					    }

			    	    response.forEach(function(item) {
			    	    	var effic = item.efficacy.split(' ').map(function(token) {
			    	    	    return '#' + token;
			    	    	  }).join(' ');

			    	    	  var ingre = item.ingredient.split(' ').map(function(token) {
			    	    	    return '#' + token;
			    	    	  }).join(' ');
			    	    	
			    	      var product = {
			    	        name: item.name,
			    	        price: item.price,
			    	        efficacy: effic,
					        ingredient: ingre,
					        review: item.review
			    	      };
			    	      productList.push(product);
			    	    });
			    	    console.log(productList);
			    	    productList.forEach(function(product) {
			                // field3 요소 생성
			                var fieldset = document.createElement('fieldset');
			                fieldset.setAttribute('id', 'field3');
			                // fieldset에 내용 추가
			                var productName = product.name;
			                var productPrice = product.price+' ~';
			                var productIngredient = product.ingredient;
			                var productEfficacy = product.efficacy;
			                var productReview = product.review;
			                var productUp = product.up;
			                if(productReview===null) productReview='0';

			                var ul = document.createElement('ul');
			                ul.innerHTML = '<li><h3>' + productName + '</h3></li>' +
			                '<li><img src="/tonicbank/resources/img/slide1.jpg" alt="" class="img"></li>' +
			                '<li>가격: ' + productPrice + '</li>' +
			                '<li>성분: ' + productIngredient + '</li>' +
			                '<li>효능: ' + productEfficacy + '</li>' +
			                '<li>후기 <a id="review">' + productReview + '</a></li>'
			                '<li>추천: ' + productUp + '</li>';

			                // fieldset에 ul을 추가
			                fieldset.appendChild(ul);

			                // main2에 fieldset 추가
			                var mainDiv = document.getElementById('main2');
			                mainDiv.appendChild(fieldset);
			            });
			    	  
			      },
			      error: function(xhr, status, error) {
			    	  console.log("ajax 오류");
			    	  
			      }
			    });
			  
			}
		
		
		function sortPro(button) {
			  const sort = convertToEnglish(button.value);
			  var mainDiv = document.getElementById('main2');
			    while (mainDiv.firstChild) {
			        mainDiv.removeChild(mainDiv.firstChild);
			    }
			 
				    switch (sort) {
				        case 'priceDesc':
				            productList.sort((a, b) => b.price - a.price);
				            break;
				        case 'priceAsc':
				            productList.sort((a, b) => a.price - b.price);
				            break;
				        case 'name':
				            productList.sort((a, b) => a.name.localeCompare(b.name));
				            break;
				        case 'review':
				            productList.sort((a, b) => b.review - a.review);
				            break;
				        case 'up':
				            productList.sort((a, b) => b.up - a.up);
				            break;
				        default:
				            // 오류 처리 또는 기본값 설정
				            break;
				    }

				  
				
			  productList.forEach(function(product) {
	                // field3 요소 생성
	                var fieldset = document.createElement('fieldset');
	                fieldset.setAttribute('id', 'field3');
	                // fieldset에 내용 추가
	                var productName = product.name;
	                var productPrice = product.price+' ~';
	                var productIngredient = product.ingredient;
	                var productEfficacy = product.efficacy;
	                var productReview = product.review;
	                var productUp = product.up;
	                if(productReview===null) productReview='0';

	                var ul = document.createElement('ul');
	                ul.innerHTML = '<li><h3>' + productName + '</h3></li>' +
	                '<li><img src='+ '/tonicbank/resources/img/'+productName+'.jpg'+' alt="" class="img"></li>' +
	                '<li>가격: ' + productPrice + '</li>' +
	                '<li>성분: ' + productIngredient + '</li>' +
	                '<li>효능: ' + productEfficacy + '</li>' +
	                '<li>후기 <a id="review">' + productReview + '</a></li>'
	                '<li>추천: ' + productUp + '</li>';

	                // fieldset에 ul을 추가
	                fieldset.appendChild(ul);

	                // main2에 fieldset 추가
	                var mainDiv = document.getElementById('main2');
	                mainDiv.appendChild(fieldset);
	            });
			}
		</script>


</body>
</html>
