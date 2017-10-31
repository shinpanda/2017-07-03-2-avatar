package com.avatar.web.controller;


import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.avatar.web.dao.MemberDao;
import com.avatar.web.entity.Member;
import com.avatar.web.service.MemberService;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "member.login";
	}
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join() {
		return "member.join";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(String id, String pwd, String name, String email) throws IOException{
		
		
		System.out.println("이멜:"+email);
	//	int row = service.insertAndPointUp(notice);
		int row = service.insertMember(new Member(id, pwd, name, email));
	//	memberDao.pointUp(principal.getName());
	//	int row = noticeDao.insert(title,content,writerId);
	//	int row2 = noticeDao.insert(new Notice(title,content,writerId));

	//		noticeFileDao.insert(new NoticeFile(null,fileName,nextId));
		
		return "redirect:login";
	}
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat(Principal principal, Model model) {
		
		model.addAttribute("list", service.getChatList(principal.getName()));
				
		return "member.chat";
	}
	
}
