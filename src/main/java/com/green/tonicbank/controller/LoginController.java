package com.green.tonicbank.controller;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.tonicbank.model.SearchCondition;
import com.green.tonicbank.model.User;
import com.green.tonicbank.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	UserService userSvc;
	
	@GetMapping("/login")
	public String logInPage(@CookieValue(value="JSESSIONID", required=false) String sessionId, HttpServletRequest req, SearchCondition sc, Model m) {
		System.out.println("쿠키에 저장된 세션 id : " + sessionId);
		String fromURL = req.getRequestURL()+sc.getQueryString();
		System.out.println("이전 URL : " + fromURL);
		fromURL  = (String)req.getHeader("REFERER");
		m.addAttribute("fromURL", fromURL);
		return "login";
	}
	
	@PostMapping("/login")
	public String logIn(User user, String fromURL, boolean rememberId, Model m, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("이전 URL : " + fromURL);
		String userId = user.getUserId();
		String pwd = user.getPwd();
		HttpSession session = req.getSession();
		
		if(!loginCheck(userId, pwd, session)) {
			String msg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");
			return "redirect:/login/login?msg="+msg;
		}
		session.setAttribute("userId", user.getUserId());
		setCookie(resp, userId, rememberId);
		System.out.println("로그인 성공 : " + user);
		if(fromURL==null||"".equals(fromURL))
			return "redirect:/";
		return "redirect:"+fromURL;
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpSession session, HttpServletRequest req) {
		String fromURL  = (String)req.getHeader("REFERER");
		session.invalidate();
		System.out.println("세션 종료");
		return "redirect:"+fromURL;
	}
	
	private boolean loginCheck(String userId, String pwd, HttpSession session) throws Exception {
		User user = userSvc.select(userId);
		if(user == null) return false;
		String nick = user.getNick();
		session.setAttribute("nick", nick);
		return user.getPwd().equals(pwd);
	}
	
	private void setCookie(HttpServletResponse resp, String userId, boolean rememberId) {
	    Cookie cookie = new Cookie("userId", rememberId ? userId : "");
	    cookie.setMaxAge(rememberId ? 60 * 60 : 0);
	    resp.addCookie(cookie);
	}
	
}