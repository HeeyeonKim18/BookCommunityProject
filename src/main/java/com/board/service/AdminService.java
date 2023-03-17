package com.board.service;

import java.util.List;

import com.board.domain.Criteria;
import com.board.domain.MemberVO;

public interface AdminService {
	
	public List<MemberVO> memberList(Criteria cri);
	
	public int memberTotal(Criteria	cri);
	
	public MemberVO idGet(String userid);
	
	public int modifyMember(MemberVO vo);
	
	public int removeMember(String userid);
	
	public int memberBoard(String userid);

}
