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
	
	// 질문게시판
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
		model.addAttribute("cmtList", service.getQuestionCmtList(no));
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
	
	@RequestMapping(value="question/cmt-edit", method=RequestMethod.GET)
	public String questionCmtEdit(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		System.out.println("edit no : "+ no);
		model.addAttribute("b", service.getQuestionCmt(no));
		return "board.question.cmt-edit";
	}
	
	@RequestMapping(value="question/cmt-edit", method=RequestMethod.POST)
	public String questionCmtEdit(BoardCmt boardCmt) {
		service.editQuestionCmt(boardCmt);
		return "redirect: "+boardCmt.getBoardNo();
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
	
	@RequestMapping(value="question/cmt-del", method=RequestMethod.POST)
	public String questionCmtDel(String no, BoardCmt boardCmt) {
		System.out.println(no);
		System.out.println("boardNo"+boardCmt.getBoardNo());
		service.deleteQuestionCmt(no);
		
		return "redirect: "+ boardCmt.getBoardNo();
	}
	
	// 정보 공유
	@RequestMapping("information")
	public String information(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		
		model.addAttribute("list", service.getInformationList(page, field, query, principal.getName()));
		model.addAttribute("count", service.getInformationCount(principal.getName()));
		
		return "board.information.list";
	}
	
	@RequestMapping(value="information/{no}", method=RequestMethod.GET)
	public String informationDetail(@PathVariable("no") String no, Model model) {
		model.addAttribute("b", service.getInformation(no));
		model.addAttribute("cmtList", service.getInformationCmtList(no));
		return "board.information.detail";
	}
	
	@RequestMapping(value="information/{no}", method=RequestMethod.POST)
	public String informationDetail(@PathVariable("no") String no, BoardCmt cmt, Principal principal) {
		cmt.setWriterId(principal.getName());
		cmt.setBoardNo(no);
		service.insertInformationCmt(cmt);
		return "redirect: "+no;
	}
	
	@RequestMapping(value="information/reg", method=RequestMethod.GET)
	public String informationReg(Model model) {
		model.addAttribute("board", "reg");
		return "board.information.reg";
	}
	
	@RequestMapping(value="information/reg", method=RequestMethod.POST)
	public String informationReg(Principal principal, Board board) {
		System.out.println(board.getContent());
		board.setWriterId(principal.getName());
		int result = service.insertInformation(board);
		return "redirect: ../information";
	}
	
	@RequestMapping(value="information/edit", method=RequestMethod.GET)
	public String informationEdit(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("board", "edit");
		model.addAttribute("b", service.getInformation(no));
		return "board.information.edit";
	}
	
	@RequestMapping(value="information/edit", method=RequestMethod.POST)
	public String informationEdit(Board board) {
		service.editInformation(board);
		return "redirect: "+board.getNo();
	}
	
	@RequestMapping(value="information/cmt-edit", method=RequestMethod.GET)
	public String informationCmtEdit(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("b", service.getInformationCmt(no));
		return "board.information.cmt-edit";
	}
	
	@RequestMapping(value="information/cmt-edit", method=RequestMethod.POST)
	public String informationCmtEdit(BoardCmt boardCmt) {
		service.editInformationCmt(boardCmt);
		return "redirect: "+boardCmt.getBoardNo();
	}
	
	@RequestMapping(value="information/del", method=RequestMethod.GET)
	public String informationDel(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("b", service.getInformation(no));
		return "board.information.delete";
	}
	
	@RequestMapping(value="information/del", method=RequestMethod.POST)
	public String informationDel(@RequestParam(value="no", defaultValue="") String no) {
		service.deleteInformation(no);
		return "redirect: ../information";
	}
	
	
	@RequestMapping(value="information/cmt-del", method=RequestMethod.GET)
	public String informationCmtDel(@RequestParam(value="no", defaultValue="") String no,
			Model model) {
		model.addAttribute("b", service.getInformationCmt(no));
		return "board.information.cmt-delete";
	}
	
	@RequestMapping(value="information/cmt-del", method=RequestMethod.POST)
	public String informationCmtDel(String no, Board board) {
		service.deleteInformationCmt(no);
		
		return "redirect: "+ board.getNo();
	}
	
	@RequestMapping("notice")
	public String notice(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		model.addAttribute("list", service.getNoticeList(page, field, query, principal.getName()));
		model.addAttribute("count", service.getNoticeCount(principal.getName()));
		
		return "board.notice.list";
	}
	
	@RequestMapping(value="notice/{no}")
	public String noticeDetail(@PathVariable("no") String no, Model model) {
		model.addAttribute("b", service.getNotice(no));
		return "board.notice.detail";
	}

}

