<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/domain/resources/css/SignUp.css">
</head>
<body>
	<div id="logo" onclick="location.replace('minipro.html')"><h1><b id="yy">tonic</b><b id="jj">bank</b></h1></div>
    <p id="please">토닉뱅크 서비스 이용을 위해 필요한 정보를 입력해주세요.</p>
    <form action="#" id="signup" onsubmit="return formCheck(this)">
        <ul>
            <li>
                <label for="id"><img src="/domain/resources/img/아이디.png"></label>
                <input id="id" name="id" type="text" placeholder="아이디 3~16자리 영문자/숫자, 영문자는 반드시 포함" onblur="inputCheck(this)">&nbsp;&nbsp;
                <div id="msgId" class="msg"></div>
            </li>
            <li>
                <label for="pwd"><img src="/domain/resources/img/비번.png"></label>
                <input id="pwd" name="pwd" type="password" placeholder="비밀번호 8~20자리 영문자/숫자/특수문자" onblur="inputCheck(this)">&nbsp;&nbsp;
                <div id="msgPwd" class="msg"></div>
            </li>
            <li>
                <label for="pwc"><img src="/domain/resources/img/비번.png"></label>
                <input id="pwc" name="pwc" type="password" placeholder="비밀번호 확인" onblur="inputCheck(this)">&nbsp;&nbsp;
                <div id="msgPwc" class="msg"></div>
            </li>
  
            <li>
                <label for="nick"><img src="/domain/resources/img/아이디.png"></label>
                <input id="nick" name="nick" type="text"  placeholder="닉네임 2~10자리 한글/영문자/숫자" onblur="inputCheck(this)">&nbsp;&nbsp;
                <div id="msgNick" class="msg"></div>
            </li>
            <li>
                <label for="email"><img src="/domain/resources/img/이메일.png" id="mail"></label>
                <input id="email" name="email" type="email" placeholder="이메일 abcd@domain.com" onblur="inputCheck(this)">
                <button type="button" id="send">코드발송</button>
                <div id="msgEmail" class="msg"></div>
            </li>
            <li>
                <label for="auth_code"></label>
                <input id="auth_code" name="auth_code" type="text" placeholder="인증코드" disabled="disabled">
                <button type="button" id="confirm">확인</button>&nbsp;&nbsp;
                <div id="msgAuth_code"></div>
            </li>
        </ul>
	    <button type="submit" id="submit">회원가입</button>
	    <button type="reset" id="reset">취소하기</button>
	</form>
	<script>
		function inputCheck(input) {
			console.log(input.name)
	        const fieldName = input.name;
	        const fieldValue = input.value;
	        const msgElement = $('#msg' + fieldName.charAt(0).toUpperCase() + fieldName.slice(1));
	        
	        switch(fieldName) {
	            case 'id':
	                // ID에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                	$(msgElement).text('ID를 입력하세요.');
	                } else {
	                	$(msgElement).text('');
	                }
	                break;
	            case 'pwd':
	                // 비밀번호에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                    msgElement.text('비밀번호를 입력하세요.');
	                } else {
	                	msgElement.text('');
	                }
	                break;
	            case 'pwc':
	                // 비밀번호 확인에 대한 유효성 검사
	                if (fieldValue !== $('#pwd').val()) {
	                    msgElement.text('비밀번호가 일치하지 않습니다.');
	                } else {
	                	msgElement.text('');
	                }
	                break;
	            case 'nick':
	                // 닉네임에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                    msgElement.text('닉네임을 입력하세요.');
	                } else {
	                	msgElement.text('');
	                }
	                break;
	            case 'email':
	                // 이메일에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                    msgElement.text('이메일을 입력하세요.');
	                } else {
	                	msgElement.text('');
	                }
	                break;
	            case 'auth_code':
	                // 인증코드에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                    msgElement.text('인증코드를 입력하세요.');
	                } else {
	                	msgElement.text('');
	                }
	                break;
	
	            default:
	                // 기본적으로 메시지를 초기화
	            	msgElement.text('');
        	} // end switch
	        return msgElement.text() === '';
		} // end inputCheck
		
		 // 폼 전체 유효성 검사 함수
	    function formCheck(frm) {
	        // 모든 입력 필드에 대한 유효성 검사
	        const idValid = inputCheck(frm.id);
	        const pwdValid = inputCheck(frm.pwd);
	        const pwcValid = inputCheck(frm.pwc);
	        const nickValid = inputCheck(frm.nick);
	        const emailValid = inputCheck(frm.email);
	        const codeValid = inputCheck(frm.auth_code);

	        // 모든 검사를 통과한 경우에만 회원가입 버튼 활성화
	        if (idValid && pwdValid && pwcValid && nickValid && emailValid && codeValid) {
	            return true; // 폼 제출 허용
	        } else {
	            return false; // 폼 제출 거부
	        }
	    }
	    
		//인증하기 버튼을 눌렀을 때 동작
		$("#send").click(function() {
	    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
	    		
	    	//Ajax로 전송
	        $.ajax({
	        	url : '/domain/EmailAuth',
	        	data : {
	        		email : email
	        	},
	        	type : 'POST',
	        	dataType : 'json',
	        	success : function(result) {
	        		console.log("result : " + result);
	        		$("#auth_code").attr("disabled", false);
	        		code = result;
	        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
	       		}
	        }); //end Ajax
	    });
	
		//인증 코드 비교
	    $("#auth_code").on("focusout", function() {
	    	const inputCode = $("#auth_code").val(); //인증번호 입력 칸에 작성한 내용 가져오기
	    	
	    	console.log("입력코드 : " + inputCode);
	    	console.log("인증코드 : " + code);
	    		
	    	if(Number(inputCode) === code){
	        	$("#msgAuth_code").html('인증번호가 일치합니다.');
	        	$("#msgAuth_code").css('color', 'green');
	    		$('#send').attr('disabled', true);
	    		$('#email').attr('readonly', true);
	    		$("#registerBtn").attr("disabled", false);
	    	}else{
	        	$("#msgAuth_code").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
	        	$("#msgAuth_code").css('color', 'red');
	        	$("#registerBtn").attr("disabled", true);
	    	}
	    });
	</script>
</body>
</html>