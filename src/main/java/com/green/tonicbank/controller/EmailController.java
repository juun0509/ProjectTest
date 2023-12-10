package com.green.tonicbank.controller;

import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.tonicbank.service.UserService;

@Controller
public class EmailController {
	@Autowired
	JavaMailSenderImpl mailSender;
	@Autowired
	UserService userSvc;

	// 이메일 인증
	@PostMapping("/EmailAuth")
	@ResponseBody
	public ResponseEntity<String> emailAuth(String email) {
		System.out.println("전달 받은 이메일 주소 : " + email);
		
		if (!isValidEmail(email)) {
            return new ResponseEntity<>("INVALID_EMAIL", HttpStatus.BAD_REQUEST);
        }
		if(!duplEmail(email)) {
			return new ResponseEntity<>("DUPLICATED_EMAIL", HttpStatus.BAD_REQUEST);
		}
		
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		
		// 이메일 보낼 양식
		String setFrom = "tonicbackmail@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." +
				 "<br>" +
				 "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage(); //Spring�뿉�꽌 �젣怨듯븯�뒗 mail API
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
        		helper.setTo(toMail);
            		helper.setSubject(title);
            		helper.setText(content, true);
            		mailSender.send(message);
           		System.out.println("랜덤숫자 : " + checkNum);
           		return new ResponseEntity<>(String.valueOf(checkNum), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("INVALID_EMAIL", HttpStatus.BAD_REQUEST);
		}
		
	}
	
	// 간단한 이메일 유효성 검사
	private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }

	//이메일 중복확인
	public boolean duplEmail(String email) {
		try {
			int result = userSvc.emailCheck(email);
			if(result != 0) {
				System.out.println(email+"(은)는 중복된 이메일");
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
}
