package com.mysqlSpring.testProject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.mysqlSpring.testProject.dto.IntroDto;

public class BoardDao implements IBoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String introWrite(IntroDto dto) {
		System.out.println("introWrite method");
		String result;
		int res = sqlSession.insert("introWrite", dto);
		if(res==1) {
			result="success";
		}
		else {
			result="failed";
		}
		return result;
	}

}
