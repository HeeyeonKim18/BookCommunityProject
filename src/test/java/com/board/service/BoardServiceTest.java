package com.board.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private BoardMapper mapper;
	
//	@Test
//	public void insertTest() {
//		BoardVO vo = new BoardVO();
//		
//		vo.setTitle("board5");
//		vo.setContent("board6");
//		vo.setWriter("member3");
//		
//		service.register(vo);
//		
//		log.info(vo.toString());
//	}
//	
	@Test
	public void selectAllTest() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<BoardVO> list = service.getList(cri);
		
		list.forEach(board -> log.info(board.getBno()));
		
	}
	
//	@Test
//	public void selectTest() {
//		
//		log.info(service.getBno(1L));
//		
//	}
	
//	@Test
//	public void modifyTest() {
//		BoardVO vo = new BoardVO();
//		vo.setBno(1L);
//		vo.setTitle("board change");
//		vo.setContent("board1 modifyboard");
//		
//		service.modify(vo);
//		
//		log.info(service.getList());
//	}
	
//	@Test
//	public void deleteTest() {
//		if(service.remove(1L)==1) {
//			log.info("it works");
//			log.info(service.getList());
//		};
//		
//	}
	
//	@Test
//	public void deleteTest() {
//		long[] bno = mapper.bnoGet("member3");
//		log.info(bno);
//	}
}
