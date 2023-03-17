package com.board.service;

import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {
	
	@Autowired
	private MemberService service;
	
//	@Autowired
//	private BCryptPasswordEncoder encoder;
	
//	@Test
//	public void insertTest() {
//		MemberVO vo = new MemberVO();
//		
//		vo.setUserid("user2");
//		vo.setUserpw("1212");
//		vo.setUserName("유저");
//		vo.setUserPhone("010-2222-2222");
//		vo.setUserMail("go1927hm@naver.com");
//		vo.setUserAddr1("서울시");
//		vo.setUserAddr2("강동구");
//		
//		service.join(vo);
//		
//		log.info(vo);
//	}
	
//	@Test
//	public void idCheckTest() {
//		String id="member";
//		String id1 = "admin";
//		
//		log.info(service.idCheck(id));
//		log.info(service.idCheck(id1));
//	}
	
//	@Test
//	public void loginTest() {
//		MemberVO vo = new MemberVO();
//		vo.setUserid("user1");
//		vo.setUserpw("1234");
//		
//		log.info(service.login(vo));
//	}
	
//	@Test
//	public void memberModify() {
//		MemberVO vo = new MemberVO();
//		vo.setUserid("hello");
//		vo.setUserMail("go1927hm@naver.com");
//		vo.setUserPhone("010-4445-7949");
//		vo.setUserAddr1("30289");
//		vo.setUserAddr2("번화1로 82번길");
//		
//		int result = service.modify(vo);
//		log.info("modify result = " + result);
//	}
	
//	@Test
//	public void getBoardTest() {
//		Criteria cri = new Criteria();
//		cri.setUserid("member3");
//		log.info(service.boardGet(cri));
//	}
	
//	@Test
//	public void forgotId() {
//		MemberVO  vo = new MemberVO();
//		vo.setUserName("관리자");
//		vo.setUserMail("go1927hm@gmail.com");
//		log.info(service.forgotId(vo));
//	}
	
	@Test
	public void forgotPw() {
		MemberVO vo = new MemberVO();
		vo.setUserid("admin");
		vo.setUserMail("go1927hm@gmail.com");
		service.sendMail(vo);
	}
	

}
