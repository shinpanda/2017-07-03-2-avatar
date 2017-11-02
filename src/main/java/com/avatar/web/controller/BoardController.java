package com.avatar.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avatar.web.entity.Board;
import com.avatar.web.entity.BoardView;
import com.avatar.web.service.BoardService;



@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("question")
	public String question(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		
		model.addAttribute("list", service.getQuestionList(page, field, query, principal.getName()));
		model.addAttribute("count", service.getQuestionCount(principal.getName()));
		
		return "board.question.list";
	}
	
	@RequestMapping("question/{id}")
	public String questionDetail(@PathVariable("no") String no, Model model) {
		model.addAttribute("b", service.getQuestion(no));
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
	
	@RequestMapping(value="question/reg", method=RequestMethod.POST)
	public String questionReg(Principal principal, Board board) {
		board.setWriterId(principal.getName());
		int result = service.insertQuestion(board);
		return "redirect: ../question";
	}
	
	
	@RequestMapping(value="question/edit", method=RequestMethod.GET)
	public String questionEdit(@RequestParam(value="id", defaultValue="") String id,
			Model model) {
		return "board.question.edit";
	}
}

