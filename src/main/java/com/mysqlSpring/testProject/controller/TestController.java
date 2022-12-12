package com.mysqlSpring.testProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	@RequestMapping("/joinView")
	public String JoinView() {
		return "joinView";
	}
	@RequestMapping(value="/join", produces="application/text;charset=UTF8")
	@ResponseBody
	public String join(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "join-success";
	}
}
