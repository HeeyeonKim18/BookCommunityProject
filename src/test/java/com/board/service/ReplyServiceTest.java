package com.board.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.Criteria;
import com.board.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTest {
	@Autowired
	private ReplyService service;
	
//	@Test
//	public void insertTest() {
//		ReplyVO vo = new ReplyVO();
//		Criteria cri = new Criteria();
//		vo.setBno(22545L);
//		vo.setReplyer("admin");
//		vo.setReply("hiiiiii this is reply");
//		service.register(vo);
//		log.info(service.list(cri, 22545L));
//	}
//	
//	@Test
//	public void updateTest() {
//		ReplyVO vo = new ReplyVO();
//		Criteria cri = new Criteria();
//		vo.setRno(3L);
//		vo.setReply("what the hell");
//		service.modifyRno(vo);
//		log.info(service.list(cri, 22545L));
//	}
//	
//	@Test
//	public void deleteTest() {
//		log.info(service.removeRno(3L));
//	}
//	
//	@Test
//	public void selectTest() {
//		log.info(service.selectRno(3L));
//	}
	
//	@Test
//	public void replyTest() {
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(1);
//		cri.setAmount(10);
//		
//		List<ReplyVO> list = service.listAll(cri);
//		
//		list.forEach(reply -> log.info(reply.toString()));
//	}
	
	@Test
	public void totalTest() {
		int total = service.ReplyTotal();
		log.info(total);
	}
}
