package com.green.tonicbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.green.tonicbank.model.PageHandler;
import com.green.tonicbank.model.RequestBoard;
import com.green.tonicbank.model.SearchCondition;
import com.green.tonicbank.service.RequestBoardService;

@Controller
@RequestMapping("requestBoard")
public class RequestBoardController {
	
	private final RequestBoardService requestBoardService;

	@Autowired
	public RequestBoardController(RequestBoardService requestBoardService) {
		super();
		this.requestBoardService = requestBoardService;
	}

	@GetMapping("list")
	public String requestBoardList(SearchCondition sc, Model model) {
		
		try {
			int totalCount = requestBoardService.getCount();
			
			PageHandler ph = new PageHandler(totalCount, sc);
			System.out.println("requestBoardSearchCondition : " + sc);
			
			List<RequestBoard> list = requestBoardService.getAllRequestBoard(sc);
			
			model.addAttribute("list", list);
			model.addAttribute("ph", ph);
			
			Date now = new Date();
			model.addAttribute("now", now);
			
			return "requestBoard";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
	}
	
	@GetMapping("read")
	public String requestBoardView(Integer requestBoardId, SearchCondition sc, Model model) {
		try {
			RequestBoard requestBoard = requestBoardService.getRequestBoard(requestBoardId);
			requestBoard.setContent(requestBoard.getContent().replace("\n", "<br>"));
			
			model.addAttribute("requestBoard", requestBoard);
			
			Date now = new Date();
			model.addAttribute("now", now);
			
			return "requestView";
		} catch (Exception e) {
			e.printStackTrace();
			return "home";
		}
	}
	
	@GetMapping("write")
	public String requestBoardWrite() {
		return "requestWrite";
	}
	
	@PostMapping("write")
	public String requestBoardWrite(RequestBoard requestBoard, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		requestBoard.setUserId(userId);
		
		try {
			int res = requestBoardService.addRequestBoard(requestBoard);
			
			if (res != 1) {
				throw new Exception("requestBoard insert error");
			}
			
			return "redirect:/requestBoard/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
		
	}
	
	@PostMapping("/image")
	@ResponseBody
	public String imageUpload(@RequestPart("file") MultipartFile file) {
		
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.indexOf("."));
		
		String uuidFileName = UUID.randomUUID() + ext;
		String localPath = "C:\\sts_workspace2\\main\\src\\main\\webapp\\resources\\img\\requestBoard\\" + uuidFileName;
		
		String localUrl = "/tonicbank/resources/img/requestBoard/" + uuidFileName;
		
		File localFile = new File(localPath);
		try {
			file.transferTo(localFile);
			
			return localUrl;
		} catch (IOException e) {
			e.printStackTrace();
			
			return localUrl;
		}
		
	}
}
