package com.mysqlSpring.testProject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.mysqlSpring.testProject.dto.UserJoinDto;

public class UserDao implements IDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String userJoin(UserJoinDto dto) {
		System.out.println("user join method");
		String result=null;
		try {
			int res = sqlSession.insert("userJoin", dto);
			System.out.println("result: "+res);
			if(res>0) {
				result="success";
			}else {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result="failed";
		}
		return result;
	}
	
	@Override
	public UserJoinDto login(String pid) {
		System.out.println("login request: "+pid);
		UserJoinDto result = sqlSession.selectOne("login", pid);
		return result;
	}
}
