package com.green.tonicbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.tonicbank.model.InfoBoard;
import com.green.tonicbank.service.InfoBoardService;

@Controller
@RequestMapping("infoBoard")
public class InfoBoardController {
	
	private final InfoBoardService infoBoardService;
	
	@Autowired
	public InfoBoardController(InfoBoardService infoBoardService) {
		super();
		this.infoBoardService = infoBoardService;
	}

	@GetMapping("/list")
	public String infoBoardList(String keyword, Model model) {
		
		try {
			if (keyword == null) {
				keyword = "";
			}
			List<InfoBoard> list = infoBoardService.getSearchInfoBoard(keyword);
			
			model.addAttribute("list", list);
			model.addAttribute("keyword", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
		
		return "infoBoard";
	}
	
	@GetMapping("view")
	public String infoBoardView(Integer infoBoardId, Model model) {
		
		try {
			InfoBoard infoBoard = infoBoardService.getInfoBoard(infoBoardId);
			
			model.addAttribute("infoBoard", infoBoard);
			
			return "infoView";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
	}

}
