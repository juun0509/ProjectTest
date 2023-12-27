package com.green.tonicbank.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.green.tonicbank.dao.ProductDao;
import com.green.tonicbank.model.Community;
import com.green.tonicbank.model.CommunityComment;
import com.green.tonicbank.model.PageHandler;
import com.green.tonicbank.model.Product;
import com.green.tonicbank.model.SearchCondition;
import com.green.tonicbank.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private final CommunityService communityService;
	private final ProductDao productDao;
	
	@Autowired
	public CommunityController(CommunityService communityService, ProductDao productDao) {
		super();
		this.communityService = communityService;
		this.productDao = productDao;
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
			String productName = community.getProductName().replace(",", "");
			Product product = new Product();
			product.setName(productName);
			product.setIngredient("");
			product.setEfficacy("");
			List<Product> list = productDao.find(product);
			product = list.get(0);
			
			Date now = new Date();
			model.addAttribute("now", now);
			model.addAttribute("community", community);
			model.addAttribute("product", product);
			
			return "view";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
	}
	
	@GetMapping("/modify")
	public String modifyCommunity(Integer communityId, Model model) {
		try {
			Community community = communityService.getCommunity(communityId);
			
			model.addAttribute("community", community);
			
			return "communityModify";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
	}
	
	@PostMapping("/modify")
	public String modifyCommunity(Community community, Model model) {
		System.out.println(community);
		try {
			int rowCnt = communityService.modifyCommunity(community);
			
			if (rowCnt != 1)
				throw new Exception("community modify error");
			
			return "redirect:/community/list?communityId=" + community.getCommunityId();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
			return "home";
		}
	}
	
	@PostMapping("/remove")
	public String removeCommunity(Integer communityId, SearchCondition sc, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		try {
			int rowCnt = communityService.remove(communityId, userId);
			
			if (rowCnt != 1) {
				throw new Exception("community remove error");
			}
			
			return "redirect:/community/list" + sc.getQueryString();
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
	
	/**
	 * 댓글 (comments)
	 * 
	 */
	@GetMapping("/comments")
	@ResponseBody
	public ResponseEntity<List<CommunityComment>> commentList(Integer communityId) {
		List<CommunityComment> list = null;
		try {
			list = communityService.getComment(communityId);
			
			return new ResponseEntity<List<CommunityComment>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommunityComment>>(list, HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/comments")
	@ResponseBody
	public ResponseEntity<String> commentWrite(@RequestBody CommunityComment comment, String mod, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		comment.setUserId(userId);
		
		try {
			
			if (mod.equals("comment")) {
				List<CommunityComment> list = communityService.getComment(comment.getCommunityId());
				int group = list.size() == 0 ? 1 : list.get(list.size() - 1).getGroup() + 1;
				comment.setParentCommentId(0);
				comment.setGroup(group);
				comment.setGroupOrder(0);
				comment.setStep(0);
				int res = communityService.writeComment(comment);
				
				if (res != 1)
					throw new Exception("comment write error");
			}
			else {
				CommunityComment parentComment = communityService.getDetailComment(comment.getParentCommentId());
				System.out.println(parentComment);
				comment.setGroup(parentComment.getGroup());
				comment.setParentCommentId(parentComment.getCommunityCommentId());
				comment.setGroupOrder(parentComment.getChildCount() + parentComment.getGroupOrder() + 1);
				comment.setStep(parentComment.getStep() + 1);
				
				communityService.modifyCommentGroupOrder(1, comment);
				
				int res = communityService.writeComment(comment);
				if (res != 1)
					throw new Exception("recomment write error");
				
				List<CommunityComment> list = communityService.getComment(comment.getCommunityId());
				Collections.sort(list, (o1, o2) -> {
					return o2.getCommunityCommentId() - o1.getCommunityCommentId();
				});
				
				for (CommunityComment c : list) {
					communityService.modifyCommentChildCount(c.getCommunityCommentId());
				}
			}
			
			return new ResponseEntity<String>("WRITE_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("WRITE_ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@PatchMapping("/comments/{communityCommentId}")
	@ResponseBody
	public ResponseEntity<String> commentModify(@PathVariable Integer communityCommentId, @RequestBody CommunityComment comment, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		comment.setUserId(userId);
		comment.setCommunityCommentId(communityCommentId);
		
		System.out.println(communityCommentId);
		System.out.println(comment);
		
		try {
			int res = communityService.modifyComment(comment);
			
			if (res != 1)
				throw new Exception("comment modify error");
			
			return new ResponseEntity<String>("MODIFY_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("MODIFY_ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
	@DeleteMapping("/comments/{communityCommentId}")
	@ResponseBody
	public ResponseEntity<String> commentRemove(@PathVariable Integer communityCommentId, Integer communityId, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		
		try {
			CommunityComment comment = communityService.getDetailComment(communityCommentId);
			int childCount = comment.getChildCount();
			comment.setDeleteStatus(true);
			communityService.modifyComment(comment);
			
			
			if (childCount == 0) {
				communityService.removeComment(communityId);
				communityService.modifyCommentGroupOrder(-1, comment);
				
				List<CommunityComment> list = communityService.getComment(comment.getCommunityId());
				Collections.sort(list, (o1, o2) -> {
					return o2.getCommunityCommentId() - o1.getCommunityCommentId();
				});
				
				for (CommunityComment c : list) {
					communityService.modifyCommentChildCount(c.getCommunityCommentId());
				}
				communityService.removeComment(communityId);
			}
			

			return new ResponseEntity<String>("REMOVE_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("REMOVE_ERROR", HttpStatus.BAD_REQUEST);
		}
	}
	
	/**
	 * 게시글 작성
	 */
	@GetMapping("/write")
	public String communityWrite() {
		return "write";
	}
	
	@PostMapping("/write")
	public String communityWrite(Community community, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		community.setProductName(community.getProductName().replaceAll(",", ""));
		
		try {
			if (userId == null) {
				throw new Exception("id is null");
			}
			community.setUserId(userId);
			
			if (community.getCategory().equals("1")) {
				community.setCategory("free");
			} else {
				community.setCategory("rev");
			}
			
			communityService.write(community);
			
			return "redirect:/community/list";
		} catch (Exception e) {
			e.printStackTrace();
			return "home";
		}
	}
	
	@PostMapping("/image")
	@ResponseBody
	public Map<String, Object> imageUpload(MultipartRequest request) {
		
		Map<String, Object> responseData = new HashMap<>();
		
		MultipartFile file = request.getFile("upload");
		
		String fileName = file.getOriginalFilename();
		String ext = fileName.substring(fileName.indexOf("."));
		
		String uuidFileName = UUID.randomUUID() + ext;
		String localPath = "C:\\sts_workspace2\\main\\src\\main\\webapp\\resources\\img\\community\\" + uuidFileName;
		
		String localUrl = "/tonicbank/resources/img/community/" + uuidFileName;
		
		File localFile = new File(localPath);
		try {
			file.transferTo(localFile);
			
			responseData.put("uploaded", true);
			responseData.put("url", localUrl);
			
			return responseData; 
		} catch (IOException e) {
			e.printStackTrace();
			
			return responseData;
		}
		
	}
	
	@GetMapping("/writePop")
	public String communityWritePop(Model model) {
		try {
			Product product = new Product();
			
			product.setName("");
			product.setIngredient("");
			product.setEfficacy("");
			
			List<Product> list = productDao.find(product);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "writePop";
	}
	
	@PostMapping("/writePop")
	@ResponseBody
	public ResponseEntity<List<Product>> communityWritePop(String keyword, Model model) {
		List<Product> list = null;
		try {
			Product product = new Product();
			product.setName(keyword);
			product.setIngredient("");
			product.setEfficacy("");
			list = productDao.find(product);
			
			product.setName("");
			product.setIngredient(keyword);
			product.setEfficacy("");
			list.addAll(productDao.find(product));
			
			product.setName("");
			product.setIngredient("");
			product.setEfficacy(keyword);
			list.addAll(productDao.find(product));
			
			return new ResponseEntity<List<Product>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<Product>>(list, HttpStatus.BAD_REQUEST);
		}
	}
	
	private boolean loginCheck(HttpServletRequest req) {
		HttpSession session = req.getSession();
		return session.getAttribute("userId") != null;
	}
}