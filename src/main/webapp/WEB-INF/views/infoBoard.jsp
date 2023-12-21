<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/tonicbank/resources/css/infoBoard.css">
</head>
<body>
<div id=board>
            <h1>정보게시판</h1>

            <form id="searchList">
                <img src="/tonicbank/resources/img/돋보기.png">
                <input type="text" name="keyword" value="${ph.sc.keyword}" placeholder="영양제를 검색해보세요">
                <button id="sBtn">검색</button>
              
            </form>
        
            <div class="tagList">

        
                    <input class="tag" type="button" value="DHA">
					<input class="tag" type="button" value="Hawthorn">
					<input class="tag" type="button" value="MSM">
					<input class="tag" type="button" value="NAC">
					<input class="tag" type="button" value="Garcinia">
					<input class="tag" type="button" value="Gamma-linolenicAcid">
					<input class="tag" type="button" value="Turmeric (Curcumin)">
					<input class="tag" type="button" value="Cinnamon">
					<input class="tag" type="button" value="ChineseMatrimonyVine">
					<input class="tag" type="button" value="Glucosamine">
					<input class="tag" type="button" value="Nattokinase">
					<input class="tag" type="button" value="Noni">
					<input class="tag" type="button" value="Green-lippedMussel">
					<input class="tag" type="button" value="DeerAntler">
					<input class="tag" type="button" value="Kelp">
					<input class="tag" type="button" value="Night-bloomingCereusSeedOil">
					<input class="tag" type="button" value="Cordyceps">
					<input class="tag" type="button" value="Lycopene">
					<input class="tag" type="button" value="RoyalJelly">
					<input class="tag" type="button" value="Lutein">
					<input class="tag" type="button" value="Ribose">
					<input class="tag" type="button" value="R-lipoicAcid">
					<input class="tag" type="button" value="Magnesium">
					<input class="tag" type="button" value="ManukaHoney">
					<input class="tag" type="button" value="Garlic">
					<input class="tag" type="button" value="Maca">
					<input class="tag" type="button" value="Manganese">
					<input class="tag" type="button" value="Melatonin">
					<input class="tag" type="button" value="Moringa">
					<input class="tag" type="button" value="Mineral">
					<input class="tag" type="button" value="MilkThistle">
					<input class="tag" type="button" value="Multivitamin">
					<input class="tag" type="button" value="Multivitamin">
					<input class="tag" type="button" value="EffervescentVitamin">
					<input class="tag" type="button" value="VitaminA">
					<input class="tag" type="button" value="VitaminB Complex">
					<input class="tag" type="button" value="VitaminC">
					<input class="tag" type="button" value="VitaminD">
					<input class="tag" type="button" value="VitaminE">
					<input class="tag" type="button" value="VitaminK">
					<input class="tag" type="button" value="Biotin">
					<input class="tag" type="button" value="MushroomExtract">
					<input class="tag" type="button" value="ImmuneBacterialComplex">
					<input class="tag" type="button" value="Bioflavonoids">
					<input class="tag" type="button" value="Beta-Carotene">
					<input class="tag" type="button" value="BorageOil">
					<input class="tag" type="button" value="Boswellia (Frankincense)">
					<input class="tag" type="button" value="Broccoli">
					<input class="tag" type="button" value="BlackCherry">
					<input class="tag" type="button" value="Blueberry">
					<input class="tag" type="button" value="Bilberry">
					<input class="tag" type="button" value="SharkCartilage">
					<input class="tag" type="button" value="FishOil">
					<input class="tag" type="button" value="Pomegranate">
					<input class="tag" type="button" value="Serrapeptase">
					<input class="tag" type="button" value="Selenium">
					<input class="tag" type="button" value="Spirulina">
					<input class="tag" type="button" value="Sulfur">
					<input class="tag" type="button" value="DietaryFiber">
					<input class="tag" type="button" value="SawPalmetto">
					<input class="tag" type="button" value="SachaInchi">
					<input class="tag" type="button" value="AroniaBerry">
					<input class="tag" type="button" value="Arginine">
					<input class="tag" type="button" value="Amaranth">
					<input class="tag" type="button" value="AminoAcid">
					<input class="tag" type="button" value="AcaiBerry">
					<input class="tag" type="button" value="Astaxanthin">
					<input class="tag" type="button" value="Zinc">

            </div>
        
        
              
             

          
           
        </div>   
           
           
</body>
</html>
