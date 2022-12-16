package com.mysqlSpring.testProject.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysqlSpring.testProject.command.UserCommand;
import com.mysqlSpring.testProject.command.UserJoinCommand;
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
	@RequestMapping("/main")
	public String main(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("main request");
		getUsername(authentication, request);
		
		//getUsername() method에서 HttpServletRequest에 저장한 내용확인
		String username = (String)request.getAttribute("username");
		String auth = (String)request.getAttribute("auth");
		System.out.println("user: "+username+"//auth: "+auth);
		
		return "main";
	}
	private void getUsername(Authentication authentication, HttpServletRequest request) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String username = userDetails.getUsername();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		String auth = authorities.toString();
		request.setAttribute("username", username);
		request.setAttribute("auth",auth);
	}
	
	@RequestMapping("/processLogin")
	public ModelAndView processLogin(
			//before log in
			@RequestParam(value="log", required=false) String log,
			//log out request
			@RequestParam(value="logout", required=false) String logout,
			//login error 
			@RequestParam(value="error",required=false) String error,
			//social login
			HttpSession session, Model model) {
		System.out.println("log process controller");
		ModelAndView mav = new ModelAndView();
		if(log!=null&&log!="") {
			mav.addObject("log", "before login");
		}
		if(logout!=null&&logout!="") {
			mav.addObject("logout", "You've been logged out successfully");
		}
		if(error!=null && error!="") {
			mav.addObject("error","Invalid username or password");
		}
		mav.setViewName("loginView");
		return mav;
	}
	
	@RequestMapping("/logoutView")
	public String logoutView(HttpServletRequest request, Model model) {
		System.out.println("log-out request ");
		return "logoutView";
	}
	
	@RequestMapping("/intro")
	public String introView(HttpServletRequest request,Model model) {
		System.out.println("intro request");
		return "intro";
	}
}
