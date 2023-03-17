package com.board.service;

import java.util.List;

import com.board.domain.Criteria;
import com.board.domain.ReplyPageDTO;
import com.board.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyPageDTO list(Criteria cri, long bno);
	
	public ReplyVO selectRno(long rno);
	
	public int modifyRno(ReplyVO vo);
	
	public int removeRno(long rno);
	
	public List<ReplyVO> listAll(Criteria cri);
	
	public int ReplyTotal();
}
