package com.board.security;


import org.springframework.beans.factory.annotation.Autowired;

import com.board.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService {
	
	@Autowired
	private MemberMapper mapper;

//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		log.warn("Load User By UserName: " + username);
//		
////		MemberVO vo = mapper.read(username);
////		
////		log.warn("queired by member mapper: "+ vo);
////		
////		return vo == null ? null : new CustomUser(vo);
//	}
	
	
	
	

}
