package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.domain.Criteria;
import com.board.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public List<ReplyVO> list(@Param("cri") Criteria cri, @Param("bno") long bno);
	
	public ReplyVO select(long rno);
	
	public int update(ReplyVO vo);
	
	public int delete(long rno);
	
	public int getCountByBno(Long bno);
	
	public int deleteByReplyer(String userid);
	
	public int deleteBnoByReplyer(String userid);
	
	public List<ReplyVO> listAll(Criteria cri);
	
	public int replyTotal();
	

}
