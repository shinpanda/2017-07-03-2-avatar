package com.avatar.web.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@RequestMapping("member")
	public String member() {
		
		
		return "admin.member.list";	
	}
	
	
	@RequestMapping("board")
	public String board() {
		
		
		return "admin.board.list";	
	}
}
