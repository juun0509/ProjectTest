package com.green.tonicbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signUp")
public class SignUpController {

	@GetMapping("/join")
	public String join() {
		return "SignUp";
	}
	
	@PostMapping("/join")
	public String joinPost() {
		System.out.println("회원가입성공");
		return "redirect:/";
	}
	
}
