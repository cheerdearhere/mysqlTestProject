package com.mysqlSpring.testProject.util;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.mysqlSpring.testProject.dao.BoardDao;
import com.mysqlSpring.testProject.dao.UserDao;
public class Constant {
	//비밀번호 암호화
	public static BCryptPasswordEncoder passwordEncoder;
	//Data Access Object
	public static UserDao udao;
	public static BoardDao bdao;
}
