package com.avatar.web.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avatar.web.entity.Board;
import com.avatar.web.entity.MemberClass;
import com.avatar.web.service.BoardService;
import com.avatar.web.service.TeacherService;

@Controller
@RequestMapping("/teacher/*")
public class TeacherController {
	
	@Autowired
	private TeacherService service;
	
	
	@RequestMapping("notice")
	public String notice(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		model.addAttribute("list", service.getNoticeList(page, field, query, principal.getName()));
		model.addAttribute("count", service.getNoticeCount(principal.getName()));
		
		return "teacher.notice.list";
	}
	
	@RequestMapping(value="notice/{no}")
	public String noticeDetail(@PathVariable("no") String no, Model model) {
		model.addAttribute("b", service.getNotice(no));
		return "teacher.notice.detail";
	}
	@RequestMapping(value="notice/reg", method=RequestMethod.GET)
	public String noticeReg(Model model) {
		model.addAttribute("board", "reg");
		return "teacher.notice.reg";
	}
	
	@RequestMapping(value="notice/reg", method=RequestMethod.POST)
	public String noticeReg(Principal principal, Board board) {
		System.out.println(board.getContent());
		board.setWriterId(principal.getName());
		int result = service.insertNotice(board);
		return "redirect: ../notice";
	}

	@RequestMapping(value="notice/edit", method=RequestMethod.GET)
	public String noticeEdit(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("board", "edit");
		model.addAttribute("b", service.getNotice(no));
		return "teacher.notice.edit";
	}
	
	@RequestMapping(value="notice/edit", method=RequestMethod.POST)
	public String noticeEdit(Board board) {
		service.editNotice(board);
		return "redirect: "+board.getNo();
	}
	
	@RequestMapping(value="notice/del", method=RequestMethod.GET)
	public String noticeDel(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("b", service.getNotice(no));
		return "teacher.notice.delete";
	}
	
	@RequestMapping(value="notice/del", method=RequestMethod.POST)
	public String noticeDel(@RequestParam(value="no", defaultValue="") String no) {
		System.out.println(no);
		service.deleteNotice(no);
		return "redirect: ../notice";
	}
	
	@RequestMapping("is-complete")
	public String isComplete(Principal principal, Model model){
		
		/*List<MemberClass> map = service.getSeatList(principal.getName());
		*/
		return "teacher.is-complete";
	}
	
	
}
