package com.mysqlSpring.testProject.dao;

import com.mysqlSpring.testProject.dto.IntroDto;
import com.mysqlSpring.testProject.dto.UserJoinDto;

public interface IUserDao {
	public String userJoin(UserJoinDto dto);
	public UserJoinDto login(String pid);
}
