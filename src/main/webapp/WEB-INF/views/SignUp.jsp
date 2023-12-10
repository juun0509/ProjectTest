<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/domain/resources/css/SignUp.css">
</head>
<body>
	<div id="logo"><a href="<c:url value='/'/>"><h1><b id="yy">tonic</b><b id="jj">bank</b></h1></a></div>
    <p id="please">토닉뱅크 서비스 이용을 위해 필요한 정보를 입력해주세요.</p>
    <form action='<c:url value="/signUp/join"/>' method="post" id="signup" onsubmit="return formCheck(this)">
        <ul>
            <li>
                <label for="userId"><img src="/domain/resources/img/아이디.png"></label>
                <input id="userId" name="userId" type="text" placeholder="아이디 3~16자리 영문자/숫자, 영문자는 반드시 포함" onblur="inputCheck(this)">&nbsp;&nbsp;
                <span id="msgUserId" class="msg"></span>
            </li>
            <li>
                <label for="pwd"><img src="/domain/resources/img/비번.png"></label>
                <input id="pwd" name="pwd" type="password" placeholder="비밀번호 8~20자리 영문자/숫자/특수문자" onblur="inputCheck(this)">&nbsp;&nbsp;
                <span id="msgPwd" class="msg"></span>
            </li>
            <li>
                <label for="pwc"><img src="/domain/resources/img/비번.png"></label>
                <input id="pwc" name="pwc" type="password" placeholder="비밀번호 확인" onblur="inputCheck(this)">&nbsp;&nbsp;
                <span id="msgPwc" class="msg"></span>
            </li>
  
            <li>
                <label for="nick"><img src="/domain/resources/img/아이디.png"></label>
                <input id="nick" name="nick" type="text"  placeholder="닉네임 2~10자리 한글/영문자/숫자" onblur="inputCheck(this)">&nbsp;&nbsp;
                <span id="msgNick" class="msg"></span>
            </li>
            <li>
                <label for="email"><img src="/domain/resources/img/이메일.png" id="mail"></label>
                <input id="email" name="email" type="email" placeholder="이메일 abcd@domain.com" onblur="inputCheck(this)">
                <!-- 인증코드가 성공적으로 발송될 경우 email 입력 받는 태그는 읽기만 가능한 속성으로 바뀜 -->
                <button type="button" id="send">코드발송</button>
                <span id="msgEmail" class="msg"></span>
            </li>
            <li>
                <label for="auth_code"></label>
                <input id="auth_code" name="auth_code" type="text" placeholder="인증코드" disabled="disabled">
                <!-- 확인버튼을 눌렀을 때 인증코드가 일치하면 인증코드 입력란과 코드발송 버튼은 잠김 -->
                <button type="button" id="confirm" name="confirm">확인</button>&nbsp;&nbsp;
                <span id="msgConfirm"></span>
            </li>
        </ul>
	    <button type="submit" id="submit">회원가입</button>
	    <!-- 취소하기 버튼을 누르면 이메일 관련 요소들은 모두 초기화 -->
	    <button type="reset" id="reset">취소하기</button>
	</form>
	<script>
		//아이디 중복확인
		function duplId(fieldValue, callback) {
		    $.ajax({
		        url: "/domain/signUp/duplId",
		        type: "POST",
		        dataType: "json",
		        data: { userId: fieldValue },
		        success: function (result) {
		        	console.log('result:'+result)
		            // 콜백 함수 호출 시 불리언 값을 전달
		            callback(result == 1);
		        }
		    });
		}
		
		//닉네임 중복확인
		function duplNick(fieldValue, callback) {
		    $.ajax({
		        url: "/domain/signUp/duplNick",
		        type: "POST",
		        dataType: "json",
		        data: { nick: fieldValue },
		        success: function (result) {
		        	console.log('result:'+result)
		            // 콜백 함수 호출 시 불리언 값을 전달
		            callback(result == 1);
		        }
		    });
		}
		
		// 각각 input에서 커서가 벗어났을 때 유효성 검사
		function inputCheck(input) {
	        const fieldName = input.name;
	        const fieldValue = input.value;
	        const msgElement = $('#msg' + fieldName.charAt(0).toUpperCase() + fieldName.slice(1));
	        
	        switch(fieldName) {
	            case 'userId':
	                // ID에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                	$(msgElement).text('ID를 입력하세요.');
	                } else if (!/^[a-zA-Z0-9]{3,16}$/.test(fieldValue)) {
	                    msgElement.text('아이디는 3~16자리 영문자 또는 숫자이어야 합니다.');
	                } else if (!/[a-zA-Z]/.test(fieldValue)) {
	                    msgElement.text('아이디에는 영문자가 반드시 포함되어야 합니다.');
	                } else {
	                    // 비동기 함수 호출 및 콜백 함수로 결과 처리
	                    duplId(fieldValue, function (isDuplicate) {
	                    	console.log(isDuplicate);
	                        if (isDuplicate) {
	                            msgElement.text('중복된 아이디가 있습니다.');
	                        } else {
	                            msgElement.text('');
	                        }
	                    });
	                }
	                break;
	            case 'pwd':
	                // 비밀번호에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                    msgElement.text('비밀번호를 입력하세요.');
	                } else if (!/^[a-zA-Z0-9!@#$%^&*()_-]{8,20}$/.test(fieldValue)) {
	                    msgElement.text('비밀번호는 8~20자리 영문자, 숫자, 특수문자 중 1개 이상을 포함해야 합니다.');
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
	                } else if (!/^[a-zA-Z0-9가-힣]{2,10}$/.test(fieldValue)) {
	                    msgElement.text('닉네임은 2~10자리 한글, 영문자, 숫자 중 1개 이상을 포함해야 합니다.');
	                } else {
	                    // 비동기 함수 호출 및 콜백 함수로 결과 처리
	                    duplNick(fieldValue, function (isDuplicate) {
	                    	console.log(isDuplicate);
	                        if (isDuplicate) {
	                            msgElement.text('중복된 닉네임이 있습니다.');
	                        } else {
	                            msgElement.text('');
	                        }
	                    });
	                }
	                break;
	            case 'email':
	                // 이메일에 대한 유효성 검사
	                if (fieldValue.length == 0) {
	                    msgElement.text('이메일을 입력하세요.');
	                } else if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(fieldValue)) {
	                    msgElement.text('올바른 이메일 형식이 아닙니다.');
	                } else {
	                    msgElement.text('');
	                }
	                break;
	            case 'confirm':
	                // 인증코드에 대한 유효성 검사
	                // 'confirm' 요소에 'checked' 데이터 속성이 없는 경우를 확인
				    if ($("#confirm").data('clicked') != true) {
				        msgElement.text('확인 버튼을 눌러 인증코드를 확인하세요.');
				    } else {
				        msgElement.text('');
				    }
				    break;
	
	            default:
	                // 기본적으로 메시지를 초기화
	            	msgElement.text('');
        	} // end switch
	        return msgElement.text() === ''; //폼체크 함수로 반환할 boolean 값
		} // end inputCheck
		
		// 폼 제출 시 유효성 검사 함수
	    function formCheck(frm) {
	        // 모든 입력 필드에 대한 유효성 검사
	        // 아래 변수들은 유효성 검사 메세지가 비어있을 경우 true 값 반환
	        const idValid = inputCheck(frm.userId);
	        const pwdValid = inputCheck(frm.pwd);
	        const pwcValid = inputCheck(frm.pwc);
	        const nickValid = inputCheck(frm.nick);
	        const emailValid = inputCheck(frm.email);
	        const confirmValid = inputCheck(frm.confirm);
	        
	        console.log('아이디:'+idValid)
	        console.log('비밀번호:'+pwdValid)
	        console.log('비밀번호확인:'+pwcValid)
	        console.log('닉네임:'+nickValid)
	        console.log('이메일:'+emailValid)
	        console.log('인증코드확인:'+confirmValid)
	        
	        // 모든 검사를 통과한 경우에만 회원가입 버튼 활성화
	        if (idValid && pwdValid && pwcValid && nickValid && emailValid && confirmValid) {
	        	console.log('폼제출허용')
	            return true; // 폼 제출 허용
	        } else {
	        	console.log('폼제출실패')
	            return false; // 폼 제출 거부
	        }
	    }
	    
		// 취소버튼 누르면 이메일 입력란 다시 활성화
		$("#reset").click(function(){
			$('#email').attr('readonly', false);
			$("#auth_code").attr("disabled", true);
			$('#send').attr('disabled', false);
			$("#msgEmail").html('');
			$("#msgConfirm").html('');
		})
		
		//인증하기 버튼을 눌렀을 때 동작
		$("#send").click(function() {
			alert("처리중입니다.");
	    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
	    		
	    	//Ajax로 전송
	        $.ajax({
	        	url : '/domain/EmailAuth',
	        	data : {
	        		email : email
	        	},
	        	type : 'POST',
	        	dataType : 'text',
	        	success : function(result) {
	        		console.log("result : " + result);
	        		code = parseInt(result, 10);
	        		$('#email').attr('readonly', true);
	        		$("#auth_code").attr("disabled", false);
	        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
	       		},
	       		error: function(xhr, status, error) { // Ajax 요청이 실패한 경우
	       			var responseText = xhr.responseText;
	       			if (responseText == 'DUPLICATED_EMAIL') {
	       				$('#msgEmail').text("중복된 이메일입니다.");
	       			} else {
	       				$('#msgEmail').text("유효하지 않은 이메일입니다.");
	       			}
	       	    }
	        }); //end Ajax
	    });
	
		//인증 코드 비교
	    $("#confirm").on("click", function() {
	    	const inputCode = $("#auth_code").val(); //인증번호 입력 칸에 작성한 내용 가져오기
	    	
	    	console.log("입력코드 : " + inputCode);
	    	console.log("인증코드 : " + code);
	    		
	    	if(Number(inputCode) == code){
	        	$("#msgConfirm").html('인증번호가 일치합니다.');
	        	$("#msgConfirm").css('color', 'green');
	    		$('#send').attr('disabled', true);
	    		$("#auth_code").attr('disabled', true);
	    		$("#confirm").data('clicked', true);
	    	}else{
	        	$("#msgConfirm").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
	        	$("#msgConfirm").css('color', 'red');
	    	}
	    });
	</script>
</body>
</html>