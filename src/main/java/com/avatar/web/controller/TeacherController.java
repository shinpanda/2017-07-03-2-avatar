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
import org.springframework.web.bind.annotation.ResponseBody;

import com.avatar.web.dao.MemberClassDao;
import com.avatar.web.entity.Board;
import com.avatar.web.entity.MemberClass;
import com.avatar.web.entity.MemberClassView;
import com.avatar.web.service.BoardService;
import com.avatar.web.service.MemberService;
import com.avatar.web.service.TeacherService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("/teacher/*")
public class TeacherController {
	
	@Autowired
	private TeacherService service;
	@Autowired
	private MemberService mService;
	@Autowired
	private MemberClassDao memberClassDao;
	
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
		
		List<MemberClassView> list = service.getSeatList(principal.getName());
		model.addAttribute("list", list);
		
		return "teacher.is-complete";
	}
	
	@RequestMapping("student/list")
	public String studentList(
			@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="memberId") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal, Model model) {
		
		String id = principal.getName();
		model.addAttribute("c", mService.getClassInfo(id));
		String classId = memberClassDao.getClassId(id);
		/*System.out.println("1) id,page,field,query: "+classId+", "+page+", "+field+", "+query);*/
		model.addAttribute("list", memberClassDao.getListPage(classId,page,field,query));
		model.addAttribute("count", mService.getStuCount(classId));
		
		return "teacher.student.list";	

	} 
	
	@RequestMapping(value="student/list", method=RequestMethod.POST)
	public String studentList(String updateId) {
		int result = service.updateStudent(updateId, "ROLE_CLASSPRESIDENT");
		return "redirect: ./list";

	} 
	
	@RequestMapping("student/seat")
	public String student(@RequestParam(value="p", defaultValue="1") Integer page, 
			@RequestParam(value="f", defaultValue="memberId") String field,
			@RequestParam(value="q", defaultValue="") String query,
			Principal principal,
			Model model) {
		List<MemberClassView> list = service.getStudentList(principal.getName());
		model.addAttribute("list", list);
		
		return "teacher.student.seat";
	}
	
	@RequestMapping("student/student-info")
	@ResponseBody
	public String studentInfo(String memberId) {
		
		MemberClassView mcv = service.getStudentInfo(memberId);
		String json = "";
		Gson gson = new Gson();
		json = gson.toJson(mcv);
		
		return json;
	}
	
	@RequestMapping("student/student-update")
	@ResponseBody
	public String studentUpdate(String studentInfo) {
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject) jsonParser.parse(studentInfo);
		if (!jsonObject.isJsonNull()) {
			String id = jsonObject.get("memberId").getAsString();
			String role = jsonObject.get("role").getAsString();
			
			int result = service.updateStudent(id, role);
		}
		return "aa";
	}
	
}
