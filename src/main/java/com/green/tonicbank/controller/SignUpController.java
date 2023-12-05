package com.green.tonicbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signUp")
public class SignUpController {

	@GetMapping("join")
	public String join() {
		return "SignUp";
	}
	
}
