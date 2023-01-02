package com.mysqlSpring.testProject.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.dto.IntroDto;
import com.mysqlSpring.testProject.util.Constant;

public class IntroModyfyFormCommand implements ICommand {
	@Override
	public void execute(HttpServletRequest request, Model model) {
		System.out.println("intro Modify  Form command");
		BoardDao bdao = Constant.bdao;
		String introId = (String)request.getParameter("introId");
		int introID = Integer.parseInt(introId);
		System.out.println("intro Modify ID: " +introID);
		IntroDto dto=bdao.introModifyForm(introID);
		model.addAttribute("introDetails",dto);
	}
}
