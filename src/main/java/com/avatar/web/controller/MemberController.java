package com.avatar.web.controller;


import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avatar.web.dao.ClassDao;
import com.avatar.web.entity.Member;
import com.avatar.web.entity.Class;


import com.avatar.web.service.MemberService;
import com.google.gson.Gson;


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
		List<Class> classList = classDao.getList();
		model.addAttribute("classList", classList);
		
		//System.out.println(classList);
		return "member.join";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member member,
			@RequestParam(value="classId", defaultValue="") String classId, 
			@RequestParam(value="classPwd", defaultValue="") String classPwd, 
			@RequestParam(value="role", defaultValue="") String role, 
			Model model) throws IOException{
        role = "ROLE_"+role.toUpperCase();
        System.out.println(role);
		int result =0;
		result = classDao.checkPw(classId, classPwd);
		
		
		int row =0;
        if(result > 0){ 
        	
        	if(role.equals("ROLE_STUDENT"))
        		row = service.insert(member,role,classId);
        	else {
        		System.out.println("학생가입오류");
        		 return "member.join";
        	}
            return "redirect:login";
        }else if(role.equals("ROLE_TEACHER")) {
        	row = service.insert(member,role);
        	
        	return "redirect:login";
        	
        }else { 
        	System.out.println("가입실패");
            return "member.join";
        }
	}
	
	@RequestMapping(value="idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		Gson gson = new Gson();
		String json = "";
		json = gson.toJson(service.idCheck(id));
		return json;
	}
	@RequestMapping(value="emailCheck")
	@ResponseBody
	public String emailCheck(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		Gson gson = new Gson();
		String json = "";
		json = gson.toJson(service.emailCheck(email));
		return json;
	}	
	@RequestMapping(value="checkPw")
	@ResponseBody
	public String checkPw(HttpServletRequest request, Model model) {
		String classId = request.getParameter("classId");
		String classPwd = request.getParameter("classPwd");
		Gson gson = new Gson();
		String json = "";
		json = gson.toJson(classDao.checkPw(classId, classPwd));
		return json;
	}	
	
	
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypage(Model model) {
		List<Member> memberList = service.getList();
		model.addAttribute("memberList", memberList);
		return "member.mypage";
	}
	
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat(Principal principal, Model model) {
		
		model.addAttribute("list", service.getChatList(principal.getName()));
		model.addAttribute("br", "<br/>");
		model.addAttribute("cn", "\n");
		return "member.chat";
	}
	
}
