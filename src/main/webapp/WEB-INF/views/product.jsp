<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link href="<c:url value="/resources/css/product.css"/>" rel='stylesheet' />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body>
    <div id="con">
    <div id="header"><h1>맞춤 영양제</h1></div>
    <div id="main">
        <h3>우선순위 설정</h3>

    <fieldset id="field">        
        <ul id="tag-list" style="list-style-type: decimal;"></ul>
    </fieldset>
    
    <fieldset id="field2">        
        <input class="tagBox" type="button" name="tagBox" value="#Fatigue" >
	    <input class="tagBox" type="button" name="tagBox" value="#Skin" >
	    <input class="tagBox" type="button" name="tagBox" value="#Antioxidant" >
	    <input class="tagBox" type="button" name="tagBox" value="#Gut&Bowel" >
	    <input class="tagBox" type="button" name="tagBox" value="#Diet" >
	    <input class="tagBox" type="button" name="tagBox" value="#Bone&Joint" >
	    <input class="tagBox" type="button" name="tagBox" value="#PregnantWomen" >
	    <input class="tagBox" type="button" name="tagBox" value="#Baby&Kids" >
	    <input class="tagBox" type="button" name="tagBox" value="#Eyes" >
	    <input class="tagBox" type="button" name="tagBox" value="#Liver" >
	    <input class="tagBox" type="button" name="tagBox" value="#Diabetes" >
	    <input class="tagBox" type="button" name="tagBox" value="#BloodPressure" >
	    <input class="tagBox" type="button" name="tagBox" value="#Menopause" >
	    <input class="tagBox" type="button" name="tagBox" value="#Women" > 
	    <input class="tagBox" type="button" name="tagBox" value="#Men&Prostate" >
	    <input class="tagBox" type="button" name="tagBox" value="#Hormone" >
	    <input class="tagBox" type="button" name="tagBox" value="#HairLoss" >
	    <input class="tagBox" type="button" name="tagBox" value="#Rhinitis" >
	    <input class="tagBox" type="button" name="tagBox" value="#Brain" >
	    <input class="tagBox" type="button" name="tagBox" value="#Stomach" >
	    <input class="tagBox" type="button" name="tagBox" value="#Other" >
    </fieldset>

     
        
    <fieldset id="field3">
        <h3>가격설정</h3>
        <input id="priceMin" type="text" name="tag" size="3" placeholder="0" >
        <p>~</p>
        <input id="priceMax" type="text" name="tag" size="3" placeholder="1,000,000" >
    </fieldset>
    <button type="button" id="search">검색</button>



    </div>
    <div id="main2">



    </div>
  
</div>



<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
        
            $(document).ready(function () {
                var tag = {};
                var counter = 0;
                
                function addTagToList(tagValue) {
                    // 중복되는 태그인지 확인
                    var result = Object.values(tag).filter(function (word) {
                        return word === tagValue;
                    });

                    if (result.length === 0) {
                        $("#tag-list").append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'> x</span></li>");
                        addTag(tagValue);
                    } else {
                        alert("태그값이 중복됩니다.");
                    }
                }
                $(document).on("mouseenter", ".del-btn", function () {
                    $(this).css("cursor", "pointer"); // 마우스 커서를 손가락 모양(pointer)으로 변경
                });
                function getTagListValues() {
                    var tagValues = [];
                    $("#tag-list .tag-item").each(function () {
                        var value = $(this).text().trim(); // 태그 아이템의 값 가져오기
                        value = value.trim().replace(/^[\s#]+|[\s#]+$/g, '');
                        value = value.trim().replace(/\sx$/g, '');
                        tagValues.push(value);
                    });
                    return tagValues;
                }
                // Field2의 각 태그 버튼 클릭 시 이벤트 핸들러
                $("#field2 .tagBox").on("click", function () {
                    var tagValue = $(this).val(); // 클릭된 태그의 값 가져오기
                    addTagToList(tagValue); // 태그를 태그 리스트에 추가
                });
                
                
                
                
                
                
                
                
                // 입력한 값을 태그로 생성한다.
                function addTag (value) {
                    tag[counter] = value;
                    counter++; // del-btn 의 고유 id 가 된다.
                }
        
                
                
                
                
                
                
                // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
                function marginTag () {
                    return Object.values(tag).filter(function (word) {
                        return word !== "";
                    });
                }
            
              
                $("#search").on("click", function () {
                    var tagListValues = getTagListValues(); // 태그 리스트의 값들 가져오기
                    var priceMinValue = $("#priceMin").val(); // priceMin 값 가져오기
                    var priceMaxValue = $("#priceMax").val(); // priceMax 값 가져오기
                    console.log("Tag List Values:", tagListValues);
                    console.log("Price Min Value:", priceMinValue);
                    console.log("Price Max Value:", priceMaxValue);
                    // AJAX를 사용하여 Spring 컨트롤러로 데이터를 전송
                    $.ajax({
                        type: "POST",
                        url: "./custom", // Spring 컨트롤러의 엔드포인트 URL
                        contentType: "application/json",
                        data: JSON.stringify({
                            tags: tagListValues,
                            priceMin: priceMinValue,
                            priceMax: priceMaxValue,
                        }), // 태그 값과 priceMin, priceMax를 JSON 형식으로 변환하여 전송
                        success: function (response) {
                            // 성공적으로 데이터를 전송한 후 수행할 작업
                            console.log("태그 값 및 가격 전송 성공");
                            var main2Div = $("#main2");
                            
                            // response는 서버에서 받은 JSON 데이터를 나타냅니다.
                            for (var i = 0; i < response.length; i++) {
    var productList = response[i];
    var fieldset = $("<fieldset id='field" + (i + 4) + "'>");
    var productName = '';
    var productPrice = 0;
    var productIngredient = '';
    var productEfficacy = '';

    for (var j = 0; j < productList.length; j++) {
        var product = productList[j];

       
        if (j > 0) {
            productName += ' + ';
            productIngredient += ', '; 
        }
        productName += product.name;
        productPrice += product.price;
        productIngredient += product.ingredient; 
        if (!productEfficacy.includes('#' + product.efficacy)) {
            productEfficacy += '#' + product.efficacy + ' ';
        }
    }

    var productInfo = "<p>추천 조합: " + productName + "</p>" +
                      "<p>총 가격: " + productPrice + " ~ </p>" +
                      "<p>성분: " + productIngredient + "</p>" +
                      "<p>효능: " + productEfficacy + "</p>";

    fieldset.append(productInfo);

    // 상품 정보가 담긴 fieldset을 main2Div에 추가
    main2Div.append(fieldset);
}
                        }
                            ,
                        error: function (error) {
                            // 데이터 전송 중 오류가 발생한 경우 처리
                            console.error("태그 값 및 가격 전송 중 오류:", error);
                        }
                    });
                });
                // 삭제 버튼 
                // 인덱스 검사 후 삭제
                $(document).on("click", ".del-btn", function (e) {
                    var index = $(this).attr("idx");
                    tag[index] = "";
                    $(this).parent().remove();
                });
        })
        </script>
</body>
</html>
