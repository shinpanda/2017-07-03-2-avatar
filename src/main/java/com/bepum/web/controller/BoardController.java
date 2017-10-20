package com.bepum.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/board/*")
public class BoardController {

	@RequestMapping("question")
	public String question(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
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
