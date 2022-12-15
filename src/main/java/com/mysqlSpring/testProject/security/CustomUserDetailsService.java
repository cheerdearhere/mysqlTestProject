package com.mysqlSpring.testProject.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mysqlSpring.testProject.dao.UserDao;
import com.mysqlSpring.testProject.dto.UserJoinDto;
import com.mysqlSpring.testProject.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		 UserDao udao = Constant.udao;
		 UserJoinDto dto = udao.login(username);
		 System.out.println("dto: " + dto);
		 if(dto==null) {
			 System.out.println("security: DTO is null!!");
			 throw new UsernameNotFoundException("No user found with username");
		 }
		 
		 String pw = dto.getpPw();
		 String auth=dto.getpAuth();
		 System.out.println(dto.getpNum()+"/"+dto.getpId()+"/"+pw+"/"+auth);
		 
		 //권한 저장을 위한 Collection-ArrayList
		 Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		 roles.add(new SimpleGrantedAuthority(auth));
		 UserDetails user = new User(username,pw,roles);
		 return user;
	}

}
