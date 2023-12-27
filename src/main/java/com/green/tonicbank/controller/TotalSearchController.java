package com.green.tonicbank.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.PageHandler;
import com.green.tonicbank.model.SearchCondition;
import com.green.tonicbank.service.CommunityService;
import com.green.tonicbank.service.InfoBoardService;
import com.green.tonicbank.service.RequestBoardService;

@Controller
public class TotalSearchController {

	private final RequestBoardService prodBoardSvc; // 상품게시판
	private final InfoBoardService infoBoardSvc; // 정보게시판
	private final CommunityService communitySvc; // 자유게시판
	
	@Autowired
	public TotalSearchController(RequestBoardService prodBoardSvc, InfoBoardService infoBoardSvc, CommunityService communitySvc) {
		super();
		this.prodBoardSvc = prodBoardSvc;
		this.infoBoardSvc = infoBoardSvc;
		this.communitySvc = communitySvc;
	}
	
	@GetMapping("/search")
	public String totalSearch(SearchCondition sc, Model model) {
		sc.setOption("A");
		sc.setPageSize(5);
		System.out.println("통합검색 : " + sc);
		try {
			Date now = new Date();
			int totalCount = communitySvc.getCount(sc);
			PageHandler ph = new PageHandler(totalCount, sc);
			List<Community> list = communitySvc.getAllCommunity(sc);
			model.addAttribute("now", now);
			model.addAttribute("ph", ph);
			model.addAttribute("list", list);

			
			//product
			int proCount =prodBoardSvc.count(sc.getKeyword());
			PageHandler proPh=new PageHandler(proCount, sc);
			List<Product> pro=prodBoardSvc.search(sc.getKeyword());
			model.addAttribute("productList",pro);
			model.addAttribute("proPh", proPh);



			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "searchPage";
	}
	
	@GetMapping("/more")
	public String more(SearchCondition sc, Model model) {
		sc.setOption("A");
		System.out.println("통합검색 더보기 : " + sc);
		try {
			Date now = new Date();
			int totalCount = communitySvc.getCount(sc);
			PageHandler ph = new PageHandler(totalCount, sc);
			List<Community> list = communitySvc.getAllCommunity(sc);
			model.addAttribute("now", now);
			model.addAttribute("ph", ph);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "morePage";
	}
	
}
