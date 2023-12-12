package com.green.tonicbank.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.PageHandler;
import com.green.tonicbank.model.SearchCondition;
import com.green.tonicbank.service.CommunityService;
import com.green.tonicbank.service.UserService;

@Controller
@RequestMapping("community")
public class CommunityController {
	
	private final CommunityService communityService;
	private final UserService userService;
	
	@Autowired
	public CommunityController(CommunityService communityService, UserService userService) {
		super();
		this.communityService = communityService;
		this.userService = userService;
	}

	@GetMapping("/list")
	public String list(SearchCondition sc, Model model) {
		try {
			int totalCount = communityService.getCount(sc);
			PageHandler ph = new PageHandler(totalCount, sc);
			System.out.println("CommunityController - list : " + sc);
			
			List<Community> list = communityService.getAllCommunity(sc);
			model.addAttribute("ph", ph);
			model.addAttribute("list", list);
			
			Date now = new Date();
			model.addAttribute("now", now);
			return "community";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
		
	}
	
	@GetMapping("/read")
	public String read(Integer communityId, SearchCondition sc, Model model) {
		
		try {
			Community community = communityService.getCommunity(communityId);
			
			model.addAttribute("community", community);
			
			return "view";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
		
	}
}
