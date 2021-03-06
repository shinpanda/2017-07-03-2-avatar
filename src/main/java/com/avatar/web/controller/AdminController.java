package com.avatar.web.controller;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avatar.web.dao.AdminBoardCmtDao;
import com.avatar.web.dao.AdminDao;
import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.entity.BoardCmt;
import com.avatar.web.service.AdminService;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private MemberClassDao memberClassDao;	
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private AdminBoardCmtDao adminBoardCmtDao;

	@RequestMapping("member")
	public String member(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="memberId") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		
		model.addAttribute("list", memberClassDao.getMemberList(page,field,query));
		model.addAttribute("count", memberClassDao.getMemberCount());
		

		return "admin.member.list";	

	} 
	
	@RequestMapping("teacher")
	public String teacher(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="memberId") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		
		model.addAttribute("list", memberClassDao.getTeacherList(page,field,query));
		model.addAttribute("count", memberClassDao.getTeacherCount());
		System.out.println("티쳐"+memberClassDao.getTeacherCount());

		return "admin.member.teacher";	

	} 
	


	@RequestMapping("board")
	public String board(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="title") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		
		model.addAttribute("list", adminDao.getList(page, field, query));
		model.addAttribute("count", adminDao.getCount());
		
				
		
		return "admin.board.list";	
	}
	
	
	@RequestMapping(value="board/{adminBoardId}", method=RequestMethod.GET)
	public String boardDetail(@PathVariable("adminBoardId") String adminBoardId, Model model) {
		model.addAttribute("b", adminDao.get(adminBoardId));
		model.addAttribute("cmtList", adminBoardCmtDao.getList(adminBoardId));
		model.addAttribute("br", "<br/>");
		model.addAttribute("cn", "\n");

		return "admin.board.detail";
	}
	
	@RequestMapping(value="question/{AdminBoardId}", method=RequestMethod.POST)
	public String questionDetail(@PathVariable("AdminBoardId") String AdminBoardId, BoardCmt cmt, Principal principal) {
		cmt.setWriterId(principal.getName());
		cmt.setBoardNo(AdminBoardId);
		return "redirect: "+AdminBoardId;
	}
	
	
	
	@RequestMapping("class")
	public String adminClass(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="course") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		model.addAttribute("list", service.getClassList(page, field, query));
		model.addAttribute("count", service.getClassCount());
		return "admin.class.list";	
	}
	
	@RequestMapping("class/lecture-room")
	public String adminLectureRoom(Model model) {
		model.addAttribute("list", service.getLectureRoomList());
		model.addAttribute("count", service.getLectureRoomCount());
		
		return "admin.class.lecture-room";	
	}
	@RequestMapping("class/lecture-admin")
	public String AdminLectureRoom(String data) {
		System.out.println(data);
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject) jsonParser.parse(data);
		if (!jsonObject.isJsonNull()) {
			String id = jsonObject.get("id").getAsString();
			String type = jsonObject.get("type").getAsString();
			System.out.println(type);
			if(!type.equals("del")) {
				int row = Integer.parseInt(jsonObject.get("row").getAsString());
				int col = Integer.parseInt(jsonObject.get("col").getAsString());
				if(type.equals("edit"))
					service.editLectureRoom(id, row, col);
				if(type.equals("add")) {					
					int result = service.regLectureRoom(id, row, col);
				}
			}
			else{
				service.delLectureRoom(id);
			}
		}
		return "aa";

	}
}
