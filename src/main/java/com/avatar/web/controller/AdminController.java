package com.avatar.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avatar.web.dao.MemberClassDao;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private MemberClassDao memberClassDao;
	
	@RequestMapping("member")
	public String member(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="memberId") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		
		model.addAttribute("list", memberClassDao.getMemberList(page,field,query));
		model.addAttribute("count", memberClassDao.getMemberCount());
		
		return "admin.member.list";	
	} 
	
	
	@RequestMapping("board")
	public String board() {
		
		
		return "admin.board.list";	
	}
}
