package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.domain.Criteria;
import com.board.domain.ReplyPageDTO;
import com.board.domain.ReplyVO;
import com.board.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		log.info("register reply: " + vo);
		return mapper.insert(vo);
		
	}

	@Override
	public ReplyPageDTO list(Criteria cri, long bno) {
		log.info("list of Reply: " + bno);

		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.list(cri, bno));
	}

	@Override
	public ReplyVO selectRno(long rno) {
		log.info("select : " + rno);
		return mapper.select(rno);
	}

	@Override
	public int modifyRno(ReplyVO vo) {
		log.info("modify rno: " + vo);
		return mapper.update(vo);
	}

	@Override
	public int removeRno(long rno) {
		log.info("delete rno: " + rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> listAll(Criteria cri) {
		log.info("list All Reply");
		return mapper.listAll(cri);
	}

	@Override
	public int ReplyTotal() {
		log.info("total Reply");
		return mapper.replyTotal();
	}

}
