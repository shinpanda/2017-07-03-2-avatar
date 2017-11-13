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
import com.avatar.web.entity.BoardCmt;
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
	
	@RequestMapping(value="question/{no}", method=RequestMethod.GET)
	public String questionDetail(@PathVariable("no") String no, Model model) {
		model.addAttribute("b", service.getQuestion(no));
		model.addAttribute("cmtList", service.getQuestionCmt(no));
		return "board.question.detail";
	}
	
	@RequestMapping(value="question/{no}", method=RequestMethod.POST)
	public String questionDetail(@PathVariable("no") String no, BoardCmt cmt, Principal principal) {
		cmt.setWriterId(principal.getName());
		cmt.setBoardNo(no);
		service.insertQuestionCmt(cmt);
		return "redirect: "+no;
	}
	
	@RequestMapping(value="question/reg", method=RequestMethod.GET)
	public String questionReg(Model model) {
		model.addAttribute("board", "reg");
		return "board.question.reg";
	}
	
	@RequestMapping(value="question/reg", method=RequestMethod.POST)
	public String questionReg(Principal principal, Board board) {
		System.out.println(board.getContent());
		board.setWriterId(principal.getName());
		int result = service.insertQuestion(board);
		return "redirect: ../question";
	}
	
	@RequestMapping(value="question/edit", method=RequestMethod.GET)
	public String questionEdit(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("board", "edit");
		model.addAttribute("b", service.getQuestion(no));
		return "board.question.edit";
	}
	
	@RequestMapping(value="question/edit", method=RequestMethod.POST)
	public String questionEdit(Board board) {
		service.editQuestion(board);
		return "redirect: "+board.getNo();
	}
	
	@RequestMapping(value="question/del", method=RequestMethod.GET)
	public String questionDel(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("b", service.getQuestion(no));
		return "board.question.delete";
	}
	
	@RequestMapping(value="question/del", method=RequestMethod.POST)
	public String questionDel(@RequestParam(value="no", defaultValue="") String no) {
		System.out.println(no);
		service.deleteQuestion(no);
		return "redirect: ../question";
	}
	
	
	@RequestMapping(value="question/cmt-del", method=RequestMethod.GET)
	public String questionCmtDel(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("b", service.getQuestionCmt(no));
		return "board.question.cmt-delete";
	}
}

