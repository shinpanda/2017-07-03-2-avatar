package com.avatar.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avatar.web.entity.Class;
import com.avatar.web.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	AdminService service;
	

	@RequestMapping("member")
	public String member() {
	
		return "admin.member.list";	
	}

	@RequestMapping("board")
	public String board() {
		
		
		return "admin.board.list";	
	}
	
	@RequestMapping("class")
	public String adminClass(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="course") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		model.addAttribute("list", service.getClassList(page, field, query));
		model.addAttribute("count", service.getClassCount());
		return "admin.class.list";	
	}
	
	@RequestMapping("class/lecture-room")
	public String adminLectureRoom() {
		
		return "admin.board.list";	
	}
}
