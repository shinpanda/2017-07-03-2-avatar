package com.avatar.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avatar.web.entity.BoardView;
import com.avatar.web.service.BoardService;



@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private BoardService service;
	
	@RequestMapping("question")
	public String question(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		model.addAttribute("list", service.getQuestionList(page, field, query));
		model.addAttribute("count", service.getQuestionCount());
		
		return "board.question.list";
	}
	
	@RequestMapping("question/{id}")
	public String questionDetail(@PathVariable("id") String id, Model model) {
		return "board.question.detail";
	}
	
	@RequestMapping(value="question/del", method=RequestMethod.GET)
	public String questionDel(@RequestParam(value="id", defaultValue="") String id,
			Model model) {
		return "board.question.del";
	}
	
	@RequestMapping(value="question/reg", method=RequestMethod.GET)
	public String questionReg() {
		return "board.question.reg";
	}
	
	@RequestMapping(value="question/edit", method=RequestMethod.GET)
	public String questionEdit(@RequestParam(value="id", defaultValue="") String id,
			Model model) {
		return "board.question.edit";
	}
}
