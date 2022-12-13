package com.mysqlSpring.testProject.command;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

public interface UserCommand {
	public void execute(HttpServletRequest request, Model model);
}
