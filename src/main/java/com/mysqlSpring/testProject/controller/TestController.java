package com.mysqlSpring.testProject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysqlSpring.testProject.command.UserCommand;
import com.mysqlSpring.testProject.dao.UserDao;
import com.mysqlSpring.testProject.util.Constant;

@Controller
public class TestController {
	private UserCommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder=passwordEncoder;
		Constant.passwordEncoder=passwordEncoder;
	}
	private UserDao udao;
	@Autowired
	public void setUdao(UserDao udao) {
		this.udao=udao;
		Constant.udao=udao;
	}
	
	@RequestMapping("/joinView")
	public String JoinView() {
		System.out.println("joinView request");
		return "joinView";
	}
	@RequestMapping(value="/join", produces="application/text;charset=UTF8")
	@ResponseBody
	public String join(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("join request");
		com = new UserJoinCommand();
		com.execute(request, model);
		
		String result = (String)request.getAttribute("result");
		if(result.equals("success")) {
			return "join-success";
		}
		else{
			return "join-failed";
		}
	}
	@RequestMapping("/loginView")
	public String loginView() {
		System.out.println("loginView 요청");
		return "loginView";
	}

}
