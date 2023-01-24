package com.itwillbs.mvc_board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.itwillbs.mvc_board.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	
	
}
