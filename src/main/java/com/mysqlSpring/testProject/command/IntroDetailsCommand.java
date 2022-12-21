package com.mysqlSpring.testProject.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.dto.IntroDto;
import com.mysqlSpring.testProject.util.Constant;

public class IntroDetailsCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao bdao = Constant.bdao;
		String introId = request.getParameter("introId");
		int introID = Integer.parseInt(introId);
		System.out.println("intro ID: " +introID);
		IntroDto dto=bdao.introDetails(introID);
		model.addAttribute("introDetails",dto);
	}

}
