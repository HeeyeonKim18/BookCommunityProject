package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.domain.BoardAttachVO;
import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.mapper.BoardAttachMapper;
import com.board.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO vo) {
		log.info("service: insert");
		mapper.insertSelectKey(vo);
		
		if(vo.getAttachList() ==null || vo.getAttachList().size() <=0) {
			return;
		}
		vo.getAttachList().forEach(attach->{
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("service:getAllList");
		return mapper.selectAll(cri);
	}
	
	@Transactional
	@Override
	public BoardVO getBno(long bno) {
		log.info("service:getBno");
		mapper.countViews(bno);
		return mapper.selectOne(bno);
	}
	
	@Override
	public BoardVO getModify(long bno) {
		log.info("service:getModify");
		return mapper.selectOne(bno);
	}
	
	@Transactional
	@Override
	public int modify(BoardVO vo) {
		log.info("service:modify");
		attachMapper.deleteAll(vo.getBno());
		
		int modifyResult = mapper.update(vo);
		
		if(modifyResult ==1 && vo.getAttachList() != null && vo.getAttachList().size() > 0) { 
			vo.getAttachList().forEach(attach ->{
				attach.setBno(vo.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	@Transactional
	@Override
	public int remove(long bno) {
		log.info("service:remove");
		attachMapper.deleteAll(bno);
		return mapper.delete(bno);
	}
	
	@Override
	public int total(Criteria cri) {
		log.info("Service: total");
		return mapper.boardTotal(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(long bno) {
		log.info("getAttachList by bno" + bno);
		return attachMapper.findByBno(bno);
	}

	

}
