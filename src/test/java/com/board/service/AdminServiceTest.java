package com.board.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.Criteria;
import com.board.domain.MemberVO;
import com.board.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTest {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private AdminMapper mapper;
	
//	@Test
//	public void insertTest() {
//		BoardVO vo = new BoardVO();
//		
//		vo.setTitle("board5");
//		vo.setContent("board6");
//		vo.setWriter("hello");
//		
//		service.register(vo);
//		
//		log.info(vo.toString());
//	}
//	

//	
//	@Test
//	public void selectAllTest() {
//		BoardVO vo = new BoardVO();
//		vo.setWriter("admin");
//		
//		log.info(service.memberList());
//		
//	}
	
//	@Test
//	public void selectTest() {
//		
//		log.info(service.getBno(1L));
//		
//	}
	
//	@Test
//	public void modifyTest() {
//		MemberVO vo = new MemberVO();
//		vo.setUserid("hello");
//		vo.setUserPhone("010-8823-8426");
//		vo.setUserAddr1("경남");
//		vo.setUserAddr2("김해시");
//		vo.setUserAddr3("장유2동");
//		service.modifyMember(vo);
//		log.info(service.idGet("hello"));
//	}
	
//	@Test
//	public void deleteTest() {
//		service.removeMember("user1");
//		log.info(service.memberList());
//		
//	}
	
//	@Test
//	public void criTest() {
//		Criteria cri = new Criteria();
//		cri.setKeyword("a");
//		
//		List<MemberVO> list = mapper.selectMemberAll(cri);
//		list.forEach(member-> log.info(member));
//	}
	
	
}
