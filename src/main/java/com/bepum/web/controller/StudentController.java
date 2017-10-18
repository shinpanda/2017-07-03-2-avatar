package com.bepum.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/*")
public class StudentController {
	
	@RequestMapping("sit-change")
	public String sitChange() {
		return "student.sit-change";
	}
}
