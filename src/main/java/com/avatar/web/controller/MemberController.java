package com.avatar.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	public String join(Member member) throws IOException {
		
		
		
	//	int row = service.insertAndPointUp(notice);
		int row = service.insert(member);
	//	memberDao.pointUp(principal.getName());
	//	int row = noticeDao.insert(title,content,writerId);
	//	int row2 = noticeDao.insert(new Notice(title,content,writerId));

	//		noticeFileDao.insert(new NoticeFile(null,fileName,nextId));
		
		return "redirect:../login";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat() {
		return "member.chat";
	}
	
}
