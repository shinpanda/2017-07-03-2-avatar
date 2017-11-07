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

import com.avatar.web.dao.ClassDao;
import com.avatar.web.entity.Member;
import com.avatar.web.entity.Class;


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
		List<Class> classList = classDao.getList();
		model.addAttribute("classList", classList);
		return "member.join";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member member,@RequestParam(value="classId", defaultValue="") String classId, @RequestParam(value="classPwd", defaultValue="") String classPwd, Model model) throws IOException{
		/*@ModelAttribute String classid,@ModelAttribute String classpwd,  */
		//System.out.println("cl.id:"+cl.getId());
		/*System.out.println("classid:"+classid);
		System.out.println("classpwd:"+classpwd);*/
		
		int result =0;
		result = classDao.checkPw(classId, classPwd);
		
		System.out.println(result);
        if(result > 0){ // ��й�ȣ�� ��ġ�ϸ� ���� ó����,  �����̷�Ʈ
			int row = service.insert(member);
            return "redirect:login";
        } else { // ��й�ȣ�� ��ġ���� �ʴ´ٸ�, div�� ����ġ ���� ���, viwe.jsp�� ������
            // ��������, �������� ����
          //  MemberVO vo2 = memberService.viewMember(vo.getUserId());
            //vo.setUserRegdate(vo2.getUserRegdate());
            //vo.setUserUpdatedate(vo2.getUserUpdatedate());
            //model.addAttribute("dto", cl);
          //  model.addAttribute("message", "��й�ȣ ����ġ");
            return "member.join";
        }
	}
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat(Principal principal, Model model) {
		
		model.addAttribute("list", service.getChatList(principal.getName()));
				
		return "member.chat";
	}
	
}
