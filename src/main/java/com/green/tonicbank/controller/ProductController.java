package com.green.tonicbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.tonicbank.dao.ProductDao;
import com.green.tonicbank.model.Custom;
import com.green.tonicbank.model.Product;
import com.green.tonicbank.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService ps;

	@Autowired
	ProductDao pdao;
	
	@GetMapping
	public String getProduct() throws Exception{
		return "findProduct";
	}
	@GetMapping("/custom")
	public String getCustom() throws Exception{
		return "product";
	}
	@PostMapping("/custom")
	public ResponseEntity<List<List<Product>>> getCustom(@RequestBody Custom request) throws Exception {
	    String tagsStr = String.join(",", request.getTags());
	    return ResponseEntity.ok(ps.getCustom(tagsStr, Integer.parseInt(request.getPriceMin()), Integer.parseInt(request.getPriceMax())));
	}
	@PostMapping("find")
	@ResponseBody
	public List<Product> findProduct(@RequestBody Product product)throws Exception {
	    return pdao.find(product);
	}
}
