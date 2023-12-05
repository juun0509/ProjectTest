<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>
		Hello world!  
	</h1>

	<P>  The time on the server is ${serverTime}. </P>
	<div class="form-group">
  		<input class="form-control" placeholder="이메일을 입력해주세요." name="email" id="email" type="email" autofocus>
	    <div style="display: block; text-align: right;">
	      <input type="button" value="인증하기" class="btn btn-primary" id="emailAuth">
	    </div>
	  	<input class="form-control" placeholder="인증 코드 6자리를 입력해주세요." maxlength="6" disabled="disabled" name="authCode" id="authCode" type="text" autofocus>
	  	<span id="emailAuthWarn"></span>
	</div>
	<input type="submit" value="회원가입" class="btn btn-lg btn-success btn-block" id="registerBtn" disabled="disabled">
	<script>
	//인증하기 버튼을 눌렀을 때 동작
		$("#emailAuth").click(function() {
	    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
	    		
	    	//Ajax로 전송
	        $.ajax({
	        	url : './EmailAuth',
	        	data : {
	        		email : email
	        	},
	        	type : 'POST',
	        	dataType : 'json',
	        	success : function(result) {
	        		console.log("result : " + result);
	        		$("#authCode").attr("disabled", false);
	        		code = result;
	        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
	       		}
	        }); //End Ajax
	    });
	
		//인증 코드 비교
	    $("#authCode").on("focusout", function() {
	    	const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
	    	
	    	console.log("입력코드 : " + inputCode);
	    	console.log("인증코드 : " + code);
	    		
	    	if(Number(inputCode) === code){
	        	$("#emailAuthWarn").html('인증번호가 일치합니다.');
	        	$("#emailAuthWarn").css('color', 'green');
	    		$('#emailAuth').attr('disabled', true);
	    		$('#email').attr('readonly', true);
	    		$("#registerBtn").attr("disabled", false);
	    	}else{
	        	$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
	        	$("#emailAuthWarn").css('color', 'red');
	        	$("#registerBtn").attr("disabled", true);
	    	}
	    });
	</script>
</body>
</html>
