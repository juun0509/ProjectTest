<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/tonicbank/resources/css/infoView.css">
</head>
<body>
	<div id=board>
		<h1>${ infoBoard.name }</h1>
		<div id="content">
			<p>${ infoBoard.content }</p>
		</div>

		<div id="intake">
			<h2>권장 섭취량(성인기준)</h2>
			<p></p>
		</div>
		<div id="intake2">
			<p>상한섭취량</p>
			<div id="intakeData" width="1200px">
				<div id="data"></div>
			</div>
			<p class="start">0</p>
			<p>10,000mg</p>

		</div>


		<div id="remind">
			<h2>주의사항</h2>
			<ul>
			</ul>

		</div>

	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			
			let strRecIntake = "${ infoBoard.recIntake }";
			let recIntake = strRecIntake.split(',');
			let tmpRecIntake = "";
			let max = 0;
			if (recIntake.length == 1) {
				tmpRecIntake = recIntake[0] + "mg";
				max = recIntake[0];
			} else {
				tmpRecIntake = recIntake[0] + "mg ~ " + recIntake[1] + "mg";
				max = recIntake[1];
			}
			
			document.querySelector('#intake > p').innerHTML = tmpRecIntake;
			document.querySelector('#data').style.width = 1200 / (10000 / max) + "px";
			
			let strPrecautions = `${ infoBoard.precautions }`;
			let precautions = strPrecautions.split('\n');
			
			precautions.forEach(function(precaution) {
				let newElement = document.createElement('li');
				newElement.textContent = precaution;
				
				document.querySelector('#remind > ul').appendChild(newElement);
			});
			
		});
	</script>
</body>
</html>