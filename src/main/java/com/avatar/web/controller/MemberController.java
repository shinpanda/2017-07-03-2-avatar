package com.avatar.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "member.login";
	}
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join() {
		return "member.join";
	}
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat(Model model) {
		
		//model.addAttribute(list, )
		return "member.chat";
	}
	
}
