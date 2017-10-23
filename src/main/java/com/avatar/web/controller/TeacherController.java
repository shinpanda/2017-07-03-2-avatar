package com.avatar.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/teacher/*")
public class TeacherController {
	
	@RequestMapping("notice")
	public String notice(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		return "teacher.notice.list";
	}
	@RequestMapping("notice/{id}")
	public String questionDetail(@PathVariable("id") String id, Model model) {
		return "teacher.notice.list";
	}
	
	@RequestMapping(value="notice/del", method=RequestMethod.GET)
	public String questionDel(@RequestParam(value="id", defaultValue="") String id,
			Model model) {
		return "teacher.notice.del";
	}
	
	@RequestMapping(value="notice/reg", method=RequestMethod.GET)
	public String questionReg() {
		return "teacher.notice.reg";
	}
	
	@RequestMapping(value="notice/edit", method=RequestMethod.GET)
	public String questionEdit(@RequestParam(value="id", defaultValue="") String id,
			Model model) {
		return "teacher.notice.edit";
	}
	
}
