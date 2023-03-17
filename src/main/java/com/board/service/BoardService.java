package com.board.service;

import java.util.List;

import com.board.domain.BoardAttachVO;
import com.board.domain.BoardVO;
import com.board.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO vo);
	
	public List<BoardVO> getList(Criteria cri);
	
	public BoardVO getBno(long bno);
	
	public BoardVO getModify(long bno);
	
	public int modify(BoardVO vo);
	
	public int remove(long bno);
	
	public int total(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(long bno);

}
