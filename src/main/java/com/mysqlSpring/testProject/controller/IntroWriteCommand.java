package com.mysqlSpring.testProject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.mysqlSpring.testProject.command.ICommand;
import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.dto.IntroDto;
import com.mysqlSpring.testProject.util.Constant;

public class IntroWriteCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BoardDao bdao = Constant.bdao;
		IntroDto dto = (IntroDto)request.getAttribute("introDto");
		String result = bdao.introWrite(dto);
		model.addAttribute("result",result);
	}

}
