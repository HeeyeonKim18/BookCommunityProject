package com.board.mapper;

import java.util.List;

import com.board.domain.Criteria;
import com.board.domain.MemberVO;

public interface AdminMapper {
	
	public List<MemberVO> selectMemberAll(Criteria cri); 
	
	public int memberTotal(Criteria cri);
	
	public MemberVO selectId(String userid);
	
	public int update(MemberVO vo);
	
	public int delete(String userid);
	
	public int memberBoard(String userid);
}
