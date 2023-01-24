package com.itwillbs.mvc_board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.mvc_board.service.MainService;
import com.itwillbs.mvc_board.service.ProductService;

@Controller
public class MainController {
	@Autowired
	private MainService service;
	
	//------메인 페이지 포워딩--------
	
	@PostMapping(value = "/main.ma")
	public String main() {
		return "main";
	}
	
	
}
