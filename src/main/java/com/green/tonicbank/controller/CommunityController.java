package com.green.tonicbank.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.SearchCondition;
import com.green.tonicbank.model.PageHandler;
import com.green.tonicbank.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private final CommunityService communityService;
	
	@Autowired
	public CommunityController(CommunityService communityService) {
		super();
		this.communityService = communityService;
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
			int rowCnt = communityService.modifyViewCount(communityId);
			if (rowCnt != 1) {
				throw new Exception("viewCount error");
			}
			Community community = communityService.getCommunity(communityId);
			
			Date now = new Date();
			model.addAttribute("now", now);
			model.addAttribute("community", community);
			
			return "view";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
	}
	
	@PostMapping("/like")
	@ResponseBody
	public ResponseEntity<Map> like(Integer communityId, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");
		
		try {
			int rowCnt = communityService.findLike(userId, communityId);
			boolean check = false;
			
			if (rowCnt == 0) {
				communityService.addLike(userId, communityId);
				communityService.modifyLikeCount(1, communityId);
				check = true;
			}
			else {
				communityService.removeLike(communityId, userId);
				communityService.modifyLikeCount(-1, communityId);
				check = false;
			}
			int likeCount = communityService.getLikeCount(communityId);
			Map map = new HashMap();
			map.put("likeCount", likeCount);
			map.put("check", check);
			return new ResponseEntity<Map>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map>(null, HttpStatus.BAD_REQUEST);
		}
	}
	
	private boolean loginCheck(HttpServletRequest req) {
		HttpSession session = req.getSession();
		return session.getAttribute("userId") != null;
	}
}