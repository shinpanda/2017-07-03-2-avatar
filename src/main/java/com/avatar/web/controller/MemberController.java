package com.avatar.web.controller;


import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.avatar.web.dao.ClassDao;
import com.avatar.web.dao.MemberDao;
import com.avatar.web.entity.Member;
import com.avatar.web.service.MemberService;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	@Autowired
	private ClassDao classDao;
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "member.login";
	}
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(Model model) {
		List<Class> list = classDao.getList();
		model.addAttribute("list", list);
		return "member.join";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member member, Class c, HttpServletRequest request) throws IOException{
		int row = service.insert(member, c);
		
		return "redirect:login";
	}
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat(Principal principal, Model model) {
		
		model.addAttribute("list", service.getChatList(principal.getName()));
				
		return "member.chat";
	}
	
}
